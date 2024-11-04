## Telematic Applications

# Midterm 1

*Academic year 2019-20*

## Instructions <!-- omit in toc -->

Available time: 90 min

Explain clearly but briefly every step you make in the exam considering that a
correct answer with no explanation may not necessarily be considered valid.
Answer the exam using exam paper sheets. Explicitly describe any supposition you
make, however, unless contradicted by the question, you can assume the
following:

* the sender always delivers every segment of the window or those the question
  describes (using segments that are MSS long) before receiving the ACK that
  acknowledges the first segment delivered in that window
* every segment is acknoledged individually

> **Note**
>
> Student answers. The answers provided are not necessarily correct unless
> stated otherwise.

---

## Problem

Juan has a brand-new optical fiber connection with a new provider. That new
connection provides a bandwidth of 200Mbps and propagation delay of 3ms ($t_p$ =
3ms) with the server of an online gaming platform Juan is willing to use. The
online gaming platform has several Internet connection requirements that should
be satisfied in order to play and you should evaluate if Juan will or won’t be
able to with his new connection. Considering the TCP stack is configured to use
a slow start threshold of 64 segments, WIN for both endpoints is set to 200
segments, and the MTU of the connection is 1500 bytes, answer the following
questions:

### Problem question 1
(0.5 points)  
How big would be the congestion window (`cwnd`) and the effective window
($V_{ef}$) if the connection is open for a very very long time and there is no
congestion? why?

> **Answer**
>
> The congestion window (`cwnd`) may grow to infinity if congestion never occurs
> (technically, it will only grow to the maximum value that can be stored by the
> implementation).
>
> The effective window, being the minimum value between the congestion window
> and the receiver window, will be limited by the latter, which is 200 segments.

### Problem question 2

Calculate the continuous delivery window ($V_{ec}$). $V_{ec}$ is the maximum
number of segments that can be delivered in one RTT. The gaming platform can
wait for the client or server effective window to reach the value of $V_{ec}$,
but once reached, the gaming platform requires them to be able to send 120Kbytes
per RTT during the game. Does Juan’s Internet connection fulfill with this?

> **Answer**
>
> The continuous sending window (in english, $W_{cs}$) is a theoretical optimal
> value for the effective window. Neglecting ACK tx time, it can be calculated
> as:
>
> $$
> \begin{aligned}
>     V_{ec} &= \frac{RTT}{T_{tx}} \\
>     &= \frac{2 ⋅ t_p + T_{tx}}{T_{tx}} \\
>     &= \frac{2 ⋅ t_p + \frac{MTU}{BW}}{\frac{MTU}{BW}} \\
>     &= \frac{6 \text{ms} + \frac{1500⋅8}{200⋅10^6}}{\frac{1500⋅8}{200⋅10^6}} \\
>     &= \frac{6 \text{ms} + 60 \text{μs}}{60 \text{μs}} \\
>     &\boxed{= 101 \text{ [segments]}}
> \end{aligned}
> $$
>
> Now, in KB/RTT:
>
> $$
> 101 \text{ seg} ⋅ 1460 \frac{\text{B}}{\text{seg}} = 147 460 \text{B}
> $$
>
> So yes, Juan's connection fulfills the requirement.

### Problem question 3

How long (in RTTs) would it take the effective window to reach the continuous
delivery window ($V_{ec}$)? The gaming platform requires the client to reach
that window in less than 300ms. Does Juan’s Internet connection fulfill with
this?

> **Answer**
>
> The effective window will reach the continuous sending window size when the
> congestion window reaches that size, as the receiver window is larger in this
> scenario (200 segments > 101 segments). We can approximate the congestion
> window growth as updating every RTT, so it will first grow exponentially with
> every RTT until `ssthresh` is reached (64 segments), and then linearly at a
> rate of 1 segment per RTT. Since `cwnd` starts at 1 mss, it will take $\log_2
> \left(\frac{64}{1}\right) = 6$ RTTs to reach `ssthresh`. From there, it will
> take approximately $101 - 64 = 37$ RTTs to reach a value of 101 segments. If
> we add those up, we get 43 RTTs, which is $43 ⋅ 6.06 \text{ ms} = 260.6 \text{
> ms}$. Since that's smaller than 300ms, Juan's connection also fulfills this
> requirement.

### Problem question 4

Juan is quite concerned about security, so he hired a firewall service with his
internet connection. The problem is that the firewall is misconfigured and
eliminates the first SYN segment (the first segment of the TCP connection
establishment) the client delivers to the online gaming platform, producing a
timeout. How does it affect Juan’s connection? Would his connection be able to
reach ($V_{ec}$) in the required time?

> **Answer**
>
> This seems like quite a big problem, as consistently losing the first `SYN`
> segment will prevent any connection from being established, ever. In fact, the
> online gaming platform will never even know Juan is trying to connect, as it
> won't get the `SYN` segment, and Juan's client will time out every time. In
> this case, Juan will never be able to connect to the gaming platform.
>
> In the case that only one `SYN` segment is lost, the connection will be
> established, but it will take an extra RTT to do so. This will not affect the
> connection's ability to reach the continuous sending window in the required
> time, as the `ssthresh` and `cwnd` are independent for each connection.

### Problem question 5

The Internet provider, that cannot fix the problem with the firewall, offers to
every user of the online gaming platform the same speed but a better propagation
time of 1ms ($t_p$ = 1ms) instead of the original 3ms. Will Juan be able to play
online games in this case?

> **Answer**
>
> First of all, this would affect the value of the continuous sending window:
>
> $$
> \begin{aligned}
>     V_{ec} &= \frac{RTT}{T_{tx}} \\
>     &= \frac{2 ⋅ t_p + T_{tx}}{T_{tx}} \\
>     &= \frac{2 \text{ms} + 60 \text{μs}}{60 \text{μs}} \\
>     &\boxed{≈ 34 \text{ [segments]}}
> \end{aligned}
> $$
>
> That's much lower than the previous value, so we should check if the
> throughput per RTT is still enough:
>
> $$
> 34 \text{ seg} ⋅ 1460 \frac{\text{B}}{\text{seg}} = 49 240 \text{ B}
> $$
>
> Woah, that's less than 120 KB per RTT. Sorry, Juan, your ISP didn't quite fix
> your problem

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

1. (0.5 points) How big would be the congestion window (`cwnd`) and the
   effective window ($V_{ef}$) if the connection is open for a very very long time
   and there is no congestion? why?

2. Calculate the continuous delivery window ($V_{ec}$). $V_{ec}$ is the maximum
   number of segments that can be delivered in one RTT. The gaming platform can
   wait for the client or server effective window to reach the value of
   $V_{ec}$, but once reached, the gaming platform requires them to be able to
   send 120Kbytes per RTT during the game. Does Juan’s Internet connection
   fulfill with this?

3. How long (in RTTs) would it take the effective window to reach the continuous
   delivery window ($V_{ec}$)? The gaming platform requires the client to reach
   that window in less than 300ms. Does Juan’s Internet connection fulfill with
   this?

4. Juan is quite concerned about security, so he hired a firewall service with
   his internet connection. The problem is that the firewall is misconfigured
   and eliminates the first SYN segment (the first segment of the TCP connection
   establishment) the client delivers to the online gaming platform, producing a
   timeout. How does it affect Juan’s connection? Would his connection be able
   to reach ($V_{ec}$) in the required time?

5. The Internet provider, that cannot fix the problem with the firewall, offers
   to every user of the online gaming platform the same speed but a better
   propagation time of 1ms ($t_p$ = 1ms) instead of the original 3ms. Will Juan
   be able to play online games in this case?

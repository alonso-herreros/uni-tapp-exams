## Telematic Applications <!-- omit in toc -->

# Final Exam (E2)

*Academic year 2021-22*
GRADO EN INGENIERÍA EN
TECNOLOGÍAS DE TELECOMUNICACION´
Aplicaciones Telemáticas
Evaluación continua (E2)

---

* [Problem 1 - e-mail](#problem-1---e-mail)
    * [Question 1.1)](#question-11)
    * [Question 1.2)](#question-12)
    * [Question 1.3)](#question-13)
    * [Question 1.4)](#question-14)
    * [Question 1.5)](#question-15)
    * [Question 1.6)](#question-16)
* [Problem 2 - HTTP](#problem-2---http)
    * [Question 2.1)](#question-21)
    * [Question 2.2)](#question-22)
    * [Question 2.3)](#question-23)
    * [Question 2.4)](#question-24)
    * [Question 2.5)](#question-25)

---

## Instructions <!-- omit in toc -->

* You can use any reasonable assumption (used in class) but you must explicitly
  state that you do it and what that assumption is, by briefly explaining it.
* Explain everything you do since the results provided without an explanation
  may not count for the grade

## Problem 1 - e-mail
A student with the email account `alumno1@gmail.com` uses his home PC with
domain name `clientpc.origin.com`. On such a PC, which is not an MTA (simply a
mail client), there is a mail User Agent that the student uses to send an email
like the following:

```text
From: alumno1@gmail.com
To: juan@uc3m.es
To: sat@lenovo.com
CC: alumno2@gmail.com
Subject: merry christmas
Content-Type: multipart/mixed; boundary="MixedBoundaryString"

--MixedBoundaryString

Hi there!

Let me wish you a Merry Christmas and A Happy New Year!

See you soon

--MixedBoundaryString
Content-Type: image/jpg;name="greetingscard.jpg"
Content-Transfer-Encoding: base64

ARBITRARY_INFORMATION_ENCODED_IN_BASE64

--MixedBoundaryString--
```

All the headers of the mail, boundaries of the multipart, headers of the parts
of the multipart as well as the body of the mail, except the content in base64,
occupy 467 octets. To clarify, in other words, the whole mail except the content
in base64 (which would go right where it is written ”ARBITRARY INFORMATION
ENCODED IN BASE64”) occupies 467 octets.

Figura 1: MTAs interconnection

The MTA servers described in Figure 1 can communicate freely with each other.
The MTA of `gmail.com` is `gmail-smtp-in.gmail.com`, the input MTA of the domain
`uc3m.es` is `smtp.uc3m.es` and the input MTA of the domain `lenovo.com` is
`mta.lenovo.com`.

### Question 1.1)

Indicate which header(s) are missing from the RFC822 format email described in
the exam and **justify your reply**

### Question 1.2)

Write down the full SMTP trace from `clientPC`, where the UA is located, to the
first MTA it connects to (`gmail-smtp-in.gmail.com`).

### Question 1.3)

Indicate differences in connections, SMTP commands, as well as possible changes
to the mail in RFC822 format transported by SMTP when the email leaves
`gmail-smtp-in.gmail.com` to the final destinations. Justify your answers by
stating in detail where each change occurs and why..

### Question 1.4)

Calculate the total size of the mail with the dimensions specified at the
beginning of the problem and considering that the file `greetingscard.jpg`, that
is sent in the email, has a huge size of 68153 bytes

### Question 1.5)

Consider that the finally encoded email is sent directly over TCP (without
considering the commands of the SMTP protocol) by a connection with an MTU of
1500 and an announced window of 11680, in which there are no restrictions by
speed, nor congestion. How many RTTs will take to send the mail from the
beginning to the end of the connection?

### Question 1.6)

Let suppose that when the student writes the email in his UA, the recipient
`alumno2@gmail.com` is placed in BCC (or CCO in Spanish) and then delivers it.
Indicate and **adequately justify** what **differences** would exist with:

* The email RFC822 format written in the exam
* The trace at the out of the UA (compared to your response in question 2)
* The differences stated in question 3

## Problem 2 - HTTP

The host named `server.webops.com` has an apache2 server installed to serve
`solar.energia.com` and `eolica.energia.com`. Both domains are independent zones
belonging to two different companies inside the big corporation `energia.com`.

The server IP address is `65.65.65.80`.

### Question 2.1)

What is the minimal change in the DNS of `eolica.energia.com` so that requests
to `http://www.eolica.energia.com` are responded by the server? Write down the
DNS requests and replies for a user to resolve the domain. Let all the caches be
empty and indicate which replies are authoritative.

### Question 2.2)

Write down the HTTP GET requests using protocol version 1.1 to get the pages
`http://www.solar.energia.com` and `www.eolica.energia.com` include all the
compulsory request headers.

### Question 2.3)

A user browsing `http://www.solar.energia.com` notes the load of the images
`http://energia.com/solar-diag.jpg` and `http://energia.com/alt-diag.jpg`.
Knowing that the DNS server of energia.com is doing load balancing of that
address using two different IPs, and knowing that the TTL of the A record of
energia.com is 10 seconds. Calculate if each image will be loaded from a
different IP or both will load from the same. Suppose the size of each image is
250 KBytes, MSS=1460, the link is 2Mbps and 30 ms propagation delay. Explain the
calculation procedure followed.

> **Note**
>
> The question only makes sense if we consider HTTP/1.0 clients, because
> HTTP/1.1 or later clients reuse the same connection to download all objects
> until the connection’s keepalive expires. Let’s perform the calculation for
> 1.0 clients:

### Question 2.4)

Imagine now that the server is configured with one of the two following
configuration options: a) a 15 seconds KeepAliveTimeout; or b) activating HTTP
Pipelining. Recalculate the timing of question 3 if needed and justify if any of
the configuration has some effect in the load of the images from the same or
different IPs.

### Question 2.5)

Explain if the server can do some optimization to lower the images transmission
time. Indicate the HTTP headers and values that make that optimization possible.

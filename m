Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E298C1150AD
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 13:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfLFMxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 07:53:30 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:47013 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfLFMxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 07:53:30 -0500
Received: from [192.168.1.155] ([95.117.69.190]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MBV6n-1iT3RS2059-00CzZl; Fri, 06 Dec 2019 13:53:25 +0100
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status
 changes
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191127133510.10614-1-brgl@bgdev.pl>
 <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
 <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
 <0058e57c-5765-3944-3137-10b780985a36@metux.net>
 <CAMRc=McHdtrvkLvT67ew1+88iPtRpd+MO1+5Tr3YsuLceQor1A@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <569d7017-fe19-2f4f-a402-a1f28b3c9e84@metux.net>
Date:   Fri, 6 Dec 2019 13:52:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=McHdtrvkLvT67ew1+88iPtRpd+MO1+5Tr3YsuLceQor1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XOjHc5F72uLN+OdFfxUbHj/j+76RvCQEynOfS+MfsmRnvCVBA3i
 +1VvKp1HZRKNt679pZDDsDCWS7rvGf2f5HyJWMNaSRcdfatz/5v6C0dZ1M1sX3PVjsiTvPj
 8x6izIHdD0iTZzR/nwt+i6TKbZd3VjyxewVDKx47AH5gT422+VUQfgpKqmMIS/YhR9RPU/s
 v0bJq5Frl/dRU/jCgplqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R4VpifeGNB4=:dHPCnyZCOjRuqA9ozNoCeZ
 BdcwuL3uakQaQ7an/QLvrKiQE4tIVSiSPuHKFugqVFv7/d911kNKPk0gKVS/3sLyySACvImed
 4fGnP7psvLSwUMmsQwoFar2KKtHSSGexuehbosawR2UzPeZ0wRJf7tiToWCnpogL1k/YB37F+
 /MnFvxzmbH5IfSV2FbcrtKtnjrJd5VjS/tC8oW3jGjb3Id5+ktcBNyoTSkeLErBljJdZY1cSH
 mOYbgTW5UkWpUAGMLDaqnp3m91avGxSCkunfzrKUrlzFiVpUziGZ391RRXS3zhHtTpR4IRR4k
 RNY4GaCRwn/R3u0GadwClfOQaUakXpgXASUM73dMChpOvrcx0Tg3Bd18Un0dTnCDfUFCOZa9n
 TqzpCDR+fajdegMOCLFSOj7abodKXHHMRZzeUou0L/stTHTAJJgWMIV8FoFVQV+xF8c7ikW1E
 wwV5chcachxNxG9OkJ3z6FZwKNgDOyLK+vT2bgm2L2lUcBHi14+Not/6qAS2xvWAxYa3Gjnkf
 8UqMFIeIiif/SXRvQtAvQSQrh3fhJ7hATkWVTPUc9XqhMu7qTUn53uuLkmJjwlFyXHl36gRqE
 Nynphv5ggZjpTx6ICaBApKe68+sNwi8yCCNVqURXWaUrTZQK1S9/QRqeJfAPy0sqBuXIa4u2N
 UKjbuCUT9Gv5sgryNdvo/A6DksWvkfrtx7uxaLtLWQN1cNOrPOsGm52tU5VVm6UDA6NXV8jmb
 Avfha7mKdlXo923HAPd7jNcaULANAqjRsWjJgqqYOMB09Cg7bBmpi1CwS/+U41cGN0ACM99Rn
 Yy+gIbb+pW+VZ0ioMCh8FjTeHG98SXRovtvVUODUcwBjny34kGz5sWcwZum3Or27aI3AyEq82
 sL1xqhChnVQIFHhy2gfg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

>> Oh, no, I've been afraid that this would be coming ... desktop bus in
>> embedded system is a real nightmare. (yes, some people are even insane
>> enough to put that thing on an public IP interface and so make critical
>> machinery like cards easily remote controllable by average school kids)
> 
> Nah, you're overreacting, nobody is putting anything on the network.

Maybe you've just missed that (maybe better for mental health ;-)), but
people actually do put desktop bus on open networks. Chrysler/Harmann
are an famous example (rendering the cars easily remote-controllable)
I've had lots of similar cases w/ my clients. Whats going on in critical
industries like automotive or medical often is a real nightmare. One of
the reasons why I only buy old cars and do a careful inspection of
physicians before allowing them to treat me or my family.

IMHO, we should be careful about not encouraging folks out there to do
silly things, just because they look so easy. (embedded development
isn't entirely easy)

> Most of my work isn't in upstream kernel development - it's actually
> launching CE products. And it's been a long time since I've worked
> with a client that could be convinced not to use systemd and dbus on
> an embedded system. 

Yeah, same problem here. But actually, it's easier than one might think:
let them run into a scenario where that malware really does horrible
things and let the client drive against the wall. Some will learn,
others won't - just let evolution optimize that :p

> This just makes things so easy for people writing
> high-level application code that it's become de-facto standard -
> whether we like it or not.

Yeah, "hilevel" code, that completely ignores vital aspects of the
machine it then runs on, eg. RT or memory constraints. Seen that so
many times. Emperical experience tells: sooner or later it will go
nuts and things go horribly wrong. The unplesant question just is: how
many people have get hurt or killed in the process.

Lennartware isn't the only problem here, but also ancient and completely
unmaintained vendor kernels, patched-to-deah by rookies (eg. ublox).
OTOH, the positive side, eg. if I really need to get a *new* car, I'd
pick one where I can disable surveillance stuff like "ecall" easily :p

In general, what those industries completely ignore is maintainability
and stability. There, this only exists on the paper (cubic meters of
papers that formally look nice, but don't really tell anything about
the *actual* important facts) - formally proven bullshit.

I've made the personal decision that I don't wanna become yet another
Edward Teller, neither do I wanna allow some BSG-type scenario. That's
the reason I'm spending so much time in this discussion.

> This is just your personal anecdote. I could bring up several examples
> of good implementations of event-based, dbus-oriented systems all
> right. Bad programmers don't make tools they're using bad.

Problem is: good programmers who can really deal with those concepts
are hard to find. And those systems usually are hard to test. Desktop
bus is magnitudes more complex than isolated FSMs.

Within the last decades, I never had a single case where desktop bus had
been the superior choice (actually, only few cases where purely event-
driven architecture was a good idea).

> I want to add this
> new feature to allow for creating a central entity controlling GPIO
> lines in the user-space. In case of sysfs - IT IS such a central
> entity except that it lives in the kernel. It doesn't need to be
> notified about changes in line properties.

I'm still wondering why exactly one would want such an central entity
in userspace and then letting it talk to others via desktop bus. At
least in critical embedded systems, not talking about self-knittet
hobby projects. Seems those ideas originate from people who don't know
what the OS/Kernel is for :p

Actually, I had a case where somebody attemted to do so (folks who tried
linux embedded development from a windows machine :o). Fortunately,
before they could write their planned "GPIO HAL" (several 10kLoc for
just doing some trivial sysfs ops), I've configured the lines to the
proper drivers in DT (basically, just some LEDs, inputs, rs485 signal
lines, etc). Later on they started to write some "HAL" for LEDs,
inputs, rs485 ... the manager of neighboring department on the other
end of the room then ask me: "don't they know that they've got an
operating system" ;-)

Seriously, we shouldn't do everything that some strange folks are asking
for, just to make them happy. We don't wanna desktop bus in the kernel,
do we ? :p

By the way: we *do* need some improvements for PLC-like applications:
Highlevel provisioning of platform devices, eg. configure which devices
are attached to certain interfaces in an specific installation, so the
applications don't ever need any knowledge about that, but just talk
to specific devices.

Most of what's needed (on kernel side) is already there: DT overlays.
Just yet have to get this working on non-DT (eg. ACPI platform).

In fact that's already in my pipeline, also for other purposes, eg.
replace simple board or mfd drivers by just a DT snippet. Yet lacked the
time to work out a suitable way for mixing DT and ACPI and allowing DT
to override ACPI. But that's a topic for a completely different thread.


--mtx--

---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

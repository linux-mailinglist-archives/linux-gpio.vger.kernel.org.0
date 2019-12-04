Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB98112AF2
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 13:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfLDMGn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 07:06:43 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:43801 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfLDMGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 07:06:43 -0500
Received: from [192.168.1.155] ([77.9.37.28]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHX7f-1iXmTW2Hrd-00DbqL; Wed, 04 Dec 2019 13:06:39 +0100
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status
 changes
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191127133510.10614-1-brgl@bgdev.pl>
 <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
 <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0058e57c-5765-3944-3137-10b780985a36@metux.net>
Date:   Wed, 4 Dec 2019 13:06:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bSqnan+FaeBm/hSxfhCSeiiGR9aXpq6pTZwvQtL+8Qf8pvDLLM+
 Gtsui3Tom/43/OgEL3ozg8qaRn0FVEgViwhEy6j3VAfOw1vPom/Fk1cTiy9Uj5AJQEKckH8
 2F0yav4JxX0g1Nb8H77487Xg5lN1xJ/qV+tiZmy8b3j+SvYLnb1cIGi9efFoxUgaK4adK4B
 b/m/kDWUcRhZYJ5+dtpFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AdjozgabDAA=:q15B1WnGECQow0/x5YIgu3
 +i9aaP+Fh3Vd+10d3Aw1uURxLHO17sraCC6C0PbDjiefxmy7mNVkfCYf1N8ZCFy7U2Tq9wGuL
 vUr+OKYh4+eycC0gdQz5ywkI9u1+vj/EFxDJ+qVZmE53tZkSgQFN8XOSbvRzkDcJW2vRPIx41
 /siDUC19CwbRkC7xgoVk1qanERXsY/KQbRPkEM9h82KzYcWn19XV7xzHav/fZfbuFEqE/Phfx
 SGn4xsE6JztA1tGHyJUectQoM07hrKH5onnTg3Qy6e+vhlvj7Q/6PV0Ly962cBNf2YuM9TrQU
 Cc1l224tHOAceR+w6UMslAbmtTdCM1JnwrhhlhT2CCz0OpobEkmGCLnhzoCRztUCgsg4O0uP6
 YZilv7BICjlriXE98qHLEFwvLDnRe37JE0x3OcHTq5Ef7dBHSX9KZclajWwaKInBNLF3pJuKt
 YCIQYm57oETPuH8VikwMBVaoCrBMDv7HYhn56gWIgsXtNmYQwYtHN4X8bCEEyTJlBWlJmmF+e
 ifiql0yCbgcGqZy0m0pJfH47Ly3x+uGT433HMfUDPu+PGg8W3zju1A13c0u620LJQNGD0S5/G
 xOo0J5Xz/+2zEwtu5hjp3+lkrPgwoWbAr0d8G36pH9WpEyLeRIbOl2mlScduUpyeOiFzhWLCf
 4jLrqMonBgdUyAdWxVEp77vty2AZzPPBtBEFMygr4kxuG6kzp9R2h3voztazOEUuBqos7hRh7
 nwsBhRjOU9fa3hqscoqL0KWi/LI9hnm4HWMNctEfesRAF2hXPUqTBVvMdm34tUWBQnJfK86M6
 rxT2AvhQTy32Ykvxan4GA8pccq6/qap3Hxf83UHalcVkUkhdo+KQO6sbME7nvLWyGogzrIF56
 LdQEh7zIIB/GdVRbAB4w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29.11.19 11:58, Bartosz Golaszewski wrote:

Hi folks,


missed much of this thread, so please excuse me if I'm going to say
something stupid ;-)

> No, it really is just about keeping the line information in user-space
> synchronized with the one in the kernel without re-reading the line
> info periodically. Whether it's the kernel that requests the line or
> other user-space process doesn't matter. We just want to stay
> up-to-date with the information we already do have access to.

In that case, why not just using inotify+friends or some blocking read
for that ?

Personally, I'm a really big friend of synthentic filesystems instead of
ioctl()s, because they're so simple to use (don't wanna repeat the whole
Plan9 literature here ;-)), so I'd do it in this way:

* have a file in /sys/class/gpio/... holding the current gpio
  information, in some easily parsable format. (either one file
  globally or one per chip)
* a) this file can be monitored via inotify (just one event when
     something had changed, or maybe have mtime reflect the time of
     last change)
* b) allow read after EOF, which is blocking, until something changes

That way, userland implementation would be trivial enough to do it
in a simple shell script.

> It may seem like a feature-creep because this is the third new feature
> being added to the character device in a short span of time. 

Personally, I'm not a fan of such chardevs at all, but this raises
another interesting pretty general topic: sidechannel/out-of-band data
of chardevs.

Originally, Unix chardevs have been designed as something operates on
streams of bytes, maybe with some extra operations (eg. setting baud
rate, etc). ioctl()s have been implemented as some escape route for such
extra functions. Over the many years, there's been a massive ioctl()
inflation, even hardware specific ones. IMHO, this is a huge mess, which
requires to lots of extra work for userland applications, which should
instead get generic interfaces, even leading to ridiculous things like
HAL, etc.

Seriously, we should lean back and think of better ways. One idea would
be making devices more directly-like, where things like oob-streams
or config attributes can be enumerated and addressed by names.
(actually, if I could change history, I'd make them actual directories)

> But at
> the same time: user-space wants to use GPIOs and they're mostly doing
> it over sysfs. If you want people to switch over to the character
> device - we must make it at least as useful as sysfs.

Personally, I don't see any practical reason, why I should use the
chardev at all - sysfs is much simpler. The only reason I see is when
needing to set several lines at once - but I haven't seen practical a
usecase where there isn't some specific device behind them, that
deservers it's own driver, attaching to some suitable subsystem.
(actually, I rarely talk to gpios directly from userland - except for
some lowlevel debugging purposes).

> These new features are not unjustified: I receive a significant amount
> of mail with feature-requests for libgpiod (also from people who are
> not well aware that I can only support features exposed by mainline
> kernel).

Do you have more detailed information on what these folks are really
up to, what their actual usecases are ?

> Last thing that users often complain about is the fact that with the
> character device, the state of GPIO lines used by user-space needs to
> be kept by the process using them. This unfortunately often comes from
> the lack of understanding of how a character device functions, but it
> really seems users want to have a centralized agent that takes control
> of the lines, provides standardized interface to interact with them
> and exports their metadata.

Yeah, I also sometimes have those kinds of clients. So far, in all cases
turned out that they actually needed a more high level device driver
(or extend an existing one) instead of touching gpios directly from
within the application. (usually things like relais or extra uart
signalling lines, power control, etc, via gpio, etc).

> Recognizing this fact, I implemented a proof-of-concept dbus daemon, 
> but one thing that it could really
> benefit from is dynamic, event-based synchronization and this series
> tries to add just that (BTW please take a look at the discussion under
> patch 7/8 - the code in this series will probably change a lot).

Oh, no, I've been afraid that this would be coming ... desktop bus in
embedded system is a real nightmare. (yes, some people are even insane
enough to put that thing on an public IP interface and so make critical
machinery like cards easily remote controllable by average school kids)

Seriously, I've seen a lot of similar constructs in the field, all of
them have quickly turned out as complete crap - usually coming from
folks who need >50kLoc ontop of trivial cansocket with silly excuses
like formal certification :o). Please, don't give these kids a machine
gun, they will just hurt innocent people with it :P

> We should probably start a new thread on this. I'll play the
> user-space's advocate and say: has anyone ever needed this? Do other
> kernel sub-systems do this?

Hotplug could lead to such situations.

Playing the kernel advocate here: better don't even consider opening
this apocalypse box and focus on clean kernel drivers instead :p


--mtx

---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2743112FFE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfLDQ01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 11:26:27 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44036 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbfLDQ0Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 11:26:24 -0500
Received: by mail-il1-f196.google.com with SMTP id z12so56706iln.11
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l5BvKTHM/zoTz4seGXHHfrWbsY5sP3TzOHZKpnPr4Mo=;
        b=FpspMFIlGeZrqDF2/XJE4b4HJ2yZBDfWcQJBST1ER6ZNGPsXmpnJ/HpY9cZLdEsskL
         h4W+ZdGRCAeboYcjWYYNcurqXIXr3YrZUItWge2R6BS63miR5/uT0hquIlPrAskCaraC
         F/DKpQLq5M4tSh8Hu/TleOG1As1Ar4yjOfhwzbPet7mTRU5Z5tQFu+e6808Nys17zrEU
         /HQ84hTzSa7VDlYrnvgpJIIdOk8yBjDDPv/WpFq323NP/QuEF2Zs32x4wOcKGcqXv3Jy
         FkXgZWrRdeKcxk1909chNv8vLCzg1gRoQ+0vyt5ox6uZNtKFwQRECrykjFtn3f7eza7o
         T/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l5BvKTHM/zoTz4seGXHHfrWbsY5sP3TzOHZKpnPr4Mo=;
        b=EX2lRKu5rI0gf8fyXCTzIr9i5NolnASIcmcBbMtrhk+G0O23UoV77Ws5ngSQZENmCC
         zg2vaCPt9hYYKkWdIzh0hknZsnKj8RxDnH+Tw8EvQj/E/7fTeXb/AjH2J99FZz0U6u7E
         oDtv65zA8VEMg/92tsbve9J6/CfsyGccATyjrPllqxEmgw7jiJhnVv80ZADSJKdrrmdh
         6ZO+9/hcGTkZIyJjMEzb/vDxglyDkg6THna/aWnGv/63E9YofZFKPsYCVLrfHV05b9vq
         F6zNokNN84i3GICbYhVAtu/hPNte2MGUC59STamUGf9D5IDDZlglGZiGCqQxzOiYa/1x
         6nYQ==
X-Gm-Message-State: APjAAAWAClzWNbNAf5TvZoNt3HeyxieWhnHkct9GQDw1vgiO47mI+GAf
        KTXKvVNRdUuWme+aYGV8BBJn1u8yb/ZNoPCoglLYEw==
X-Google-Smtp-Source: APXvYqzPnzayZZW5JRkkCppKF13E27EKBv1MEhtf+GTBW7j/ktWbB/BIUkqH0asHGgA+VpuYb17oyKaxhfT+vVkEJYs=
X-Received: by 2002:a92:96c2:: with SMTP id g185mr4335869ilh.40.1575476782926;
 Wed, 04 Dec 2019 08:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
 <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com> <0058e57c-5765-3944-3137-10b780985a36@metux.net>
In-Reply-To: <0058e57c-5765-3944-3137-10b780985a36@metux.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Dec 2019 17:26:11 +0100
Message-ID: <CAMRc=McHdtrvkLvT67ew1+88iPtRpd+MO1+5Tr3YsuLceQor1A@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status changes
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 gru 2019 o 13:06 Enrico Weigelt, metux IT consult
<lkml@metux.net> napisa=C5=82(a):
>
> On 29.11.19 11:58, Bartosz Golaszewski wrote:
>
> Hi folks,
>
>
> missed much of this thread, so please excuse me if I'm going to say
> something stupid ;-)
>
> > No, it really is just about keeping the line information in user-space
> > synchronized with the one in the kernel without re-reading the line
> > info periodically. Whether it's the kernel that requests the line or
> > other user-space process doesn't matter. We just want to stay
> > up-to-date with the information we already do have access to.
>
> In that case, why not just using inotify+friends or some blocking read
> for that ?
>
> Personally, I'm a really big friend of synthentic filesystems instead of
> ioctl()s, because they're so simple to use (don't wanna repeat the whole
> Plan9 literature here ;-)), so I'd do it in this way:
>
> * have a file in /sys/class/gpio/... holding the current gpio
>   information, in some easily parsable format. (either one file
>   globally or one per chip)
> * a) this file can be monitored via inotify (just one event when
>      something had changed, or maybe have mtime reflect the time of
>      last change)
> * b) allow read after EOF, which is blocking, until something changes
>
> That way, userland implementation would be trivial enough to do it
> in a simple shell script.
>
> > It may seem like a feature-creep because this is the third new feature
> > being added to the character device in a short span of time.
>
> Personally, I'm not a fan of such chardevs at all, but this raises
> another interesting pretty general topic: sidechannel/out-of-band data
> of chardevs.
>
> Originally, Unix chardevs have been designed as something operates on
> streams of bytes, maybe with some extra operations (eg. setting baud
> rate, etc). ioctl()s have been implemented as some escape route for such
> extra functions. Over the many years, there's been a massive ioctl()
> inflation, even hardware specific ones. IMHO, this is a huge mess, which
> requires to lots of extra work for userland applications, which should
> instead get generic interfaces, even leading to ridiculous things like
> HAL, etc.
>
> Seriously, we should lean back and think of better ways. One idea would
> be making devices more directly-like, where things like oob-streams
> or config attributes can be enumerated and addressed by names.
> (actually, if I could change history, I'd make them actual directories)
>
> > But at
> > the same time: user-space wants to use GPIOs and they're mostly doing
> > it over sysfs. If you want people to switch over to the character
> > device - we must make it at least as useful as sysfs.
>
> Personally, I don't see any practical reason, why I should use the
> chardev at all - sysfs is much simpler. The only reason I see is when
> needing to set several lines at once - but I haven't seen practical a
> usecase where there isn't some specific device behind them, that
> deservers it's own driver, attaching to some suitable subsystem.
> (actually, I rarely talk to gpios directly from userland - except for
> some lowlevel debugging purposes).
>
> > These new features are not unjustified: I receive a significant amount
> > of mail with feature-requests for libgpiod (also from people who are
> > not well aware that I can only support features exposed by mainline
> > kernel).
>
> Do you have more detailed information on what these folks are really
> up to, what their actual usecases are ?
>
> > Last thing that users often complain about is the fact that with the
> > character device, the state of GPIO lines used by user-space needs to
> > be kept by the process using them. This unfortunately often comes from
> > the lack of understanding of how a character device functions, but it
> > really seems users want to have a centralized agent that takes control
> > of the lines, provides standardized interface to interact with them
> > and exports their metadata.
>
> Yeah, I also sometimes have those kinds of clients. So far, in all cases
> turned out that they actually needed a more high level device driver
> (or extend an existing one) instead of touching gpios directly from
> within the application. (usually things like relais or extra uart
> signalling lines, power control, etc, via gpio, etc).
>
> > Recognizing this fact, I implemented a proof-of-concept dbus daemon,
> > but one thing that it could really
> > benefit from is dynamic, event-based synchronization and this series
> > tries to add just that (BTW please take a look at the discussion under
> > patch 7/8 - the code in this series will probably change a lot).
>
> Oh, no, I've been afraid that this would be coming ... desktop bus in
> embedded system is a real nightmare. (yes, some people are even insane
> enough to put that thing on an public IP interface and so make critical
> machinery like cards easily remote controllable by average school kids)
>

Nah, you're overreacting, nobody is putting anything on the network.
Most of my work isn't in upstream kernel development - it's actually
launching CE products. And it's been a long time since I've worked
with a client that could be convinced not to use systemd and dbus on
an embedded system. This just makes things so easy for people writing
high-level application code that it's become de-facto standard -
whether we like it or not.

> Seriously, I've seen a lot of similar constructs in the field, all of
> them have quickly turned out as complete crap - usually coming from
> folks who need >50kLoc ontop of trivial cansocket with silly excuses
> like formal certification :o). Please, don't give these kids a machine
> gun, they will just hurt innocent people with it :P
>

This is just your personal anecdote. I could bring up several examples
of good implementations of event-based, dbus-oriented systems all
right. Bad programmers don't make tools they're using bad.

As for the sysfs vs chardev: this has been discussed a lot. We won't
be adding any new features to the sysfs interface. I want to add this
new feature to allow for creating a central entity controlling GPIO
lines in the user-space. In case of sysfs - IT IS such a central
entity except that it lives in the kernel. It doesn't need to be
notified about changes in line properties.

Bartosz

> > We should probably start a new thread on this. I'll play the
> > user-space's advocate and say: has anyone ever needed this? Do other
> > kernel sub-systems do this?
>
> Hotplug could lead to such situations.
>
> Playing the kernel advocate here: better don't even consider opening
> this apocalypse box and focus on clean kernel drivers instead :p
>
>
> --mtx
>
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287

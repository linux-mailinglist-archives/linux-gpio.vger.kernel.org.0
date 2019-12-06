Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D5911547F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 16:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfLFPoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 10:44:15 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45448 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbfLFPoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 10:44:15 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so5574789lfa.12
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 07:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h57nwXVnGdakt0m0372PTmhC009r6hwfebJAhfxmbqU=;
        b=TlYXT2ZsM5l9LiRH7P9YhNeLIOEIYQcDLYaYG8W2vt9Cn5a9YnUjDE6DT157IlnpWJ
         i2tusFchDH0yDCrKOPnCjAJ80Hne4qmeLP3D+ivQ9aevZm1OOaZjKJo5VJYozc5D5KPC
         Sd00FNaCapeAHyP7WOKUBiXltxGEA/q36Wlw3NGWqZrP6Vzv1f/9CMEDpSVDc+KMxbx6
         W9aCIm0ucBD70hPe8qPvtGHe1xmS1s7H65lrKZfw5hW1Vv//wXKmFj5r4maCl4bhJ+O/
         jmTBpCm/xW+24ogzEJ2wTAFDFtiXPOOB0ryQ8AozDiqaSzB6JD//yGCEBdtSZO1NbIQu
         Zt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h57nwXVnGdakt0m0372PTmhC009r6hwfebJAhfxmbqU=;
        b=rZ2uX2k72cTdNQwgrvjwU+7kXY4fVMOdQeItHNUNEeZesmeyC5nmXgQEbuk1ux/394
         UDOEUyy57T/gfeTbhHuB8I1PmsHVAB4EoiF322Yq+DS+/syYfvOK5C6EbJUKSOukvK5/
         mg3z05X5OyqnYmMKA6bfOaZZu0GsSpktCyFK+mM688UIfeomcCqTt0UxaHqP7zhAGvOi
         Lri6T4tX/vp/s7BFOZCHjt2PQCE0qtrnw56L+yaujYZWBwOFsAdPjsvB4ZqOCoMC7tqi
         9L8C0jtGUMFXSl/aKgWL2LpMwHrnnV5ReaA6bct3bmrn+cohDxr/3xDdlGLrIUfReuQ+
         dR+w==
X-Gm-Message-State: APjAAAX3b6iyd8Hzr1V++H9qM+fMuab+wqqyPGXSdj1Hb3zdd8Pzz3Py
        VK76Ua3gwNeJK2KKdK0qyqqh7Gm6ca2J2b5DXfyhTQ==
X-Google-Smtp-Source: APXvYqwhRo7fdzEzR5N/FRa9wALvkraOG9kEEr6VybUSbPNXGgO/qeLhw/JjTvz5aU7De9ZekqLGmNmiu22U7XHmN6o=
X-Received: by 2002:a19:c84:: with SMTP id 126mr8505675lfm.5.1575647052245;
 Fri, 06 Dec 2019 07:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
 <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com> <0058e57c-5765-3944-3137-10b780985a36@metux.net>
In-Reply-To: <0058e57c-5765-3944-3137-10b780985a36@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Dec 2019 16:44:00 +0100
Message-ID: <CACRpkda-nucsM-b=68t5N2gQ7910G_a5Hz1cEwSNgVHgvJhqLA@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status changes
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 1:06 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> Personally, I'm a really big friend of synthentic filesystems instead of
> ioctl()s, because they're so simple to use (don't wanna repeat the whole
> Plan9 literature here ;-)), so I'd do it in this way:
>
> * have a file in /sys/class/gpio/... holding the current gpio
>   information, in some easily parsable format. (either one file
>   globally or one per chip)

The topology for the current solution is in /sys/bus/gpio actually,
but I get what you mean.

> * a) this file can be monitored via inotify (just one event when
>      something had changed, or maybe have mtime reflect the time of
>      last change)
> * b) allow read after EOF, which is blocking, until something changes
>
> That way, userland implementation would be trivial enough to do it
> in a simple shell script.

The current (deprecated) sysfs pretty much does this.

The main issue sysfs in its current form had to die was that it relied
on global GPIO numbers. An alternative to the character device
would be to use e.g. subdirs for each GPIO chip and export
local offset numbers from there, but well we
reached a fork in the road with the chardev I'd say.

The main problem solved with the chardev was that scripts that
died/crashed left the sysfs nodes explicitly exported and
populated and everything just in the general mess it was at the time
the application crashed.

Of course it is easy to pose things like that the application should
register crash handlers or whatnot, but it turns out people weren't
doing that and with a character device, then it cleans up automatically
if the application dies or get terminated by a signal for example,
and the same application can just be relaunched without problems.

> > But at
> > the same time: user-space wants to use GPIOs and they're mostly doing
> > it over sysfs. If you want people to switch over to the character
> > device - we must make it at least as useful as sysfs.
>
> Personally, I don't see any practical reason, why I should use the
> chardev at all - sysfs is much simpler.

I see your stance, but it also makes it much easier to shoot
yourself in the foot.

> (actually, I rarely talk to gpios directly from userland - except for
> some lowlevel debugging purposes).

Nobody should. The users of userspace GPIO are factory lines,
industrial control and automation, maker communities and odd
prototypes. Not deployed products like phones or computers.

> Do you have more detailed information on what these folks are really
> up to, what their actual usecases are ?

The typical cases involves rigging a few relays and sensors
up in a lab to perform some automation, not dissimilar to e.g.
PLC (programmable logic controllers) and such. The world is
full of these one-offs, some in more expensive and intimidating
environments than others. Some are the lab bench of a few
select makers. Makers are not important to big capital and
big business (who are not talking to us) but they are important
to the community exactly because they are talking to us.

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
> Seriously, I've seen a lot of similar constructs in the field, all of
> them have quickly turned out as complete crap - usually coming from
> folks who need >50kLoc ontop of trivial cansocket with silly excuses
> like formal certification :o). Please, don't give these kids a machine
> gun, they will just hurt innocent people with it :P

I don't think that argument by likeness (with something you don't
like) is a very good one.

What we are discussing is what is nowadays referred to as
the "service layer" including D-Bus etc and systemd, whether
it uses D-Bus or something else is irrelevant.

OpenWrt has a service layer, it is called ubus, and it has a
system layer daemon as well (similar to systemd). This is deployed
in millions of routers as router manufacturers almost exclusively
build on top of OpenWrt these days. It is not a lot of code.
https://openwrt.org/docs/techref/ubus

Yours,
Linus Walleij

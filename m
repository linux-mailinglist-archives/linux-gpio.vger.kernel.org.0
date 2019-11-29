Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E53F10D5EC
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 13:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfK2M6M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 07:58:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44730 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2M6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 07:58:11 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19so4903606lji.11
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 04:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BwDOxdYS9C1nAUpyH/ENu81FUiSCQpCKczP+61pjasQ=;
        b=crS2ePN38PPEdrAGga5X5SdPjSCGysWoJ7Y6HLdDsk28UI2ZbxwM1PyppFNC62+y5U
         P9UTM7kIAj03cHMSBUzAOr5d3Tfav933DVsnK5KH36MQ3Z5ttizoLkoEZesl/hqUCJXf
         XIYfZmIC6PokZn4jYhaxzULdNslyrdrfdiwU0dJiWp3EEU2ECbHkTqh9W3rHFKymEBZf
         C5kHeB9TrPuM8avK+IVNX2WfGhIb9wAYIYDW3yG5Qlp2BAYhYC9xRHTMXl6CrMjsOFXz
         DpX4hol7LMmnH7mq2BDPvPAUiyc7QIhNQsHRMGT62gaapRYYJErrL2wMqJ6VIKOr17Ge
         6gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BwDOxdYS9C1nAUpyH/ENu81FUiSCQpCKczP+61pjasQ=;
        b=oMH7zW/dzNH9eDfJYiBazJJArhWcx5XGYuHMnZYQxWaYHuxzaEuQuDy2UlJEbnouEl
         L208PAu8hdCO/zFEVQti3XaY+nDNB4hvNq0k9zmvHZhwMcRFODr0pdgUKvYWuAIA1Yfy
         A5t73t1GyOOPGcssCttwbWobtFvx7j+3FIiiNLN92fsfOoeGRLHGsRBzFMYMs6WoGDkz
         HCzM5xqex1U/sLsulQtY4rsUJCyGUS4NFRWIdJq/UyyhnIMm4HxyKKbuC4xTdBAtxLue
         GbXq/PuFLU8FkyQ3NMOjV1NTFYcSBNXRoiqi8lPGcN5YtofTkW2ROzc5XZaN4+V3Eeoz
         lCxA==
X-Gm-Message-State: APjAAAU/jgqS64dQqHRqFaJHcYP8ZgxxZj7Di/NY81wIM7UFR1qjxxOz
        LF1pxeErsn+zcNz9+XAP+15U2RCKYalA5maS2FuFeg==
X-Google-Smtp-Source: APXvYqzV1iuQAGMcFSVgJ5Bw2ISZGQZlKilK4xyHtnxgDDNOEVpKbQ4Cr8PmcDQpNXQ7TiMFF4aTomfOMID3PXP8h88=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr16863113ljm.233.1575032288806;
 Fri, 29 Nov 2019 04:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
 <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
In-Reply-To: <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Nov 2019 13:57:57 +0100
Message-ID: <CACRpkdaW8YxjEBN0jX5AYmzGyftGv=b-KOCsjMMxoqqESBDsyA@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status changes
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 29, 2019 at 11:58 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> pt., 29 lis 2019 o 11:04 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):

> > Is the *main* use case different userspace processes trying
> > to use the same pins and getting denied? Because in that
> > case we might be putting a bit too much userspace plumbing
> > into the kernel and we need to think about that for a while.
> > (Binder and kdbus etc comes to mind.)
>
> No, it really is just about keeping the line information in user-space
> synchronized with the one in the kernel without re-reading the line
> info periodically. Whether it's the kernel that requests the line or
> other user-space process doesn't matter. We just want to stay
> up-to-date with the information we already do have access to.

I was more after whether the expected conflict we resolve
will be mostly between kernel and userspace or between
userspace and userspace, statistically speaking. Like: what
is happening to actual systems people are trying to deploy.

> > So there is some feature growth happening here and I want
> > to be aware of the whole picture.
>
> It may seem like a feature-creep because this is the third new feature
> being added to the character device in a short span of time. But at
> the same time: user-space wants to use GPIOs and they're mostly doing
> it over sysfs. If you want people to switch over to the character
> device - we must make it at least as useful as sysfs.

So a part of the design criteria is to provide the same functions
as e.g. putting inotify's on /sys/class/gpio/* and watching as
files come and go or something like this?

(That sounds reasonable.)

> These new features are not unjustified: I receive a significant amount
> of mail with feature-requests for libgpiod (also from people who are
> not well aware that I can only support features exposed by mainline
> kernel).

OK

> It turns out that RPi people really wanted the BIAS settings because
> the downstream RPi GPIO interface supports it. Having added this may
> now make them switch to libgpiod.

That's good news, I think Drew said the same thing about
Beagle.

> Old sysfs interface allows to change the direction of lines or their
> active-low setting at run-time and it turned out this too is a
> functionality people want to see in libgpiod. Thanks to Kent's effort
> we now have it.

Yeah that's a win.

> Last thing that users often complain about is the fact that with the
> character device, the state of GPIO lines used by user-space needs to
> be kept by the process using them. This unfortunately often comes from
> the lack of understanding of how a character device functions, but it
> really seems users want to have a centralized agent that takes control
> of the lines, provides standardized interface to interact with them
> and exports their metadata. Recognizing this fact, I implemented a
> proof-of-concept dbus daemon, but one thing that it could really
> benefit from is dynamic, event-based synchronization and this series
> tries to add just that (BTW please take a look at the discussion under
> patch 7/8 - the code in this series will probably change a lot).

OK

> I believe this may be the last missing piece and after that we can
> really consider this ABI feature-complete.

OK that is a good point.

My own pet peeve is the industrial automation and control use
case: here we have the design space where people today use
either PLC:s or RaspberryPi's or Beagle boards, or even some
custom computers.

For me personally that is a design space we should cover and
if this helps the RaspberryPi to do that better I'm all for it.

An especially interesting case is multiple GPIO expanders
plugged in on pluggable busses such as PCI or USB. I think
that kind of discoverability and dynamically expandable GPIO
blocks is something people in the industry are quite keen to
get.

What we need to do is to make it dirt simple to use GPIOs for
custom hacks and construction of factories and doorstops
and what not, while at the same time strongly discouraging
it to be used to manage hardware such as laptops, tablets
or phones from userspace. That's maybe hard, and we might
be victims of our own success ...

However the eradication of the sysfs ABI seems to be well
on track!

> > On a side track:
> >
> > There is a bit about policy that needs to happen here I suppose,
> > like for example what if the kernel actually wants one of the
> > lines that userspace has picked? Should userspace be kicked
> > out and kernel get what it wants? (Arguably yes.)
> >
>
> We should probably start a new thread on this. I'll play the
> user-space's advocate and say: has anyone ever needed this? Do other
> kernel sub-systems do this?

So far it was designed under the assumption that this kind of
collisions are handled on a first-come-first serve basis, and
that is indeed how it works today.

I'm just not sure that this assumption is going to hold in the
future so wanted to make a little check-up.

Linus

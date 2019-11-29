Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C21910D478
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 11:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfK2K6U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 05:58:20 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:45436 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbfK2K6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 05:58:20 -0500
Received: by mail-il1-f194.google.com with SMTP id o18so26589356ils.12
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 02:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YfFvNkCWeIc/nuAQXwL/i9+ytxGk8uHz1PeXwtteRA8=;
        b=2HBo+oOG6wEGJvSBRITYOEhNlHWouidNQA2AzoHb9AmqSb6rN2VRxC9633dmcslUBq
         cT+KmRH/NHu0swaV2TSP3UDgnpIi+t2Zg/CjBbFkl+AGtVmN4AAQT7l4nUtsVrH6IWWQ
         hfnzMMM9YL4PBL4ZKsWz9jdLfAERnb4jRRv+goGR13D/J8Ow5V+QrVxhRfJpPtOeIFdl
         IjtjYRavJuxvnQOWisOxY5eL2B+eWGOWSLyznwcgxyZ0QBbEDO6tSqJ1gIlvi0L9g64p
         kajLRTtvzENYlaC/Hqhj1kSvh7Ti6hTtJDnxzZfwgnD/YrgCN3jGoQmJUJAQVl7LQ8ZK
         P2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YfFvNkCWeIc/nuAQXwL/i9+ytxGk8uHz1PeXwtteRA8=;
        b=j3FQIuaF88C+jDuRkOlrKGn5Sg8P2TueN3GHAHMi7dcwZZlb01afwabNmWaXdLBiLL
         EHD6DK03VXY6FCuzSbmCfG5n56HwhUGpGvgIohdMUVsCpM1yScP9GaJ4TErspwnce9kI
         xkEJtp1iCte54pi8Ui3mMect5DiXcI4qGqHbufk9QagJe2J9iopDgLxUgMWy+DpTY7zJ
         8wHKTV4aAzRmq5n0oVxzJaK1umgnl340JTWz7t/Y5siobp7d5pKo/RAjZBQThbbNZ03s
         nPaws/UCP2FybwoOqZJ6/DQWRuF+daf9fwywP/rStyQ0cKOBrkUJpmUAE/m7tDKeIu6q
         dxCA==
X-Gm-Message-State: APjAAAVOqVlfhl5Nfyc8B5fGD4oEO7Kj2DPkHho3jt+Y0v9nPhDy04rd
        s92EpN/Af5rDoTI8AsosixRN94z3S1txmxZvYe6tKw==
X-Google-Smtp-Source: APXvYqx80wZExuKs7rN4Qumjr/0JZJVPczCjcJ2pGf9kSb7ikZYNbSSLm/kDcm5Ux6spp2wcSPODXCoc4poto9zf1Ds=
X-Received: by 2002:a92:49d1:: with SMTP id k78mr35225097ilg.6.1575025097496;
 Fri, 29 Nov 2019 02:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
In-Reply-To: <CACRpkdZ6e0GaE9KBJ1-E+cS_KnPY-EKLNxJFqjArr28hYMQqOg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 29 Nov 2019 11:58:06 +0100
Message-ID: <CAMRc=McH6m3Lsvz8g1JSD_c-QNdb-Kh0+8BH5EKcEW2vM2VYJA@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status changes
To:     Linus Walleij <linus.walleij@linaro.org>
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

pt., 29 lis 2019 o 11:04 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Wed, Nov 27, 2019 at 2:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > This series adds a new ioctl() that allows user-space to retrieve a
> > file-descriptor which can then be polled for events emitted by the kern=
el
> > when the line is requested, released or its status changed. This of cou=
rse
> > doesn't require the line to be requested. Multiple user-space processes
> > can watch the same lines.
>
> So if I understand correctly all the series do is expose metadata about
> all GPIO lines to userspace?
>

I'd say it's about adding a way to dynamically watch changes in this metada=
ta.

> I think up until now the use case assumptions have been:
>
> - The kernel will pick off some GPIO lines, mostly during boot but
>   occasionally at runtime (by users such as kernel modules or
>   hotlugged devices).
>

Indeed.

> - Userspace will pick some lines from those that are available,
>   after the kernel picked those it wants. If it tries to pick one of
>   those that the kernel already picked, the request will be denied.
>
> The assumption (at least in my head) was that the GPIOs the
> kernel picks will not be a very dynamic business.
>
> So this appears to be dealing with this very dynamic business.
>
> Is the *main* use case different userspace processes trying
> to use the same pins and getting denied? Because in that
> case we might be putting a bit too much userspace plumbing
> into the kernel and we need to think about that for a while.
> (Binder and kdbus etc comes to mind.)
>

No, it really is just about keeping the line information in user-space
synchronized with the one in the kernel without re-reading the line
info periodically. Whether it's the kernel that requests the line or
other user-space process doesn't matter. We just want to stay
up-to-date with the information we already do have access to.

> So there is some feature growth happening here and I want
> to be aware of the whole picture.
>

It may seem like a feature-creep because this is the third new feature
being added to the character device in a short span of time. But at
the same time: user-space wants to use GPIOs and they're mostly doing
it over sysfs. If you want people to switch over to the character
device - we must make it at least as useful as sysfs.

These new features are not unjustified: I receive a significant amount
of mail with feature-requests for libgpiod (also from people who are
not well aware that I can only support features exposed by mainline
kernel).

It turns out that RPi people really wanted the BIAS settings because
the downstream RPi GPIO interface supports it. Having added this may
now make them switch to libgpiod.

Old sysfs interface allows to change the direction of lines or their
active-low setting at run-time and it turned out this too is a
functionality people want to see in libgpiod. Thanks to Kent's effort
we now have it.

Last thing that users often complain about is the fact that with the
character device, the state of GPIO lines used by user-space needs to
be kept by the process using them. This unfortunately often comes from
the lack of understanding of how a character device functions, but it
really seems users want to have a centralized agent that takes control
of the lines, provides standardized interface to interact with them
and exports their metadata. Recognizing this fact, I implemented a
proof-of-concept dbus daemon, but one thing that it could really
benefit from is dynamic, event-based synchronization and this series
tries to add just that (BTW please take a look at the discussion under
patch 7/8 - the code in this series will probably change a lot).

I believe this may be the last missing piece and after that we can
really consider this ABI feature-complete.

> On a side track:
>
> There is a bit about policy that needs to happen here I suppose,
> like for example what if the kernel actually wants one of the
> lines that userspace has picked? Should userspace be kicked
> out and kernel get what it wants? (Arguably yes.)
>

We should probably start a new thread on this. I'll play the
user-space's advocate and say: has anyone ever needed this? Do other
kernel sub-systems do this?

> Yours,
> Linus Walleij

Best regards,
Bartosz

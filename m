Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A911115886
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 22:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfLFVUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 16:20:54 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:40989 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfLFVUy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 16:20:54 -0500
Received: by mail-io1-f68.google.com with SMTP id z26so8767968iot.8
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 13:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8mnXgPaScBnr46TzaGLXmqKZ0PVzrE5M2Q6iH8H72FI=;
        b=0eyOvDV4bCLLomF/wyhQ652/636EWvdSnKPbbpWNWDB+rCsgfAo8nb37krB51Zx3ky
         6gJVw6phTfePlGP+NWoxiiGo7cPFl8S0ZWdKwUcWiCG0a0SK3FB3OQhsnhC2yeSBEEUw
         /6YMhNZ8Nc4XKgJovonlIFCiiJnhEF0LdE+UZnkWZ81dHjgW2BC12NUMvtxGeESiTqWf
         cdG9R85Y+v5vSgU8IgywKWCQPTjV5WQIxZgRETTmuvET/8RlfvuX7oCgk2qu0+Fut8dA
         hWzIJkwF9I38Uu5JwOZ2vRaw+iLpB3YxLMwWrkAS1h7HYzKvVOoosVFjwysifFzyhmAZ
         xHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8mnXgPaScBnr46TzaGLXmqKZ0PVzrE5M2Q6iH8H72FI=;
        b=XmxJr/lZ87WgEjqilZmXjVjIBs5wYFCcDp98HeaPhiTtGSpU83hNuYAk9wRx6tLoHV
         SNM3NsWVxkUbD4ijmMPE3YvT9pZwSo1+gMZSW0dmI6wS31BKG99Ir4w9jODbe5pT2WmG
         Xdgkcl/rJ9IPcrJa4OKjE2M9ByINbaQnPZbMT2O8nypFKZ+KBikYzrV2nZMfHwn/PMiN
         2eqa+byqIfutYvOfH7pw+zUO7+Hhwx/WcOjxXc95N8bayACmBDgdxCIFy52xx8SnpKkv
         aCnQ8YLPBpa+yMUZwqrE/swcofWVPud9Ggpk/MyrxnmmUHr8dQG5FRMYxjWipbjUrW81
         h7SQ==
X-Gm-Message-State: APjAAAXRxdqca1CdtOHaJkrMXH2wfiuAnk8nJZYTAOngxnTPbBICwLdm
        o/KgLY0tywSFF598NVVYzhtMr/LYPmrbCrpGz4N8FQ==
X-Google-Smtp-Source: APXvYqxQG/MFm0NLPU4pZANlC1CFo68XRWkNDIeyGZqw4l+RAF1ncBBDqqw2FfVcYZKh042PzFTvHrU+6yIkRe55Z1I=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr7393244iom.6.1575667253892;
 Fri, 06 Dec 2019 13:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
 <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
 <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com> <CAHp75VfzP8-0wKmPTTKYe+fc6=r_4sVcJPyOsM8YTuH=i4rxmA@mail.gmail.com>
In-Reply-To: <CAHp75VfzP8-0wKmPTTKYe+fc6=r_4sVcJPyOsM8YTuH=i4rxmA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Dec 2019 22:20:42 +0100
Message-ID: <CAMRc=MfxteQDmeZn_Et0uFs2cPvLGpJ5BTeBOn37o=2Oo_eU=Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 5 gru 2019 o 18:02 Andy Shevchenko <andy.shevchenko@gmail.com> napisa=
=C5=82(a):
>
> On Thu, Dec 5, 2019 at 3:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > czw., 5 gru 2019 o 11:27 Andy Shevchenko <andy.shevchenko@gmail.com> na=
pisa=C5=82(a):
> > > On Thu, Dec 5, 2019 at 11:42 AM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > > > =C5=9Br., 4 gru 2019 o 23:34 Andy Shevchenko <andy.shevchenko@gmail=
.com> napisa=C5=82(a):
> > > > > On Wed, Dec 4, 2019 at 6:03 PM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > > So, the test cases, I can imagine of, should include (k - kernel, u -=
 user):
> > > - 64k-64u: LE and BE
> > > - 64k-32u: LE and BE
> > > - 32k-32u: LE and BE
> >
> > I usually use qemu VMs built with yocto for testing but I don't see
> > any way of creating a 32-bit user-space with 64-bit kernel. Any ideas
> > on how to prepare a testing environment?
>
> In my case it's very easy. I do
> - compile kernel as 64-bit separately;
> - compile initramfs of Buildroot distro with external kernel build provid=
ed.
>

Any specific config options are needed on x86-64 kernel to use 32-bit
user-space? I'm not well versed in x86 architectures, that's why I'm
asking. I built a 32-bit userspace qemu image with yocto and then
manually built a 64-bit kernel. I tried running it but I'm getting a
kernel panic when the rootfs is being mounted.

On a different note: why would endianness be an issue here? 32-bit
variables with 64-bit alignment should still be in the same place in
memory, right?

Any reason not to use __packed for this structure and not deal with
this whole compat mess?

I also noticed that my change will only allow user-space to read one
event at a time which seems to be a regression with regard to the
current implementation. I probably need to address this too.

Bart

> That's setup in which I observed the issue.
>
> --
> With Best Regards,
> Andy Shevchenko

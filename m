Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF61109910
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2019 07:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfKZGJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Nov 2019 01:09:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:60406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbfKZGJg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Nov 2019 01:09:36 -0500
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92C282073F;
        Tue, 26 Nov 2019 06:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574748575;
        bh=pHxQw4eAkDVM2NOdyDU2Qf2aPQMBOwtOkM9PYH46Vws=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kiBuFTigYwZGLvOACGTXFW13iDjzjtD3cPkIOnekL34wG1IppWnQZpwTnlvmjcWTV
         sjZhepeFmfbcT3aa0oJirH+VZRIrULYBuu4/NJM3r2zz107qZwcSd3j2D6mpZZUDPD
         VUzLSTlamDYz0Sb7zz+ucMU3kzft7sObn55ekn3I=
Received: by mail-lf1-f52.google.com with SMTP id b20so13047692lfp.4;
        Mon, 25 Nov 2019 22:09:35 -0800 (PST)
X-Gm-Message-State: APjAAAUiJjOBytTkUvI5p5ABxCjUAN7vNV9A6m/SrJRpKJdQBPKsM5KQ
        nO/wZ6yh61rOdrq8bJQlaQb+jNKQBP3X7CZZ7iY=
X-Google-Smtp-Source: APXvYqz+mGoODbXvuWOpDuoB4deHWZfXkDpLgYpz6o9dXanE8DhcvBX9SLi7XUWlKABR+ahnXp9G2qAt2UtBvsZP3es=
X-Received: by 2002:ac2:51b5:: with SMTP id f21mr23141783lfk.159.1574748573659;
 Mon, 25 Nov 2019 22:09:33 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191121072643epcas2p452071a503725c7764acf5084d24425b1@epcas2p4.samsung.com>
 <001001d5a03d$05de1f70$119a5e50$@samsung.com> <CAJKOXPckbRowhCmnJfT8-DT3gYaTpDOf0wVxmxdf-tZpOyM5ew@mail.gmail.com>
 <028901d5a3f6$e2d72310$a8856930$@samsung.com>
In-Reply-To: <028901d5a3f6$e2d72310$a8856930$@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 26 Nov 2019 14:09:22 +0800
X-Gmail-Original-Message-ID: <CAJKOXPdy=oxkwspt3CpF-qV5XRPMKrupMOpbWXJT3e7trqvXkw@mail.gmail.com>
Message-ID: <CAJKOXPdy=oxkwspt3CpF-qV5XRPMKrupMOpbWXJT3e7trqvXkw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: modularize samsung pinctrl driver
To:     Hyunki Koo <hyunki00.koo@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 26 Nov 2019 at 09:14, Hyunki Koo <hyunki00.koo@samsung.com> wrote:
>
> On Thu, 21 Nov 2019 at 16:38, Krzysztof Kozlowski <krzk@kernel.org> wrote=
:
> > Hi,
> >
> > Thanks for the patch. Few comments below:
> >
> > On Thu, 21 Nov 2019 at 15:26, =EA=B5=AC=ED=98=84=EA=B8=B0 <hyunki00.koo=
@samsung.com> wrote:
> >>
> >> Enable samsung pinctrl driver to be compiled as modules.
> >
> > Why? What's the benefit? Are platforms capable of such boot? Pinctrl is=
 needed early - even before mounting rootfs...
> > What about module unloading? Is it reasonable?
> > Please answer to all this also in commit message.
> >
>
> Sorry to late and Thank you for your comment, I would like to apply GKI o=
n the pinctrl driver
> So I would like to cut off dependency from ARCH_EXYNOS.

This is driver for Exynos and S3C so why cutting off the dependency? I
mean, wait, it is a driver for Exynos so it cannot work on other
boards...

> I will split into two part,
> First, cut off the dependency with ARCH_EXYNOS in arch/arm64/Kconfig.plat=
form.
> Second, I will make the pinctrl driver as a module.

Then you are doing it in wrong order - this patch makes it as a module
but you send it as first one.

You did not resolve however my questions about:
1. Will this even work? Will platforms boot?
2. How are you going to handle module unloading since on purpose we
added suppress_bind?

>
> >>
> >> Change-Id: I92a9953c92831a316f7f50146898ff19831549ec
> >
> > This does not belong to Git.
> >
> >> Signed-off-by: Hyunki Koo <hyunki00.koo@samsung.com>
> >
> >You "From" name is different than written here in Signed-off-by. They sh=
ould match and I do not know Korean to be able to tell whether they really =
match or not :).
> >How about using Latin transliteration also in "From" field?
> >
> >> ---
> >>  drivers/pinctrl/samsung/Kconfig                |  5 +----
> >>  drivers/pinctrl/samsung/Makefile               | 13 +++++++------
> >>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c   |  2 ++
> >>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  2 ++
> >>  drivers/pinctrl/samsung/pinctrl-exynos.c       |  2 ++
> >>  drivers/pinctrl/samsung/pinctrl-samsung.c      | 13 +++++++++++++
> >>  6 files changed, 27 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/samsung/Kconfig
> >> b/drivers/pinctrl/samsung/Kconfig index 425fadd6c346..25e16984ef23
> >> 100644
> >> --- a/drivers/pinctrl/samsung/Kconfig
> >> +++ b/drivers/pinctrl/samsung/Kconfig
> >> @@ -3,14 +3,13 @@
> >>  # Samsung Pin control drivers
> >>  #
> >>  config PINCTRL_SAMSUNG
> >> -       bool
> >> +       tristate "Pinctrl driver data for Samsung SoCs"
> >>         select PINMUX
> >>         select PINCONF
> >>
> >>  config PINCTRL_EXYNOS
> >>         bool "Pinctrl driver data for Samsung EXYNOS SoCs"
> >>         depends on OF && GPIOLIB && (ARCH_EXYNOS || ARCH_S5PV210)
> >> -       select PINCTRL_SAMSUNG
> >>         select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV2=
10)
> >>         select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
> >>
> >> @@ -25,9 +24,7 @@ config PINCTRL_EXYNOS_ARM64  config PINCTRL_S3C24XX
> >>         bool "Samsung S3C24XX SoC pinctrl driver"
> >>         depends on ARCH_S3C24XX && OF
> >> -       select PINCTRL_SAMSUNG
> >>
> >>  config PINCTRL_S3C64XX
> >>         bool "Samsung S3C64XX SoC pinctrl driver"
> >>         depends on ARCH_S3C64XX
> >> -       select PINCTRL_SAMSUNG
> >> diff --git a/drivers/pinctrl/samsung/Makefile
> >> b/drivers/pinctrl/samsung/Makefile
> >> index ed951df6a112..b3ac01838b8a 100644
> >> --- a/drivers/pinctrl/samsung/Makefile
> >> +++ b/drivers/pinctrl/samsung/Makefile
> >> @@ -1,9 +1,10 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  # Samsung pin control drivers
> >>
> >> -obj-$(CONFIG_PINCTRL_SAMSUNG)  +=3D pinctrl-samsung.o
> >> -obj-$(CONFIG_PINCTRL_EXYNOS)   +=3D pinctrl-exynos.o
> >> -obj-$(CONFIG_PINCTRL_EXYNOS_ARM)       +=3D pinctrl-exynos-arm.o
> >> -obj-$(CONFIG_PINCTRL_EXYNOS_ARM64)     +=3D pinctrl-exynos-arm64.o
> >> -obj-$(CONFIG_PINCTRL_S3C24XX)  +=3D pinctrl-s3c24xx.o
> >> -obj-$(CONFIG_PINCTRL_S3C64XX)  +=3D pinctrl-s3c64xx.o
> >> +obj-$(CONFIG_PINCTRL_SAMSUNG)  +=3D pinctrl-samsung-super.o
> >> +pinctrl-samsung-super-$(CONFIG_PINCTRL_SAMSUNG)        +=3D pinctrl-s=
amsung.o
> >> +pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS) +=3D pinctrl-exynos.o
> >> +pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS_ARM)     +=3D pinctrl-e=
xynos-
> >> arm.o
> >> +pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS_ARM64)   +=3D pinctrl-e=
xynos-
> >> arm64.o
> >> +pinctrl-samsung-super-$(CONFIG_PINCTRL_S3C24XX)        +=3D pinctrl-s=
3c24xx.o
> >> +pinctrl-samsung-super-$(CONFIG_PINCTRL_S3C64XX)        +=3D pinctrl-s=
3c64xx.o
> >
> > I don't get why you need to rename obj to pinctrl-samsung-super?
>
> I would like to make pinctrl as a super module. It is many dependency bet=
ween pinctrl-exynos, pinctr-exynos-arm64 and pinctrl-samsung

Might be a stupid question but what is "Super module"?

Second, the dependencies are there because this is a integral part of them.

I think I miss some bigger picture here because I still do not
understand what you want to achieve in the end (why doing this)?

Best regards,
Krzysztof

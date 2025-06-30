Return-Path: <linux-gpio+bounces-22457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B07AEE780
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 21:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F396189E0CA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 19:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E601D9324;
	Mon, 30 Jun 2025 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzHLCqZz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0D43AA8;
	Mon, 30 Jun 2025 19:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312002; cv=none; b=WW3h5wDw0DHRg6jquE1zET/m5xhj92pGKNO7fbSDhjEOlLukqwfY8BrkN/4gWV+PcKyn7m0YN/dAXVWu6tqTZui+Bfpq3m/0GVOejUYfuPoefKDPj49nl6l50zl9plHb+MO3HBtyPBm/ZCFPhUorBarAo6No9TwQvjaEsp6/jNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312002; c=relaxed/simple;
	bh=kAgCkIezU6dLBy1qMupKYWlktOvfEHFfvi2Jw9Kl2mQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjjQoDDKxPVn8yI/CijBA23Vqp/qnIODtsmp4w6wLDghuSfe/Ec9fw379/owGeUIOLcXkaC1kBDiaakeadjYjuGuTbvbJozSQxw1WspMcJaWza666MURhYn7O49N3w8N5wXA/Z6EEMadADYwFh5FEH4LxkBfOL6stUKnSn0GIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzHLCqZz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2815743e87.0;
        Mon, 30 Jun 2025 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751311999; x=1751916799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFs/ehALtL0+qFoc09farxfhDThHkq27kEeWKbJRfGk=;
        b=UzHLCqZzj5VdFge5P2m69zRTiOQb3akVYozKL8eB0wVLA3pt1BpronGJobo/KBWeWD
         DSO/85yqe0mhDPHOnvTFU0OatKWF4komXCQlESno6uhogZM7h2Oy2WTqMDoNUCFPnGrW
         YKjZrC/vxJBeXQZBxnpZRJaPGZ7zkbVLrFD2lK8j/wmcb035sfZzAsN1+SWYGxN2TkOB
         O+nxy2YSHVLj8OCJVSK4EGOFIx701r2DT1BAQthXg1RzLrVMiQNQ/+QrHEyxjKu9JUIO
         vawL+9+nHbMVCiihEaA2QWnRCVmPgOXAW3+XaJN4DEl66O95ggUwDQMQDlMygnQD0bOT
         hkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311999; x=1751916799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFs/ehALtL0+qFoc09farxfhDThHkq27kEeWKbJRfGk=;
        b=cpK0K8QGhudYWkGClAZwbZT45awnVDRI43QUsHR6bSrE1ua/fHa4dydXAPGqVV8a2j
         DHE+mm3Q+IOoZCJ9G7V+ON8CqH3GVgcFn45+31Mqw7pCjwmb3XuQ1Its6W0rMr5NlKrD
         MiCFjDB9/sYyglhQyMDK+9PSrx6PquISztLTmzgHY6NAo/1UrjRWU8+26k5y8cNnYEzW
         Xob6lK4Z+Q5jpAPYfI36b/GmFBTLFsM8PXlT+Qc1Bg29r8xgeLIkFnfU7bxYY2ddAP+O
         nSneXA/QcjR3Zs5qDY3ivnsVy/ItOT3TzxOxdWt+Akvao5gVPvMRPJRMpcZcHorymtz9
         jqVg==
X-Forwarded-Encrypted: i=1; AJvYcCVOFlw9So+YVi4sIyijQBrOly/lQQd+rmBnJrOCEwO6RALdjATTgUfwoqDEcCbPaD8SOsI1IfyJdA/SbPpO@vger.kernel.org, AJvYcCVkPBcB5VDrm3SbVUNg61LkAl8ktNstWfjHk5TehnzhEK7QugLjDJHXLc01mQYP/NmypdRQ2KBTCGSN@vger.kernel.org
X-Gm-Message-State: AOJu0YzuFEDAzxFPB9m3HZ0x1KAphZ8IXU7/9r9GRT+nDfitCQy09YTr
	vpa9tLAUg4ms4USKd5ofgVfPelolXY0nBGYbYzYl8QSZ7Le9HiMZgdt9C/sSK79O1ZcKSiu27I7
	zLqgZxiUa2esTbWzu3QrkqaZZPw1AgAk=
X-Gm-Gg: ASbGnctyGWeif/he9M2GEx0ChYrgnnVIjvMxutD0bi8sYB4zEsx7wGg/4A3cVoY9wmK
	HZfAp3K98o36je5fqMcC1VluVuv9Gd41YXk/8N4sDHH8P+gR/OHByotkZCRvtv4r4xipAnaAw4M
	4UXluQ1iYgmFxupI6ZreBaRx8Wb1NrfDPBXAhmwQv3sws=
X-Google-Smtp-Source: AGHT+IGL1mELHdrz6HdxzWEWB3SBn7d/Rnj0vx3ffhkVy9NM2gVR9bObheCFocjQaqGhjFns4WPlclmCGQsLdR2UqGw=
X-Received: by 2002:a05:6512:3055:b0:553:cc61:1724 with SMTP id
 2adb3069b0e04-5550b84e53dmr4479902e87.24.1751311998729; Mon, 30 Jun 2025
 12:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com> <CAMRc=Mdwa=DuubA6P+EnjUAQE8XupYsbo=3LuH-jYEBttREGqg@mail.gmail.com>
In-Reply-To: <CAMRc=Mdwa=DuubA6P+EnjUAQE8XupYsbo=3LuH-jYEBttREGqg@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:33:07 -0500
X-Gm-Features: Ac12FXxKnkWwA36VsVoD5Hl-K0ZXp6mKLB_zzh_TkqusAXbCh-DmgE3rxpQWCi4
Message-ID: <CALHNRZ9=u9hrXZ79N3VzMwdFuJO75TomOzRzgDxzmcTEeatzAQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: palmas: Allow building as a module
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 4:48=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Fri, May 23, 2025 at 12:22=E2=80=AFAM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The driver works fine as a module, so allowing building as such. This
> > drops the driver specific init in favor of the module macro which does
> > the same, plus handling exit.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v2:
> > - Drop module alias and add module device table
> > - Link to v1: https://lore.kernel.org/r/20250522-gpio-palmas-gpio-v1-1-=
d6b1a3776ef5@gmail.com
> > ---
> >  drivers/gpio/Kconfig       |  2 +-
> >  drivers/gpio/gpio-palmas.c | 10 +++++-----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index f2c39bbff83a33dcb12b2d32aa3ebc358a0dd949..be5d823516d0e2bff4b4231=
dac6a82bf10887118 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1464,7 +1464,7 @@ config GPIO_MAX77650
> >           These chips have a single pin that can be configured as GPIO.
> >
> >  config GPIO_PALMAS
> > -       bool "TI PALMAS series PMICs GPIO"
> > +       tristate "TI PALMAS series PMICs GPIO"
> >         depends on MFD_PALMAS
> >         help
> >           Select this option to enable GPIO driver for the TI PALMAS
> > diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
> > index 28dba7048509a3ef9c7972c1be53ea30adddabb0..eaef29f59292de5281f31e1=
96961d90974e65b75 100644
> > --- a/drivers/gpio/gpio-palmas.c
> > +++ b/drivers/gpio/gpio-palmas.c
> > @@ -140,6 +140,7 @@ static const struct of_device_id of_palmas_gpio_mat=
ch[] =3D {
> >         { .compatible =3D "ti,tps80036-gpio", .data =3D &tps80036_dev_d=
ata,},
> >         { },
> >  };
> > +MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
> >
> >  static int palmas_gpio_probe(struct platform_device *pdev)
> >  {
> > @@ -191,9 +192,8 @@ static struct platform_driver palmas_gpio_driver =
=3D {
> >         .driver.of_match_table =3D of_palmas_gpio_match,
> >         .probe          =3D palmas_gpio_probe,
> >  };
> > +module_platform_driver(palmas_gpio_driver);
> >
> > -static int __init palmas_gpio_init(void)
> > -{
> > -       return platform_driver_register(&palmas_gpio_driver);
> > -}
> > -subsys_initcall(palmas_gpio_init);
>
> This being put into an earlier initcall than device_initcall() makes
> me think, someone had a reason for it and this change can break this.
> I'm Cc'ing the original author who seems to still be active in the
> kernel.
>
> Laxman: can you verify that this can be safely moved to module_initcall()=
?
>

Reminder about this patch/question. It's well into the 6.16 cycle now.
If Laxman doesn't respond, is this mergeable? I didn't see any issues
in my basic boot tests on a tegra124 device using a tps65913. But I
didn't do anything close to full functionality tests.

Aaron


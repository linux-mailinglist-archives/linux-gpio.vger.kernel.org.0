Return-Path: <linux-gpio+bounces-27528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E7C0110A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 14:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070F119A0ED7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 12:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C287331326F;
	Thu, 23 Oct 2025 12:18:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC930F7F7
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221905; cv=none; b=gN5ktgOvzryRqr1BiSjKivFY3A6xaAreUv8w6+PixMotTYfgMPH2jWqUUOYESb2UhmrUnwqN/5nyDlNEbdS23/oThb55p7T8UhVfo+k5+obip5ISQ2dl/bGLRdNOhRu+WSq9OQMs2XW3q5f9gcc3uZbAIsg78/7hu9nmePUeNtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221905; c=relaxed/simple;
	bh=6UnI/G5uFXvZM3QYOrlOsy8lHW3iy4QXrl32Cyvdw+A=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfg68v+tDk2LAm6dn3RzQJqSG2sgwlqOJj51BmC9MQlb3LKGm4L71AUb2owleaguxbk5oF3aIcA/47dOLV+Fc/nu6EcDh5H29U8L9Yo7AE1glVxshoYZAKAwhe4omotpOA9XAwQ8CZEIlPxhzhryKbaXb8c15kFZTmnatzKTW9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=esmil.dk; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=esmil.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63e3568f90dso753793d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 05:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221898; x=1761826698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4fF/fwVg7UrUpgvaNoDLtEEeEL936gX4ttsHTSYttVM=;
        b=TXliZlhldtppC7Gs5BeF8eDenPNW/snYsPnLXlXPI7bwgRqopeMjLcMCOu6InpBQnP
         Ydvz1kpk9o8rhYS1122RdNYk9qE9HZKjY5jlJHSy8bSyAbVvu1obZePV1aAita9OPBXA
         F3TSTUhezAGfNnJnzaOkBI/d1OoI+g2CdgapZDx47V8yUjkbFR58Lh2eD09VXhPXx28L
         cCro+jSjjXSiHajDAbwTI/OHupo9DJKFaDg+8tOTrWm8h3AJ+tufemLmdw5DXgWTI/B+
         WJhgim+TiT/vKmXXULKBpkreUU0aZa5xdrXWn4KHBgUbVek3acn/1xoPUJOG/uRE+utP
         1mdA==
X-Forwarded-Encrypted: i=1; AJvYcCVuWOdApqDUtvrddTbfVRM0QD90/dGTragG3bwGBbgLG+ltRq8khsxHL8H4D+0Oyh0FaHlWRUF0Pryc@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbSnI+oo2qk6aQhvgkMqszOaW30JUPGJ1UoqdgV9RosjtriIZ
	SJLs49LyEngTylpglVnSqyRrb+Lx2OtyeT+L5xxcm1+IqhFcR0HOprN6xQfWH5cUuIkjtwZQxoU
	yAoP8h7YGZ018mnG/XMGvRCPV4ldzxt8=
X-Gm-Gg: ASbGncsFD9PJZ8u6f2yLY0s4RrXE+Hkrkn9ip9gVB48OzGXx0F9h1Bq/HmO3KApjICJ
	/pCw5L59naqSICHpPBd4wwAF3sKmLJKC/ciMSmqrdZfBR6yHiCFFek7q/MIFRzbBUVPeBDcVyIo
	Oy7Zy1V76d//W4sR1xdYEGdlNJf5/Kvsc8duwx5H9vXc5v7LdtlgWRoMp/AcsV5Zn0Mq1Zm9rfa
	RrThzTuMEgD6pwVuFTmmE41EFBjw6mP8IFFNt11lV6dyCDa1w/kkwe1NBo09hthTJ00KA==
X-Google-Smtp-Source: AGHT+IEC3QHhYBZSQQPhFBXYj6WYUOW1grD9uZTJNUw3bPCmSjtWE4zRxeVpvsKcNBIq63CnLwvpseCqNRb/wfa8wBw=
X-Received: by 2002:a05:690e:1502:b0:62f:c634:4b3f with SMTP id
 956f58d0204a3-63f377cd99amr1469290d50.7.1761221898433; Thu, 23 Oct 2025
 05:18:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Oct 2025 05:18:16 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Oct 2025 05:18:16 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMRc=Mc9e4P9vCt79yR1Jt5_2wxUngqAR_m1AxG=nbz=Cr3BjQ@mail.gmail.com>
References: <20251021181631.25442-1-alitariq45892@gmail.com> <CAMRc=Mc9e4P9vCt79yR1Jt5_2wxUngqAR_m1AxG=nbz=Cr3BjQ@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
User-Agent: alot/0.0.0
Date: Thu, 23 Oct 2025 05:18:16 -0700
X-Gm-Features: AS18NWC-riM2AFKbkUWAzUi3IEgdY1Ce6EbhwvllAw7hGVDS1TddtOVJTTQLTxk
Message-ID: <CANBLGcygpsp=R5gM7NeuVO-JG1yfQJ_0dhnFfL1ud=291cJZAQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: use dynamic GPIO base allocation
To: Ali Tariq <alitariq45892@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ali,

Quoting Bartosz Golaszewski (2025-10-22 09:23:37)
> On Tue, Oct 21, 2025 at 8:17=E2=80=AFPM Ali Tariq <alitariq45892@gmail.co=
m> wrote:
> >
> > The JH7110 pinctrl driver currently sets a static GPIO base number from
> > platform data:
> >
> >   sfp->gc.base =3D info->gc_base;
> >
> > Static base assignment is deprecated and results in the following warni=
ng:
> >
> >   gpio gpiochip0: Static allocation of GPIO base is deprecated,
> >   use dynamic allocation.
> >
> > Set `sfp->gc.base =3D -1` to let the GPIO core dynamically allocate
> > the base number. This removes the warning and aligns the driver
> > with current GPIO guidelines.
> >
> > Tested on VisionFive 2 (JH7110 SoC).
> >
> > Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> > ---
> >  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drive=
rs/pinctrl/starfive/pinctrl-starfive-jh7110.c
> > index 05e3af75b09f..eb5cf8c067d1 100644
> > --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> > @@ -938,7 +938,7 @@ int jh7110_pinctrl_probe(struct platform_device *pd=
ev)
> >         sfp->gc.set =3D jh7110_gpio_set;
> >         sfp->gc.set_config =3D jh7110_gpio_set_config;
> >         sfp->gc.add_pin_ranges =3D jh7110_gpio_add_pin_ranges;
> > -       sfp->gc.base =3D info->gc_base;
> > +       sfp->gc.base =3D -1;
> >         sfp->gc.ngpio =3D info->ngpios;
> >
> >         jh7110_irq_chip.name =3D sfp->gc.label;
> > --
> > 2.43.0
> >
> >
>
> That's a NACK until you also remove JH7110_AON_GC_BASE and
> JH7110_SYS_GC_BASE assignments after explaining why they are no longer
> needed.

Thanks for your patch, cleaning this up. As Bartosz said you'd want to clea=
n up
the now unused defines and the gc_base member of struct jh7110_pinctrl_soc_=
info
too though.

As for why this is no longer needed, I don't think it was ever needed. It j=
ust
slipped through review unfortunately. Hal should be able to explain why if
that's not the case.

/Emil


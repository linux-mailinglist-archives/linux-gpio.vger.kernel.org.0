Return-Path: <linux-gpio+bounces-5709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE8E8ACA78
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 12:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1F09B20B57
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 10:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456BD53814;
	Mon, 22 Apr 2024 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yazwWYqp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6113E3ED
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781258; cv=none; b=WEhh5nr/spuFnXeZc+hzEn1+N/CS7y+T9mt7sFfEMFfZhau8C/TlgtTnZTbXgkzadYVv9EmCv+drZwG3N54S6ZUMkIGIOdRneAGkcnLU+a49tl+LhFLSc4kmT2l4XjbDIJ21MQa4GP3hp08GIT+w6Gsyi6dHHWLV3qTAsLkU3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781258; c=relaxed/simple;
	bh=aDZG2lDnq+hlwDfokO8r20HjfALS7hd3CmW+2KPsvoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZGoc3+xKZC2zzbvW8OL8l9ecRji076joPhHCinvMTaRuvELFzi2lrQ1oV6Nnnl6XTXF4Z3TfcZ4IrA6eiz6yt9oe9br4L4UhAd6ZXpjKT63nu+Rv9+UiPoZx92y7xKSDEJjvAu90fPNvMt9CrCjni0cKznWEdkZ0iWLTolBnZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yazwWYqp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2da0b3f7ad2so60777971fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713781254; x=1714386054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6n3QpSD2GmO3aRxqZjaA+3Qv43wmj5fZfLqd7FRwxQ=;
        b=yazwWYqpf9xn7faT1wou0Og2IiTFr1DF1uCPWVjw5ypNfFu2j0/ETzOWOQd7i80wUR
         B9ADs/vcUpYKLG/08IIjO2xya0FBcC6od2r6Q9VraZty8pWs7qzQpo1kihq7SolX/xg/
         lP0R/ESzADXVcVibDrtGRKYG/vZtetEmfMVcS1oqDycddZ4Ix2iTlLC0K8emqRjvYnSQ
         NuBiGixAMrnKJdCHJEk2x427WmlzgJ+538awzudPVd4Gxs9GfdMtoazJb1qLLA97uatG
         BHASOeiIkdwoXujH5SkILT4UBYBcq7LYCawayxEzSWbRJ/VTDr1+bdualRSme+IMIV+P
         ADPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713781254; x=1714386054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6n3QpSD2GmO3aRxqZjaA+3Qv43wmj5fZfLqd7FRwxQ=;
        b=T+iSvQU3uFapliFUYoSlPr4GBpldBp2Ga2TvXlJp1sOb35BSp7mYxszsw55L9kWlqw
         Oxyn0qYn2oY/DabSTpWiJdvi7AaslGGiHMbhfzxPdd7OQVHAABKnKRav+SqcO8DU8dK9
         mNGyHYFrksmP1IFcZWXJe9dlD58vdlprWE1PZVNFOBsSqSbAryS9JAm1ALt6xtKAa37J
         TDhs6Dhv5Tlygg2XOFhvcxbijX3jtr2YQ9J37ro0QF+TSbdP2GMAcd5NUga2SvLr66m/
         D6VcUwao43PC/3Vbf8y7h9t09JWIZfv+DxtBH14/IztxWG01Mgi4n5P/ARDz10tq8vj/
         ffhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCc+J1PKIuPxCL8z3d4enN6Lo8DMbgcWp9Nm1l5SIfUs6jDcNF92fuBaCXGJXsRKt+mq9JAIguc17yGQw36UOK7vbZZXSSjMAd7w==
X-Gm-Message-State: AOJu0YzlgoKfXcGxUuRoswvF4OGwZDDZ0Mjo1ftE9c0+Ma3wGAcluIsF
	9DZzrC1jIWyNww+Rf0hZi/VSPsZBk6RMQBCh2T69RVMrdgR3N2eplA6yZoEuWMPk31jO2Gfjc1u
	Iki0vgD0ZTp9pjdI22a9CZZ02lC4LH7aaaXEqgUDoW+xh0MUs
X-Google-Smtp-Source: AGHT+IHr2ThsGdQtCcOcItjjiHDeJR/H4Tg2szdpz/AaCf4bt15EJa9zH07VzlC1p3stpJp/fhYMSq7J43V38aJacQY=
X-Received: by 2002:a05:651c:49e:b0:2d6:c5d7:8477 with SMTP id
 s30-20020a05651c049e00b002d6c5d78477mr5433987ljc.36.1713781254425; Mon, 22
 Apr 2024 03:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419080555.97343-1-aapo.vienamo@linux.intel.com>
 <MW5PR84MB1842F4C102CBFA73E861F420AB0D2@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <CAHp75Vd_zfuRc5nV42MHUjyOPQgf0+=A5Yyj8kaO7vYcmQsOzw@mail.gmail.com>
In-Reply-To: <CAHp75Vd_zfuRc5nV42MHUjyOPQgf0+=A5Yyj8kaO7vYcmQsOzw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Apr 2024 12:20:43 +0200
Message-ID: <CAMRc=Me_XTQmWMi-+XAm-FwkEwgUM+rsG2gYP8jLGZaH58c4PA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add Intel Granite Rapids-D vGPIO driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Elliott, Robert (Servers)" <elliott@hpe.com>, Aapo Vienamo <aapo.vienamo@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2024 at 12:02=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Apr 19, 2024 at 11:00=E2=80=AFPM Elliott, Robert (Servers)
> <elliott@hpe.com> wrote:
> > > -----Original Message-----
> > > From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> > > Sent: Friday, April 19, 2024 3:06 AM
>
> ...
>
> > > +static int gnr_gpio_probe(struct platform_device *pdev)
> > > +{
> > > +     size_t num_backup_pins =3D IS_ENABLED(CONFIG_PM_SLEEP) ? GNR_NU=
M_PINS
> > > : 0;
> > > +     struct device *dev =3D &pdev->dev;
> > > +     struct gpio_irq_chip *girq;
> > > +     struct gnr_gpio *priv;
> > > +     void __iomem *regs;
> > > +     int irq, ret;
> > > +
> > > +     priv =3D devm_kzalloc(dev, struct_size(priv, pad_backup,
> > > num_backup_pins), GFP_KERNEL);
> > > +     if (!priv)
> > > +             return -ENOMEM;
> > > +
> > > +     regs =3D devm_platform_ioremap_resource(pdev, 0);
> > > +     if (IS_ERR(regs))
> > > +             return PTR_ERR(regs);
> > > +
> > > +     irq =3D platform_get_irq(pdev, 0);
> > > +     if (irq < 0)
> > > +             return irq;
> > > +
> > > +     ret =3D devm_request_irq(dev, irq, gnr_gpio_irq, IRQF_SHARED |
> > > IRQF_NO_THREAD,
> > > +                            dev_name(dev), priv);
> > > +     if (ret)
> > > +             return dev_err_probe(dev, ret, "failed to request inter=
rupt\n");
> >
> > All of these early returns will leave the memory allocated to priv
> > forever, since priv isn't saved anywhere until:
>
> > > +     platform_set_drvdata(pdev, priv);
>
> I'm not sure I got your comment right. Do you think there is a memory
> leak on the error paths above? If so, can you elaborate, because I
> don't see it?
>

Elliott: if probe fails and we return, all devm_ resources will be
released. I don't see any error in this code either.

Bart


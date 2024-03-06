Return-Path: <linux-gpio+bounces-4172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3C873A73
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 16:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8F11F2C4E6
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 15:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A267134751;
	Wed,  6 Mar 2024 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F8qtd1Cg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DA5131742
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709738034; cv=none; b=cGCavtzjMA7HuDjojMdFy+dHe8AsP23OUF6y0nZpmxmd9luL6+YdPSqPIeJWF6eTj7TbffuJiarwDM+jWXA0Zww9UVH4opnnqM4iLadZp4N9C9pzsOfmasCMMCmQ9fH2Em/Tuazbo6osxNIRVhJ4wLhm80VOx5UkV3pYMY8KrCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709738034; c=relaxed/simple;
	bh=OWawPekkIytNLOs/rJCehNPCbyJsOfdGlmgMeHnQ5T8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WBC9FPPztKh42fV9o88/DiOXzW3NZhWdXHDyYGw0DDepMru89nhgTEbKKKL5W5e1AymHRccsayxpQ1DXNIdDvHaWMB0nRAv+jB9hyV3JnaPhCH0cCnI68i5MAA5YJVgIXvK6ZazYVrxFAFDOkt401iSdNfPHcothGUqioIcm+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F8qtd1Cg; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 896351BF204;
	Wed,  6 Mar 2024 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709738024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtbuwLqdyjIEhU7fiX0WLZW5mD3J8673gqbudp7JQpY=;
	b=F8qtd1Cg46HTsD0CO5VuCioeG+2apLV5ygaKgN5L6eqgzsyjBooemTGHzR4uN/Dpja4eRK
	ZxgUghAnM+S+xtU0GJ454hqEP8DVRXbC2RyI3jUVyx5SiG8s3PgJxOxatB+uZ6c7q4aWjo
	7FakXoEmBgG+nqEesVFYV7OygjvGgtCUhBKUV4K0xU1wgbrybjOg/k+ZSj2xRAaN3YgUqf
	O3/42BtHf5eQdmPu9T+U911dDE5qJlAfF2Wr/FzXTgeKM1gYJGAQXqf7J7Z70XM/1itgCn
	rWpIFCqMIaOsYr8IZbw8X5zlX0BQYh/JJ+Q0QJ+E9Net829yhc0HTqvpvVJIVQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Mar 2024 16:13:41 +0100
Message-Id: <CZMRJNWD7F6W.23A8YUXQ6P7H7@bootlin.com>
Subject: Re: [PATCH v2] gpio: nomadik: Back out some managed resources
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, <linux-gpio@vger.kernel.org>
To: "Linus Walleij" <linus.walleij@linaro.org>, "Andy Shevchenko"
 <andy.shevchenko@gmail.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240305-fix-nomadik-gpio-v2-1-e5d1fbdc3f5c@linaro.org>
 <CAHp75Vc2+wx=82kx1qMsXH3uWX4tMdDEMXLm=MqB869-=bcGeg@mail.gmail.com>
 <CACRpkdZCXE6VBa3f7asSNYF7Esn5nHnxf0QJfibT7TcfSE52FQ@mail.gmail.com>
In-Reply-To: <CACRpkdZCXE6VBa3f7asSNYF7Esn5nHnxf0QJfibT7TcfSE52FQ@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Wed Mar 6, 2024 at 1:51 PM CET, Linus Walleij wrote:
> On Wed, Mar 6, 2024 at 12:20=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Mar 6, 2024 at 12:09=E2=80=AFAM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > >
> > > Several commits introduce managed resources (devm_*) into the
> > > nmk_gpio_populate_chip() function.
> > >
> > > This isn't always working because when called from the Nomadik pin
> > > control driver we just want to populate some states for the device as
> > > the same states are used by the pin control driver.
> > >
> > > Some managed resources such as devm_kzalloc() etc will work, as the
> > > passed in platform device will be used for lifecycle management,
> > > but in some cases where we used the looked-up platform device
> > > for the GPIO block, this will cause problems for the combined
> > > pin control and GPIO driver, because it adds managed resources
> > > to the GPIO device before it is probed, which is something that
> > > the device core will not accept, and all of the GPIO blocks will
> > > refuse to probe:
> > >
> > > platform 8012e000.gpio: Resources present before probing
> > > platform 8012e080.gpio: Resources present before probing
> > > (...)
> > >
> > > Fix this by not tying any managed resources to the looked-up
> > > gpio_pdev/gpio_dev device, let's just live with the fact that
> > > these need imperative resource management for now.
> > >
> > > Drop in some notes and use a local *dev variable to clarify the
> > > code.
> >
> > LGTM, some minor remarks below.
> >
> > ...
> >
> > > Cc: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> >
> > Note, you can put Cc:s after --- line and it won't go to the commit
> > message while Cc to the respective people.
>
> Yeah old habit, actually b4 handles it fine by recording the
> recipients only in the cover letter.
>
> > > +               dev_dbg(dev, "populate: using default ngpio (%d)\n", =
ngpio);
> >
> > While at it %d --> %u.
> (...)
> > > +               dev_err(dev, "failed getting reset control: %ld\n",
> > >                         PTR_ERR(reset));
> >
> > Also possible %pe.
>
> Fixed them both when applying! Thanks!

Format specifier %pe takes a pointer, ie it should be reset and not
PTR_ERR(reset). See efaa90ed2cff ("gpio: nomadik: Back out some managed
resources") on linux-pinctrl/ib-nomadik-gpio.

Apart from that, tested efaa90ed2cff on Mobileye hardware.

GCC warning:

In file included from ./include/linux/device.h:15,
                 from ./include/linux/platform_device.h:13,
                 from drivers/gpio/gpio-nomadik.c:28:
drivers/gpio/gpio-nomadik.c: In function =E2=80=98nmk_gpio_populate_chip=E2=
=80=99:
drivers/gpio/gpio-nomadik.c:588:30: warning: format =E2=80=98%p=E2=80=99 ex=
pects argument of type =E2=80=98void *=E2=80=99, but argument 3 has type =
=E2=80=98long int=E2=80=99 [-Wformat=3D]
  588 |                 dev_err(dev, "failed getting reset control: %pe\n",
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/dev_printk.h:110:30: note: in definition of macro =E2=80=98=
dev_printk_index_wrap=E2=80=99
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
     \
      |                              ^~~
./include/linux/dev_printk.h:144:56: note: in expansion of macro =E2=80=98d=
ev_fmt=E2=80=99
  144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
      |                                                        ^~~~~~~
drivers/gpio/gpio-nomadik.c:588:17: note: in expansion of macro =E2=80=98de=
v_err=E2=80=99
  588 |                 dev_err(dev, "failed getting reset control: %pe\n",
      |                 ^~~~~~~
drivers/gpio/gpio-nomadik.c:588:62: note: format string is defined here
  588 |                 dev_err(dev, "failed getting reset control: %pe\n",
      |                                                             ~^
      |                                                              |
      |                                                              void *
      |                                                             %ld



Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



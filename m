Return-Path: <linux-gpio+bounces-2508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B583ACBC
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 16:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0754D29B2A2
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 15:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880F643154;
	Wed, 24 Jan 2024 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OTz9/k2m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E73D7A72E
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706108657; cv=none; b=tXJN4LpP2kNe5f4UDDYwcpBrL4Q/wGF6j8kSMaKE1dIijXhKojkKzfqp8/p+Qi3gW5XuI2L4zgNg3cSTgitOZBSvIrTc2RJnXN3CxBVfCARKr34oWkp/Rl0AGqwuO79I58VPIW1cRTi5g2Tl8kDMfu3/XDShrv0RBSchmH1L3s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706108657; c=relaxed/simple;
	bh=QsiRynAsT/z/TCm48D3nC/uEaw/2v3gfvveNi7AsbBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhCn8U8yyNwqEQ5clAhrWGrHciJxIoNZGTKpdgZkf1dSwP+Q0MHwTTUvpOw6n7K2ZsT4kllrvqZwAOq6oWsqja+ImOIQKP5YDMDfrmvS+hJZMj3Vg6+N/wn8Z+aUeQ3zgcD3ZyMhzKoS98t2MruYXltiAQlSTPyONq58H9ftUoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OTz9/k2m; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d2dfa80009so1963425241.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 07:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706108654; x=1706713454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysgE70B//0yY4/ym/04AKJ4ytw6Tk1SVHti+L8Nc1Eo=;
        b=OTz9/k2mdHiscyGFvmhciqe2sQY2iqlqjk05giGqVXqQp0xLM/4PsVZLm42o37VM4B
         vngGRzKOrAhI3J22vnAKfqwax16nxr58LhYq5hNiRr5pps0T8491p6q+4B5lmoZ2L028
         VxJ6LukyJIpI2yfNfr8mtPnzV8aD14DBbELb0li3MW0Xu2rddq7GgfHVSYt/0QOJddS/
         XFQeczuGGiftdxSOMKBAnetPv8UYiGNtm5UGy8AlJTfA3ubNO8lsq3nkG3cvxFZqiiz2
         HmT6ccj+d9k4kvctMUL/FEdSxNx8UanmHQlBq943ywHZOYiXzSy4sYg8maMVpVGf8F9A
         0OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706108654; x=1706713454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysgE70B//0yY4/ym/04AKJ4ytw6Tk1SVHti+L8Nc1Eo=;
        b=ALsBRyka81VlmgiysrLvbSgww0Z6M2QNlsgDfcTCFiKwOiRU1dPoTIfsYhOtjAGiMC
         sp9dY55CAkzB9qAyDGUzGr1SriGl6baEf1hDs86iEPyJ8quDgkyxOZ7GcyQUyj8uPcX4
         UWe8WF5OvH/qTDXPM3u5tqwe/h+DOIn6SwDk1vVxAW/dxcl9ZS4zMpiJnv+ticMuivz2
         Ds/fJnw9Vf/DZc5++YpqzHkdRw+WsbkkkqRq7AKrxKJJrE26iigSu7944YcEh8/1DlUF
         5da5r2fqjzjKLumc0Dz20dII59D7/Jv7/zytVWsxPqMVjUGn2aouMerORgJwzoELtvcp
         m1YQ==
X-Gm-Message-State: AOJu0YxdiYTFHbTZplvdpzQrB1W9LFjKRr3s6/+wUW0ZcfD8ma92Jwq/
	Qzjwwy1LsqWaY+teXobDo5CHJWFtLj17Qyr4AHsgIPQgzwu+yY7haYTfR5wB600+mpq6/9GhB+b
	UCVP+1FAvPYebx7BW/w1/Vo1sOBzKE9kEXmdxqg==
X-Google-Smtp-Source: AGHT+IHGq0lRlsIoIZwfCNTn1+hirROLQ4pKtq+XTxGYhDbnKamiFRCv8aaNXpYBLJm+nL4aU4xloFlbTelqa8CwVKA=
X-Received: by 2002:a1f:728d:0:b0:4bd:75b7:7a09 with SMTP id
 n135-20020a1f728d000000b004bd75b77a09mr369221vkc.22.1706108654014; Wed, 24
 Jan 2024 07:04:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-20-brgl@bgdev.pl>
 <83ad61e2f9d62621f42d8738f6028103fe8bfb94.camel@crapouillou.net>
In-Reply-To: <83ad61e2f9d62621f42d8738f6028103fe8bfb94.camel@crapouillou.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jan 2024 16:04:02 +0100
Message-ID: <CAMRc=MdwAaQ1Prtweu9znEL+mbyxSmmKhL65PG+=YKniCD1c9w@mail.gmail.com>
Subject: Re: [PATCH 19/21] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
To: Paul Cercueil <paul@crapouillou.net>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Dipen Patel <dipenp@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 3:59=E2=80=AFPM Paul Cercueil <paul@crapouillou.net=
> wrote:
>
> Hi Bartosz,
>
> Le mardi 05 septembre 2023 =C3=A0 20:53 +0200, Bartosz Golaszewski a =C3=
=A9crit :
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We're porting all users of gpiochip_find() to using
> > gpio_device_find().
> > Update the swnode GPIO code.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpiolib-swnode.c | 29 ++++++++++++-----------------
> >  1 file changed, 12 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-
> > swnode.c
> > index b5a6eaf3729b..56c8519be538 100644
> > --- a/drivers/gpio/gpiolib-swnode.c
> > +++ b/drivers/gpio/gpiolib-swnode.c
> > @@ -31,31 +31,26 @@ static void swnode_format_propname(const char
> > *con_id, char *propname,
> >               strscpy(propname, "gpios", max_size);
> >  }
> >
> > -static int swnode_gpiochip_match_name(struct gpio_chip *chip, void
> > *data)
> > +static struct gpio_device *swnode_get_gpio_device(struct
> > fwnode_handle *fwnode)
> >  {
> > -     return !strcmp(chip->label, data);
> > -}
> > +     const struct software_node *gdev_node;
> > +     struct gpio_device *gdev;
> >
> > -static struct gpio_chip *swnode_get_chip(struct fwnode_handle
> > *fwnode)
> > -{
> > -     const struct software_node *chip_node;
> > -     struct gpio_chip *chip;
> > -
> > -     chip_node =3D to_software_node(fwnode);
> > -     if (!chip_node || !chip_node->name)
> > +     gdev_node =3D to_software_node(fwnode);
> > +     if (!gdev_node || !gdev_node->name)
> >               return ERR_PTR(-EINVAL);
> >
> > -     chip =3D gpiochip_find((void *)chip_node->name,
> > swnode_gpiochip_match_name);
> > -     return chip ?: ERR_PTR(-EPROBE_DEFER);
> > +     gdev =3D gpio_device_find_by_label((void *)gdev_node->name);
> > +     return gdev ?: ERR_PTR(-EPROBE_DEFER);
> >  }
> >
> >  struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
> >                                  const char *con_id, unsigned int
> > idx,
> >                                  unsigned long *flags)
> >  {
> > +     struct gpio_device *gdev __free(gpio_device_put) =3D NULL;
> >       const struct software_node *swnode;
> >       struct fwnode_reference_args args;
> > -     struct gpio_chip *chip;
> >       struct gpio_desc *desc;
> >       char propname[32]; /* 32 is max size of property name */
> >       int error;
> > @@ -77,12 +72,12 @@ struct gpio_desc *swnode_find_gpio(struct
> > fwnode_handle *fwnode,
> >               return ERR_PTR(error);
> >       }
> >
> > -     chip =3D swnode_get_chip(args.fwnode);
> > +     gdev =3D swnode_get_gpio_device(args.fwnode);
> >       fwnode_handle_put(args.fwnode);
> > -     if (IS_ERR(chip))
> > -             return ERR_CAST(chip);
> > +     if (IS_ERR(gdev))
> > +             return ERR_CAST(gdev);
>
> I'm a bit late to the party, sorry.
>
> I'm looking at how __free() should be used to use it in my own
> patchset, and I was wondering if this code actually works.
>
> What happens if swnode_get_gpio_device() returns an error pointer?
> Won't that cause a call to gpio_device_put() with the invalid pointer?
>
> Cheers,
> -Paul
>

No. because the __free() callback is defined as:

DEFINE_FREE(gpio_device_put, struct gpio_device *,
    if (!IS_ERR_OR_NULL(_T)) gpio_device_put(_T))

Bart

> >
> > -     desc =3D gpiochip_get_desc(chip, args.args[0]);
> > +     desc =3D gpiochip_get_desc(gdev->chip, args.args[0]);
> >       *flags =3D args.args[1]; /* We expect native GPIO flags */
> >
> >       pr_debug("%s: parsed '%s' property of node '%pfwP[%d]' -
> > status (%d)\n",
>


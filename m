Return-Path: <linux-gpio+bounces-29100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A736C8AC24
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93B8A4E4689
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE1E33B971;
	Wed, 26 Nov 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWmV9y/N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC18330D29
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172547; cv=none; b=P1mjIhfoB2ozFBN2vrPvkX0uSNOfMgE5ecAwqp47qFrNbolslJ4vbGpEBMqSvp5PBA6g0gQqIAeCWCyYi59h8Rqk7ckaKUfOEMnrai5hGdbktu/TuKyLITKO2HpA6nzRfD92Q8ErMcZkbbU2RaPCU1ff8RwPMFE7kM/ye8zxNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172547; c=relaxed/simple;
	bh=lASm2siB5AU0w5u55FAD+C2Ou4paYQEnU69Wbb4v2Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROg737eduXrkYfDjXWf2ISExDcGmEwLkYhds6GM7mojKaJZc7b9MEvb3Vc0pjafaXkEe2hW1a+Jk9YtdxUTLenhH0boSZ9lwgDy74Ua0GBmUiJjXK+BDprfPtuI1CysnvnHxJwfBU05IA+NruhzTPATQIpnsg4EYNBJW7P1UC38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWmV9y/N; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso2111801a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172544; x=1764777344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG1nOVu8gVLE+V2Sxzp2pYjIM+pZyr/YOIj56xPih2c=;
        b=UWmV9y/NodWXuqhJY1TrxxsW5M1ncI40fhICgsktkYPkqohzrKM5KW8gECsBOkUMmc
         GomMVh5SAwe28JGNT4WeVfyWdctx/9vWYlroKPha9wg8kMPsREvY5d//lXoxsnW1UkFi
         pGFo7cozZkoNz4/xCnDXm2Aclxz3llxgBJitrL5N9yEG4avTKJKfoG8YwiWv77A9JTTD
         2zHAuhkmOLH9hE2MlyVtRYbSM5uricdM0rHaz+yHpHE5RIoF8TD0rASiGuNpbWZIqiZc
         GcR0VeCKBmUrnvceelH7wMbrwnxTuR+mK/r7337QBmHOFLSRwY/TGl7N6YAI1JzZtzps
         e7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172544; x=1764777344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG1nOVu8gVLE+V2Sxzp2pYjIM+pZyr/YOIj56xPih2c=;
        b=oJC92HW3anF0nKQfedRlz9xAK0naiKR1hzekJUqkT/arpd2OGQeCufdTtfu+6VxAaA
         3n1zaDG3O46/XYkOGvOAdCctmpxdCo6vtT9bfxErf/dEYLQbRPvZO0QeZKM78Su8hcxE
         8u+FTtiujp9Hes27gAYhjF4xYVod5b7Q0uJnDr0X/ksInY+QBPqNSS7jcDofk/pb7ETt
         RAtlkSh1CQ26QV5ZOMeRbpANDOq4KRfiHgNgd5iyvROvaDGt/yrrPUHYvWCe+X3vgF1s
         hqA+8gEYH/3Qo+meub+TWua6u/gpzjB/Xzl1gtcxx2sUJjPXJVJTz5nlm9v4CCMM4KIR
         TBqA==
X-Forwarded-Encrypted: i=1; AJvYcCURTvmW5ytmQ/DcrabAolDmIi+i2JxrXVsSgmG0oaQCc7BiaSuElx/zsT6OD7ikVlpzkrxc96sJvrHx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Sv7RFBaIA2yc/tvlaZlETmvHrl9fhpnBoKwIygeM/mbCor8X
	7l1UiITPWZxkyeJueh5ZaygqZB+yJNVYf5RrNya31bvB1bJgSo0YtUbhIWSsuBn0
X-Gm-Gg: ASbGncvWLL8hS7+4LiCUcv3VumffeJopYm3gDYSfyaYiq8VPVlsYXT81PMUxDZnYKCq
	HQEXah/1advz9RYQqkZLcppPj48B0bFPOQg4NHCg43w0jcx6dCV17RFkMe7eEMe3b5j4MlqAVzl
	0DlVd1l4ounMV/8RdE9SOvg7tjHF1yco7OzzIij904mfsFT614v4LKzU4nTu6Re7g40Ml5V/gOc
	NVqTkSktwu3Dua5knTwa/P3A5vlSvOLRxF+7yrXmg9YYhOTNoYvvWWs2pjFUsdhcUtINsWJIPsZ
	pSLQTv0gQUdznrHRFxxWLazjoUawRgBW62oTsoIxv9nJCaBhVWhTOh6BAR/HrtnryiSaKDk3vVi
	zetKpjBQDFHjS7EcZhoz8NhBEqNJ/7EaD7aNUro2Ay6NXa3X0AhzMc46lV3nK6nvNEUIFESUHQi
	aSH49+5BbYJgXD+qllNNhzNG9iGaCsgG/W7pBzOh9sjT8J89czni8sW99g1LxOh2UZyCg=
X-Google-Smtp-Source: AGHT+IFOk4Dc71dAU1PFak6lwxd8NQT+2eJebIKCLnu747O0fz8ysrn20pLcynZiSjtb/k5bFDX7Ag==
X-Received: by 2002:aa7:d4ce:0:b0:640:931e:ccac with SMTP id 4fb4d7f45d1cf-64539658323mr16418976a12.7.1764172544022;
        Wed, 26 Nov 2025 07:55:44 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:123e:4501:1025:ba00:55dc:4ccc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453633fe28sm18380759a12.0.2025.11.26.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:55:43 -0800 (PST)
Date: Wed, 26 Nov 2025 16:55:41 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 9/9] iio: adc: ad4062: Add GPIO Controller support
Message-ID: <rk4hmupbrb5ugxft6upj7ru43x3z7ybrobax45rorpwbcwleh6@vzxrr3m7r6ep>
References: <20251124-staging-ad4062-v2-0-a375609afbb7@analog.com>
 <20251124-staging-ad4062-v2-9-a375609afbb7@analog.com>
 <aSQ2JUN05vmMQC1I@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSQ2JUN05vmMQC1I@smile.fi.intel.com>

On Mon, Nov 24, 2025 at 12:40:37PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 24, 2025 at 10:18:08AM +0100, Jorge Marques wrote:
> > When gp0 or gp1 is not taken as an interrupt, expose them as gpo if
Hi Andy,
> 
> GPO
Ack.
> 
> > gpio-contoller is set in the devicetree.
> 
> Why can't gpio-regmap be used?
> 
Because the device register values (0x5, 0x6) does not fit the gpio-regmap.
It writes the mask for high and 0 for low.
But low is 01[01] and
    high   01[10]

A different series would need to extend the gpio-regmap ops, but if you
implement your custom reg read/write, then you save at most ~5 lines...
I will add that to the commit message.
> ...
> 
> > +static int ad4062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct ad4062_state *st = gpiochip_get_data(gc);
> > +	unsigned int reg_val;
> > +	int ret;
> > +
> > +	ret = regmap_read(st->regmap, AD4062_REG_GP_CONF, &reg_val);
> > +	if (ret)
> > +		return 0;
Should have been
  		return ret;
> 
> > +	if (st->gpo_irq[offset])
> > +		return -ENODEV;
> 
> Consider using valid_mask instead (.init_valid_mask() callback).
> Hmm... And it seems it's in place. I didn't get what is here then and
> why we need to do it after accessing the HW? If there are side-effects
> they must be described.
> 
True, this is not necessary the valid mask does the same.
> > +	if (offset)
> > +		reg_val = FIELD_GET(AD4062_REG_GP_CONF_MODE_MSK_1, reg_val);
> > +	else
> > +		reg_val = FIELD_GET(AD4062_REG_GP_CONF_MODE_MSK_0, reg_val);
> > +
> > +	return reg_val == AD4062_GP_STATIC_HIGH ? 1 : 0;
> 
> 	return !!(reg_val == AD4062_GP_STATIC_HIGH);
> 
> also will work.
>
 	return reg_val == AD4062_GP_STATIC_HIGH;
> > +}
> 
> > +static int ad4062_gpio_init_valid_mask(struct gpio_chip *gc,
> > +				       unsigned long *valid_mask,
> > +				       unsigned int ngpios)
> > +{
> > +	struct ad4062_state *st = gpiochip_get_data(gc);
> > +
> > +	bitmap_zero(valid_mask, ngpios);
> > +
> > +	if (!st->gpo_irq[0])
> > +		set_bit(0, valid_mask);
> > +	if (!st->gpo_irq[1])
> > +		set_bit(1, valid_mask);
> 
> Why atomic bit set:s?
> 
Not needed, will use

	if (!st->gpo_irq[0])
		*valid_mask |= BIT(0);
	if (!st->gpo_irq[1])
		*valid_mask |= BIT(1);

> 
> > +	return 0;
> > +}
> > +
> > +static int ad4062_gpio_init(struct ad4062_state *st)
> > +{
> > +	struct device *dev = &st->i3cdev->dev;
> > +	struct gpio_chip *gc;
> > +	u8 val, mask;
> > +	int ret;
> 
> > +	if ((st->gpo_irq[0] && st->gpo_irq[1]) ||
> > +	    !device_property_read_bool(dev, "gpio-controller"))
> > +		return 0;
> 
> Do you need this? valid_mask should take care of this.
> 
True, this is not necessary.
> > +	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
> > +	if (!gc)
> > +		return -ENOMEM;
> > +
> > +	val = 0;
> > +	mask = 0;
> > +	if (!st->gpo_irq[0]) {
> > +		mask |= AD4062_REG_GP_CONF_MODE_MSK_0;
> > +		val |= FIELD_PREP(AD4062_REG_GP_CONF_MODE_MSK_0, AD4062_GP_STATIC_LOW);
> > +	}
> > +	if (!st->gpo_irq[1]) {
> > +		mask |= AD4062_REG_GP_CONF_MODE_MSK_1;
> > +		val |= FIELD_PREP(AD4062_REG_GP_CONF_MODE_MSK_1, AD4062_GP_STATIC_LOW);
> > +	}
> > +
> > +	ret = regmap_update_bits(st->regmap, AD4062_REG_GP_CONF,
> > +				 mask, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = devm_add_action_or_reset(dev, ad4062_gpio_disable, st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	gc->parent = dev;
> > +	gc->label = st->chip->name;
> > +	gc->owner = THIS_MODULE;
> > +	gc->base = -1;
> > +	gc->ngpio = 2;
> > +	gc->init_valid_mask = ad4062_gpio_init_valid_mask;
> > +	gc->get_direction = ad4062_gpio_get_direction;
> > +	gc->set = ad4062_gpio_set;
> > +	gc->get = ad4062_gpio_get;
> > +	gc->can_sleep = true;
> > +
> > +	ret = devm_gpiochip_add_data(dev, gc, st);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Unable to register GPIO chip\n");
> > +
> > +	return 0;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Best regards,
Jorge


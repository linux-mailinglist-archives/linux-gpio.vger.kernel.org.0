Return-Path: <linux-gpio+bounces-26282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F1B7E615
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B6A37A7E37
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 08:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EF619E992;
	Wed, 17 Sep 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UjQf/qfu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C3215F7D
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096499; cv=none; b=UVoO4UEA5UtISfYZBO+/AknYOXc7JS3VV8CRhLzcDulKJ1NX+zTxD5NoafogHX4hnCzezUURo4rMixjCDUwXYwg6RRFUao+1DH2UG4SgMWYRaBDz5XaFMuWTrleFgsxLPHvO/PWCgIxYUFC7mWjyQUzqCY5+sdc3kFEoM3icj4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096499; c=relaxed/simple;
	bh=zmAkUSmURyrPm9Es6pwndaNcte5fukrPYep/WwE6W4Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9GQ4tOhL9mjAygo6lZ2HQ2t+xQH1Pgd22Rn0Jj5ig8u9QGImSUcPnHTvhqHNgZWV/p3yIgP/bAHJOktcUlkzFafdlPpyD1FUPfi9E9chTkfeUqGUP/+bSh0n/UnoxeFVPo/eSbdSv2TFoHdYxYKijkooS6D+0SuIh2Y7myrQNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UjQf/qfu; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f753ec672so7005643e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758096496; x=1758701296; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol9k3KHJzXIaDXkNQhQhw49htl/DZQ8I8F+dCl06Mtw=;
        b=UjQf/qfu8ssiqFjL4mkUQ6tDH1JbVipksc4AZKr30r6amd2K7kWnrIK7GhdDJIcCn+
         AExW8HV9WXf6D3x70J6Mzh4BQIpWMCT+Jnc/5ZDH+gtuqoI9rLZC88XjbZD1iujVULMz
         MgYEz2GZEi7EvTxb4TV+UMpAiVRzdpjobckhyNLF5Ht6JsKxYLpA0mRoWMGVfn5SpIEJ
         rz/9sEsEVNaQnX/hbfk9X/ipbS5JVUtangSM7YSHTElNVkO4ojHqJaGDRZvhLfk4XzR5
         s5zZrTY0656E5BpupBLOJdvruylExs3lsRWrI977XqkQpVLxrhAQoRMAcjRbuNX436TI
         NgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096496; x=1758701296;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol9k3KHJzXIaDXkNQhQhw49htl/DZQ8I8F+dCl06Mtw=;
        b=OMUnTCwkF8xUHT1UHC6SyVHZGqbcLlo2x2G3VmGYMKXj37gCMyMJoynAC7tPZZgjZI
         oUyxGbpPUjluXka39KlUpTbaqJ4OyK+13j/mb7CeNk0cTqJVD3iJcTEHLdkU3hkBzacK
         gjDr7uuPKx7AQjTxfA8lXZ5oOJ2ZuToac6fGD42tmrsgnB9pJpFO40YmpGbLJKvcZtxR
         guye48Au6P1tjcfRh4hDnvo+tpvGFQae6SNegjLhPdZMg1g+icdeyEarLYbSSiPOg9jc
         pznzIErWdIMlMEgiGdqclxhyJqQQg+abZcifJOwhy/zN0xzMhMLHDs2IxbUMLrg2+rXk
         ux/A==
X-Forwarded-Encrypted: i=1; AJvYcCU9c1GbFB0y+CS5VHH1vI9wAM6zOXCHNTys/DcJjXdpVkVy0o426Ao4PTNficKB2Io6cRerPgQG4Cut@vger.kernel.org
X-Gm-Message-State: AOJu0YymCijri8ryCVOCOjuVHy48L5DX1p+moq+F7jm9R4TdJAq5BW2E
	Xmd69ev0GTlslbvpvCr5ZgotZk/tDnzIcsPHr5e7iARXsFPF2yVK+bo8JVhJCBAYRJX7gplfbE+
	nN5zBOKIgc6OmPB2OH6vwsl7+LwG8ELWdYRu/f5uqAA==
X-Gm-Gg: ASbGncuevrCObNHIsi9W2Ann3JP6mHdc2EKwhkEj0yu1qDzYEzEysaVjnLdaBbvo4Jh
	B2oaDXp5aJKT2O25J1NoIz3GPYpJgpRMEH6WzamKeOyaXPnV7IBPv+r69ehyEXQDO5fIvtf8vir
	LTpG6rjlF3JHegTdn6j86vUWqFiAzWsrvhIftVbpXuaImtZAAurwVoV0LvIXJI7nYXjKMfeirb7
	Zh+vZo=
X-Google-Smtp-Source: AGHT+IFi1eJTaH7DVdwAIVZGkyYcqr+sGA4zyzraMkWCqnDPZbRtBQdZBum7IYP7LBbDpkKNnrt2EffnjwjITFjgOyw=
X-Received: by 2002:a05:6512:308a:b0:56b:9958:517c with SMTP id
 2adb3069b0e04-57798285a09mr489864e87.19.1758096496449; Wed, 17 Sep 2025
 01:08:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Sep 2025 04:08:14 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Sep 2025 04:08:14 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <jfxasie7r3362tsxscd6bqpoprsj7pgmatlj6jsfgvorkwbor3@xsikgz67p6qb>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-6-ioana.ciornei@nxp.com> <aMmSpu/TWOmpHJ60@lizhi-Precision-Tower-5810>
 <jfxasie7r3362tsxscd6bqpoprsj7pgmatlj6jsfgvorkwbor3@xsikgz67p6qb>
Date: Wed, 17 Sep 2025 04:08:14 -0400
X-Gm-Features: AS18NWD5qcNMsaefDUNSUUtp6FKM2Pq61oZoZu-DrMEwo5PMJ7fcwIRJJYocyvQ
Message-ID: <CAMRc=MeoTwyj6kV7PYGCZSqTB5dfBsoQd8byHFc2B1MHAaeYdw@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Sep 2025 09:40:37 +0200, Ioana Ciornei <ioana.ciornei@nxp.com> said:
> On Tue, Sep 16, 2025 at 12:39:02PM -0400, Frank Li wrote:
>> On Mon, Sep 15, 2025 at 03:23:50PM +0300, Ioana Ciornei wrote:
>> > Add support for the GPIO controller found on some QIXIS FPGAs in
>> > Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
>> > using gpio-regmap.
>> >
>> > A GPIO controller has a maximum of 8 lines (all found in the same
>> > register). Even within the same controller, the GPIO lines' direction is
>> > fixed, which mean that both input and output lines are found in the same
>> > register. This is why the driver also passed to gpio-regmap the newly
>> > added .fixed_direction_output bitmap to represent the true direction of
>> > the lines.
>> >
>> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
>> > ---
>> > Changes in v2:
>> > - Use the newly added .fixed_direction_output bitmap representing
>> >   the fixed direction of the GPIO lines.
>> >
>> >  drivers/gpio/Kconfig           |   9 +++
>> >  drivers/gpio/Makefile          |   1 +
>> >  drivers/gpio/gpio-qixis-fpga.c | 123 +++++++++++++++++++++++++++++++++
>> >  3 files changed, 133 insertions(+)
>> >  create mode 100644 drivers/gpio/gpio-qixis-fpga.c
>> >
>> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> > index 886bef9106da..4ca5890007ff 100644
>> > --- a/drivers/gpio/Kconfig
>> > +++ b/drivers/gpio/Kconfig
>> > @@ -1951,6 +1951,15 @@ config GPIO_LATCH
>> >  	  Say yes here to enable a driver for GPIO multiplexers based on latches
>> >  	  connected to other GPIOs.
>> >
>> > +config GPIO_QIXIS_FPGA
>> > +	tristate "NXP QIXIS FPGA GPIO support"
>> > +	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
>> > +	select GPIO_REGMAP
>> > +	help
>> > +	  This enables support for the GPIOs found in the QIXIS FPGA which is
>> > +	  integrated on some NXP Layerscape boards such as LX2160ARDB and
>> > +	  LS1046AQDS.
>> > +
>> >  config GPIO_MOCKUP
>> >  	tristate "GPIO Testing Driver (DEPRECATED)"
>> >  	select IRQ_SIM
>> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> > index 379f55e9ed1e..373b1f169558 100644
>> > --- a/drivers/gpio/Makefile
>> > +++ b/drivers/gpio/Makefile
>> > @@ -144,6 +144,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
>> >  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
>> >  obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
>> >  obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
>> > +obj-$(CONFIG_GPIO_QIXIS_FPGA)		+= gpio-qixis-fpga.o
>> >  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
>> >  obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
>> >  obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
>> > diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
>> > new file mode 100644
>> > index 000000000000..23219a634f73
>> > --- /dev/null
>> > +++ b/drivers/gpio/gpio-qixis-fpga.c
>> > @@ -0,0 +1,123 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +/*
>> > + * Layerscape GPIO QIXIS FPGA driver
>> > + *
>> > + * Copyright 2025 NXP
>> > + */
>> > +
>> > +#include <linux/device.h>
>> > +#include <linux/gpio/driver.h>
>> > +#include <linux/gpio/regmap.h>
>> > +#include <linux/kernel.h>
>> > +#include <linux/mod_devicetable.h>
>> > +#include <linux/module.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/regmap.h>
>> > +
>> > +enum qixis_cpld_gpio_type {
>> > +	LX2160ARDB_GPIO_SFP = 0,
>> > +	LS1046AQDS_GPIO_STAT_PRES2,
>> > +};
>>
>> needn't type at all.
>>
>
> True, I can just pass the u64 bitmap directly as data. Will try.
>
> [snip]
>
>> > +	if (!pdev->dev.parent)
>> > +		return -ENODEV;
>> > +
>> > +	cfg = device_get_match_data(&pdev->dev);
>> > +	if (!cfg)
>> > +		return -ENODEV;
>>
>> Needn't this check.
>
> Ok.
>
>>
>> > +
>> > +	ret = device_property_read_u32(&pdev->dev, "reg", &base);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> > +	if (!regmap) {
>> > +		/* In case there is no regmap configured by the parent device,
>> > +		 * create our own.
>> > +		 */
>>
>> /* Use MMIO space */
>
> Ok.
>
>
> [snip]
>
>> +		config.reg_set_base = GPIO_REGMAP_ADDR(base);
>>
>>
>> only two compatibles string in qixis_cpld_gpio_of_match. so it can set
>> unconditional.
>>
>
> Fair point. Will change.
>
> Ioana
>

When sending the next revision please change the title to: "gpio: foo: ...",
IOW: drop the drivers prefix.

Bartosz


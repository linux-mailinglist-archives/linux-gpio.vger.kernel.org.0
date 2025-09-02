Return-Path: <linux-gpio+bounces-25409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C9B409CF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 17:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14A774E44E0
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 15:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A91232ED47;
	Tue,  2 Sep 2025 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS1x9qyY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52DF32ED25;
	Tue,  2 Sep 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828438; cv=none; b=Scs/0uS0jFLahm7kxwyEWOx/l9c6YQMtx0Y3gk89FyZKd1oAzRQddPsCDJw66YaXIu0m4Njjo/lHWNpPE4i/ne+eznGubFSf3N6t5h9PUrhPwPzZerWomqFZUgBnhLEvd9YZ6Lh2IE2quCk8dvDQlD5l89d8efMYs3HO2qzU5VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828438; c=relaxed/simple;
	bh=Yp082BtJyNkl+UbZt1DIV8VDjpmSNVA8FEzIUsrdAl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0nrexgbvNGKHoVQc9H+szZWJk/0TUgiEiOf5f7c19HdhSC7Dw4l9I1PpUkLcnk/cVDdeIFdubwxBn/+Gpcg8IJhU10qLy2VKgAowXFpsluZA9v/2XkRPlzpcryJgMQ3L342XOkvzBxbx+l7wzlxmZ1wc1OrMLgY6OofY+yGKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS1x9qyY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881D1C4CEED;
	Tue,  2 Sep 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756828438;
	bh=Yp082BtJyNkl+UbZt1DIV8VDjpmSNVA8FEzIUsrdAl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZS1x9qyY9xFiqaUNQkQIiX7FPmOoSBYH6/d3baPgMBBEgcIxitkA697Tbl0bowrkO
	 aB8OUFTZ3nrcxmNobBInj7m6e2GjTsKa5V9oC0zpExq3quBQAK4ysRnHI4zeoP/GBF
	 M8E6Pw7ODdtKYDiY1wj0Rf1wi1K7q0Enj9Dhs9Ba++5fONi3zFBbJzzZn/gJkfbbTR
	 iMJ+OkavngafYoCplMwJsTx8gcT4k8sk6UvU9pXHMlbQm0fgcv29OGF2gAUkxWIidq
	 BBm/AxfnWc12vRuHH5C6AAC9Y1ykexo5/zJmq2ZJQDNB+MqVIH8Rv1o+hmvFBJdDG7
	 YBKc+xvBwnSEg==
Date: Tue, 2 Sep 2025 16:53:52 +0100
From: Lee Jones <lee@kernel.org>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 2/6] mfd: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <20250902155352.GW2163762@google.com>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <20250814-ltc4283-support-v1-2-88b2cef773f2@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814-ltc4283-support-v1-2-88b2cef773f2@analog.com>

On Thu, 14 Aug 2025, Nuno Sá via B4 Relay wrote:

> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Main usage is as an Hardware Monitoring device. However, it has up to 8
> pins that can be configured and used as GPIOs and hence, the device can
> also be a GPIO controller (and so being added as MFD device).
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  11 ++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/ltc4283.c       | 140 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ltc4283.h |  33 +++++++++++
>  5 files changed, 187 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 413bb77d5eebe2b51aa9c3af86e7cfd5ab142044..b5f4f1c41c64b738d57c1fb5552a60b4c6b9985c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14506,6 +14506,8 @@ L:	linux-hwmon@vger.kernel.org
>  L:	linux-gpio@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
> +F:	drivers/mfd/ltc4283.c
> +F:	include/linux/mfd/ltc4283.h
>  
>  LTC4286 HARDWARE MONITOR DRIVER
>  M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 425c5fba6cb1e7848dcea05bd77c729a71d48e2c..ec3e02d40fd17a0bba29e3157723055feedebd11 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -900,6 +900,17 @@ config MFD_MAX14577
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_LTC4283
> +	tristate "LTC4283 Hot Swap Controller"
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  This enables support for the LTC4283 Negative Voltage Hot Swap
> +	  Controller. This driver provides common support for accessing the
> +	  device; additional drivers must be enabled in order to use the
> +	  functionality of the device.
> +
>  config MFD_MAX77541
>  	tristate "Analog Devices MAX77541/77540 PMIC Support"
>  	depends on I2C=y
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f7bdedd5a66d16bf8ccee0da1236a441e6f085b0..4a3bcd30ab7e12aed4bc5e48294500c77cb61aa7 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
>  obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
>  
> +obj-$(CONFIG_MFD_LTC4283)	+= ltc4283.o
>  obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
>  obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
> diff --git a/drivers/mfd/ltc4283.c b/drivers/mfd/ltc4283.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a45c01278f884630984790c922c057c4f2db9c82
> --- /dev/null
> +++ b/drivers/mfd/ltc4283.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Analog Devices LTC4283 I2C Negative Voltage Hot Swap Controller
> + *
> + * Copyright 2025 Analog Devices Inc.
> + */
> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/regmap.h>
> +#include <linux/property.h>

Alphabetical.

> +
> +#include <linux/mfd/ltc4283.h>
> +
> +static const struct mfd_cell ltc4283_cells[] = {
> +	MFD_CELL_OF("ltc4283-hwmon", NULL, NULL, 0, 0, "adi,ltc4283-hwmon"),
> +	MFD_CELL_OF("ltc4283-gpio", NULL, NULL, 0, 0, "adi,ltc4283-gpio"),
> +};
> +
> +static bool ltc4283_writable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case 0x00 ... 0x03:

Define these magic numbers.

> +		return false;
> +	case 0x3c:
> +		return false;
> +	case 0x86 ... 0x8f:
> +		return false;
> +	case 0x91 ... 0xa1:
> +		return false;
> +	case 0xa3:
> +		return false;
> +	case 0xac:
> +		return false;
> +	case 0xf1 ... 0xff:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config ltc4283_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.writeable_reg = ltc4283_writable_reg,
> +};
> +
> +static int ltc4283_get_gpio_pins(struct i2c_client *client, u32 *n_cells)

Why not do this in the GPIO driver?

> +{
> +	struct device *dev = &client->dev;
> +	u32 pins[LTC4283_GPIO_MAX], pin;
> +	unsigned long *gpio_mask;
> +	int n_pins, ret;
> +
> +	/*
> +	 * The device has up to 8 pins that can be configured either as GPIOS or
> +	 * for monitoring purposes. Both gpio and hwmon devices need to have
> +	 * this information in order to do proper validations and
> +	 * configurations. Hence, this property needs to be in the top level
> +	 * device.
> +	 */
> +	n_pins = device_property_count_u32(dev, "adi,gpio-pins");
> +	if (n_pins < 0)
> +		return 0;
> +	if (n_pins >= LTC4283_GPIO_MAX)
> +		return dev_err_probe(dev, -EINVAL, "Too many GPIO pins specified (%d), max is %d\n",
> +				     n_pins, LTC4283_GPIO_MAX);
> +
> +	ret = device_property_read_u32_array(dev, "adi,gpio-pins", pins, n_pins);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read GPIO pins\n");
> +
> +	gpio_mask = devm_bitmap_zalloc(dev, LTC4283_GPIO_MAX, GFP_KERNEL);
> +	if (!gpio_mask)
> +		return -ENOMEM;
> +
> +	for (pin = 0; pin < n_pins; pin++) {
> +		if (pins[pin] >= LTC4283_GPIO_MAX)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid GPIO pin specified (%u), max is %d\n",
> +					     pins[pin], LTC4283_GPIO_MAX);
> +
> +		__set_bit(pins[pin], gpio_mask);
> +	}
> +
> +	/* Add the GPIO cell */
> +	*n_cells += 1;

Just register it anyway and have the GPIO driver error out if it doesn't
have the right cells / properties.

> +	i2c_set_clientdata(client, gpio_mask);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	u32 n_cells = ARRAY_SIZE(ltc4283_cells) - 1;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = devm_regmap_init_i2c(client, &ltc4283_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	ret = ltc4283_get_gpio_pins(client, &n_cells);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> +				    ltc4283_cells, n_cells, NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id ltc4283_of_match[] = {
> +	{ .compatible = "adi,ltc4283" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ltc4283_of_match);
> +
> +static const struct i2c_device_id ltc4283_i2c_id[] = {
> +	{ "ltc4283" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);
> +
> +static struct i2c_driver ltc4283_driver = {
> +	.driver = {
> +		.name = "ltc4283",
> +		.of_match_table = ltc4283_of_match,
> +	},
> +	.probe = ltc4283_probe,
> +	.id_table = ltc4283_i2c_id,
> +};
> +module_i2c_driver(ltc4283_driver);
> +
> +MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC4283 MFD I2C driver");

It's not an MFD anything!

And the communication method is meaningless.

You can use "Core driver" instead.

> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/ltc4283.h b/include/linux/mfd/ltc4283.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..153594009c07b296ce5743e5e817e96464d81cb3
> --- /dev/null
> +++ b/include/linux/mfd/ltc4283.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Analog Devices LTC4283 I2C Negative Voltage Hot Swap Controller
> + *
> + * Copyright 2025 Analog Devices Inc.
> + */
> +
> +#ifndef __MFD_LTC4283_H_
> +#define __MFD_LTC4283_H_
> +
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +
> +/*
> + * We can have up to 8 gpios. 4 PGIOs and 4 ADIOs. PGIOs start at index 4 in the
> + * gpios mask.
> + */
> +#define LTC4283_PGIOX_START_NR	4
> +
> +#define LTC4283_PGIO_CONFIG		0x10
> +#define   LTC4283_PGIO_CFG_MASK(pin) \
> +	GENMASK(((pin) - LTC4283_PGIOX_START_NR) * 2 + 1, (((pin) - LTC4283_PGIOX_START_NR) * 2))

What do all of these numbers mean?  Can you define them?

> +#define LTC4283_PGIO_CONFIG_2		0x11
> +#define   LTC4283_ADC_MASK		GENMASK(2, 0)
> +#define   LTC4283_PGIO_OUT_MASK(pin)	BIT(4 + (pin))
> +
> +#define LTC4283_GPIO_MAX	8
> +
> +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */

Why?

> +#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> +
> +#endif
> 
> -- 
> 2.50.1
> 
> 

-- 
Lee Jones [李琼斯]


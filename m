Return-Path: <linux-gpio+bounces-29079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9921C89E7E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32820356E86
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 13:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B462B20A5E5;
	Wed, 26 Nov 2025 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qK9y8kdh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A31F0E34;
	Wed, 26 Nov 2025 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162293; cv=none; b=OqdaflyR71JAe5+iY0v6psikKC7vHyGjn5/xpky0PKhuzAp8r4eeLwjtjlGkBdSY94a1f6+0z53pBCA2DCkIxvssSgk/x5nTLt1pC5IkRg4ycw/t28xC1I1Jg7mhhJRc6NXC4UrQxte1LVyjvPEHA6Gi93LHUSSgmIcyqf7p12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162293; c=relaxed/simple;
	bh=WQ9FQIL122lVcBFg8BX6czJ7NNg5P9RWcZI1dunrvuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkppqL2ab16d+O/xtslOpOAWwzKlx2NYsIgFj02SiSNdT/ahNzsj+VcvVI6AbXBoxtsHGeFIYFt8E9T19xFZUSwIw/dXEFDJsj2HfZn+t7adhDLlU1o38aUSKvao2xaITzgdST26suFUWTUHweiwzoEwisYXzU4BAJdlloZ3n40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qK9y8kdh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705A4C113D0;
	Wed, 26 Nov 2025 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764162293;
	bh=WQ9FQIL122lVcBFg8BX6czJ7NNg5P9RWcZI1dunrvuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qK9y8kdhwP0oRo4esBbizmMN1qbrIvwXu+P0JALdpmanp6HnJ6P+e1ANafYEBhQ1Z
	 eKwjR+/qmw2OEGv8uoDPSfupO+71mpwvSGihN1uJt1wsxz9Wx1AEGf+6YPyOptNtJK
	 2r/d5v1+BYv0iAd9oRQVAYvGBJSLwc4kIoSLoP+3aJzfImZ450MFW3dA8UAaLQoegm
	 KUcbj5/CMVnHATPxClA1lcF0uNSA0577mED1wgAY5irkmEBtz0KV5eNKMRT3E9QYZM
	 NxIymQO/iI7Y5NNEYqYwx8T2xsggLmo8UB3DTCsIts9Y/Oeda3GSqs5dHT199TnjCM
	 7YZy6MTvw2n4w==
Date: Wed, 26 Nov 2025 13:04:47 +0000
From: Lee Jones <lee@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/6] mfd: Add RTL8231 core device
Message-ID: <20251126130447.GB3070764@google.com>
References: <20251119200306.60569-1-sander@svanheule.net>
 <20251119200306.60569-4-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119200306.60569-4-sander@svanheule.net>

On Wed, 19 Nov 2025, Sander Vanheule wrote:

> The RTL8231 is implemented as an MDIO device, and provides a regmap
> interface for register access by the core and child devices.
> 
> The chip can also be a device on an SMI bus, an I2C-like bus by Realtek.
> Since kernel support for SMI is limited, and no real-world SMI
> implementations have been encountered for this device, this is currently
> unimplemented. The use of the regmap interface should make any future
> support relatively straightforward.
> 
> After a soft reset, all pins are muxed to GPIO inputs before the pin
> drivers are enabled. This is done to prevent accidental system resets,
> when a pin is connected to the main SoC's reset line.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> Changes since v6:
> - Sort header includes
> - Drop comment on cache type (6.19 will support REGCACHE_FLAT_S)
> - Limit scope of LED_START field definition to init
> - Variable renames:
>    - map -> regmap
>    - val -> status (register value) and ready_code (field value)
>    - val -> cfg
> - Invert logic for !started, reducing code indentation
> - Place __maybe_unused after function return type
> - Use regmap_field_write() for LED_START field (volatile register)
> - Use regcache_drop_region() to invalidate cache, replacing
>   regcache_mark_dirty() which invalidates the device state
> ---
>  drivers/mfd/Kconfig         |   9 ++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/rtl8231.c       | 193 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/rtl8231.h |  71 +++++++++++++
>  4 files changed, 274 insertions(+)
>  create mode 100644 drivers/mfd/rtl8231.c
>  create mode 100644 include/linux/mfd/rtl8231.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947b..e13e2df63fee 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1301,6 +1301,15 @@ config MFD_RDC321X
>  	  southbridge which provides access to GPIOs and Watchdog using the
>  	  southbridge PCI device configuration space.
>  
> +config MFD_RTL8231
> +	tristate "Realtek RTL8231 GPIO and LED expander"
> +	select MFD_CORE
> +	select REGMAP_MDIO
> +	help
> +	  Support for the Realtek RTL8231 GPIO and LED expander.
> +	  Provides up to 37 GPIOs, 88 LEDs, and one PWM output.
> +	  When built as a module, this module will be named rtl8231.
> +
>  config MFD_RT4831
>  	tristate "Richtek RT4831 four channel WLED and Display Bias Voltage"
>  	depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 865e9f12faff..ba973382a20f 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -252,6 +252,7 @@ obj-$(CONFIG_MFD_HI6421_PMIC)	+= hi6421-pmic-core.o
>  obj-$(CONFIG_MFD_HI6421_SPMI)	+= hi6421-spmi-pmic.o
>  obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
>  obj-$(CONFIG_MFD_DLN2)		+= dln2.o
> +obj-$(CONFIG_MFD_RTL8231)	+= rtl8231.o
>  obj-$(CONFIG_MFD_RT4831)	+= rt4831.o
>  obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
>  obj-$(CONFIG_MFD_RT5120)	+= rt5120.o
> diff --git a/drivers/mfd/rtl8231.c b/drivers/mfd/rtl8231.c
> new file mode 100644
> index 000000000000..8c74a3497045
> --- /dev/null
> +++ b/drivers/mfd/rtl8231.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0-only

No company copyright or author tags?

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mdio.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/mfd/rtl8231.h>
> +
> +static bool rtl8231_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	/*
> +	 * Registers with self-clearing bits, strapping pin values.
> +	 * Don't mark the data registers as volatile, since we need
> +	 * caching for the output values.
> +	 */
> +	case RTL8231_REG_FUNC0:
> +	case RTL8231_REG_FUNC1:
> +	case RTL8231_REG_PIN_HI_CFG:
> +	case RTL8231_REG_LED_END:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct mfd_cell rtl8231_cells[] = {
> +	{
> +		.name = "rtl8231-pinctrl",
> +	},
> +	{
> +		.name = "rtl8231-leds",
> +		.of_compatible = "realtek,rtl8231-leds",
> +	},
> +};
> +
> +static int rtl8231_soft_reset(struct regmap *regmap)
> +{
> +	const unsigned int all_pins_mask = GENMASK(RTL8231_BITS_VAL - 1, 0);
> +	unsigned int cfg;
> +	int err;
> +
> +	/* SOFT_RESET bit self-clears when done */
> +	regmap_write_bits(regmap, RTL8231_REG_PIN_HI_CFG,
> +			  RTL8231_PIN_HI_CFG_SOFT_RESET, RTL8231_PIN_HI_CFG_SOFT_RESET);
> +
> +	err = regmap_read_poll_timeout(regmap, RTL8231_REG_PIN_HI_CFG, cfg,
> +				       !(cfg & RTL8231_PIN_HI_CFG_SOFT_RESET), 50, 1000);
> +	if (err)
> +		return err;
> +
> +	regcache_drop_region(regmap, 0, RTL8231_REG_COUNT - 1);

Nit:

RTL8231_REG_FUNC0, RTL8231_REG_GPIO_DATA2

I'll also accept additional devices for each of these which would make
things very clear.

RTL8231_REG_START	0
RTL8231_REG_END		RTL8231_REG_COUNT - 1

Or similar.

> +
> +	/*
> +	 * Chip reset results in a pin configuration that is a mix of LED and GPIO outputs.
> +	 * Select GPI functionality for all pins before enabling pin outputs.
> +	 */
> +	regmap_write(regmap, RTL8231_REG_PIN_MODE0, all_pins_mask);
> +	regmap_write(regmap, RTL8231_REG_GPIO_DIR0, all_pins_mask);
> +	regmap_write(regmap, RTL8231_REG_PIN_MODE1, all_pins_mask);
> +	regmap_write(regmap, RTL8231_REG_GPIO_DIR1, all_pins_mask);
> +	regmap_write(regmap, RTL8231_REG_PIN_HI_CFG,
> +		     RTL8231_PIN_HI_CFG_MODE_MASK | RTL8231_PIN_HI_CFG_DIR_MASK);
> +
> +	return 0;
> +}
> +
> +static int rtl8231_init(struct device *dev, struct regmap *regmap)
> +{
> +	struct regmap_field *led_start;
> +	unsigned int ready_code;
> +	unsigned int started;
> +	unsigned int status;
> +	int err;
> +
> +	err = regmap_read(regmap, RTL8231_REG_FUNC1, &status);
> +	if (err) {
> +		dev_err(dev, "failed to read READY_CODE\n");
> +		return err;
> +	}
> +
> +	ready_code = FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, status);
> +	if (ready_code != RTL8231_FUNC1_READY_CODE_VALUE) {
> +		dev_err(dev, "RTL8231 not present or ready 0x%x != 0x%x\n",
> +			ready_code, RTL8231_FUNC1_READY_CODE_VALUE);
> +		return -ENODEV;
> +	}
> +
> +	led_start = dev_get_drvdata(dev);
> +	err = regmap_field_read(led_start, &started);
> +	if (err)
> +		return err;
> +
> +	if (started)
> +		return 0;
> +
> +	err = rtl8231_soft_reset(regmap);
> +	if (err)
> +		return err;
> +
> +	/* LED_START enables power to output pins, and starts the LED engine */
> +	return regmap_field_write(led_start, 1);

Why can't the dedicated LED driver initialise itself?

> +}
> +
> +static const struct regmap_config rtl8231_mdio_regmap_config = {
> +	.val_bits = RTL8231_BITS_VAL,
> +	.reg_bits = RTL8231_BITS_REG,
> +	.volatile_reg = rtl8231_volatile_reg,
> +	.max_register = RTL8231_REG_COUNT - 1,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +static int rtl8231_mdio_probe(struct mdio_device *mdiodev)
> +{
> +	const struct reg_field field_led_start = REG_FIELD(RTL8231_REG_FUNC0, 1, 1);
> +	struct device *dev = &mdiodev->dev;
> +	struct regmap_field *led_start;
> +	struct regmap *regmap;
> +	int err;
> +
> +	regmap = devm_regmap_init_mdio(mdiodev, &rtl8231_mdio_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to init regmap\n");

Nit: Let's not shorten user messages - "initialise".

> +		return PTR_ERR(regmap);
> +	}
> +
> +	led_start = devm_regmap_field_alloc(dev, regmap, field_led_start);
> +	if (IS_ERR(led_start))
> +		return PTR_ERR(led_start);
> +
> +	dev_set_drvdata(dev, led_start);

I'd pass the whole Regmap through and let the LED extract its own part.

> +	mdiodev->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(mdiodev->reset_gpio))
> +		return PTR_ERR(mdiodev->reset_gpio);
> +
> +	device_property_read_u32(dev, "reset-assert-delay", &mdiodev->reset_assert_delay);
> +	device_property_read_u32(dev, "reset-deassert-delay", &mdiodev->reset_deassert_delay);
> +
> +	err = rtl8231_init(dev, regmap);

... then you can omit the 'regmap' argument.

> +	if (err)
> +		return err;
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, rtl8231_cells,
> +				    ARRAY_SIZE(rtl8231_cells), NULL, 0, NULL);
> +}
> +
> +static int __maybe_unused rtl8231_suspend(struct device *dev)
> +{
> +	struct regmap_field *led_start = dev_get_drvdata(dev);
> +
> +	return regmap_field_write(led_start, 0);

The LED driver doesn't have its own suspend support?

> +}
> +
> +static int __maybe_unused rtl8231_resume(struct device *dev)
> +{
> +	struct regmap_field *led_start = dev_get_drvdata(dev);
> +
> +	return regmap_field_write(led_start, 1);
> +}
> +

Nit: Remove this line.

> +static SIMPLE_DEV_PM_OPS(rtl8231_pm_ops, rtl8231_suspend, rtl8231_resume);
> +
> +static const struct of_device_id rtl8231_of_match[] = {
> +	{ .compatible = "realtek,rtl8231" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rtl8231_of_match);
> +
> +static struct mdio_driver rtl8231_mdio_driver = {
> +	.mdiodrv.driver = {
> +		.name = "rtl8231-expander",
> +		.of_match_table	= rtl8231_of_match,
> +		.pm = pm_ptr(&rtl8231_pm_ops),
> +	},
> +	.probe = rtl8231_mdio_probe,
> +};
> +mdio_module_driver(rtl8231_mdio_driver);
> +
> +MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
> +MODULE_DESCRIPTION("Realtek RTL8231 GPIO and LED expander");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/rtl8231.h b/include/linux/mfd/rtl8231.h
> new file mode 100644
> index 000000000000..003eda3797a3
> --- /dev/null
> +++ b/include/linux/mfd/rtl8231.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Register definitions the RTL8231 GPIO and LED expander chip
> + */
> +
> +#ifndef __LINUX_MFD_RTL8231_H
> +#define __LINUX_MFD_RTL8231_H
> +
> +#include <linux/bits.h>
> +
> +/*
> + * Registers addresses are 5 bit, values are 16 bit
> + * Also define a duplicated range of virtual addresses, to enable
> + * different read/write behaviour on the GPIO data registers
> + */
> +#define RTL8231_BITS_VAL		16
> +#define RTL8231_BITS_REG		5
> +
> +/* Chip control */
> +#define RTL8231_REG_FUNC0		0x00
> +#define RTL8231_FUNC0_SCAN_MODE		BIT(0)
> +#define RTL8231_FUNC0_SCAN_SINGLE	0
> +#define RTL8231_FUNC0_SCAN_BICOLOR	BIT(0)
> +
> +#define RTL8231_REG_FUNC1		0x01
> +#define RTL8231_FUNC1_READY_CODE_VALUE	0x37
> +#define RTL8231_FUNC1_READY_CODE_MASK	GENMASK(9, 4)
> +#define RTL8231_FUNC1_DEBOUNCE_MASK	GENMASK(15, 10)
> +
> +/* Pin control */
> +#define RTL8231_REG_PIN_MODE0		0x02
> +#define RTL8231_REG_PIN_MODE1		0x03
> +
> +#define RTL8231_PIN_MODE_LED		0
> +#define RTL8231_PIN_MODE_GPIO		1
> +
> +/* Pin high config: pin and GPIO control for pins 32-26 */
> +#define RTL8231_REG_PIN_HI_CFG		0x04
> +#define RTL8231_PIN_HI_CFG_MODE_MASK	GENMASK(4, 0)
> +#define RTL8231_PIN_HI_CFG_DIR_MASK	GENMASK(9, 5)
> +#define RTL8231_PIN_HI_CFG_INV_MASK	GENMASK(14, 10)
> +#define RTL8231_PIN_HI_CFG_SOFT_RESET	BIT(15)
> +
> +/* GPIO control registers */
> +#define RTL8231_REG_GPIO_DIR0		0x05
> +#define RTL8231_REG_GPIO_DIR1		0x06
> +#define RTL8231_REG_GPIO_INVERT0	0x07
> +#define RTL8231_REG_GPIO_INVERT1	0x08
> +
> +#define RTL8231_GPIO_DIR_IN		1
> +#define RTL8231_GPIO_DIR_OUT		0
> +
> +/*
> + * GPIO data registers
> + * Only the output data can be written to these registers, and only the input
> + * data can be read.
> + */
> +#define RTL8231_REG_GPIO_DATA0		0x1c
> +#define RTL8231_REG_GPIO_DATA1		0x1d
> +#define RTL8231_REG_GPIO_DATA2		0x1e
> +#define RTL8231_PIN_HI_DATA_MASK	GENMASK(4, 0)
> +
> +/* LED control base registers */
> +#define RTL8231_REG_LED0_BASE		0x09
> +#define RTL8231_REG_LED1_BASE		0x10
> +#define RTL8231_REG_LED2_BASE		0x17
> +#define RTL8231_REG_LED_END		0x1b
> +
> +#define RTL8231_REG_COUNT		0x1f
> +
> +#endif /* __LINUX_MFD_RTL8231_H */
> -- 
> 2.51.1
> 

-- 
Lee Jones [李琼斯]


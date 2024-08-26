Return-Path: <linux-gpio+bounces-9161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0395ECC6
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 11:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD551C21765
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2148A13E033;
	Mon, 26 Aug 2024 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjY3mfHN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDD13BACC;
	Mon, 26 Aug 2024 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663440; cv=none; b=A/QJkEcuPbu4tntvsvvhD1ObNsLQ8z+IwLLhUKJuFlYKD9DizPIpKdcdrqSLxuGyqObSp54TzE3tjjCdsQ8vS8lAVSRKmsQlPxUd/xrOB4ucd0OoQ/VanCNQRjGymBsN1Xk5ZpOuRau77i+hET+RSr1mUf0+cTUMtimNBZMMUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663440; c=relaxed/simple;
	bh=ubU4SP5/UrB7mcpISJ52zNIckboVT0Fj8XYbs/4GPzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpwUPjSxH0xDjgvrwTBFD3f/1lK6Ni1o2mBOaB7jE1WwmCn1BhQ+YfZeNRQQ2Qs4N5fZ86B7p6IAuFhWERjZeswnDecj+N6LgDVMkvrxh0bvH9m2CgSctp3BsYeBd1XEqwufQOov24/Kvu+SkYJI6EHBno4nLEeviKApuyspcvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjY3mfHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB79C8CDC1;
	Mon, 26 Aug 2024 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724663440;
	bh=ubU4SP5/UrB7mcpISJ52zNIckboVT0Fj8XYbs/4GPzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZjY3mfHNQ3M01Ay4ODdAUqJbGwq9IIN3DBE6SJZ4TP73eKOHk+u7YH1pY3TWjyPJ3
	 YHSzlaMvg+IVF7Gr86Qt600YPm6qj9XUilQGb8vHyshYzVnmzprfG32SMVwCyXFgJS
	 TXPz3asQqsJxmkdsPtjFKzAW4sNFmT4HRl6hf0GeMm9AyQB+ZmAuJBKitssF1ZeE85
	 xx5a9fyehwpr89cSpn44lGVxVNwEiyz+z7k3HSPfHKdZQ0xLMsneMTjgQxGtQ1yPts
	 IzUg9Or7iIbzWR68fJHVsjrqLeJjTlwNW8ahIaY8NYjt25BZ1NxLRvFWq+DaVgjuJT
	 FmUhjsMZ+EOFw==
Message-ID: <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
Date: Mon, 26 Aug 2024 11:10:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/08/2024 10:42, Andrei Stefanescu wrote:
> Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
> (System Integration Unit Lite2) hardware module. There are two
> SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
> SIUL2_1 for the rest.
> 
> The GPIOs are not fully contiguous, there are some gaps:
> - GPIO102 up to GPIO111(inclusive) are invalid
> - GPIO123 up to GPIO143(inclusive) are invalid
> 
> Some GPIOs are input only(i.e. GPI182) though this restriction
> is not yet enforced in code.
> 
> This patch adds basic GPIO functionality(no interrupts, no
> suspend/resume functions).
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> ---
>  drivers/gpio/Kconfig            |   8 +
>  drivers/gpio/Makefile           |   1 +
>  drivers/gpio/gpio-siul2-s32g2.c | 607 ++++++++++++++++++++++++++++++++
>  3 files changed, 616 insertions(+)
>  create mode 100644 drivers/gpio/gpio-siul2-s32g2.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 58f43bcced7c..0c3c94daab0f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -643,6 +643,14 @@ config GPIO_SIOX
>  	  Say yes here to support SIOX I/O devices. These are units connected
>  	  via a SIOX bus and have a number of fixed-direction I/O lines.
>  
> +config GPIO_SIUL2_S32G2
> +        tristate "GPIO driver for S32G2/S32G3"
> +        depends on OF_GPIO

depends on ARCH || COMPILE_TEST?
(at least that's my preference)

> +        help
> +          This enables support for the SIUL2 GPIOs found on the S32G2/S32G3
> +          chips. Say yes here to enable the SIUL2 to be used as an GPIO
> +          controller for S32G2/S32G3 platforms.
> +
>  config GPIO_SNPS_CREG
>  	bool "Synopsys GPIO via CREG (Control REGisters) driver"
>  	depends on ARC || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 64dd6d9d730d..fb6e770a64b9 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -149,6 +149,7 @@ obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
>  obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
>  obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
>  obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
> +obj-$(CONFIG_GPIO_SIUL2_S32G2)		+= gpio-siul2-s32g2.o
>  obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
>  obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
>  obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
> diff --git a/drivers/gpio/gpio-siul2-s32g2.c b/drivers/gpio/gpio-siul2-s32g2.c
> new file mode 100644
> index 000000000000..07df16299237
> --- /dev/null
> +++ b/drivers/gpio/gpio-siul2-s32g2.c
> @@ -0,0 +1,607 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * SIUL2 GPIO support.
> + *
> + * Copyright (c) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2018-2024 NXP
> +  */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/bitmap.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +/* PGPDOs are 16bit registers that come in big endian
> + * order if they are grouped in pairs of two.
> + *
> + * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
> + */
> +#define SIUL2_PGPDO(N)		(((N) ^ 1) * 2)
> +#define S32G2_SIUL2_NUM		2
> +#define S32G2_PADS_DTS_TAG_LEN	(7)
> +
> +#define SIUL2_GPIO_16_PAD_SIZE		16
> +
> +/**
> + * struct siul2_device_data  - platform data attached to the compatible.
> + * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM tables.
> + * @reset_cnt: reset the pin name counter to zero when switching to SIUL2_1.
> + */
> +struct siul2_device_data {
> +	const struct regmap_access_table **pad_access;
> +	const bool reset_cnt;
> +};
> +
> +/**
> + * struct siul2_desc - describes a SIUL2 hw module.
> + * @pad_access: array of valid I/O pads.
> + * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
> + * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
> + * @gpio_base: the first GPIO pin.
> + * @gpio_num: the number of GPIO pins.
> + */
> +struct siul2_desc {
> +	const struct regmap_access_table *pad_access;
> +	struct regmap *opadmap;
> +	struct regmap *ipadmap;
> +	u32 gpio_base;
> +	u32 gpio_num;
> +};
> +
> +/**
> + * struct siul2_gpio_dev - describes a group of GPIO pins.
> + * @platdata: the platform data.
> + * @siul2: SIUL2_0 and SIUL2_1 modules information.
> + * @pin_dir_bitmap: the bitmap with pin directions.
> + * @gc: the GPIO chip.
> + * @lock: mutual access to bitmaps.
> + */
> +struct siul2_gpio_dev {
> +	const struct siul2_device_data *platdata;
> +	struct siul2_desc siul2[S32G2_SIUL2_NUM];
> +	unsigned long *pin_dir_bitmap;
> +	struct gpio_chip gc;
> +	raw_spinlock_t lock;
> +};
> +
> +static inline int siul2_get_gpio_pinspec(struct platform_device *pdev,
> +					 struct of_phandle_args *pinspec,
> +					 unsigned int range_index)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +						range_index, pinspec);

Where do you drop the ref?

> +}
> +
> +static inline struct regmap *siul2_offset_to_regmap(struct siul2_gpio_dev *dev,
> +						    unsigned int offset,
> +						    bool input)
> +{
> +	struct siul2_desc *siul2;
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->siul2); i++) {
> +		siul2 = &dev->siul2[i];
> +		if (offset >= siul2->gpio_base &&
> +		    offset - siul2->gpio_base < siul2->gpio_num)
> +			return input ? siul2->ipadmap : siul2->opadmap;
> +	}
> +
> +	return NULL;
> +}
> +
> +static inline void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
> +					    unsigned int gpio, int dir)

Drop inline from all above. No point.

> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&dev->lock, flags);
> +
> +	if (dir == GPIO_LINE_DIRECTION_IN)
> +		bitmap_clear(dev->pin_dir_bitmap, gpio, 1);
> +	else
> +		bitmap_set(dev->pin_dir_bitmap, gpio, 1);
> +
> +	raw_spin_unlock_irqrestore(&dev->lock, flags);
> +}
> +
> +static inline int siul2_get_direction(struct siul2_gpio_dev *dev,
> +				      unsigned int gpio)
> +{
> +	return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_OUT :
> +						     GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static inline struct siul2_gpio_dev *to_siul2_gpio_dev(struct gpio_chip *chip)
> +{
> +	return container_of(chip, struct siul2_gpio_dev, gc);
> +}
> +
> +static int siul2_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	struct siul2_gpio_dev *gpio_dev;
> +	int ret = 0;
> +
> +	ret = pinctrl_gpio_direction_input(chip, gpio);
> +	if (ret)
> +		return ret;
> +
> +	gpio_dev = to_siul2_gpio_dev(chip);
> +	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_IN);
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	return siul2_get_direction(to_siul2_gpio_dev(chip), gpio);
> +}
> +
> +static unsigned int siul2_pin2pad(unsigned int pin)
> +{
> +	return pin / SIUL2_GPIO_16_PAD_SIZE;
> +}
> +
> +static u16 siul2_pin2mask(unsigned int pin)
> +{
> +	/**
> +	 * From Reference manual :
> +	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
> +	 */
> +	return BIT(SIUL2_GPIO_16_PAD_SIZE - 1 - pin % SIUL2_GPIO_16_PAD_SIZE);
> +}
> +
> +static inline u32 siul2_get_pad_offset(unsigned int pad)
> +{
> +	return SIUL2_PGPDO(pad);
> +}
> +


...

> +
> +static struct regmap *common_regmap_init(struct platform_device *pdev,
> +					 struct regmap_config *conf,
> +					 const char *name)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	resource_size_t size;
> +	void __iomem *base;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	base = devm_ioremap_resource(dev, res);

There is a wrapper for both calls above, so use it.

> +	if (IS_ERR(base))
> +		return ERR_PTR(-ENOMEM);
> +
> +	size = resource_size(res);
> +	conf->val_bits = conf->reg_stride * 8;
> +	conf->max_register = size - conf->reg_stride;
> +	conf->name = name;
> +	conf->use_raw_spinlock = true;
> +
> +	if (conf->cache_type != REGCACHE_NONE)
> +		conf->num_reg_defaults_raw = size / conf->reg_stride;
> +
> +	return devm_regmap_init_mmio(dev, base, conf);
> +}
> +
> +static bool not_writable(__always_unused struct device *dev,
> +			 __always_unused unsigned int reg)
> +{
> +	return false;
> +}
> +
> +static struct regmap *init_padregmap(struct platform_device *pdev,
> +				     struct siul2_gpio_dev *gpio_dev,
> +				     int selector, bool input)
> +{
> +	const struct siul2_device_data *platdata = gpio_dev->platdata;
> +	struct regmap_config regmap_conf = siul2_regmap_conf;
> +	char dts_tag[S32G2_PADS_DTS_TAG_LEN];
> +	int err;
> +
> +	regmap_conf.reg_stride = 2;
> +
> +	if (selector != 0 && selector != 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	regmap_conf.rd_table = platdata->pad_access[selector];
> +
> +	err = snprintf(dts_tag, ARRAY_SIZE(dts_tag),  "%cpads%d",
> +		       input ? 'i' : 'o', selector);
> +	if (err < 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (input) {
> +		regmap_conf.writeable_reg = not_writable;
> +		regmap_conf.cache_type = REGCACHE_NONE;
> +	} else {
> +		regmap_conf.wr_table = platdata->pad_access[selector];
> +	}
> +
> +	return common_regmap_init(pdev, &regmap_conf, dts_tag);
> +}
> +
> +static int siul2_gpio_pads_init(struct platform_device *pdev,
> +				struct siul2_gpio_dev *gpio_dev)
> +{
> +	struct device *dev = &pdev->dev;
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
> +		gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
> +							    false);
> +		if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
> +			dev_err(dev,
> +				"Failed to initialize opad2%lu regmap config\n",
> +				i);
> +			return PTR_ERR(gpio_dev->siul2[i].opadmap);
> +		}
> +
> +		gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
> +							    true);
> +		if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
> +			dev_err(dev,
> +				"Failed to initialize ipad2%lu regmap config\n",
> +				i);
> +			return PTR_ERR(gpio_dev->siul2[i].ipadmap);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int siul2_gen_names(struct device *dev, unsigned int cnt, char **names,
> +			   char *ch_index, unsigned int *num_index)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < cnt; i++) {
> +		if (i != 0 && !(*num_index % 16))
> +			(*ch_index)++;
> +
> +		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
> +					  *ch_index, 0xFU & (*num_index)++);
> +		if (!names[i])
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_remove_reserved_names(struct device *dev,
> +					    struct siul2_gpio_dev *gpio_dev,
> +					    char **names)
> +{
> +	struct device_node *np = dev->of_node;
> +	int num_ranges, i, j, ret;
> +	u32 base_gpio, num_gpio;
> +
> +	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
> +
> +	num_ranges = of_property_count_u32_elems(dev->of_node,
> +						 "gpio-reserved-ranges");
> +
> +	/* The "gpio-reserved-ranges" is optional. */
> +	if (num_ranges < 0)
> +		return 0;
> +	num_ranges /= 2;
> +
> +	for (i = 0; i < num_ranges; i++) {
> +		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
> +						 i * 2, &base_gpio);
> +		if (ret) {
> +			dev_err(dev, "Could not parse the start GPIO: %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
> +						 i * 2 + 1, &num_gpio);
> +		if (ret) {
> +			dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
> +			dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
> +			return -EINVAL;
> +		}
> +
> +		/* Remove names set for reserved GPIOs. */
> +		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
> +			devm_kfree(dev, names[j]);
> +			names[j] = NULL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_populate_names(struct device *dev,
> +				     struct siul2_gpio_dev *gpio_dev)
> +{
> +	unsigned int num_index = 0;
> +	char ch_index = 'A';
> +	char **names;
> +	int i, ret;
> +
> +	names = devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
> +			     GFP_KERNEL);
> +	if (!names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < S32G2_SIUL2_NUM; i++) {
> +		ret = siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
> +				      names + gpio_dev->siul2[i].gpio_base,
> +				      &ch_index, &num_index);
> +		if (ret) {
> +			dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
> +				i);
> +			return ret;
> +		}
> +
> +		if (gpio_dev->platdata->reset_cnt)
> +			num_index = 0;
> +
> +		ch_index++;
> +	}
> +
> +	ret = siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
> +	if (ret)
> +		return ret;
> +
> +	gpio_dev->gc.names = (const char *const *)names;
> +
> +	return 0;
> +}
> +
> +static int siul2_gpio_probe(struct platform_device *pdev)
> +{
> +	struct siul2_gpio_dev *gpio_dev;
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args pinspec;
> +	struct gpio_chip *gc;
> +	size_t bitmap_size;
> +	int ret = 0;
> +	size_t i;
> +
> +	gpio_dev = devm_kzalloc(dev, sizeof(*gpio_dev), GFP_KERNEL);
> +	if (!gpio_dev)
> +		return -ENOMEM;
> +
> +	gpio_dev->platdata = of_device_get_match_data(dev);
> +
> +	for (i = 0; i < S32G2_SIUL2_NUM; i++)
> +		gpio_dev->siul2[i].pad_access =
> +			gpio_dev->platdata->pad_access[i];
> +
> +	ret = siul2_gpio_pads_init(pdev, gpio_dev);
> +	if (ret)
> +		return ret;
> +
> +	gc = &gpio_dev->gc;
> +
> +	platform_set_drvdata(pdev, gpio_dev);
> +
> +	raw_spin_lock_init(&gpio_dev->lock);

Why do you use raw spin? Are you sure you need it (some people just
replace it thinking this will help them in PREEMPT_RT without actually
thinking if it is needed). IOW, do you have here irqchip anywhere?

> +
> +	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
> +		ret = siul2_get_gpio_pinspec(pdev, &pinspec, i);
> +		if (ret) {
> +			dev_err(dev,
> +				"unable to get pinspec %lu from device tree\n",
> +				i);
> +			return -EINVAL;
> +		}
> +
> +		if (pinspec.args_count != 3) {
> +			dev_err(dev, "Invalid pinspec count: %d\n",
> +				pinspec.args_count);
> +			return -EINVAL;
> +		}
> +
> +		gpio_dev->siul2[i].gpio_base = pinspec.args[1];
> +		gpio_dev->siul2[i].gpio_num = pinspec.args[2];
> +	}
> +
> +	gc->base = -1;
> +
> +	/* In some cases, there is a gap between the SIUL GPIOs. */
> +	gc->ngpio = gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_base +
> +		    gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_num;
> +
> +	ret = siul2_gpio_populate_names(&pdev->dev, gpio_dev);
> +	if (ret)
> +		return ret;
> +
> +	bitmap_size = gc->ngpio * sizeof(*gpio_dev->pin_dir_bitmap);
> +	gpio_dev->pin_dir_bitmap = devm_bitmap_zalloc(dev, bitmap_size,
> +						      GFP_KERNEL);
> +	if (!gpio_dev->pin_dir_bitmap)
> +		return -ENOMEM;
> +
> +	gc->parent = dev;
> +	gc->label = dev_name(dev);
> +
> +	gc->set = siul2_gpio_set;
> +	gc->get = siul2_gpio_get;
> +	gc->set_config = siul2_set_config;
> +	gc->request = siul2_gpio_request;
> +	gc->free = siul2_gpio_free;
> +	gc->direction_output = siul2_gpio_dir_out;
> +	gc->direction_input = siul2_gpio_dir_in;
> +	gc->get_direction = siul2_gpio_get_dir;
> +	gc->owner = THIS_MODULE;
> +
> +	ret = devm_gpiochip_add_data(dev, gc, gpio_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to add gpiochip\n");
> +
> +	return 0;
> +}
> +
> +static const struct regmap_range s32g2_siul20_pad_yes_ranges[] = {
> +	regmap_reg_range(SIUL2_PGPDO(0), SIUL2_PGPDO(0)),
> +	regmap_reg_range(SIUL2_PGPDO(1), SIUL2_PGPDO(1)),
> +	regmap_reg_range(SIUL2_PGPDO(2), SIUL2_PGPDO(2)),
> +	regmap_reg_range(SIUL2_PGPDO(3), SIUL2_PGPDO(3)),
> +	regmap_reg_range(SIUL2_PGPDO(4), SIUL2_PGPDO(4)),
> +	regmap_reg_range(SIUL2_PGPDO(5), SIUL2_PGPDO(5)),
> +	regmap_reg_range(SIUL2_PGPDO(6), SIUL2_PGPDO(6)),
> +};
> +
> +static const struct regmap_access_table s32g2_siul20_pad_access_table = {
> +	.yes_ranges	= s32g2_siul20_pad_yes_ranges,
> +	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul20_pad_yes_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul21_pad_yes_ranges[] = {
> +	regmap_reg_range(SIUL2_PGPDO(7), SIUL2_PGPDO(7)),
> +	regmap_reg_range(SIUL2_PGPDO(9), SIUL2_PGPDO(9)),
> +	regmap_reg_range(SIUL2_PGPDO(10), SIUL2_PGPDO(10)),
> +	regmap_reg_range(SIUL2_PGPDO(11), SIUL2_PGPDO(11)),
> +};
> +
> +static const struct regmap_access_table s32g2_siul21_pad_access_table = {
> +	.yes_ranges	= s32g2_siul21_pad_yes_ranges,
> +	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul21_pad_yes_ranges),
> +};
> +
> +static const struct regmap_access_table *s32g2_pad_access_table[] = {
> +	&s32g2_siul20_pad_access_table,
> +	&s32g2_siul21_pad_access_table
> +};
> +
> +static_assert(ARRAY_SIZE(s32g2_pad_access_table) == S32G2_SIUL2_NUM);
> +
> +static const struct siul2_device_data s32g2_device_data = {
> +	.pad_access	= s32g2_pad_access_table,
> +	.reset_cnt	= true,
> +};
> +
> +static const struct of_device_id siul2_gpio_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-siul2-gpio", .data = &s32g2_device_data },

Why do you have match data? There are no other variants.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, siul2_gpio_dt_ids);
> +
> +static struct platform_driver siul2_gpio_driver = {
> +	.driver			= {
> +		.name		= "s32g2-siul2-gpio",
> +		.owner		= THIS_MODULE,

Oh.... It's still dissappointing to see people trying to usptream their
10 or 15 year old drivers. Drop. Start from NEW DRIVER when writing new
driver. Not from 10-15 year old downstream driver.



Best regards,
Krzysztof



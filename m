Return-Path: <linux-gpio+bounces-7020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E698D67A8
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 19:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5DC21C2494E
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 17:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E910C17622F;
	Fri, 31 May 2024 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMevXgK1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92918176181;
	Fri, 31 May 2024 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175324; cv=none; b=U9cdLJ9+49j/8R5l3ErjN5wjYGdiPzCmYHBamzt0FkfumttcCcPdMjDzftl/gGICNe92BLsDrPBbYQ0IXWWHtb+4/X5V9XuXJyir9rKkN2sWutzXAXqKSKGXrE1w+FrwDS/u7ZVvuWXcuowY2aEHFGEo7K9ebLmta6A81qL3hS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175324; c=relaxed/simple;
	bh=TE31zcCtwo//qTVABONplIr8MOzq6rjh/sO1YqhtHhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hK2g8EmwWKAjVXB/4H7DH2Vh8NnBfKGi45VScU2D6Tx2tYBhdppDNRvEfHi4PjMUQI37WyGVpabukuTxysaUCZJr3FsBlRDFlBXXnpaTl9hn/eo9UPbt0IOApt9qY1lk+X6xO34ZbvfII7wwxzpTr5omLH6PH4GC92pPuFrUITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMevXgK1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9678EC116B1;
	Fri, 31 May 2024 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717175324;
	bh=TE31zcCtwo//qTVABONplIr8MOzq6rjh/sO1YqhtHhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMevXgK14QpY8qvutmv5xGuTkkEr5FUSvq4yjHXp36WaVmhoBK1Es3rxkrrGdTxPF
	 5DqXSrSu/fWa4IUVKC8S/vUvfHkAsUaOIrvIxFpjd9YHLEoXeqGuYApkbFUCNNsTIk
	 K7ohS1o+TntQPOmSd+J6XymXWopHUw6kkH2s4dC3LUGBuvKW8wNRybktCJpUQfKEGv
	 Qgv8Shug/i9LAfPSfKyIDb+9sfvT2zlRR57bkfrvsNZK6TqtphpRRELjqBmgJFuVui
	 J0Uw2YDt8DgITkkvii0QxBKkT64Zpbb3eSEpxp4gK64lLdWUVRCvTOJRdCcLrKwwnI
	 Zmkv+rgbfv72Q==
Date: Fri, 31 May 2024 18:08:37 +0100
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 12/14] mfd: pm8008: rework driver
Message-ID: <20240531170837.GC1204315@google.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-13-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529162958.18081-13-johan+linaro@kernel.org>

Please improve the subject line.

I'll come back to review the whole set once Andy has had his wicked way with you!

</end>

On Wed, 29 May 2024, Johan Hovold wrote:

> Rework the pm8008 driver to match the new binding which no longer
> describes internal details like interrupts and register offsets
> (including which of the two consecutive I2C addresses the registers
> belong to).
> 
> Instead make the interrupt controller implementation internal and pass
> interrupts to the subdrivers using MFD cell resources.
> 
> Note that subdrivers may either get their resources, like register block
> offsets, from the parent MFD or this can be included in the subdrivers
> directly.
> 
> In the current implementation, the temperature alarm driver is generic
> enough to just get its base address and alarm interrupt from the parent
> driver, which already uses this information to implement the interrupt
> controller.
> 
> The regulator driver, however, needs additional information like parent
> supplies and regulator characteristics so in that case it is easier to
> just augment its table with the regulator register base addresses.
> 
> Similarly, the current GPIO driver already holds the number of pins and
> that lookup table can therefore also be extended with register offsets.
> 
> Note that subdrivers can now access the two regmaps by name, even if the
> primary regmap is registered last so that it is returned by default when
> no name is provided in lookups.
> 
> Finally, note that the temperature alarm and GPIO subdrivers need some
> minor rework before they can be used with non-SPMI devices like the
> PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
> rather than "spmi" prefix to prevent binding until the driver has been
> updated.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/mfd/Kconfig                   |  1 +
>  drivers/mfd/qcom-pm8008.c             | 97 +++++++++++++++++++++++----
>  include/dt-bindings/mfd/qcom-pm8008.h | 19 ------
>  3 files changed, 86 insertions(+), 31 deletions(-)
>  delete mode 100644 include/dt-bindings/mfd/qcom-pm8008.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 4b023ee229cf..bfcb68c62b07 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2208,6 +2208,7 @@ config MFD_ACER_A500_EC
>  config MFD_QCOM_PM8008
>  	tristate "QCOM PM8008 Power Management IC"
>  	depends on I2C && OF
> +	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ
>  	help
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 72199840231e..246b5fe9819d 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -7,8 +7,10 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/ioport.h>
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/mfd/core.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -16,8 +18,6 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> -#include <dt-bindings/mfd/qcom-pm8008.h>
> -
>  #define I2C_INTR_STATUS_BASE		0x0550
>  #define INT_RT_STS_OFFSET		0x10
>  #define INT_SET_TYPE_OFFSET		0x11
> @@ -45,6 +45,16 @@ enum {
>  #define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
>  #define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
>  
> +/* PM8008 IRQ numbers */
> +#define PM8008_IRQ_MISC_UVLO	0
> +#define PM8008_IRQ_MISC_OVLO	1
> +#define PM8008_IRQ_MISC_OTST2	2
> +#define PM8008_IRQ_MISC_OTST3	3
> +#define PM8008_IRQ_MISC_LDO_OCP	4
> +#define PM8008_IRQ_TEMP_ALARM	5
> +#define PM8008_IRQ_GPIO1	6
> +#define PM8008_IRQ_GPIO2	7
> +
>  enum {
>  	SET_TYPE_INDEX,
>  	POLARITY_HI_INDEX,
> @@ -148,21 +158,65 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
>  	.get_irq_reg		= pm8008_get_irq_reg,
>  };
>  
> -static struct regmap_config qcom_mfd_regmap_cfg = {
> +static const struct regmap_config qcom_mfd_regmap_cfg = {
> +	.name		= "primary",
> +	.reg_bits	= 16,
> +	.val_bits	= 8,
> +	.max_register	= 0xffff,
> +};
> +
> +static const struct regmap_config pm8008_regmap_cfg_2 = {
> +	.name		= "secondary",
>  	.reg_bits	= 16,
>  	.val_bits	= 8,
>  	.max_register	= 0xffff,
>  };
>  
> +static const struct resource pm8008_temp_res[] = {
> +	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
> +	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
> +};
> +
> +static const struct mfd_cell pm8008_cells[] = {
> +	MFD_CELL_NAME("pm8008-regulator"),
> +	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
> +	MFD_CELL_NAME("pm8008-gpio"),
> +};
> +
> +static void devm_irq_domain_fwnode_release(void *data)
> +{
> +	struct fwnode_handle *fwnode = data;
> +
> +	irq_domain_free_fwnode(fwnode);
> +}
> +
>  static int pm8008_probe(struct i2c_client *client)
>  {
>  	struct regmap_irq_chip_data *irq_data;
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap, *regmap2;
> +	struct fwnode_handle *fwnode;
> +	struct i2c_client *dummy;
>  	struct gpio_desc *reset;
> -	int rc;
> -	struct device *dev;
> -	struct regmap *regmap;
> +	char *name;
> +	int ret;
> +
> +	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
> +	if (IS_ERR(dummy)) {
> +		ret = PTR_ERR(dummy);
> +		dev_err(dev, "failed to claim second address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap2 = devm_regmap_init_i2c(dummy, &qcom_mfd_regmap_cfg);
> +	if (IS_ERR(regmap2))
> +		return PTR_ERR(regmap2);
>  
> -	dev = &client->dev;
> +	ret = regmap_attach_dev(dev, regmap2, &pm8008_regmap_cfg_2);
> +	if (ret)
> +		return ret;
> +
> +	/* Default regmap must be attached last. */
>  	regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
> @@ -177,14 +231,33 @@ static int pm8008_probe(struct i2c_client *client)
>  	 */
>  	usleep_range(1000, 2000);
>  
> -	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
> -		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
> +	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	name = strreplace(name, '/', ':');
> +
> +	fwnode = irq_domain_alloc_named_fwnode(name);
> +	if (!fwnode)
> +		return -ENOMEM;
> +
> +	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
>  				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> -		if (rc)
> -			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> +	if (ret) {
> +		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
> +		return ret;
>  	}
>  
> -	return devm_of_platform_populate(dev);
> +	/* Needed by GPIO driver. */
> +	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> +				ARRAY_SIZE(pm8008_cells), NULL, 0,
> +				regmap_irq_get_domain(irq_data));
>  }
>  
>  static const struct of_device_id pm8008_match[] = {
> diff --git a/include/dt-bindings/mfd/qcom-pm8008.h b/include/dt-bindings/mfd/qcom-pm8008.h
> deleted file mode 100644
> index eca9448df228..000000000000
> --- a/include/dt-bindings/mfd/qcom-pm8008.h
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2021 The Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef __DT_BINDINGS_MFD_QCOM_PM8008_H
> -#define __DT_BINDINGS_MFD_QCOM_PM8008_H
> -
> -/* PM8008 IRQ numbers */
> -#define PM8008_IRQ_MISC_UVLO	0
> -#define PM8008_IRQ_MISC_OVLO	1
> -#define PM8008_IRQ_MISC_OTST2	2
> -#define PM8008_IRQ_MISC_OTST3	3
> -#define PM8008_IRQ_MISC_LDO_OCP	4
> -#define PM8008_IRQ_TEMP_ALARM	5
> -#define PM8008_IRQ_GPIO1	6
> -#define PM8008_IRQ_GPIO2	7
> -
> -#endif
> -- 
> 2.44.1
> 

-- 
Lee Jones [李琼斯]


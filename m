Return-Path: <linux-gpio+bounces-6253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6C8C03E1
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 19:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0D2B28A02E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 17:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9DB12BEB7;
	Wed,  8 May 2024 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xglaHf05"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788C12AAF9
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190993; cv=none; b=OuDbRmklLqvPKKCGCB6mRVhBeOHoNpLj3+5O1vIwuxX7ohSnlzyfcyjnwAYBari4n8xZbm5lZD4d2hVpoJETYuTq/cqCsbIdLe/9ig8uRLeeKbfoQU5DDXFHJQzBg5yi1mx7NITVyUzxiYU0BgYTjmXnq/pMHrOXrSzRp7a6Yko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190993; c=relaxed/simple;
	bh=szPgE3rebF1sy5v5yd23f4PLf0P3xWB8KnNzAqtAPjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiK7V73unEtVUv/pa68IvOmCudgW55SjSDSsAmgEeNKSO4wQXMpThMpErzVPnbRqxpDyJ0AFpvgZlbYKzeZWtVTuiV1qNgHoCSP2aVJS5VizDfwKU1bFnmagh2mgHzsbu/bLkO0VkVtX4Kym90tZ8Gb3YPgUUSVxUcu1Wr060vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xglaHf05; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e30c625178so418171fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715190990; x=1715795790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzBzRgFSdVH+nrPU1OUGiOgXRj7GxqH91mwBdStB+BA=;
        b=xglaHf05xowF77CprSFwwUIGXiQhxFU+8aOKMwK2cdilOk7WYcVZqwYKXDF4uFh39c
         rs0XkEU0HbiTOw0Vk3Mh2lWDIS0rfqVokj3lMIxZgpmLrZCdbvWkSs926c+J3IKOWROt
         m+fDIKKyKyC3KmHgTLqtlDK5vkIZo0Y60eiMPc8ipCgAn7nV+ICk1wIVzHb1BJizslbM
         cHgSgwQUmNo8wwnvrlF/TTY0CetMha52Iq6oUNoBwRIMC9UOs2OBkLmd5DqBs0ggdHH3
         kMoU18fnuNp7L1b8/GN0jABWxLlEPhY7jLa4cNo2ziOCx5eOb8I6mk3YC7CaPSTw7IFo
         Qesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715190990; x=1715795790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzBzRgFSdVH+nrPU1OUGiOgXRj7GxqH91mwBdStB+BA=;
        b=B/rEVB0BL4WvyIFFGu2Lk7b+7iRtGyJjqmmImirj3SPJdLJkWiDKNbKtBA5CGkXnGY
         2KwMY4lNEw7ETZzcK+OZ/UVcFEpoM096x8BrywmuiFfwcgjvqXb1/p7LXzE9doxq2hPu
         3BH55pol6VtFW861f8w03xd9jwb1g+nMRN5Je7I1kXDvum/zRvYGdrUTz0icZwPSjeom
         Bn7sSUFKyLpBV0D80N6TQ+wvJXDml6Uil1vhuC5OWbPX703WNS06+FhVVoEjsz0UbzZS
         52d+fXvwvH4HjCR4SAG7d60JZTzyJaG74JNlPjVhTqYIFgCnHYJeBT1v176jRgZKDbQ1
         s8hA==
X-Forwarded-Encrypted: i=1; AJvYcCUwyWKql1Lmf37zcJBxW17GIEzU3ntog7o+ltG6mItsUXS/zn4M5jI3xzUtE/Dmm3mwiNzu1iQ0DDfxuDkbYg8wmMViMN+hB18IxQ==
X-Gm-Message-State: AOJu0Yx2cENdyBf5IWFAm6WZVkHRHDZG12bhM8jJBvlIyONS+vP65CWm
	eEMrelIcL6IylgnmRbOxMxUEJ03uBiSajePcaLbPnTcX2/Zxp1tSDPcjyOuoiaQ=
X-Google-Smtp-Source: AGHT+IGNTtXzAx+uEFqVS4+rrXCid12VNtYBGtEcGsClfV93tEjIjQ51qt0rgpsLA6kPJK1trUqT/g==
X-Received: by 2002:a2e:8906:0:b0:2e3:4f79:4d25 with SMTP id 38308e7fff4ca-2e446d82bb0mr20739551fa.3.1715190989827;
        Wed, 08 May 2024 10:56:29 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a14-20020a05600c224e00b0041c012ca327sm3032031wmm.45.2024.05.08.10.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 10:56:29 -0700 (PDT)
Message-ID: <f838a43a-e7a1-427d-ade7-f0793474a634@linaro.org>
Date: Wed, 8 May 2024 18:56:28 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] mfd: pm8008: rework driver
To: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-12-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240506150830.23709-12-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2024 16:08, Johan Hovold wrote:
> Rework the pm8008 driver to match the new binding which no longer
> describes internal details like interrupts and register offsets
> (including which of the two consecutive I2C addresses the registers
> belong two).
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
> primary regmap is registered last so that it's returned by default when
> no name is provided in lookups.
> 
> Finally, note that the current QPNP GPIO and temperature alarm
> subdrivers need some minor rework before they can be used with non-SPMI
> devices like the PM8008. The MFD cell names therefore use a "qpnp"
> rather than "spmi" prefix to prevent binding until the drivers have been
> updated.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/mfd/Kconfig                   |  1 +
>   drivers/mfd/qcom-pm8008.c             | 95 +++++++++++++++++++++++----
>   include/dt-bindings/mfd/qcom-pm8008.h | 19 ------
>   3 files changed, 85 insertions(+), 30 deletions(-)
>   delete mode 100644 include/dt-bindings/mfd/qcom-pm8008.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 4b023ee229cf..bfcb68c62b07 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2208,6 +2208,7 @@ config MFD_ACER_A500_EC
>   config MFD_QCOM_PM8008
>   	tristate "QCOM PM8008 Power Management IC"
>   	depends on I2C && OF
> +	select MFD_CORE
>   	select REGMAP_I2C
>   	select REGMAP_IRQ
>   	help
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index c7a4f8a60cd4..706a725428dd 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -7,8 +7,10 @@
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
> +#include <linux/ioport.h>
>   #include <linux/irq.h>
>   #include <linux/irqdomain.h>
> +#include <linux/mfd/core.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
> @@ -16,8 +18,6 @@
>   #include <linux/regmap.h>
>   #include <linux/slab.h>
>   
> -#include <dt-bindings/mfd/qcom-pm8008.h>
> -
>   #define I2C_INTR_STATUS_BASE		0x0550
>   #define INT_RT_STS_OFFSET		0x10
>   #define INT_SET_TYPE_OFFSET		0x11
> @@ -45,6 +45,16 @@ enum {
>   #define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
>   #define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
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
>   enum {
>   	SET_TYPE_INDEX,
>   	POLARITY_HI_INDEX,
> @@ -150,21 +160,65 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
>   	.get_irq_reg		= pm8008_get_irq_reg,
>   };
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
>   	.reg_bits	= 16,
>   	.val_bits	= 8,
>   	.max_register	= 0xffff,
>   };
>   
> +static const struct resource pm8008_temp_res[] = {
> +	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
> +	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
> +};
> +
> +static const struct mfd_cell pm8008_cells[] = {
> +	MFD_CELL_NAME("qcom-pm8008-regulator"),
> +	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
> +	MFD_CELL_NAME("qpnp-gpio"),
> +};
> +
> +static void devm_irq_domain_fwnode_release(void *res)
> +{
> +	struct fwnode_handle *fwnode = res;
> +
> +	irq_domain_free_fwnode(fwnode);
> +}
> +
>   static int pm8008_probe(struct i2c_client *client)
>   {
>   	struct regmap_irq_chip_data *irq_data;
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap, *regmap2;
> +	struct fwnode_handle *fwnode;
> +	struct i2c_client *dummy;
>   	struct gpio_desc *reset;
> +	char *name;
>   	int rc;
> -	struct device *dev;
> -	struct regmap *regmap;
>   
> -	dev = &client->dev;
> +	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
> +	if (IS_ERR(dummy)) {
> +		rc = PTR_ERR(dummy);
> +		dev_err(&client->dev, "failed to claim second address: %d\n", rc);
> +		return rc;
> +	}
> +
> +	regmap2 = devm_regmap_init_i2c(dummy, &qcom_mfd_regmap_cfg);
> +	if (IS_ERR(regmap2))
> +		return PTR_ERR(regmap2);
> +
> +	rc = regmap_attach_dev(dev, regmap2, &pm8008_regmap_cfg_2);
> +	if (rc)
> +		return rc;
> +
> +	/* Default regmap must be attached last. */
>   	regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg);
>   	if (IS_ERR(regmap))
>   		return PTR_ERR(regmap);
> @@ -173,14 +227,33 @@ static int pm8008_probe(struct i2c_client *client)
>   	if (IS_ERR(reset))
>   		return PTR_ERR(reset);
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
> +	rc = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
> +	if (rc)
> +		return rc;
> +
> +	rc = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
>   				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> -		if (rc)
> -			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> +	if (rc) {
> +		dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> +		return rc;
>   	}
>   
> -	return devm_of_platform_populate(dev);
> +	/* Needed by GPIO driver. */
> +	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> +				ARRAY_SIZE(pm8008_cells), NULL, 0,
> +				regmap_irq_get_domain(irq_data));
>   }
>   
>   static const struct of_device_id pm8008_match[] = {
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

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


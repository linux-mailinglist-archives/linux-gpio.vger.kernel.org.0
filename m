Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 090A76225D3
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiKIIwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiKIIwQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:52:16 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9AB1CFE8
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:52:14 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id s24so24703557ljs.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46OCH59w3LqN3DFnsBqHvYNV0xn8XCE9P307ZDZk3AA=;
        b=bOaHLlQzCqgpoDKIfAdOcPxyMphds2gW/+oEmQWmBaJ/oY0Bo1T9UeLWt2Wfr1fnbR
         apcZlaVOeC0ltdwp+RcGkjrSQ8AYPEHsKA/bKYq3h21kLm3CEJEavx+9H/LxQCdXoJdQ
         pWS5vnaWB/oYp3GcgMYgx1WVRUe6auS5DOn8GthKriRrCAArJshSf4K8GYs6kHWQVmeH
         XhNaaQwYRSj7F/a4W9srQXIyqk8K25mNTqZgDAC4G1JU/Ku/5XeYeG2aHe9pxPUrKYkP
         8S8k6iIIVUAuEuwBTnd4EkTgx9QP9aaYv7BV76kPfpec2SaELovmoVWnj7b2v7n7Mhds
         C6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46OCH59w3LqN3DFnsBqHvYNV0xn8XCE9P307ZDZk3AA=;
        b=VwpP2tUlkT3RlA2i9phTNiBqJkLWsvRZlJujPhlt4vnN/LEcJtXxkdbmOtP5wHkHBY
         CaRim5BpRgrDWHanA4nJBRvd50CDx+HalNMASsB6Ut2gSxsJL5uqPxJTBiDfUBs0MC+5
         ea2CqYm2Cn99Z5hyoKbloV+fExfuNgxiSXGhprenKuOJSVP1EBSeu9Z8r9Fo1DiAgGe/
         KujjprjlcpAUUvpt5X/wCrNes39AmEANl9wMdCI1fNJjMNQom6DaCR8/kIM+IZgALy8o
         4adsei88/hleW0LaWIVQOqqsFMl81CcEOF6l0A/qXJAXCGl2Cd54I5R8PVV+hb+Kf5eE
         NcCA==
X-Gm-Message-State: ANoB5pmCATAa7B+5rTZLwlNOHKIAV+YPuFQGFd+su2vRu41g5B8g3aHB
        VLRNEulNB7d8gx+XXnNdm9EHNg==
X-Google-Smtp-Source: AA0mqf4PijX6S+EWsWi7KC+JIidbUh1ZOg831La7EQ62sybOOoU91PYCjv+jKar1i9GEc6DOyGmVTA==
X-Received: by 2002:a2e:9e41:0:b0:277:155c:f510 with SMTP id g1-20020a2e9e41000000b00277155cf510mr2456552ljk.17.1667983932706;
        Wed, 09 Nov 2022 00:52:12 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id t8-20020ac25488000000b004b0b131453csm2132827lfk.49.2022.11.09.00.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:52:12 -0800 (PST)
Message-ID: <c67ab598-c571-79fa-0f71-034332e9ffff@linaro.org>
Date:   Wed, 9 Nov 2022 09:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/7] MFD: TPS6594x: Add new PMIC device driver for
 TPS6594x chips
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, brgl@bgdev.pl, lee@kernel.org,
        linus.walleij@linaro.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, vigneshr@ti.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-3-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109065546.24912-3-mranostay@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2022 07:55, Matt Ranostay wrote:
> From: Keerthy <j-keerthy@ti.com>
> 

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> The TPS6594x chip is a PMIC, and contains the following components:
> 
> - GPIO controller
> - RTC
> 
> However initially only RTC is supported.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  drivers/mfd/Kconfig          |  14 ++++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/tps6594x.c       | 120 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/tps6594x.h |  84 ++++++++++++++++++++++++
>  4 files changed, 219 insertions(+)
>  create mode 100644 drivers/mfd/tps6594x.c
>  create mode 100644 include/linux/mfd/tps6594x.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6e920442366c..9a6dc6b69058 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1596,6 +1596,20 @@ config MFD_TI_LP873X
>  	  This driver can also be built as a module. If so, the module
>  	  will be called lp873x.
>  
> +config MFD_TPS6594X
> +	tristate "TI TPS6594X Power Management IC"
> +	depends on I2C && OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here then you get support for the TPS6594X series of
> +	  Power Management Integrated Circuits (PMIC).
> +	  These include voltage regulators, RTS, configurable
> +	  General Purpose Outputs (GPO) that are used in portable devices.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called tps6594x.
> +
>  config MFD_TI_LP87565
>  	tristate "TI LP87565 Power Management IC"
>  	depends on I2C && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 4dd479212b3a..51d7bfcd0a27 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
>  obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
>  obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
>  obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
> +obj-$(CONFIG_MFD_TPS6594X)	+= tps6594x.o
>  obj-$(CONFIG_MENELAUS)		+= menelaus.o
>  
>  obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
> diff --git a/drivers/mfd/tps6594x.c b/drivers/mfd/tps6594x.c
> new file mode 100644
> index 000000000000..0de7946b6b8b
> --- /dev/null
> +++ b/drivers/mfd/tps6594x.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for tps6594x PMIC chips
> + *
> + * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
> + * Author: Keerthy <j-keerthy@ti.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/tps6594x.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +static const struct regmap_config tps6594x_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = TPS6594X_REG_MAX,
> +};
> +
> +static const struct mfd_cell tps6594x_cells[] = {
> +	{ .name = "tps6594x-gpio" },
> +	{ .name = "tps6594x-rtc" },

You have compatibles for children, so use them.

> +};
> +
> +static struct tps6594x *tps;
> +
> +static void tps6594x_power_off(void)
> +{
> +	regmap_write(tps->regmap, TPS6594X_FSM_NSLEEP_TRIGGERS,
> +		TPS6594X_FSM_NSLEEP_NSLEEP1B | TPS6594X_FSM_NSLEEP_NSLEEP2B);
> +
> +	regmap_write(tps->regmap, TPS6594X_INT_STARTUP,
> +		TPS6594X_INT_STARTUP_NPWRON_START_INT |
> +		TPS6594X_INT_STARTUP_ENABLE_INT | TPS6594X_INT_STARTUP_RTC_INT |
> +		TPS6594X_INT_STARTUP_SOFT_REBOOT_INT);
> +
> +	regmap_write(tps->regmap, TPS6594X_INT_MISC,
> +		TPS6594X_INT_MISC_BIST_PASS_INT |
> +		TPS6594X_INT_MISC_EXT_CLK_INT | TPS6594X_INT_MISC_TWARN_INT);
> +
> +	regmap_write(tps->regmap, TPS6594X_CONFIG_1,
> +		TPS6594X_CONFIG_NSLEEP1_MASK | TPS6594X_CONFIG_NSLEEP2_MASK);
> +
> +	regmap_write(tps->regmap, TPS6594X_FSM_I2C_TRIGGERS,
> +		TPS6594X_FSM_I2C_TRIGGERS_I2C0);
> +}
> +
> +static int tps6594x_probe(struct i2c_client *client)
> +{
> +	struct tps6594x *ddata;
> +	struct device_node *node = client->dev.of_node;
> +	unsigned int otpid;
> +	int ret;
> +
> +	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->dev = &client->dev;
> +
> +	ddata->regmap = devm_regmap_init_i2c(client, &tps6594x_regmap_config);
> +	if (IS_ERR(ddata->regmap)) {
> +		ret = PTR_ERR(ddata->regmap);
> +		dev_err(ddata->dev,
> +			"Failed to initialize register map: %d\n", ret);
> +		return ret;

return dev_err_probe

> +	}
> +
> +	ret = regmap_read(ddata->regmap, TPS6594X_REG_DEV_REV, &otpid);
> +	if (ret) {
> +		dev_err(ddata->dev, "Failed to read OTP ID\n");
> +		return ret;

return dev_err_probe

> +	}
> +
> +	ddata->rev = otpid;
> +	i2c_set_clientdata(client, ddata);
> +
> +	ret = mfd_add_devices(ddata->dev, PLATFORM_DEVID_AUTO, tps6594x_cells,
> +			      ARRAY_SIZE(tps6594x_cells), NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(ddata->dev, "Failed to register cells\n");
> +		return ret;

return dev_err_probe

> +	}
> +
> +	tps = ddata;
> +
> +	if (of_property_read_bool(node, "ti,system-power-controller"))
> +		pm_power_off = tps6594x_power_off;
> +
> +	return 0;
> +}

Best regards,
Krzysztof


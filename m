Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3335965DAEF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jan 2023 18:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239765AbjADRGY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Jan 2023 12:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235015AbjADRGX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2023 12:06:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCBB17586;
        Wed,  4 Jan 2023 09:06:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B647E617BC;
        Wed,  4 Jan 2023 17:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0442C433EF;
        Wed,  4 Jan 2023 17:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672851977;
        bh=fFt9Bo5bwlxUAVeGW6kc+cnqkJyfuEF21ebvngbJHUg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYyvjXk9Ktjw8FPQ+hLhjlb/MkeKrAQWmK8U2Rk6GJijoenCNILLrsAsQrmG/4oUG
         /u9BdnQIkbyS6IiwIlCrkj1L0xOr7K2g8GltW7HQ5QJSYCwZPG7KH5TtLT3+MMHuV0
         TPmKsxJcN3j7rdV5l/TpqTXPL5sc7M2fba0s/JacWMQjpUNcI3PFTMXfKBR6zq07jh
         Ectw+tnYYmoXALB1uXFW/Xcm1ZdDnaVGqXNqcEuKNQ73MKoY2UEldYCYEkv+uM81rg
         OLkrqaY9yYBqYjs3YIX7clclsMjiWRNa607N78tqfDz80Tt+oBx20G20OlZGJ3mIqe
         FvLF0FKnIdBzA==
Date:   Wed, 4 Jan 2023 17:06:08 +0000
From:   Lee Jones <lee@kernel.org>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     michael@walle.cc, vigneshr@ti.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, a.zummo@towertech.it,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v5 2/4] mfd: tps6594: Add support for TPS6594 PMIC devices
Message-ID: <Y7WyAIzI62o6vNhF@google.com>
References: <20221123053512.1195309-1-mranostay@ti.com>
 <20221123053512.1195309-3-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123053512.1195309-3-mranostay@ti.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 22 Nov 2022, Matt Ranostay wrote:

> From: Keerthy <j-keerthy@ti.com>
> 
> The TPS6594 chip is a PMIC, and contains the following components:
> 
> - GPIO controller
> - RTC
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  drivers/mfd/Kconfig         |  14 +++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/tps6594.c       | 113 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/tps6594.h |  84 +++++++++++++++++++++++++++
>  4 files changed, 212 insertions(+)
>  create mode 100644 drivers/mfd/tps6594.c
>  create mode 100644 include/linux/mfd/tps6594.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6653d03e0fe3..c54f2959a200 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1596,6 +1596,20 @@ config MFD_TI_LP873X
>  	  This driver can also be built as a module. If so, the module
>  	  will be called lp873x.
>  
> +config MFD_TPS6594
> +	tristate "TI TPS6594 Power Management IC"
> +	depends on I2C && OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here then you get support for the TPS6594 series of
> +	  Power Management Integrated Circuits (PMIC).
> +	  These include voltage regulators, RTS, configurable
> +	  General Purpose Outputs (GPO) that are used in portable devices.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called tps6594.
> +
>  config MFD_TI_LP87565
>  	tristate "TI LP87565 Power Management IC"
>  	depends on I2C && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 4dd479212b3a..b4fdfcc57831 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
>  obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
>  obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
>  obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
> +obj-$(CONFIG_MFD_TPS6594)	+= tps6594.o
>  obj-$(CONFIG_MENELAUS)		+= menelaus.o
>  
>  obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
> diff --git a/drivers/mfd/tps6594.c b/drivers/mfd/tps6594.c
> new file mode 100644
> index 000000000000..a7f80833e8fc
> --- /dev/null
> +++ b/drivers/mfd/tps6594.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for TPS6594 PMIC chips
> + *
> + * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
> + * Author: Keerthy <j-keerthy@ti.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/tps6594.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>

Nit: Alphabetical.

> +static const struct regmap_config tps6594_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = TPS6594_REG_MAX,
> +};
> +
> +static const struct mfd_cell tps6594_cells[] = {
> +	{ .name = "tps6594-gpio" },
> +	{ .name = "tps6594-rtc" },
> +};
> +
> +static struct tps6594 *tps;
> +
> +static void tps6594_power_off(void)
> +{
> +	regmap_write(tps->regmap, TPS6594_FSM_NSLEEP_TRIGGERS,
> +		TPS6594_FSM_NSLEEP_NSLEEP1B | TPS6594_FSM_NSLEEP_NSLEEP2B);

Any chance we can align against the open parentheses?

> +	regmap_write(tps->regmap, TPS6594_INT_STARTUP,
> +		TPS6594_INT_STARTUP_NPWRON_START_INT |
> +		TPS6594_INT_STARTUP_ENABLE_INT | TPS6594_INT_STARTUP_RTC_INT |
> +		TPS6594_INT_STARTUP_SOFT_REBOOT_INT);
> +
> +	regmap_write(tps->regmap, TPS6594_INT_MISC,
> +		TPS6594_INT_MISC_BIST_PASS_INT |
> +		TPS6594_INT_MISC_EXT_CLK_INT | TPS6594_INT_MISC_TWARN_INT);
> +
> +	regmap_write(tps->regmap, TPS6594_CONFIG_1,
> +		TPS6594_CONFIG_NSLEEP1_MASK | TPS6594_CONFIG_NSLEEP2_MASK);
> +
> +	regmap_write(tps->regmap, TPS6594_FSM_I2C_TRIGGERS,
> +		TPS6594_FSM_I2C_TRIGGERS_I2C0);
> +}
> +
> +static int tps6594_probe(struct i2c_client *client)
> +{
> +	struct tps6594 *ddata;
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
> +	ddata->regmap = devm_regmap_init_i2c(client, &tps6594_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(ddata->dev, PTR_ERR(ddata->regmap),
> +			"Failed to initialize register map\n");
> +
> +	ret = regmap_read(ddata->regmap, TPS6594_REG_DEV_REV, &otpid);
> +	if (ret)
> +		return dev_err_probe(ddata->dev, ret, "Failed to read OTP ID\n");
> +
> +	ddata->rev = otpid;
> +	i2c_set_clientdata(client, ddata);
> +
> +	ret = mfd_add_devices(ddata->dev, PLATFORM_DEVID_AUTO, tps6594_cells,
> +			      ARRAY_SIZE(tps6594_cells), NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(ddata->dev, ret, "Failed to register cells\n");
> +
> +	tps = ddata;

This should be in the if() statement below, no?

> +	if (of_property_read_bool(node, "ti,system-power-controller"))
> +		pm_power_off = tps6594_power_off;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id of_tps6594_match_table[] = {
> +	{ .compatible = "ti,tps6594", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, of_tps6594_match_table);
> +
> +static const struct i2c_device_id tps6594_id_table[] = {
> +	{ "tps6594", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tps6594_id_table);

If you're using .probe_new() you can omit this table.

> +static struct i2c_driver tps6594_driver = {
> +	.driver	= {
> +		.name	= "tps6594",
> +		.of_match_table = of_tps6594_match_table,
> +	},
> +	.probe_new	= tps6594_probe,
> +	.id_table	= tps6594_id_table,
> +};
> +module_i2c_driver(tps6594_driver);
> +
> +MODULE_AUTHOR("J Keerthy <j-keerthy@ti.com>");
> +MODULE_DESCRIPTION("TPS6594 PMIC device driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
> new file mode 100644
> index 000000000000..f721ec9880dd
> --- /dev/null
> +++ b/include/linux/mfd/tps6594.h
> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Core driver interface for TI TPS6594 PMIC family
> + *
> + * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +#ifndef __MFD_TPS6594_H
> +#define __MFD_TPS6594_H
> +
> +#include <linux/bits.h>
> +
> +/* TPS6594 chip ID list */
> +#define TPS6594			0x00
> +
> +/* All register addresses */
> +#define TPS6594_REG_DEV_REV			0x01
> +#define TPS6594_INT_STARTUP			0x65
> +#define TPS6594_INT_MISC			0x66
> +#define TPS6594_CONFIG_1			0x7d
> +#define TPS6594_FSM_I2C_TRIGGERS		0x85
> +#define TPS6594_FSM_NSLEEP_TRIGGERS		0x86
> +
> +#define TPS6594_RTC_SECONDS			0xb5
> +#define TPS6594_RTC_MINUTES			0xb6
> +#define TPS6594_RTC_HOURS			0xb7
> +#define TPS6594_RTC_DAYS			0xb8
> +#define TPS6594_RTC_MONTHS			0xb9
> +#define TPS6594_RTC_YEARS			0xba
> +#define TPS6594_RTC_WEEKS			0xbb
> +#define TPS6594_ALARM_SECONDS			0xbc
> +#define TPS6594_ALARM_MINUTES			0xbd
> +#define TPS6594_ALARM_HOURS			0xbe
> +#define TPS6594_ALARM_DAYS			0xbf
> +#define TPS6594_ALARM_MONTHS			0xc0
> +#define TPS6594_ALARM_YEARS			0xc1
> +#define TPS6594_RTC_CTRL_1			0xc2
> +#define TPS6594_RTC_CTRL_2			0xc3
> +#define TPS6594_RTC_STATUS			0xc4
> +#define TPS6594_RTC_INTERRUPTS			0xc5
> +#define TPS6594_REG_MAX			0xd0
> +
> +/* Register field definitions */
> +#define TPS6594_DEV_REV_DEV_ID			0xff
> +
> +#define TPS6594_INT_STARTUP_NPWRON_START_INT	BIT(0)
> +#define TPS6594_INT_STARTUP_ENABLE_INT		BIT(1)
> +#define TPS6594_INT_STARTUP_RTC_INT		BIT(2)
> +#define TPS6594_INT_STARTUP_FSD_INT		BIT(4)
> +#define TPS6594_INT_STARTUP_SOFT_REBOOT_INT	BIT(5)
> +
> +#define TPS6594_INT_MISC_BIST_PASS_INT		BIT(0)
> +#define TPS6594_INT_MISC_EXT_CLK_INT		BIT(1)
> +#define TPS6594_INT_MISC_TWARN_INT		BIT(3)
> +
> +#define TPS6594_CONFIG_NSLEEP1_MASK		BIT(6)
> +#define TPS6594_CONFIG_NSLEEP2_MASK		BIT(7)
> +
> +#define TPS6594_FSM_I2C_TRIGGERS_I2C0		BIT(0)
> +
> +#define TPS6594_FSM_NSLEEP_NSLEEP1B		BIT(0)
> +#define TPS6594_FSM_NSLEEP_NSLEEP2B		BIT(1)
> +
> +#define TPS6594_RTC_CTRL_REG_GET_TIME		BIT(6)
> +#define TPS6594_RTC_CTRL_REG_STOP_RTC		BIT(0)
> +#define TPS6594_RTC_INTERRUPTS_REG_IT_ALARM	BIT(3)
> +
> +#define TPS6594_RTC_STATUS_RUN			BIT(1)
> +
> +/**
> + * struct tps6594 - state holder for the tps6594 driver
> + * @dev: struct device pointer for MFD device
> + * @rev: revision of the tps6594
> + * @lock: lock guarding the data structure
> + * @regmap: register map of the tps6594 PMIC
> + *
> + * Device data may be used to access the TPS6594 chip
> + */

This will not pass a W=1 build - please fix.

> +struct tps6594 {
> +	struct device *dev;
> +	u8 rev;
> +	struct regmap *regmap;
> +};
> +#endif /* __MFD_TPS6594_H */
> -- 
> 2.38.GIT
> 

-- 
Lee Jones [李琼斯]

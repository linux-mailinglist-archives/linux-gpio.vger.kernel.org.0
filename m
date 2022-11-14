Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE6B7628AC0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 21:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237693AbiKNUsZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 15:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbiKNUsN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 15:48:13 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A666713F7F;
        Mon, 14 Nov 2022 12:48:07 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 547BC60007;
        Mon, 14 Nov 2022 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668458886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=owj7jV2GY0bbRrGgiyqXUxSTQ0wmVf4/LAIwgp1eqF8=;
        b=fPjiK1A++szrwZEnjkTBXzH/jFiLZT76xYokAFU+URbgHTO6BNe+gXvmvPIVS5p4Lirnn8
        O1tmoUXPl8NXoSrDw887X2foBeCr7HZcCQHekIYGUSNI/eD9X1R1jWLRPtajylOIzYzKyu
        XE3gefsBty0Oz+3HsnvqrIp+AC5rLDcEfQNCrF/8O6PoV/SAsAB1Op54QV/W6vbQC79sjC
        AC6svzkXuTSL8oEAMJBeEQXn7UYq2AFZzHp/tR17mzZ1r71prmAYsNupnE6YByUQFtTWxf
        AZ1fxduvDDqotNv2gANhfhWVgmudjEn6AquhqAU7fGtMoGptMDvJEDhUMO5thg==
Date:   Mon, 14 Nov 2022 21:48:04 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     brgl@bgdev.pl, lee@kernel.org, linus.walleij@linaro.org,
        kristo@kernel.org, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
        vigneshr@ti.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v3 3/7] rtc: rtc-tps6594x: Add support for TPS6594X PMIC
 RTC
Message-ID: <Y3KphJB4ux7zfW/M@mail.local>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-4-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109065546.24912-4-mranostay@ti.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On 08/11/2022 22:55:42-0800, Matt Ranostay wrote:
> diff --git a/drivers/rtc/rtc-tps6594x.c b/drivers/rtc/rtc-tps6594x.c
> new file mode 100644
> index 000000000000..e9f904d0a769
> --- /dev/null
> +++ b/drivers/rtc/rtc-tps6594x.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rtc-tps6594x.c -- TPS6594x Real Time Clock driver.
> + *
> + * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com
> + *
> + * TODO: alarm support

Is this TODO actually useful? :)

> +static int tps6594x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	unsigned char rtc_data[TPS6594X_NUM_TIME_REGS];
> +	struct tps6594x *tps6594x = dev_get_drvdata(dev->parent);
> +	int ret;
> +
> +	/* Reset TPS6594X_RTC_CTRL_REG_GET_TIME bit to zero, required for latch */
> +	ret = regmap_update_bits(tps6594x->regmap, TPS6594X_RTC_CTRL_1,
> +		TPS6594X_RTC_CTRL_REG_GET_TIME, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "RTC CTRL reg update failed, err: %d\n", ret);

I would avoid these messages that are not actually actionable.

> +		return ret;
> +	}
> +
> +	/* Copy RTC counting registers to static registers or latches */
> +	ret = regmap_update_bits(tps6594x->regmap, TPS6594X_RTC_CTRL_1,
> +		TPS6594X_RTC_CTRL_REG_GET_TIME, TPS6594X_RTC_CTRL_REG_GET_TIME);
> +	if (ret < 0) {
> +		dev_err(dev, "RTC CTRL reg update failed, err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_bulk_read(tps6594x->regmap, TPS6594X_RTC_SECONDS,
> +			rtc_data, TPS6594X_NUM_TIME_REGS);
> +	if (ret < 0) {
> +		dev_err(dev, "RTC_SECONDS reg read failed, err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	tm->tm_sec = bcd2bin(rtc_data[0]);
> +	tm->tm_min = bcd2bin(rtc_data[1]);
> +	tm->tm_hour = bcd2bin(rtc_data[2]);
> +	tm->tm_mday = bcd2bin(rtc_data[3]);
> +	tm->tm_mon = bcd2bin(rtc_data[4]) - 1;
> +	tm->tm_year = bcd2bin(rtc_data[5]) + 100;
> +
> +	return ret;
> +}
> +
> +static int tps6594x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	unsigned char rtc_data[TPS6594X_NUM_TIME_REGS];
> +	struct tps6594x *tps6594x = dev_get_drvdata(dev->parent);
> +	int ret, retries = 5;
> +	unsigned int val;
> +
> +	rtc_data[0] = bin2bcd(tm->tm_sec);
> +	rtc_data[1] = bin2bcd(tm->tm_min);
> +	rtc_data[2] = bin2bcd(tm->tm_hour);
> +	rtc_data[3] = bin2bcd(tm->tm_mday);
> +	rtc_data[4] = bin2bcd(tm->tm_mon + 1);
> +	rtc_data[5] = bin2bcd(tm->tm_year - 100);
> +
> +	/* Stop RTC while updating the RTC time registers */
> +	ret = regmap_update_bits(tps6594x->regmap, TPS6594X_RTC_CTRL_1,
> +				 TPS6594X_RTC_CTRL_REG_STOP_RTC, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "RTC stop failed, err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Waiting till RTC isn't running */
> +	do {
> +		ret = regmap_read(tps6594x->regmap, TPS6594X_RTC_STATUS, &val);
> +		if (ret < 0) {
> +			dev_err(dev, "RTC_STATUS reg read failed, err = %d\n", ret);
> +			return ret;
> +		}
> +		msleep(20);
> +	} while (--retries && (val & TPS6594X_RTC_STATUS_RUN));

Maybe you should go for regmap_read_poll_timeout.

> +
> +	if (!retries) {
> +		dev_err(dev, "RTC_STATUS is still RUNNING\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = regmap_bulk_write(tps6594x->regmap, TPS6594X_RTC_SECONDS,
> +		rtc_data, TPS6594X_NUM_TIME_REGS);
> +	if (ret < 0) {
> +		dev_err(dev, "RTC_SECONDS reg write failed, err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Start back RTC */
> +	ret = regmap_update_bits(tps6594x->regmap, TPS6594X_RTC_CTRL_1,
> +				 TPS6594X_RTC_CTRL_REG_STOP_RTC,
> +				 TPS6594X_RTC_CTRL_REG_STOP_RTC);
> +	if (ret < 0)
> +		dev_err(dev, "RTC start failed, err = %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct rtc_class_ops tps6594x_rtc_ops = {
> +	.read_time	= tps6594x_rtc_read_time,
> +	.set_time	= tps6594x_rtc_set_time,
> +};
> +
> +static int tps6594x_rtc_probe(struct platform_device *pdev)
> +{
> +	struct tps6594x *tps6594x = dev_get_drvdata(pdev->dev.parent);
> +	struct tps6594x_rtc *tps6594x_rtc = NULL;
> +	int ret;
> +
> +	tps6594x_rtc = devm_kzalloc(&pdev->dev, sizeof(struct tps6594x_rtc), GFP_KERNEL);
> +	if (!tps6594x_rtc)
> +		return -ENOMEM;
> +
> +	tps6594x_rtc->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, tps6594x_rtc);
> +
> +	/* Start RTC */
> +	ret = regmap_update_bits(tps6594x->regmap, TPS6594X_RTC_CTRL_1,
> +				 TPS6594X_RTC_CTRL_REG_STOP_RTC,
> +				 TPS6594X_RTC_CTRL_REG_STOP_RTC);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "RTC_CTRL write failed, err = %d\n", ret);
> +		return ret;
> +	}

It doesn't make sense to start the RTC in probe as it is probably
already started and time is kept properly or it is not started and then
you can use this information in tps6594x_rtc_read_time as you know the
time is not correct.
I'd rather ensure it is started in tps6594x_rtc_set_time.

> +
> +	tps6594x_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,

This is deprecated, please use devm_rtc_allocate_device() and
devm_rtc_register_device(). You also need to set the range properly.

> +				&tps6594x_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(tps6594x_rtc->rtc)) {
> +		ret = PTR_ERR(tps6594x_rtc->rtc);
> +		dev_err(&pdev->dev, "RTC register failed, err = %d\n", ret);

This message is useless as the core aloready pronts an error on
registration failure.

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_tps6594x_rtc_match[] = {
> +	{ .compatible = "ti,tps6594x-rtc", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_tps6594x_rtc_match);
> +#endif
> +
> +static struct platform_driver tps6594x_rtc_driver = {
> +	.probe		= tps6594x_rtc_probe,
> +	.driver		= {
> +		.name	= "tps6594x-rtc",
> +		.of_match_table = of_match_ptr(of_tps6594x_rtc_match),
> +	},
> +};
> +
> +module_platform_driver(tps6594x_rtc_driver);
> +
> +MODULE_ALIAS("platform:tps6594x_rtc");
> +MODULE_DESCRIPTION("TI TPS6594x series RTC driver");
> +MODULE_AUTHOR("Keerthy J <j-keerthy@ti.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.38.GIT
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

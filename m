Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8C2D649613
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Dec 2022 21:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiLKUFw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Dec 2022 15:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiLKUFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Dec 2022 15:05:51 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C45BC1B;
        Sun, 11 Dec 2022 12:05:49 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 842B9E0004;
        Sun, 11 Dec 2022 20:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670789147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aygsMx4TJ8Ez/Ymyikd1YHSRsA4Prw0/zWD81Atj3Ho=;
        b=cse1r3p5N8JCAGiY00vN1Z2u1JxHXwTaW4MfC3L04Zky1CVDPvXJkU1hXnZieZjv+vxLE7
        2UoyrEvSYi4nl6OWbm6sGCnj9PV0KJgM9FOkcMt+ER4yH8hgoFwZINT3vZ6yuDGlF8KCyc
        P/D48Z+T670BnAefUy94JZaw5O8H4HVNMvVJl4FLWH0xB2VytPFTKNXVyKgqwAXrjuCdTX
        gfhYIx27mkuHrPeqHgG1J1+nPzqnPJ9py/+DatWQea38cBAbSmaIAae071GfKwbsX1tWmH
        0Uqy/BB+cVqqsBcbD+/zJw6RJ3XIvFqgxCubW3y8yv5I1ZdeNiAhxl/MuesPIA==
Date:   Sun, 11 Dec 2022 21:05:46 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     michael@walle.cc, vigneshr@ti.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, a.zummo@towertech.it,
        linus.walleij@linaro.org, lee@kernel.org, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v5 3/4] rtc: rtc-tps6594: Add support for TPS6594 PMIC RTC
Message-ID: <Y5Y4GlHc0aI6GG2g@mail.local>
References: <20221123053512.1195309-1-mranostay@ti.com>
 <20221123053512.1195309-4-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123053512.1195309-4-mranostay@ti.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On 22/11/2022 21:35:11-0800, Matt Ranostay wrote:
> +static int tps6594_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	unsigned char rtc_data[TPS6594_NUM_TIME_REGS];
> +	struct tps6594 *tps6594 = dev_get_drvdata(dev->parent);
> +	unsigned int val;
> +	int ret;
> +
> +	rtc_data[0] = bin2bcd(tm->tm_sec);
> +	rtc_data[1] = bin2bcd(tm->tm_min);
> +	rtc_data[2] = bin2bcd(tm->tm_hour);
> +	rtc_data[3] = bin2bcd(tm->tm_mday);
> +	rtc_data[4] = bin2bcd(tm->tm_mon + 1);
> +	rtc_data[5] = bin2bcd(tm->tm_year - 100);
> +
> +	/* Stop RTC while updating the RTC time registers */
> +	ret = regmap_update_bits(tps6594->regmap, TPS6594_RTC_CTRL_1,
> +				 TPS6594_RTC_CTRL_REG_STOP_RTC, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "RTC stop failed, err = %d\n", ret);

This function is way too verbose. There is no other action for the user
than retrying to set the time. You should probably remove all the
dev_err calls.

> +		return ret;
> +	}
> +
> +	/* Waiting till RTC isn't running */
> +	ret = regmap_read_poll_timeout(tps6594->regmap, TPS6594_RTC_STATUS,
> +				       val, !(val & TPS6594_RTC_STATUS_RUN),
> +				       TPS6594_RTC_POLL, TPS6594_RTC_TIMEOUT);
> +	if (ret) {
> +		dev_err(dev, "RTC_STATUS is still RUNNING\n");
> +		return ret;
> +	}
> +
> +	ret = regmap_bulk_write(tps6594->regmap, TPS6594_RTC_SECONDS,
> +		rtc_data, TPS6594_NUM_TIME_REGS);
> +	if (ret < 0) {
> +		dev_err(dev, "RTC_SECONDS reg write failed, err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Start back RTC */
> +	ret = regmap_update_bits(tps6594->regmap, TPS6594_RTC_CTRL_1,
> +				 TPS6594_RTC_CTRL_REG_STOP_RTC,
> +				 TPS6594_RTC_CTRL_REG_STOP_RTC);
> +	if (ret < 0)
> +		dev_err(dev, "RTC start failed, err = %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct rtc_class_ops tps6594_rtc_ops = {
> +	.read_time	= tps6594_rtc_read_time,
> +	.set_time	= tps6594_rtc_set_time,
> +};
> +
> +static int tps6594_rtc_probe(struct platform_device *pdev)
> +{
> +	struct tps6594_rtc *tps6594_rtc;
> +
> +	tps6594_rtc = devm_kzalloc(&pdev->dev, sizeof(*tps6594_rtc), GFP_KERNEL);
> +	if (!tps6594_rtc)
> +		return -ENOMEM;
> +
> +	tps6594_rtc->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, tps6594_rtc);
> +
> +	tps6594_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(tps6594_rtc->rtc))
> +		return PTR_ERR(tps6594_rtc->rtc);
> +
> +	tps6594_rtc->rtc->ops = &tps6594_rtc_ops;
> +
> +	return devm_rtc_register_device(tps6594_rtc->rtc);
> +}
> +
> +static const struct of_device_id of_tps6594_rtc_match[] = {
> +	{ .compatible = "ti,tps6594-rtc", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_tps6594_rtc_match);
> +
> +static struct platform_driver tps6594_rtc_driver = {
> +	.probe		= tps6594_rtc_probe,
> +	.driver		= {
> +		.name	= "tps6594-rtc",
> +		.of_match_table = of_tps6594_rtc_match,
> +	},
> +};
> +
> +module_platform_driver(tps6594_rtc_driver);
> +
> +MODULE_ALIAS("platform:tps6594-rtc");
> +MODULE_DESCRIPTION("TI TPS6594 series RTC driver");
> +MODULE_AUTHOR("Keerthy J <j-keerthy@ti.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.38.GIT
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

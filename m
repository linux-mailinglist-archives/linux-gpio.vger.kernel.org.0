Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946586225C9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiKIItY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiKIItW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:49:22 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA00167D6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:49:21 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id a15so24693860ljb.7
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vBkkfZQWcT2BPYsBX069quROkBYsnlhEC9tn5FlJtY=;
        b=ozMeYcbthVydFqMEaUf3m/kOWrFanjiFpobFaL089YHMZlW2jxw4BLT9lWYY3y1Bqs
         Sl9ZCkgKygyOnYUxVIeUanR05mhyScLLevs48wNpCdDUfnfyhg72PRuD+pwavp73dSYe
         QdocdUAfHPUFAgDjebTvxlVkr1zXRSJOUc1iv2F3XeZNcySNZr+PD5kuzrkNXcUr6OUT
         nvFeYjYmMZUOY91cXf5YlAUYnN01MYBiQvr+twguS1/19xhBK1ecZuBDf1w95Jk8Slw8
         LCPsKgfJdnUjSRXIcuXv000fCd2FuOjOFaetftqSrJZTNNdRNVulqWGYt3kNDwmqIrjZ
         TVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vBkkfZQWcT2BPYsBX069quROkBYsnlhEC9tn5FlJtY=;
        b=Xr28WcWtWf3lwWh2KK0C4IE2mJiRnXRIQYdqlRhf8kHq8VNMr7/ayfmYP0QgPLbzAg
         W1ws87fWL1ysXEu+C/GAfSZKIZw3zTWwy+djoUZKBfeytOgXmMmDzu7deGNONOjgpKbG
         8pNosmLC5HyzSH5NB0wJeK/aWV4q4jBCofxvCAmMmTB2r2ea2vStA1lw9NJKJiA19XAu
         gCbdz6cEGvngF/rJf102YRcQct6xPKKd6pGkkMvGIID+5MlyHjoH2rzpWw+vf76OnI8/
         97W9J0SpdIr6bJuEatlxiVQa1YVS0YnnskbGCLphrnrH4PyOMksCKSezCSDWXrOr8Rrt
         uVcw==
X-Gm-Message-State: ACrzQf3RGqPClkkGvRfb+tVr6AoFmrCvy7My1DYISmXDU67K3JyMe54i
        hm6hXHZlfT9TTzWqiVIOyG4WJA==
X-Google-Smtp-Source: AMsMyM4QTrn7WKvNp/FF7kJKkIOQR2e9NmHjjrrZaLB2cpuG6r0mVHyT23yAuPI4kNeJb/4SbsAOxw==
X-Received: by 2002:a05:651c:12c2:b0:26c:13b9:a694 with SMTP id 2-20020a05651c12c200b0026c13b9a694mr21557955lje.79.1667983759758;
        Wed, 09 Nov 2022 00:49:19 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id k4-20020ac257c4000000b004b1793520a0sm2129255lfo.36.2022.11.09.00.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:49:19 -0800 (PST)
Message-ID: <0bf46e8b-334d-7a50-ff6f-ef336d6d1a51@linaro.org>
Date:   Wed, 9 Nov 2022 09:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/7] rtc: rtc-tps6594x: Add support for TPS6594X PMIC
 RTC
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, brgl@bgdev.pl, lee@kernel.org,
        linus.walleij@linaro.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, vigneshr@ti.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-4-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109065546.24912-4-mranostay@ti.com>
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
> Add support for TPS6594X PMIC RTC. However, currently only get/set of
> time + date functionality is supported.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  drivers/rtc/Kconfig        |  10 ++
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-tps6594x.c | 181 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 192 insertions(+)
>  create mode 100644 drivers/rtc/rtc-tps6594x.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 35298c651730..0adb2c2570b8 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -588,6 +588,16 @@ config RTC_DRV_TPS65910
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-tps65910.
>  
> +config RTC_DRV_TPS6594X
> +	tristate "TI TPS6594X RTC driver"
> +	depends on MFD_TPS6594X

Perhaps: || COMPILE_TEST
(and test it)

> +	help
> +	  If you say yes here you get support for the RTC of TI TPS6594X series PMIC
> +	  chips.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-tps6594x.
> +

(...)

> +
> +static int tps6594x_rtc_probe(struct platform_device *pdev)
> +{
> +	struct tps6594x *tps6594x = dev_get_drvdata(pdev->dev.parent);
> +	struct tps6594x_rtc *tps6594x_rtc = NULL;
> +	int ret;
> +
> +	tps6594x_rtc = devm_kzalloc(&pdev->dev, sizeof(struct tps6594x_rtc), GFP_KERNEL);

That's not Linux coding style. Line is too long - wrapping is at 80.
sizeof(*), not struct.

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
> +
> +	tps6594x_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
> +				&tps6594x_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(tps6594x_rtc->rtc)) {
> +		ret = PTR_ERR(tps6594x_rtc->rtc);
> +		dev_err(&pdev->dev, "RTC register failed, err = %d\n", ret);
> +		return ret;

return dev_err_probe


Best regards,
Krzysztof


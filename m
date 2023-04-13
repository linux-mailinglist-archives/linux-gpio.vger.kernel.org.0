Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C2D6E1846
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 01:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjDMX1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Apr 2023 19:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjDMX1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Apr 2023 19:27:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016BD10C6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2023 16:27:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so21602977lfc.6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2023 16:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681428431; x=1684020431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDZlals2AhM6iFKk8CuFKyiuev/5cgFhIr68WCwH9Qo=;
        b=Wv6hVcCngoI35x88x7bwLf/VHBqa8jRQpvAI3yzbpWLWGL9UoyeFwRGxV9FV92oOQf
         v94C6X4mKZUm3CcstLNi9ir9eAYOmkshxd03gi9FD+cdrdCNbiehGRbH5r/s6ViYl5aM
         GmlJM70V9rvj6kl9JluEc5RDAtBVj/r7zvMfnTSq08L4JUvJI68ADJS2L4Xnys0IlkzF
         pfMMgB7f7dDiJ0MX3gOe8UF99eaM8cpvLd2wcMgzdcce0cmG1nywFzaB8hZrrNXTQPsI
         kLwyM/viNBaCgTU4mAtFY4/RpO+Vhk54vnMdayCtXV+4SKGSl5l94A92VIuyPy4Pw/3t
         s8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681428431; x=1684020431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDZlals2AhM6iFKk8CuFKyiuev/5cgFhIr68WCwH9Qo=;
        b=N/T4NKty0dsYIlftS9BvuEp5LyRPVzpBiRHSWz9cZHnAqe2Cy8P84lQIyblkkcvzDf
         NgPNCHXJA8gRSqRUzbpdKX4HZ/a1Q++dT1AqRjU3FrtXZWWnCxPYfqq3VwO1FyaAsEmt
         8PVrLAG+3XM6kGwaJlVuJW9A3ihbii6nxh0FfrnsTRqrReuEfEYN8WAHC5IWtHly08sm
         nvlNfcdeF2e7qts/PdtmTB1CRimNgbW18IDmV0QAnUGoAksy1SExtHvlgDAHMppp/j1I
         ptKGuCQo9INpIHt47fIPIT1UnybD9Z+2VwC/dHcgwEr/W8mIpTefgab8cVuivENFcBw0
         ILCg==
X-Gm-Message-State: AAQBX9cRcAx8pU4eQqV9QrZDvLUUZh9OXKmbtZ4KnuWQYuPzFptw2fg+
        6b+jBoZE/CxqPND7XkSvohD/kg==
X-Google-Smtp-Source: AKy350b+mUzgp9QuG6LU3b7Pc2Qk3aIajq0NjsAmWUs0GH6DglNwGwqV4f2yaceMx2dzjVeW89B1WA==
X-Received: by 2002:a19:740e:0:b0:4eb:c3c:fb19 with SMTP id v14-20020a19740e000000b004eb0c3cfb19mr1305137lfe.30.1681428431243;
        Thu, 13 Apr 2023 16:27:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id p18-20020a19f012000000b004edb103db3csm194817lfc.274.2023.04.13.16.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 16:27:10 -0700 (PDT)
Message-ID: <fb3c0ce6-046d-35e7-9feb-85f5059ec6b2@linaro.org>
Date:   Fri, 14 Apr 2023 01:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/8] pinctrl: qcom: spmi-gpio: Add PMI632 support
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-iio@vger.kernel.org
References: <20230414-pmi632-v1-0-fe94dc414832@z3ntu.xyz>
 <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 14.04.2023 01:17, Luca Weiss wrote:
> Add support for the 8 GPIOs found on PMI632.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
As I've started doing more and more lately, I'll hijack this
patch to discuss the general approach..

I have a feeling that you'll get some comments about
this match list growing, especially since the driver data
is already filled in dt (gpio-ranges).. perhaps we can improve
this..

Especially considering the "qcom,spmi-gpio" fallback is there
(unless we care about 2015 DTs like 0804308fdd3c) that are
unlikely to still work nowadays. Old DTs also used interrupts=<>
to list out all the GPIOs (among the other SPMI fluff) individually
(see e.g. 5f540fb4821a).

Krzysztof, WDYT? Would it be worth taking all of that old junk into
account, or should we keep it as-is?

Konrad
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index ea3485344f06..40cab13e5a83 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1232,6 +1232,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
>  	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
>  	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
> +	{ .compatible = "qcom,pmi632-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
>  	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
> 

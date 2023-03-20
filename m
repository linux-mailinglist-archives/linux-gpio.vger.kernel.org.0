Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCAA96C1E15
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 18:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbjCTReN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 13:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbjCTRdq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 13:33:46 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F24113FC
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 10:29:27 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id e21so356091ljn.7
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679333329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xlTFSQpMKcOiQF9NqlvnJbr/20GiB8UJPzfYIL8Tqdc=;
        b=wEDrOk01qkGuLv4QDcZNhMuMAwegKpjBdFt5Cq53qF+KwLkQY4IuZeBhOfUmaSfut7
         uTnjjmYCQN5K4l/90jUQsqmO1iEJVxMYi2d3NSV2/wxOtr1JQHS/BowJzvZkcJk4Bc48
         udgsW8Qvbgjg69ERpkMjvmhSvjzcVC2vveqrCQcFfIVlz7AqsY5Mg41Ox6vsdvMaaW+W
         Li7NPCdFTLo2C+n3YC4ogC5eOOZQ9h4lotYXtIS938LxFo/fhTTvtUxg1DRktun7RzPE
         NWXghlvuYRyCSPW3W01ylbEF4QhTZAQUXSn/tHedmQleLk6sK+oj6/l2blKJB8XJO0WL
         2fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679333329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlTFSQpMKcOiQF9NqlvnJbr/20GiB8UJPzfYIL8Tqdc=;
        b=Q6180T276E7nbP/qxkIYgWwoirYy7LQumnVOu6WAGpNyjs14HfYspgJCYkkfpTBNaC
         Sj3r9XJm5VxSUVjcpHvHBNnyv8n72q4VZNeZpJIKfCkvZt+yxppDWS0ryuKLuxWKkYQU
         8jbya3fe690yEqq8HhESt4bfJeZlyNjxg1WyAXcnxU1gbwqssw6sDRZbd+aqx6XB8e/1
         kMnWsxOgR/WYdfbhWFfoGW49eUg7DTAhVIfaDlbnMNNpOCaG4j3GDhxcywUWrdodKOX/
         lio8j7fAAImdwAyeb0LtLbAnqFxU3iUwlp1ZD/w9neelenQDv5rYw1mD1DbG93PyO0d0
         5hlg==
X-Gm-Message-State: AO0yUKU2gs01W9h0l5z/Ef+y3UVuUwguMs00DBLiy+4uCy6HV/JNMfcT
        4B/2xpK9DZ+XjPq0EQbTtrj0ew==
X-Google-Smtp-Source: AK7set+SmvqU5dzoiy035pXal1iDhjCFjM6hvRf7gJpEHtaNrtqBVmFvmPzI1CUp9+kmObr6y8dJBw==
X-Received: by 2002:a05:651c:88:b0:295:acea:5885 with SMTP id 8-20020a05651c008800b00295acea5885mr109869ljq.14.1679333329120;
        Mon, 20 Mar 2023 10:28:49 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25ec7000000b004e887fd71acsm1744604lfq.236.2023.03.20.10.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:28:48 -0700 (PDT)
Message-ID: <b8721c2f-3d3b-9669-e990-00e54d7d4407@linaro.org>
Date:   Mon, 20 Mar 2023 18:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 14/15] pinctrl: qcom: spmi-gpio: add support for
 pmm8654au-gpio
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20230320154841.327908-1-brgl@bgdev.pl>
 <20230320154841.327908-15-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320154841.327908-15-brgl@bgdev.pl>
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



On 20.03.2023 16:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add support for the GPIO controller present on the pmm8654au PMIC.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index ea3485344f06..0d94175b34f8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1238,6 +1238,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
>  	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
>  	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pmm8654au-gpio", .data = (void *) 12 },
>  	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */
>  	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },
>  	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },

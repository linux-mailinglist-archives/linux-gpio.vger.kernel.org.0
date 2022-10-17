Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADAC960086F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 10:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbiJQINQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 04:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiJQINJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 04:13:09 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECB85C37F
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:13:06 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so9421645wmb.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uN5hZ0Pnut2v70eOdEnS4yEwy3E1TJfU7I2780Pammg=;
        b=NE4EujS6yyZ0ozOe7XZmcphLCO5NRBx7LaBteIf7U5Y9Gy2VGxPskyLIKWXARAKuqL
         +H9gPJwExlT4yMye0/nqZY1SNiusw8Q73EWfXOQBzUBaQJRawfeqSSB5CpmoB7wH9MEY
         Kq/qBQmyghRPXC/zy7MMQDubDlNgtm9VxUggA7H4lUzQuszyXiCIkDr0oIAu9iwDIUFz
         5Fen+jTS6Jrg5OZFTeEiB+2btXZhUZi8T0R8AsqqKU19pwZU+9obaUfq6LBpXCQ3H4rC
         tEvOQlsLDbM7UyDCCsjrur/tU95i2+3C9r5msHCAeOixCpfPV9Q/G6oLqPqMnCpK+p2u
         339w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN5hZ0Pnut2v70eOdEnS4yEwy3E1TJfU7I2780Pammg=;
        b=ogPb2htv/LS9YunSxmxIQuEXu4/b+5Q2UOxqzpkR641/WqzY3yYyTB5e+rBzDmr80r
         x2ZicPy1Ek6Jl0AdiYTkIY/WNqX4s1smWYn3wLYwFQhGcCTMSw2P7QyG4F/4giTv1RNP
         SxFkCE7xtFNnyFOzSEY/afGJwowX4ezGGjNBDGW/BP1hGrpI1h2wQfdTd/xR1FgpE9cO
         jg1PTqFHcwzjain35/sAvYuO0HdwRUU+cbLb9pjWGX0PpgKHAGX581f6JLJd5xX4hwlb
         Q6a+ZxqhsVSz+TPxLU2U4TZTKGFEUyGFjP9FmogJTWssgefuGnF+aDkmPXVkyaqEFuq+
         KOyg==
X-Gm-Message-State: ACrzQf3iVpgBeR6A64b1FR0hgYXgIelPmM0v5qLlWzDOTM1/eiA9t8Yl
        Hn6fkTfk7IJ2l/NsID8M17MVbw==
X-Google-Smtp-Source: AMsMyM4n5du8KaTXE1LWeN7qR0OfmlCKEqOOdejKwVtT/by89Is0RX8yrcULvEmZNQrZfJDjASCG3A==
X-Received: by 2002:a05:600c:190a:b0:3a8:43b8:53e3 with SMTP id j10-20020a05600c190a00b003a843b853e3mr6664364wmq.4.1665994384998;
        Mon, 17 Oct 2022 01:13:04 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id az25-20020a05600c601900b003b497138093sm9636827wmb.47.2022.10.17.01.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 01:13:04 -0700 (PDT)
Message-ID: <54e4047f-cd82-c3f7-a987-7ced4fec0dbb@linaro.org>
Date:   Mon, 17 Oct 2022 10:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/4] arm64: dts: qcom: msm8998-oneplus-cheeseburger: fix
 backlight pin function
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221011213145.122879-1-krzysztof.kozlowski@linaro.org>
 <20221011213145.122879-2-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221011213145.122879-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/10/2022 23:31, Krzysztof Kozlowski wrote:
> There is no "normal" function, so use "gpio" for backlight button pin
> configuration.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
> index ef2a88a64d32..122f6c25220e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
> @@ -35,7 +35,7 @@ &pmi8998_gpio {
>   	button_backlight_default: button-backlight-state {
>   		pinconf {
>   			pins = "gpio5";
> -			function = "normal";
> +			function = "gpio";
>   			bias-pull-down;
>   			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
>   		};

Perhaps a Fixes tag would be needed here ?

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

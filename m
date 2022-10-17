Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8E260088B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 10:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbiJQIPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 04:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbiJQIPe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 04:15:34 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBA61A05E
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:15:22 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so12122982wma.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5wh/SZ8L4kZClYFVDM976ypsjxMVOvx7CI3CC8pa078=;
        b=GrTDr//YwhUMFfrlNdHy2dporWwLbJ0oWE4bDvhGavQ/P0g4slG3CF7BnFVGnk3RZv
         jveYKjb8g8HB75kNOyQV6tthgBP3yh8CjAhJu0aUXXeuXqLRCW4xuwoQm2phL+bMoipb
         RokemUX6O48tJfWnbrjZeZyR7lO1I2p7gx74OCfE34ANLW8kZUMWGMSDf4Oy7NH0rm1x
         NqqRd9gTPkE8B+Opo8XGPWleeTBd4F69NUGFJGb9xU8mIgVkYgYmpk3dkNLieqeTD1on
         Zx5Xxl/ByccnxIGkq+P0dxE4lKLTj4pooBwyQyNf92wFUHt/HYlj+ARMB+AAXcDL8ZTm
         i04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wh/SZ8L4kZClYFVDM976ypsjxMVOvx7CI3CC8pa078=;
        b=HNLLX0CtDrkHYRbh3nXkKkV041AX1Ml+IcRXfQ3zmn/unzg/EECwhRF4mqhOKeRGZc
         WTskDLBHvb/TsZH0m212ADTVMtsNwt+YqcGhbb7CgD3Yn83jUB0MBq400Z9p8/aZ1aWu
         uUP5YXHrcPhhbGZxGMhlpZLrue68zpKZkyJLDX2dwG0ADqzTGTQTgxic0NiawUpnL71g
         6q20lTWdk202yz/4uD9mBYNqxFCggmc2CvCbAe6UZuscOMtkqQ+oeKmFXXrqXQgwpWxm
         SpOiV2x5L7cmLHEZBqiDDHrmDinOc6/A1pXORjLTDPx8xzfd8eSXCS1wAGRu74Q+v2H1
         4UwA==
X-Gm-Message-State: ACrzQf2Qm2gqECK2oXLBG01XEjs2cEzJJWElyyAlWTRK0EHFOKmHd8Oo
        SWaLmc2CsOfHGN3DVvDmdFnXAQ==
X-Google-Smtp-Source: AMsMyM5ei9xtFGGR1uv2QFprK1XNm+J4n5xrYUDf9XJJ1G3Rw6+B6U7WvQUFactKpv3qtDFdf6XsMg==
X-Received: by 2002:a05:600c:3d8e:b0:3c6:e58d:354f with SMTP id bi14-20020a05600c3d8e00b003c6e58d354fmr10561237wmb.176.1665994517520;
        Mon, 17 Oct 2022 01:15:17 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id m2-20020adfe0c2000000b0022e6178bd84sm8060394wri.8.2022.10.17.01.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 01:15:17 -0700 (PDT)
Message-ID: <c4aa1662-9711-95fc-c46a-20be6d9ed954@linaro.org>
Date:   Mon, 17 Oct 2022 10:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: msm8998-oneplus-cheeseburger:
 fix backlight pin function
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221012151416.38645-1-krzysztof.kozlowski@linaro.org>
 <20221012151416.38645-2-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221012151416.38645-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/10/2022 17:14, Krzysztof Kozlowski wrote:
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

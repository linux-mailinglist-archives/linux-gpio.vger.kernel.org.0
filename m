Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191506BA0B4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 21:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjCNU1A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 16:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjCNU0x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 16:26:53 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F22D51C81
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 13:26:49 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g17so21631263lfv.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 13:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678825608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Dxh51nOg1kRXCkTSJSkWpNCI8aYwY3l8CBW/y0y5cA=;
        b=aU5wIOARLUPFJ1i8QXGP1Ko1ehR05SazRpHSmsJrtj/H3rjp7pLpfYz2NFdodD4kra
         ut7pGVjxXrlKN1iaZmSPsenpq2PjnA3bi3QNVvjZMZm8DBXvkgsuXcoMji4CC3vvvLX0
         DYtXpYPbK595kx5kN/xQw9C40fTl11WCeTgrvTe26j/aA9kysJqfrPUhbw4B4qbcNjc6
         W5yVaMOYsNOeV2jAsUiR2iap7pOlWKtq4PexztswdSYXbm32rcFvHJXtLNIQYwOwKy+H
         R5onk2D+LPoWSOpKPfKZ63TpMHsm4MaA2XACBlwBHB9YVSyTRQeJn3vrxPnqxCQ0AFzh
         TLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678825608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dxh51nOg1kRXCkTSJSkWpNCI8aYwY3l8CBW/y0y5cA=;
        b=e6/5HKbi4/ZCOpQ9Pp1Di2lT62tT5JR0H/pvh1IlOWwd9a4jZM+5NI2BHoNtJ9CGDy
         17mE9rC3ovRtR3y9om+IHLVZ3M6iHwmTEjtLqlmcdwoP8jsK7ofiZUFK2puEo1S3yJLj
         qDVI35VCxVyyHundsvrVkckO+cCflbl4QNUPUJWMA6Z8ZubNXlXrduk7CToRKdzd7uaK
         J4TDeU2BVySzF8zUlAyQozLgZVyJocUWu2iUXJmTNWOnq1VB7kKBA7gTpH7V/mcZLaVB
         dD0nb0LC2v114HpVktsi+Zsfb9fimJ3Q1yeI8HbNJ31sL9dl9n7gLY0q4+AGoRSuo6Pb
         mfQw==
X-Gm-Message-State: AO0yUKU/WPdkgmF7O4G1b/hLSCBf+LKvLxJzkYfQP+x+p3j1VnaGRtNs
        9b1+JA8OSaspoWQ/mQmEKSKHWs3zVwG9DrD8jms=
X-Google-Smtp-Source: AK7set/A4fYW5VADzWtl0RYzwwjwMyEIKC/pStG7RUIyjb6/2Y9QzmzeGCv+rITYpS0PxDGkd4gT0w==
X-Received: by 2002:a05:6512:3910:b0:4e8:485c:6a13 with SMTP id a16-20020a056512391000b004e8485c6a13mr1238871lfu.21.1678825607888;
        Tue, 14 Mar 2023 13:26:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id j9-20020a19f509000000b004e85772b89bsm111779lfb.240.2023.03.14.13.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 13:26:47 -0700 (PDT)
Message-ID: <f6497de6-56eb-7f26-28da-8125a2f244e6@linaro.org>
Date:   Tue, 14 Mar 2023 21:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/14] arm64: dts: qcom: sa8775p: pmic: add support for
 the pmm8654 RESIN input
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230314183043.619997-1-brgl@bgdev.pl>
 <20230314183043.619997-11-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314183043.619997-11-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 14.03.2023 19:30, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the RESIN input for sa8775p platforms' PMIC.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> index 874460d087db..d55fa5165864 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> @@ -25,6 +25,12 @@ pmk8775_0_pon_pwrkey: pwrkey {
>  				linux,code = <KEY_POWER>;
>  				status = "disabled";
>  			};
> +
> +			pmk8775_0_pon_resin: resin {
> +				compatible = "qcom,pmk8350-resin";
> +				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
> +				status = "disabled";
No usual 15625 debounce time?

Konrad
> +			};
>  		};
>  	};
>  

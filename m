Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6746C1E08
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 18:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjCTRd2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 13:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbjCTRc6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 13:32:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A742736
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 10:28:36 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id by8so11751090ljb.12
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679333302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wzjrze65UkFlGZ/XglOoMjwNcpTyBgOgHY9sMdnQEIs=;
        b=Vo3UGo2z4k6fUb8W5p5osgql1AL7hi17kd2Qs1xIaTXzfNK/6QLCaRE8d7pb7FRTKN
         hMtHp2NnJnj7UIhCyqIzEWooViz/Ynwxa/OXFJmy+rxcpzLB+PRpEFhAqo4ItYXuUw7B
         nHTwTvQlu+SzUnQlDuZxw2QVeTqgXw9Gb2/jdXlBZnjxxge83bAWqMTcsFoJ/KsOfT0q
         wQnVOW+jD6hA/qJkXENHffirUg2qgHSwRM4VN/cHBFMKepD/Y4i0KWBMpc5w3cpWKACK
         kpbpzMm3hQ3hzT4iICibYw+7qIaz9JkyIS87iBU3FMI2GcgR52FBqRz4Z0dGYvFpqLQT
         am/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679333302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wzjrze65UkFlGZ/XglOoMjwNcpTyBgOgHY9sMdnQEIs=;
        b=4rq/gtYWZFGKKDofUwa4eG4VASZKxMpOgiYRFNzCBpqqJT1mev7ZPiLl2zBeEtFfz0
         JyUJpb8Mhlt0aO5f2AZiSLQSD74SoNWmr9qptGuwgKWGQ0+phOE3AWY9xbKtWJ8Mfc7/
         u2xEzHFneDBmDw+hf3Uz/5cJDT+A8BNpVsOQmP9zBjt2tn5s7h+ut/6L0UD/AiKmIEjJ
         3N61aLDC6hwuAoc5Fi0b7uCO1OdJBS+/bW8vvY9UD9CM5zRzX6278q2HdprfpyoFQV0D
         q8zQmcwO0ugoRFIGhfwDhG/ro2RG/fvuO6o7+VVc5IdlKfHqR38nWySmHANngk1Uc3sR
         PEWQ==
X-Gm-Message-State: AO0yUKXQEbgv0+Q2OAVXw+QR1Wfa/5PpwF6dXPRXwIcbGUM8mPyP090O
        KbmplCsgneD3vKFsfs38JxGRAQ==
X-Google-Smtp-Source: AK7set8SsF2uuzdimKsotO9xMkQAlOSI4YpsGaAyiASE6KgluVQej1fwQISQbDrsPr3/9l9EChJL3w==
X-Received: by 2002:a2e:97c8:0:b0:298:9e64:c916 with SMTP id m8-20020a2e97c8000000b002989e64c916mr220941ljj.17.1679333302039;
        Mon, 20 Mar 2023 10:28:22 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id u9-20020ac248a9000000b004e966678db7sm1683101lfg.113.2023.03.20.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:28:21 -0700 (PDT)
Message-ID: <a215c54b-c12e-4463-f9fe-588053f74300@linaro.org>
Date:   Mon, 20 Mar 2023 18:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sa8775p: pmic: add thermal
 zones
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230320154841.327908-1-brgl@bgdev.pl>
 <20230320154841.327908-13-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320154841.327908-13-brgl@bgdev.pl>
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
> Add the thermal zones and associated alarm nodes for the PMICs that have
> them hooked up on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 58 +++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> index 8616ead3daf5..276070b62ccd 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> @@ -6,6 +6,50 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/spmi/spmi.h>
>  
> +/ {
> +	thermal-zones {
> +		pmm8654au_1_thermal: pm8775-1-thermal {
Please reindex this, downstream uses _1 for pmic@0, but this
makes little sense. Make it match the SID.

> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pmm8654au_1_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
What happened to the downstream _2 (pmic@2) one and _4 (pmic@6)?

Konrad

> +		pmm8654au_3_thermal: pm8775-3-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pmm8654au_3_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &spmi_bus {
>  	pmm8654au_0: pmic@0 {
>  		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
> @@ -41,6 +85,13 @@ pmm8654au_1: pmic@2 {
>  		reg = <0x2 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		pmm8654au_1_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
>  	};
>  
>  	pmm8654au_2: pmic@4 {
> @@ -55,5 +106,12 @@ pmm8654au_3: pmic@6 {
>  		reg = <0x6 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		pmm8654au_3_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
>  	};
>  };

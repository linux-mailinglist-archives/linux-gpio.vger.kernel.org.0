Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA28075DB39
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Jul 2023 11:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjGVJQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Jul 2023 05:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjGVJQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Jul 2023 05:16:18 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5736C2706
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jul 2023 02:16:16 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3172144c084so2293175f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jul 2023 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690017374; x=1690622174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAuW34j1LpOfu1y1oQ6Q+GxYpSp6L2C3sF0DCiFBaB4=;
        b=x0fpM3KAac7oWai9fmh7KDzodX945HKjQ6F6VRgCT/fYG0Qa5OIhD8l+ruLqwBl/Mn
         2nlH9hTW70Vofnx93fYA1U6MY/xdXSK566s8I0/wyA2681RfzYc0fjO8jYBljH/Ca6DE
         o2k7v/NVODvOm3GS2t2q47jXpOVHN6Qn/V/kuzBMDI6lQxSf+oS0PcV1Huv8Q449qmlL
         VR3tZX+32x/AEjX7FSj05g3GuAuXo+yP8vzhm2RIHkiTvdrs0OhNod4Wx44l7R0kbzMq
         glsba6vwDAGkMuqFj655iVEe74vgkgtvtPCuiwV49ljKqcLB2hwjCs4i1mAgEkZNZUdn
         sBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690017374; x=1690622174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAuW34j1LpOfu1y1oQ6Q+GxYpSp6L2C3sF0DCiFBaB4=;
        b=lr0U2db0qBow72oSNHtK9R7XjO3SJecG0bLCFzodvk9anVVWinckdPnH1h57hJvh9o
         KLziudKXcjt8tOOlM/BpYK9quMH6YDQd/8X5cEYweNpZTTl+7UrmPflQ708OWd5MjWJy
         U1aOmoT77hstFX19zlxLZVNhm0DRZQTAdYtHqY5OmDIBFqf0C84VBocCSGin0ch+k73V
         0qzGVnCOqPM2JOW6oYV309WxiGYXckY5kktdlIv2T2g81c21GTJNI9wrDG64o/8YijP8
         wnhuAJu7DY2IvgQnvpywHo+YsnKiqbRMD5f4IXH/E8yyXsG2+0vT0RBq5AjeQoTYES7F
         0bTA==
X-Gm-Message-State: ABy/qLZSKt87DfGwBa3dyaRYbnKinDySDQ0/BtQLn+ioGUGasOzN7E4M
        QAg0CDyvB4dNSkRhtpzwX6kh0OqFfpHydA67R7A=
X-Google-Smtp-Source: APBJJlHzM2jVxTiraDr9HR8MN3BXxrCi6eXMzhl24XJMPnaInvttU/AGEdRpE6vmZWF16ETKm5lL/A==
X-Received: by 2002:adf:ef48:0:b0:314:bdb:cf71 with SMTP id c8-20020adfef48000000b003140bdbcf71mr3777363wrp.53.1690017374595;
        Sat, 22 Jul 2023 02:16:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d5152000000b00314326c91e2sm6371816wrt.28.2023.07.22.02.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 02:16:13 -0700 (PDT)
Message-ID: <3ef83472-dc69-d512-424d-898716b72ac9@linaro.org>
Date:   Sat, 22 Jul 2023 11:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 SM6115 LPASS TLMM
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230722-topic-6115_lpasstlmm-v1-0-32d1643d8774@linaro.org>
 <20230722-topic-6115_lpasstlmm-v1-1-32d1643d8774@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230722-topic-6115_lpasstlmm-v1-1-32d1643d8774@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22/07/2023 10:52, Konrad Dybcio wrote:
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"

Narrow the pattern till 18

> +
> +      function:
> +        enum: [ dmic01_clk, dmic01_data, dmic23_clk, dmic23_data, gpio, i2s1_clk,
> +                i2s1_data, i2s1_ws, i2s2_clk, i2s2_data, i2s2_ws, i2s3_clk,
> +                i2s3_data, i2s3_ws, qua_mi2s_data, qua_mi2s_sclk, qua_mi2s_ws,
> +                swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, wsa_mclk ]
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +

...

> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
> +    lpass_tlmm: pinctrl@a7c0000 {
> +        compatible = "qcom,sm6115-lpass-lpi-pinctrl";
> +        reg = <0x0a7c0000 0x20000>,
> +              <0x0a950000 0x10000>;
> +        clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +        clock-names = "audio";
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpass_tlmm 0 0 15>;

19?

> +    };
> 

Best regards,
Krzysztof


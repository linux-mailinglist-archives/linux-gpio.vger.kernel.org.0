Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECC362F018
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 09:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241616AbiKRIw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 03:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241424AbiKRIwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 03:52:22 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E189D2BD4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:52:20 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id x21so5921567ljg.10
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5p5jpjzU8KIpwuBIIbbPSInj8EzgA3wKPkdmINuLKtg=;
        b=db2Z79k+R0PPpeWdUSc/JMVjsPy6YDciEXKcDVGaNXEx8/LLfBnc1OvUw96yb4Sx7y
         ccf2nWiE+lGced1G4AYq5OSfnWvibHvEGbT/bKgmxxGhYow52XhXZONuIY64C1BrwvO+
         Ql1n6T82176cc6ZwfFRO1wFIar8u5uYpPeFQiz2mT29d/Rf/HcAaJqGGtQS4QjqivkfQ
         s5ZJNt4ZIr4CylsP4G08wdnhOw+xeY30lx81He3VBCP24on/gpEwfhjSOGCO6xi1/YAh
         jZtPxIB1hSIi4QynZi/03qeB1Z47W2P88Bn+2q4qfeu1UWV8nL4M03UXXxSSJngv2vad
         Eu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5p5jpjzU8KIpwuBIIbbPSInj8EzgA3wKPkdmINuLKtg=;
        b=1jDaUHjqf9bM6N22KK268otbuztWkDfflqe2Ad4xj93Bfn5Y7u0PPIarr7jzgjKWk5
         nN1XXH/pdVmccbVi0Fwx1c9MjQwY1OQgu/D3NvEYN2NDwpgpts+JCZASRmh6rgUKEX1T
         eW7bBOTLF+00LDbixSCEG8DPFs7+6ELmrJF1T46uxz5ar5L+4VxCe/qUgx0F3bTGS3uz
         VZXhFv+LRzJAKNbUI6th7BHaa25Az+Ph9Y4OFgesjj84rmlMqqNLYhv9/7a1kjcV0fhU
         8js/tfvIDcgK7DyWqXOj2g3drN1hCq0fXFINoYktcIVePLpAUF9hk7S9S5FqvOUChoxc
         9RRw==
X-Gm-Message-State: ANoB5pkveCpaXshI/9+HZJwHD6IJuY5tzTJa8ieYDu4V2N+20HuWlWlG
        eCzB6U11iHCxFgVEN5w6cRh6GQ==
X-Google-Smtp-Source: AA0mqf7NInPVwoinRrtQdIS7u2cBmY3U/epKgvk6kp0InWRF1xtlD+pB+TnUychIW1T9LFDhcHb72w==
X-Received: by 2002:a2e:c52:0:b0:277:9bf:9411 with SMTP id o18-20020a2e0c52000000b0027709bf9411mr2012257ljd.504.1668761539235;
        Fri, 18 Nov 2022 00:52:19 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k4-20020ac257c4000000b004a2511b8224sm573648lfo.103.2022.11.18.00.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:52:18 -0800 (PST)
Message-ID: <f20a8dff-fb51-4000-dbb6-29cb8b0d223d@linaro.org>
Date:   Fri, 18 Nov 2022 09:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: qcom,spmi-pmic: document pm8550,
 pm8550b, pm8550ve, pm8550vs, pmk8550, pm8010 & pmr735d
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v2-1-b839bf2d558a@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v2-1-b839bf2d558a@linaro.org>
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



On 18/11/2022 09:24, Neil Armstrong wrote:
> Document compatible for the pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550.
> pm8010 & pmr735d SPMI PMICs
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Didn't checkpatch complain about the length of this patch's subject?
I propose:

dt-bindings: mfd: qcom,spmi-pmic: document SM8550 PMICs

or

dt-bindings: mfd: qcom,spmi-pmic: document PMICs bundled with SM8550


Konrad
>   Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index c8362efd4345..8c9b042b4f30 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -43,6 +43,7 @@ properties:
>             - qcom,pm8004
>             - qcom,pm8005
>             - qcom,pm8009
> +          - qcom,pm8010
>             - qcom,pm8019
>             - qcom,pm8028
>             - qcom,pm8110
> @@ -54,6 +55,10 @@ properties:
>             - qcom,pm8350
>             - qcom,pm8350b
>             - qcom,pm8350c
> +          - qcom,pm8550
> +          - qcom,pm8550b
> +          - qcom,pm8550ve
> +          - qcom,pm8550vs
>             - qcom,pm8841
>             - qcom,pm8909
>             - qcom,pm8916
> @@ -70,10 +75,12 @@ properties:
>             - qcom,pmi8998
>             - qcom,pmk8002
>             - qcom,pmk8350
> +          - qcom,pmk8550
>             - qcom,pmm8155au
>             - qcom,pmp8074
>             - qcom,pmr735a
>             - qcom,pmr735b
> +          - qcom,pmr735d
>             - qcom,pms405
>             - qcom,pmx55
>             - qcom,pmx65
> 

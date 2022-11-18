Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37BEB62F9F0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 17:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241877AbiKRQK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 11:10:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241845AbiKRQK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 11:10:56 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE078DA45
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 08:10:52 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id b9so7348799ljr.5
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 08:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvAQuPUeZtCMxDEP4zdzhDgI+5I82VbT1k1p8ObW3nA=;
        b=dzObXO7jJVv8sceovKazrJ1BXNvErTI4vHAlUubDdseSzl96EwHnxwaIbXNiCUv57u
         vW4IIBmdF3kbSomKCMkfvONIPQUZ/s/bYTVtv0XCjA+RxF/63n6IAoFe7DM6QgpGXt+w
         i5bdFbnmm40oooPsoTqWAeAW5qXs3EVLQ47RDP1OwegwNTvGqGeqHFbsn9BeJ7O/Fa78
         clinchIpL4V+guMHskKO9Ck6N1rkvuKUrlGCZhvOUuHpbyCPZlKTJDjsWLfxH8X9qt30
         irwWtW/2iZPWjJ/TMn32iSKoVGtI2C/oscX2chd57QA227+filiO0BospnEhjAWxdvYj
         rIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvAQuPUeZtCMxDEP4zdzhDgI+5I82VbT1k1p8ObW3nA=;
        b=n1q1LYLusFCaN1ovBHCeXd8C+sv7d3Y35YIJyqjfEaOjMd4Hm3o55T0rXgQsw1wLJP
         LRWRc+s6bViNBUGwjO9UuX1s3Mk+cZX5UNY6i0ccPZgpmZsRjjE/P2oYqWdYXnb6mKjh
         FjTHaVD46WR2+Ev5veO1KwMV8Ucd8R/NBlbmOTgJ5iRd8HWDREJHczvKJOfAYcp0IcX+
         jYlC9ZCSzFLk/9grHo085c8VBnEwCGrl+fL+3Ehxlh8NwnI+Um+D2ovlMPvUjvjewQX7
         VWzjbkvObf0WG0S6BLu2fvKncQ8KbnoyLGIi6Re5fYI51N4Qr68iumxkLGZxnfwma8cA
         Vy7A==
X-Gm-Message-State: ANoB5pmRabjGSVuA7YWavBOSLF7ENJmW+XMdYIBjHUxK8fjUKJTPWjvV
        zolgybGQJKB1iU05xNiY2rzoXQ==
X-Google-Smtp-Source: AA0mqf6qPHXrwqSjuMcV1UC/64uEQQRNDZ6nm6QFXsuRBuHTsdUpIk0B+wOrOaCI2VH1GSL10eXx/A==
X-Received: by 2002:a2e:aa99:0:b0:277:113d:1c38 with SMTP id bj25-20020a2eaa99000000b00277113d1c38mr3012133ljb.238.1668787851126;
        Fri, 18 Nov 2022 08:10:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j23-20020ac253b7000000b004a62ff61b3dsm712152lfh.252.2022.11.18.08.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 08:10:50 -0800 (PST)
Message-ID: <e825bfbb-dc77-016a-3f56-9474aef06085@linaro.org>
Date:   Fri, 18 Nov 2022 17:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: qcom: Add SM8550 pinctrl
 bindings
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20221116105724.2600349-1-abel.vesa@linaro.org>
 <20221116105724.2600349-2-abel.vesa@linaro.org>
 <368cd281-b461-e668-0b57-cbb83f5b8086@linaro.org>
In-Reply-To: <368cd281-b461-e668-0b57-cbb83f5b8086@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/11/2022 12:10, Krzysztof Kozlowski wrote:
> On 16/11/2022 11:57, Abel Vesa wrote:
>> Add device tree binding Documentation details for Qualcomm SM8550
>> TLMM device
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>>  .../bindings/pinctrl/qcom,sm8550-pinctrl.yaml | 184 ++++++++++++++++++
>>  1 file changed, 184 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..4c5a8b78315b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-pinctrl.yaml
>> @@ -0,0 +1,184 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8550-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. SM8550 TLMM block
>> +
>> +maintainers:
>> +  - Abel Vesa <abel.vesa@linaro.org>
>> +
>> +description: |
>> +  This binding describes the Top Level Mode Multiplexer (TLMM) block found
>> +  in the SM8550 platform.
> 
> Rebase on recent next and apply same changes as in 09f537065c06.
> 
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8550-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts: true
>> +  interrupt-controller: true
>> +  '#interrupt-cells': true
>> +  gpio-controller: true
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 105
>> +
>> +  gpio-line-names:
>> +    maxItems: 209
> 
> You have 210 GPIOs, so maxItems: 210
> 
>> +
>> +  '#gpio-cells': true
>> +  gpio-ranges: true
>> +  wakeup-parent: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
> 
> This and required go after all properties and defs are listed.
>> +
>> +patternProperties:
>> +  '-state$':
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-sm8550-tlmm-state"
> 
> Use same quotes - either ' or "
> 
>> +      - patternProperties:
>> +          "-pins$":
>> +            $ref: "#/$defs/qcom-sm8550-tlmm-state"
>> +        additionalProperties: false
>> +
>> +  "^.+-hog(-[0-9]+)?$":
>> +    type: object
>> +    properties:
>> +      gpio-hog: true
>> +      gpios: true
>> +      input: true
>> +      output-high: true
>> +      output-low: true
>> +      line-name: true
> 
> Keep properties sorted by name (just like gpio-hog.yaml).
> 
> I wonder if we could add this to the common TLMM schema. It will appear
> in multiple places.

Answering to myself - this would require moving the 'state'
patternProperties part to the common schema, so maybe later... Looks
fine with changes about ordering.

Best regards,
Krzysztof


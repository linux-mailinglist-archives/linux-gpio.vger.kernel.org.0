Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420C0637B0D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 15:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiKXOFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 09:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiKXOFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 09:05:18 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9056018E3A
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:05:07 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d6so2685400lfs.10
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xSkgvbeKVsRIQO54MHan2onCSxwrrD+XXDauFHX6PI=;
        b=P+xZZji/4tykRi30u7V2uwiVkrvWzXBWGMMoHkM4301eJiR/jE5ccK1+Ecc+6t0ZUM
         4Y0Wdv7M+oFgNT7bIf/IcId35reHixuxppTjBt1Ry+gx0er+Bbc9u4FpxSKa6tz6LSxs
         JNPCufmert60WDsyliHiruKHfRqHlSFpFxU9CuQK1+ejbIyg90jRInYn6JLW1jXd7N2H
         3On35QTA0nGIGvHek++EYd+rigB8T7hutawzV6CR0U2PFfAtO+zH+Run0f5lmZIujzJO
         OP8T+J+jOJR14PIoLbXznCqHnADsIBP6xj8f0ka2YZZVOXaVvxaX4u4ebALdHRrRdXUP
         C9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xSkgvbeKVsRIQO54MHan2onCSxwrrD+XXDauFHX6PI=;
        b=QRu+YySz8Dh23KKE59Tdpe178Xtwcdcag8Jz0XpxyizBzWq9ZK3X+2qPYkH331MPai
         MFuu1WRM2eKFF3Fj639uAOf7buL+ROGlL1aW36PQxRKSIyOj++gFnX/5W1+giJHNcNZG
         MCFjwEkFhwJdpnutB+bBap2k/TtcAWd3Ugq1qejIhOfNidEwEweqFUdv7YkdDrvbIIwY
         CpPHHph+nfpsOcVNycVGmL3waeTaKGcnUHKZfSXuuzC6GWpgH1Bsc8ydcYwlb5Ddessj
         X1gGg6qmYnHLJDx0dsLMvk3HRnJ0A6aKoziZ7nnEU9VzU9t9V5B9txBi0dqIokv05Fmu
         MImw==
X-Gm-Message-State: ANoB5pnvILL8PRQ2rNkmJ+6fmvDpgSTfirzirVeKGo1Pu01j4/Gfkkbp
        EX/np2Vxlr8w3i1K1PdXBgpEjQ==
X-Google-Smtp-Source: AA0mqf7oXX8it2c2jTo0y8WBHPqGA85ZEeqGBI4LuwDFD9dN4491p2jbDYdj+PZoLvjFuMPo3q1MNA==
X-Received: by 2002:a05:6512:4029:b0:4b4:e26b:2c28 with SMTP id br41-20020a056512402900b004b4e26b2c28mr4473023lfb.356.1669298705766;
        Thu, 24 Nov 2022 06:05:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id by37-20020a05651c1a2500b0026ddaf38b0fsm104763ljb.96.2022.11.24.06.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 06:05:05 -0800 (PST)
Message-ID: <86732e73-fb66-0a90-5e64-50049e0f6507@linaro.org>
Date:   Thu, 24 Nov 2022 15:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: ti,tps6594: add TPS6594 PMIC
 support
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, michael@walle.cc,
        vigneshr@ti.com, robh@kernel.org, a.zummo@towertech.it,
        linus.walleij@linaro.org, lee@kernel.org, brgl@bgdev.pl
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20221123053512.1195309-1-mranostay@ti.com>
 <20221123053512.1195309-2-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123053512.1195309-2-mranostay@ti.com>
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

On 23/11/2022 06:35, Matt Ranostay wrote:
> Add documentation for the TPS6594 PMIC including its RTC and GPIO
> functionalities.

Back in September I asked to use get_maintainers.pl to CC people. Can
you please tell me, why you still prefer not to use it's output and
instead use a bit different email addresses?

How many times same feedback should be given?

> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,tps6594.yaml   | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> new file mode 100644
> index 000000000000..0de0db87dbf7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPS6594 Power Management Integrated Circuit (PMIC)
> +
> +description: |
> +  TPS6594 Power Management Integrated Circuit (PMIC)
> +  https://www.ti.com/lit/ds/symlink/tps6594-q1.pdf
> +
> +maintainers:
> +  - Keerthy <j-keerthy@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps6594
> +
> +  reg:
> +    const: 0x48
> +
> +  ti,system-power-controller:
> +    type: boolean
> +    description: PMIC is controlling the system power.
> +
> +  rtc:
> +    type: object
> +    $ref: /schemas/rtc/rtc.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594-rtc
> +
> +  gpio:
> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594-gpio
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: pmic@48 {
> +            compatible = "ti,tps6594";
> +            reg = <0x48>;
> +
> +            rtc {
> +                compatible = "ti,tps6594-rtc";

No resources? No properties? Usually such nodes are not useful at all.
Rob pointed this some times in different cases, but I don't remember if
we resolved it here.

> +            };
> +
> +            gpio {
> +                compatible = "ti,tps6594-gpio";

Same question.

> +            };
> +        };
> +    };
> +
> +...

Best regards,
Krzysztof


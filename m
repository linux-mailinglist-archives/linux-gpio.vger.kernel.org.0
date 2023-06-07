Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FA9726848
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jun 2023 20:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbjFGSSI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jun 2023 14:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbjFGSSG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jun 2023 14:18:06 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01613210A
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jun 2023 11:17:42 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977e83d536fso516151366b.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jun 2023 11:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686161850; x=1688753850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prDRECWq9gF2HlqhPhhfLHooXy3hmv9x6uJRavIYoMM=;
        b=K8CKxwxxN45RRYaTH7NPm1PcmY5u9Gf+agf79C9mZHlN8CYjn0SvqEmRzpevWMmaj0
         mhpDpp0KtIdV3xImPBNLj/6AalyMVyBbvf4X+LboPXyX3/mLFTSI5X+EDBye1KGVuQm2
         9PLdOHTQuzN6xcm4aatFX34Swjx7jlpQ21OCyutgc/ClFDXHALAPNaF3fP8ybwDpBo4n
         xFAVxB5O9J9gpHslhAfiEwdyPj4h2ctQ0k2tNERAnpI6L/qkR3zQQwCh5QP7Pp1aE8n4
         9znUQsLY05jSaorR006Bdcc8zqOIDdEGKP/qUY5fUyfDEkd/nBxypOV9pwbcbIbWYjk4
         C39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686161850; x=1688753850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prDRECWq9gF2HlqhPhhfLHooXy3hmv9x6uJRavIYoMM=;
        b=M6DrzF9uzwhVNKZljFS7KFe2FANxHpTsh8fpuZTyh7Yi4L+btrfo1c0jxDhxfj5gch
         e2CDectQ5mFnYDF6/uvwTPl1Axz9ZtXuVEXKYlCpvJnyB0DCCIw+rSPCcTRWnF6byIss
         tIYlF1Q1V+NYUNDkGiDT8Vhbz/4AB6e1WYZf5LQq8Xxg8NEOk04NvFZie7CTJK7gR38E
         9+9nrkgEGm8oh0ItJEk9yqvWwiVBhyR524GjhFI+OOL2njHWrIjbXKhSMtipOQmATtU+
         W/eOwyrt+kNGB6wxvYWesTRTuAjm6hPuptX9WE1j7ri7ffldNLVxSXR5eW39a96RVSqO
         YJMA==
X-Gm-Message-State: AC+VfDyxxMepd8orMVEzzU3QxS+5mY5HRJ+4wFQ66gzV0bfZzFG8Zf0u
        PwFIQc6lbyOaTJ7m6uUKexjY/A==
X-Google-Smtp-Source: ACHHUZ6yoYhGvQnkxo1NhlbZPThR0OVI8Y6NmV6ZpfuYehTZsNtv3pdMlOHWJLxpGXA/52ORFV87KQ==
X-Received: by 2002:a17:907:1606:b0:94a:7b2c:205e with SMTP id hb6-20020a170907160600b0094a7b2c205emr6065400ejc.72.1686161849737;
        Wed, 07 Jun 2023 11:17:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gu19-20020a170906f29300b0096a1ba4e0d1sm7262812ejb.32.2023.06.07.11.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:17:29 -0700 (PDT)
Message-ID: <a4134777-e43c-4b74-58d8-bff0c0d1a6f6@linaro.org>
Date:   Wed, 7 Jun 2023 20:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v6 1/1] dt-bindings: pinctrl: Update pinctrl-single to use
 yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20230605095216.18864-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605095216.18864-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/06/2023 11:52, Tony Lindgren wrote:
> Update binding for yaml and remove the old related txt bindings. Note that
> we are also adding the undocumented pinctrl-single,slew-rate property. And
> we only use the first example from the old binding.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Changes since v5:
> - Fix issues noted by Krzysztof



> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> @@ -0,0 +1,206 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pinctrl driver for hardware with a single register for one or more pins

I asked to drop the driver references but it is still here. Bindings are
not describing drivers.

"Generic Pin Controller with a Single Register for One or More Pins"


> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description:
> +  Some pin controller devices use a single register for one or more pins. The
> +  range of pin control registers can vary from one to many for each controller
> +  instance. Some SoCs from Altera, Broadcom, HiSilicon, Ralink, and TI have this
> +  kind of pin controller instances.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - pinctrl-single
> +          - pinconf-single
> +      - items:
> +          - enum:
> +              - ti,am437-padconf
> +              - ti,dra7-padconf
> +              - ti,omap2420-padconf
> +              - ti,omap2430-padconf
> +              - ti,omap3-padconf
> +              - ti,omap4-padconf
> +              - ti,omap5-padconf
> +          - const: pinctrl-single
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#pinctrl-cells':
> +    description:
> +      Number of cells. Usually 2, consisting of register offset, pin configuration
> +      value, and pinmux mode. Some controllers may use 1 for just offset and value.
> +    enum: [ 1, 2 ]
> +
> +  pinctrl-single,bit-per-mux:
> +    description: Optional flag to indicate register controls more than one pin
> +    type: boolean
> +
> +  pinctrl-single,function-mask:
> +    description: Mask of the allowed register bits
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pinctrl-single,function-off:
> +    description: Optional function off mode for disabled state
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pinctrl-single,register-width:
> +    description: Width of pin specific bits in the register
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 8, 16, 32 ]
> +
> +  pinctrl-single,gpio-range:
> +    description: Optional list of pin base, nr pins & gpio function
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle of a gpio-range node
> +          - description: pin base
> +          - description: number of pins
> +          - description: gpio function
> +
> +  '#gpio-range-cells':
> +    description: No longer needed, may exist in older files for gpio-ranges
> +    deprecated: true
> +    const: 3
> +
> +  gpio-range:
> +    description: Optional node for gpio range cells
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      '#pinctrl-single,gpio-range-cells':
> +        description: Number of gpio range cells
> +        const: 3
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +patternProperties:
> +  '-pins$|-pin':

you did not implement my comments fully, probably we misunderstood each
other. Why do you allow anything after '-pin'? Let's make it pure suffix
for both cases: '-pins?$'


> +    description:
> +      Pin group node name using naming ending in -pins, or having -pin
> +      in the node name
> +    type: object
> +    additionalProperties: false
> +


Best regards,
Krzysztof


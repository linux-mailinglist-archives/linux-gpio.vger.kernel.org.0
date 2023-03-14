Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E266B9DA9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 18:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjCNR5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 13:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjCNR45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 13:56:57 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A434AD01D
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 10:56:44 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id eg48so6201031edb.13
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 10:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678816602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBAdudaa5OwS68f0uZK/unstmFHq5M3zw+2tcO53Zq8=;
        b=IQfJITGI5ZNI33OajIaXutN5rC2BX75h5a7QWvvS7cs+Bsd6qzJI8DIKrMv3iICbBL
         VgyYu6jTKZedQHe3vQ7bXK9gqO/IT5LkTGA/lSNTLq8Vwtb9qJyAaChDD8v3vTBF3EkZ
         fqY3FSWFi3DyJDtzlNjMcrZgHq6ohEC50aePxaHLZr9VDf/jdMGadDQKaRZ7s95sSxDR
         ohvTlInGPaHJjFal0b6r/nRn+ezWiYRAyQV8b0yup8DjXt266T16rPY1w+hhs6Z+mYnh
         LUUIs5HOzI2rT84gq0uu395D9OjbnmRgTRfB6OR4GthfN4uesaxKIqVSp/sIJkmToc21
         ryzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678816602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBAdudaa5OwS68f0uZK/unstmFHq5M3zw+2tcO53Zq8=;
        b=ARmU56EpEyr91odZi5MGISu5bapa/4OcPI8ANtchhGBKRnEaMQ4n6ZV/TifoEp/mKC
         39D1UXKjHz7+NnyTM6oD+C5XAgY709bwhSyEowaMtwalIAlZhXdkvmNy22tbdYPzxTp9
         KRQV+Nj7YTCRXvqT7yyP5lvWvzF5DlsxQQsCA1C5cDQ5KXzTLpPn/5J3GtQ/BKPorRI2
         Y6i8PakCNuAGzhIvyQPG7BDIzHpJCXocdJ/XoRfZV0NbKVLUyH/mFMbARGprTDx7iz6k
         rB3HXjzu9koBkcaqS0i63yW4ZJVF2GaxaruDIvvVFOzsxyUpaqZLGiVojxF/MeKqq/b/
         5Q4A==
X-Gm-Message-State: AO0yUKXnAisN0Uvkh/ml9GPM6jtBfwoqYiuRFIj3KKShkQaJssncg6/O
        sbmLTANkXxLL3iNe2B//uRmSdg==
X-Google-Smtp-Source: AK7set/VmYsgH6FiXcXVlsj6D3W7RyTlZ0vFACe6rXBooAVbxkCIYcdML6pkyiokc3OU1DDaaYwUAg==
X-Received: by 2002:aa7:c508:0:b0:4ad:7a9f:a9f0 with SMTP id o8-20020aa7c508000000b004ad7a9fa9f0mr35568684edq.22.1678816602556;
        Tue, 14 Mar 2023 10:56:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id i19-20020a508713000000b004af62273b66sm1392473edb.18.2023.03.14.10.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 10:56:42 -0700 (PDT)
Message-ID: <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
Date:   Tue, 14 Mar 2023 18:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-4-sean.anderson@seco.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313161138.3598068-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13/03/2023 17:11, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v11:
> - Keep empty (or almost-empty) properties on a single line
> - Don't use | unnecessarily
> - Use gpio as the node name for examples
> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
> 
> Changes in v10:
> - New
> 
>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 134 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>  4 files changed, 135 insertions(+), 91 deletions(-)
>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> similarity index 78%
> rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> index 4d69f79df859..e11f4af49c52 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml


> +
> +description:
> +  Some simple GPIO controllers may consist of a single data register or a pair
> +  of set/clear-bit registers. Such controllers are common for glue logic in
> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
> +  NAND-style parallel busses.
> +
> +properties:
> +  big-endian: true
> +
> +  compatible:

Keep compatible as first property.

> +    enum:
> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller

I think you got comment that these comments are making things
unreadable. I don't see here improvement.

For example first comment is useless - you say the same as compatible.
Same with last one. So only remaining WD comment should be made in new
line so everything is nicely readable.

BTW, order the enum by name.


> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller:
> +    true

I am sure I saw comments here...

https://lore.kernel.org/all/20230308231018.GA4039466-robh@kernel.org/

> +
> +  reg:
> +    minItems: 1
> +    description:
> +      A list of registers in the controller. The width of each register is
> +      determined by its size.

I don't understand this comment. Aren't you describing now what 'reg' is
in DT spec? If so, drop. If not, please share more.

>  All registers must have the same width. The number
> +      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
> +    items:
> +      - description:
> +          Register to READ the value of the GPIO lines. If GPIO line is high,
> +          the bit will be set. If the GPIO line is low, the bit will be cleared.
> +          This register may also be used to drive GPIOs if the SET register is
> +          omitted.
> +      - description:
> +          Register to SET the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line high.
> +      - description:
> +          Register to CLEAR the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line low. If this register is omitted,
> +          the SET register will be used to clear the GPIO lines as well, by
> +          actively writing the line with 0.
> +      - description:
> +          Register to set the line as OUTPUT. Setting a bit in this register
> +          will turn that line into an output line. Conversely, clearing a bit
> +          will turn that line into an input.
> +      - description:
> +          Register to set this line as INPUT. Setting a bit in this register
> +          will turn that line into an input line. Conversely, clearing a bit
> +          will turn that line into an output.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum:

Why this is in any order? Other bindings were here specific, your 'reg'
is also specific/fixed.

> +        - dat
> +        - set
> +        - clr
> +        - dirout
> +        - dirin
> +
> +  native-endian: true
> +
> +  no-output:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If this property is present, the controller cannot drive the GPIO lines.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#gpio-cells'
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@1f300010 {
> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300010 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> +
> +    gpio@1f300014 {
> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300014 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      no-output;
> +    };

No need to duplicate examples. Keep only one. Everything is the same.


Best regards,
Krzysztof


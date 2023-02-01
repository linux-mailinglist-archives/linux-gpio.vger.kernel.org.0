Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF76685D0B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 03:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjBACGv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 21:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBACGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 21:06:50 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9244B75C;
        Tue, 31 Jan 2023 18:06:49 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id v24-20020a05683011d800b0068bdd29b160so1592476otq.13;
        Tue, 31 Jan 2023 18:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0haGgSjCQMn2MiEVJmkIrDh7Syiy8FDFeByatBgAR8=;
        b=VGrxoGm+sJMxzT9a9qswxLbOVJ3g7aHkwSrVl/Jk60TozfCNN/UZlIFXTn2RIW5h2i
         AIGlmyRbS1sTeLXtAJZnDT1AmTAnroFvhg50kY8NS6eCsoWu1djXpDHpwbcoHlRZ5Blq
         fIbkF3fg9kM2eV3hPf31HQ54m7+0je4SBzu15SWR7HKb8CeDAikEqbOSasPVZB/XfJ8Y
         DxEWEpm61/h3jG6vl82o5dhRPIbsaBNMAlu2Tp9656y5JpPX2b/fy/5YxcXjAZSBVoqY
         gWB9CNOAOf5sLJW7rt8dmQoZJt3bv7ZdMoHLr32ZnIKez7C37PMuU/mCC91tEk5oOT8W
         wrSA==
X-Gm-Message-State: AO0yUKU0K+Ap/TCFmUsX5Lw+wQHqvQ9cC1Ojto8lfxSEUUnB4pf1p33n
        RLiO7Vj3H0QrOgGMUk8FGQ==
X-Google-Smtp-Source: AK7set+4sb6nd6xIFd8MNV2tpKeR+7ihkEbAnwX5fpcAMz2dbi13lkSweEjyzomzaewFwqAsqRmAyg==
X-Received: by 2002:a05:6830:30a5:b0:68b:d40e:e21f with SMTP id g37-20020a05683030a500b0068bd40ee21fmr384560ots.34.1675217208900;
        Tue, 31 Jan 2023 18:06:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f88-20020a9d03e1000000b0068bcadcad5bsm4181956otf.57.2023.01.31.18.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 18:06:48 -0800 (PST)
Received: (nullmailer pid 2321407 invoked by uid 1000);
        Wed, 01 Feb 2023 02:06:47 -0000
Date:   Tue, 31 Jan 2023 20:06:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Message-ID: <20230201020647.GA2318275-robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 10:00:24PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson pinctrl binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> ---
>  .../pinctrl/amlogic,meson-pinctrl.yaml        | 122 ++++++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
>  2 files changed, 122 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
> new file mode 100644
> index 000000000..7aaae606b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson8-cbus-pinctrl
> +              - amlogic,meson8b-cbus-pinctrl
> +              - amlogic,meson8m2-cbus-pinctrl
> +              - amlogic,meson8-aobus-pinctrl
> +              - amlogic,meson8b-aobus-pinctrl
> +              - amlogic,meson8m2-aobus-pinctrl
> +              - amlogic,meson-gxbb-periphs-pinctrl
> +              - amlogic,meson-gxbb-aobus-pinctrl
> +              - amlogic,meson-gxl-periphs-pinctrl
> +              - amlogic,meson-gxl-aobus-pinctrl
> +              - amlogic,meson-axg-periphs-pinctrl
> +              - amlogic,meson-axg-aobus-pinctrl
> +              - amlogic,meson-g12a-periphs-pinctrl
> +              - amlogic,meson-g12a-aobus-pinctrl
> +              - amlogic,meson-a1-periphs-pinctrl
> +              - amlogic,meson-s4-periphs-pinctrl
> +      - items:
> +          - const: amlogic,meson8m2-aobus-pinctrl
> +          - const: amlogic,meson8-aobus-pinctrl
> +      - items:
> +          - const: amlogic,meson8m2-cbus-pinctrl
> +          - const: amlogic,meson8-cbus-pinctrl

Again, can't have both with and without the fallback allowed.

> +
> +  ranges: true
> +
> +  "#address-cells":
> +    enum: [1, 2]
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +required:
> +  - compatible
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties:
> +  anyOf:

Don't need anyOf.

> +    - type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +patternProperties:
> +  "^bank@[0-9]$":

Unit addresses are hex.

> +    type: object
> +    properties:
> +      reg:
> +        minItems: 5
> +        maxItems: 5
> +
> +      reg-names:
> +        items:
> +          - const: gpio
> +          - const: pull
> +          - const: pull-enable
> +          - const: mux
> +          - const: ds
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        $ref: /schemas/types.yaml#/definitions/phandle

Wrong type and gpio-ranges already has a type.

> +
> +    required:
> +      - reg
> +      - reg-names
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +
> +examples:
> +  - |
> +    pinctrl {
> +      compatible = "amlogic,meson-g12a-periphs-pinctrl";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      bank@40 {
> +        reg = <0x0 0x40  0x0 0x4c>,
> +              <0x0 0xe8  0x0 0x18>,
> +              <0x0 0x120 0x0 0x18>,
> +              <0x0 0x2c0 0x0 0x40>,
> +              <0x0 0x340 0x0 0x1c>;
> +        reg-names = "gpio", "pull", "pull-enable", "mux", "ds";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&periphs_pinctrl 0 0 86>;
> +      };
> +
> +      cec_ao_a_h_pins: cec_ao_a_h {
> +        mux {
> +          groups = "cec_ao_a_h";
> +          function = "cec_ao_a_h";
> +          bias-disable;
> +        };
> +      };
> +    };

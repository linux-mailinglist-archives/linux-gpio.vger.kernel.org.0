Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2210E645AB6
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 14:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiLGNVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 08:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiLGNV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 08:21:28 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEB41EAD1
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 05:21:26 -0800 (PST)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EA9BC44341
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1670419285;
        bh=5Fy8+G52z4/CaDFZeawpURrDotSj/z5PeZad0B3CFd8=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=sA+Tahxh3nX1vDKzBo+AIshYBkBn5Uf39K95irWs6aXv5MPqekElxPEh//x0/nN7J
         ax7WWXo8hw14dDy3f65N266IINrM/6k/OWA63Ah+vSLQGoQlBie049gZarNOnx5IZr
         PR61DCPe0gprrkuzUg6kgkHCsHJm014JgV5xiFf/AL7TTsAV7OmHz+sPk2FW5OalXM
         mlMCPIQfY85xjuGxX66U+SlkDhAjlMq0oevlQF8tbCi3xMSIlW3VUJm63yogxg01vw
         k0Nglb9sbU0Ka30IzlYbv2Igh1ebwi3BFg3M678rc4caDI0hSPJJbLk69h7KgjVewA
         AdHxpAb9BedAw==
Received: by mail-yb1-f200.google.com with SMTP id b17-20020a25b851000000b006e32b877068so19139789ybm.16
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 05:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fy8+G52z4/CaDFZeawpURrDotSj/z5PeZad0B3CFd8=;
        b=X5uw969IM1nfZl0wCLK56015dN7ZaeShQ278rSqCWlY333coTg6RHXn5IiYVQo4abE
         cwlS5mCwadqbBd0/mvIAuRIYHHGHDzUgMDRQSp3GBtpIrojr5YJJ6svK32CAEGjZvFsx
         TpERY/WKp6ml8KigSgLqANFEmiqXcYc6on2mz5BaUz9BASEyjJVZAe0ZRq8zbqdqQCQ3
         Jlj3apanG5zk74zmjSFSqngXm+u0E6veflPob6grU94LiXl2PT4Od2wxMYQEq9oZG3qN
         50YI1/4gl6rYWgCck/VcbaUwCuRilfj4jyeoAioqYI2jsBGJIUyeQdG3s783FCf+56iE
         PB9A==
X-Gm-Message-State: ANoB5pnXLeZdDGlfkKRYSBXJrgI1HKH/6STL8YbcQotE+aTL/cMmfVDV
        +IgmMtCcxgunM/tBBjlEnotJGMpYXpysK5cSSrpNKBKfQQ8fcH2AfR0tkxowkQNQTfl8s6zjY9Z
        uRj6G8N9PYyzbHj+BabA9ZMQ3HlO6PJEUIZk0J5VkRY4R21h4wooKWXU=
X-Received: by 2002:a05:690c:851:b0:378:5e3a:8fad with SMTP id bz17-20020a05690c085100b003785e3a8fadmr3504068ywb.78.1670419283343;
        Wed, 07 Dec 2022 05:21:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4dEsAOszSDho0u8YfNbcHyL/Cu47ytTETp59tYZGKkZJLswpRhnp6pWtRXOnnDD2vLgF89Nbs4i2sLQZ086ds=
X-Received: by 2002:a05:690c:851:b0:378:5e3a:8fad with SMTP id
 bz17-20020a05690c085100b003785e3a8fadmr3504041ywb.78.1670419283074; Wed, 07
 Dec 2022 05:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-4-hal.feng@starfivetech.com> <7f78e57a-d9be-b1e9-d161-40b1f66e3804@linaro.org>
 <05ade4a9-6ae2-6e3a-5223-270b24e6ea24@starfivetech.com>
In-Reply-To: <05ade4a9-6ae2-6e3a-5223-270b24e6ea24@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 7 Dec 2022 14:21:06 +0100
Message-ID: <CAJM55Z_Cr1ynK0oZ+p6EaLtc1OiZQTTbgx3N6SrM6eOt5rYrGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: pinctrl: Add StarFive JH7110 aon pinctrl
To:     Jianlong Huang <jianlong.huang@starfivetech.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 28 Nov 2022 at 02:15, Jianlong Huang
<jianlong.huang@starfivetech.com> wrote:
>
> On Mon, 21 Nov 2022 09:44:00 +0100, Krzysztof Kozlowski wrote:
> > On 18/11/2022 02:11, Hal Feng wrote:
> >> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> >>
> >> Add pinctrl bindings for StarFive JH7110 SoC aon pinctrl controller.
> >>
> >> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  .../pinctrl/starfive,jh7110-aon-pinctrl.yaml  | 134 ++++++++++++++++++
> >>  1 file changed, 134 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
> >> new file mode 100644
> >> index 000000000000..1dd000e1f614
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
> >> @@ -0,0 +1,134 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-aon-pinctrl.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: StarFive JH7110 Aon Pin Controller
> >> +
> >> +description: |
> >> +  Bindings for the JH7110 RISC-V SoC from StarFive Technology Ltd.
> >> +
> >> +  Out of the SoC's many pins only the ones named PAD_GPIO0 to PAD_GPIO4
> >> +  can be multiplexed and have configurable bias, drive strength,
> >> +  schmitt trigger etc.
> >> +  Some peripherals have their I/O go through the 4 "GPIOs". This also
> >> +  includes PWM.
> >> +
> >> +maintainers:
> >> +  - Jianlong Huang <jianlong.huang@starfivetech.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: starfive,jh7110-aon-pinctrl
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: control

Again this doesn't seem necessary when you only have 1 memory range.

> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  gpio-controller: true
> >> +
> >> +  "#gpio-cells":
> >> +    const: 2
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +    description: The GPIO parent interrupt.
> >
> > Same comments apply plus one more.
>
> Will fix, drop this description.
>
> >
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  "#interrupt-cells":
> >> +    const: 2
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reg-names
> >> +  - gpio-controller
> >> +  - "#gpio-cells"
> >> +  - interrupts
> >> +  - interrupt-controller
> >> +  - "#interrupt-cells"
> >
> > "required:" goes after patternProperties.
>
> Will fix.
>
> >
> >> +
> >> +patternProperties:
> >> +  '-[0-9]+$':
> >
> > Same comment.
>
> Will fix.
> Keep consistent quotes, use '
>
> >
> >> +    type: object
> >> +    patternProperties:
> >> +      '-pins$':
> >> +        type: object
> >> +        description: |
> >> +          A pinctrl node should contain at least one subnode representing the
> >> +          pinctrl groups available on the machine. Each subnode will list the
> >> +          pins it needs, and how they should be configured, with regard to
> >> +          muxer configuration, system signal configuration, pin groups for
> >> +          vin/vout module, pin voltage, mux functions for output, mux functions
> >> +          for output enable, mux functions for input.
> >> +
> >> +        properties:
> >> +          pinmux:
> >> +            description: |
> >> +              The list of GPIOs and their mux settings that properties in the
> >> +              node apply to. This should be set using the GPIOMUX macro.
> >> +            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pinmux"
> >> +
> >> +          bias-disable: true
> >> +
> >> +          bias-pull-up:
> >> +            type: boolean
> >> +
> >> +          bias-pull-down:
> >> +            type: boolean
> >> +
> >> +          drive-strength:
> >> +            enum: [ 2, 4, 8, 12 ]
> >> +
> >> +          input-enable: true
> >> +
> >> +          input-disable: true
> >> +
> >> +          input-schmitt-enable: true
> >> +
> >> +          input-schmitt-disable: true
> >> +
> >> +          slew-rate:
> >> +            maximum: 1
> >> +
> >> +        additionalProperties: false
> >> +
> >> +    additionalProperties: false
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/starfive-jh7110.h>
> >> +    #include <dt-bindings/reset/starfive-jh7110.h>
> >> +    #include <dt-bindings/pinctrl/pinctrl-starfive-jh7110.h>
> >> +
> >> +        soc {
> >> +                #address-cells = <2>;
> >> +                #size-cells = <2>;

Again these two lines can be dropped..

> >
> > Same comment.
>
> Will fix.
> Use 4 spaces for example indentation.
>
> >
> >> +
> >> +                gpioa: gpio@17020000 {
> >> +                        compatible = "starfive,jh7110-aon-pinctrl";
> >> +                        reg = <0x0 0x17020000 0x0 0x10000>;

..if you just change this to
reg = <0x17020000 0x10000>;

> >> +                        reg-names = "control";
> >> +                        resets = <&aoncrg_rst JH7110_AONRST_AON_IOMUX>;
> >> +                        interrupts = <85>;
> >> +                        interrupt-controller;
> >> +                        #interrupt-cells = <2>;
> >> +                        #gpio-cells = <2>;
> >> +                        gpio-controller;
> >> +                };
> >> +        };
> >> +
> >> +...
> >
>
> Best regards,
> Jianlong Huang
>
>

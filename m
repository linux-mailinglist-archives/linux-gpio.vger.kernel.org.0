Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 620EE571B3F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 15:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbiGLN3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 09:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbiGLN3y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 09:29:54 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18F09A5F3;
        Tue, 12 Jul 2022 06:29:52 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bx13so9889916ljb.1;
        Tue, 12 Jul 2022 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CWq6EQX6Req7u9p688T19ltu0flkauLZkn8CfIRgR8w=;
        b=g7CGYlvZyGPOJl5rD9IKRCC4MJfixQqIJn0Z167c2xOrNqawIkp6UKW/4smNmVHn6N
         mwTN9/Rt5vsXUza/Ni+hsfs7VA527n2qVg07FoBMzcfV/5cgP3hz4XWUGSjQSlDrXfS2
         DiP3f4uQXTOQMplPSlgF1wb/HtbByIJ7bnr28kd8LOZK5Nod/KWScDmUNAbQApE1pa7R
         pGQCsw8UCxnBGWYqWs/FoFj6aGm9eeR/Ddkrjn8MB8YsQdoKap4Dw7GZi+0nqy+2F52n
         OsCmzCSz7PnDcKQ335pr20jcq2UOgOl/vMSGFsX4qt3wz21MiYliSWj+n0qxs/uRnJKX
         sLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CWq6EQX6Req7u9p688T19ltu0flkauLZkn8CfIRgR8w=;
        b=iUELQJaOib5iMxTRy6zTSuDjT2CKkf/5BF7WMYYmM5iFLAfD6SDMLvagtHQJE9WtE1
         1DFZvUSI2RM3NN3hcjoyRl+ViQ1WlGY/SNCml4ff7zdUIb8CaX3cXxNC9tJqJt9d+J2/
         ZitryqMokuBB/nNkE4axzFCFQbOC2mGky5RIPDhm2j/0iBGidDA5iB7/FxRi2dL5IL0U
         38309Q4ymu5DuoP9b4jK95hBOWq1cSEybxNaa90+8F36wmKbALpV7fQV8acNH9KLshps
         cgTYMv4B+jQH9rcc3ArZN3YWKNsitl7rZpSNvPe/pN8xi03qWCnwmSLn0CQ9OdN9pYEr
         Fpjg==
X-Gm-Message-State: AJIora8RSXDpAvfyRig+XE/sRwEj/WiOZ0cBU7Z0uvYioB51ZgwSFcLb
        jobUloKVc/e5PN5Hu095DpWBTDPpp2uyyy4m2pE=
X-Google-Smtp-Source: AGRyM1s8h4lPwZ/wfc3Dj3oCPa4DMsPpXQNpqSG7LIKOz1Q4KOQ7VA6t1t9zVcuWqxu33ffL5EEnTcsDHky28rtUoRQ=
X-Received: by 2002:a2e:bd13:0:b0:246:1ff8:6da1 with SMTP id
 n19-20020a2ebd13000000b002461ff86da1mr13026094ljq.219.1657632589727; Tue, 12
 Jul 2022 06:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220710102110.39748-1-tmaimon77@gmail.com> <20220710102110.39748-2-tmaimon77@gmail.com>
 <8b1393e4-275b-6791-ad71-2edfeacd0a63@linaro.org>
In-Reply-To: <8b1393e4-275b-6791-ad71-2edfeacd0a63@linaro.org>
From:   Tomer Maimon <tmaimon77@gmail.com>
Date:   Tue, 12 Jul 2022 16:29:38 +0300
Message-ID: <CAP6Zq1iuMPD21dM7Gpg4AEfM1cqE1mFhnO5hhUWvDZvEz=rTqw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        zhengbin13@huawei.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

Thanks for your comments.

On Tue, 12 Jul 2022 at 12:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/07/2022 12:21, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton Arbel BMC NPCM8XX
> > pinmux and GPIO controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 205 ++++++++++++++++++
> >  1 file changed, 205 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..6395ef2bf5b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> > @@ -0,0 +1,205 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton NPCM845 Pin Controller and GPIO
> > +
> > +maintainers:
> > +  - Tomer Maimon <tmaimon77@gmail.com>
> > +
> > +description:
> > +  The Nuvoton BMC NPCM8XX Pin Controller multi-function routed through
> > +  the multiplexing block, Each pin supports GPIO functionality (GPIOx)
> > +  and multiple functions that directly connect the pin to different
> > +  hardware blocks.
> > +
> > +properties:
> > +  compatible:
> > +    const: nuvoton,npcm845-pinctrl
> > +
> > +  ranges:
> > +    maxItems: 1
>
> ranges without reg? Does it even work? Did you test the bindings?
The ranges related to GPIO node reg

I did test the pin controller document and it passed.
bash-4.2$ make ARCH=arm64 dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTEX    Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dts
  DTC     Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dtb
  CHECK   Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dtb
Did I need to run anything else than dt_binding_check for testing the document?
>
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 1
> > +
> > +patternProperties:
> > +  "^gpio@":
> > +    type: object
> > +
> > +    description:
> > +      Eight GPIO banks that each contain between 32 GPIOs.
> > +
> > +    properties:
> > +
>
> No blank line.
O.K.
>
> > +      gpio-controller: true
> > +
> > +      '#gpio-cells':
> > +        const: 2
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      gpio-ranges:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - gpio-controller
> > +      - '#gpio-cells'
> > +      - reg
> > +      - interrupts
> > +      - gpio-ranges
> > +
> > +  "-pin":
> > +    $ref: pinmux-node.yaml#
>
> Shouldn't this be under bank?
Do you mean after the group and function properties?
The -pin shouldn't use for the group property naming?
>
> > +
> > +    properties:
> > +      groups:
> > +        description:
> > +          One or more groups of pins to mux to a certain function
> > +        items:
> > +          enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
> > +                  smb5b, smb5c, lkgpo0, pspi2, jm1, jm2, smb4den, smb4b,
> > +                  smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
> > +                  smb22, smb23, smb4d, smb14, smb5, smb4, smb3, spi0cs1,
> > +                  spi0cs2, spi0cs3, smb3c, smb3b, bmcuart0a, uart1, jtag2,
> > +                  bmcuart1, uart2, bmcuart0b, r1err, r1md, r1oen, r2oen,
> > +                  rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3, fanin4,
> > +                  fanin5, fanin6, fanin7, fanin8, fanin9, fanin10, fanin11,
> > +                  fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2, pwm3,
> > +                  r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg1,
> > +                  rg1mdio, rg2, ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5,
> > +                  smb0, smb1, smb2, smb2c, smb2b, smb1c, smb1b, smb8, smb9,
> > +                  smb10, smb11, sd1, sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8,
> > +                  pwm9, pwm10, pwm11, mmc8, mmc, mmcwp, mmccd, mmcrst, clkout,
> > +                  serirq, lpcclk, scipme, sci, smb6, smb7, spi1, faninx, r1,
> > +                  spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b,
> > +                  smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2, smb12,
> > +                  smb13, spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3,
> > +                  hgpio4, hgpio5, hgpio6, hgpio7 ]
> > +
> > +      function:
> > +        description:
> > +          The function that a group of pins is muxed to
> > +        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
> > +                smb5b, smb5c, lkgpo0, pspi2, jm1, jm2, smb4den, smb4b,
> > +                smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
> > +                smb22, smb23, smb4d, smb14, smb5, smb4, smb3, spi0cs1,
> > +                spi0cs2, spi0cs3, smb3c, smb3b, bmcuart0a, uart1, jtag2,
> > +                bmcuart1, uart2, bmcuart0b, r1err, r1md, r1oen, r2oen,
> > +                rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3, fanin4,
> > +                fanin5, fanin6, fanin7, fanin8, fanin9, fanin10, fanin11,
> > +                fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2, pwm3,
> > +                r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg1,
> > +                rg1mdio, rg2, ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5,
> > +                smb0, smb1, smb2, smb2c, smb2b, smb1c, smb1b, smb8, smb9,
> > +                smb10, smb11, sd1, sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8,
> > +                pwm9, pwm10, pwm11, mmc8, mmc, mmcwp, mmccd, mmcrst, clkout,
> > +                serirq, lpcclk, scipme, sci, smb6, smb7, spi1, faninx, r1,
> > +                spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b,
> > +                smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2, smb12,
> > +                smb13, spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3,
> > +                hgpio4, hgpio5, hgpio6, hgpio7 ]
> > +
> > +    dependencies:
> > +      groups: [ function ]
> > +      function: [ groups ]
> > +
> > +    additionalProperties: false
> > +
> > +  "^pin":
>
> This is almost the same as previous property. Confusing and I think it
> does not work.
if I remove it I get the following error:
pinctrl@f0800000: 'pin34-slew' does not match any of the regexes:
'-pin', '^gpio@', 'pinctrl-[0-9]+'
Can you advise what I should do?
>
> > +    $ref: pincfg-node.yaml#
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          A list of pins to configure in certain ways, such as enabling
> > +          debouncing
> > +
> > +      bias-disable: true
> > +
> > +      bias-pull-up: true
> > +
> > +      bias-pull-down: true
> > +
> > +      input-enable: true
> > +
> > +      output-low: true
> > +
> > +      output-high: true
> > +
> > +      drive-push-pull: true
> > +
> > +      drive-open-drain: true
> > +
> > +      input-debounce:
> > +        description:
> > +          Debouncing periods in microseconds, one period per interrupt
> > +          bank found in the controller
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 4
> > +
> > +      slew-rate:
> > +        description: |
> > +          0: Low rate
> > +          1: High rate
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +
> > +      drive-strength:
> > +        enum: [ 0, 1, 2, 4, 8, 12 ]
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - ranges
> > +  - '#address-cells'
> > +  - '#size-cells'
>
> Missing allOf with ref to pinctrl.yaml.
Do you mean adding
allOf:
  - $ref: "pinctrl.yaml#"
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      pinctrl: pinctrl@f0800000 {
> > +        compatible = "nuvoton,npcm845-pinctrl";
> > +        ranges = <0x0 0x0 0xf0010000 0x8000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        gpio0: gpio@f0010000 {
> > +          gpio-controller;
> > +          #gpio-cells = <2>;
> > +          reg = <0x0 0xB0>;
> > +          interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > +          gpio-ranges = <&pinctrl 0 0 32>;
> > +        };
> > +
> > +        fanin0_pin: fanin0-pin {
> > +          groups = "fanin0";
> > +          function = "fanin0";
> > +        };
> > +
> > +        pin34_slew: pin34-slew {
>
> and how does it pass your checks?
Yes
>
> Did you test the bindings?
>
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer

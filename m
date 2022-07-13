Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055EC5739B6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236870AbiGMPHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 11:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236868AbiGMPH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 11:07:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6834E86B;
        Wed, 13 Jul 2022 08:06:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e28so15954414lfj.4;
        Wed, 13 Jul 2022 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=elIsK7TKydLbL37a1dHX3rQ4kE/AdcakLGrQyY48fMQ=;
        b=K79+JVedEsBB4R64WdTQEUzq+4gB/P98GFaDFXwfhkDN1RS5cDYxJ55P51I2ZUUBdo
         N8U+R9yfnf+4XPTrQz8ZRzcD1Lq5uSJs3lFJ10Fv66JIjwpjYpnWuObY2o08YsrFcMXf
         rJjcZhLpu5n7ZGLBLv2metouxWgqY/wbV8/ygn/xf8MMFemxRLl+FrRJwWVS4nY+jgEW
         0OXK0OTwFQBaeyAJWPoAe+FDD0BmmmG02ZN3xGYtqtDkIFkDqvH8HJPFLYQ/NVgI4WoA
         mdo1Q8i9alDAhporhPVmaZWi4AC94H60AF8H4M4xmJJssky5R74YU7rRTh2FSdNlpQeb
         xVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=elIsK7TKydLbL37a1dHX3rQ4kE/AdcakLGrQyY48fMQ=;
        b=VS2pM9ukG9VeOm69oICqvoMUG2zpEm1TpvEewFRVyZ/Af6YepT+h8ECaSuFwDTam+3
         0jOYOt3sv+PkqNGqwA+oDD2fnsovQ6bOXyCsCpWHEf/8G4nsVrarP9UUURO/Ij2y7jPe
         bNYTRTxw32o5p1VV7KaeOthZTrCKv5wzmFtFEbEZVhy51rEHeRSnWPi4tZLqWc0LTdMm
         2pWR1IhxvqXwDU2xn8hSoSHZD02kJzLY8q2cFSW3qQJYWgGro/6Ls9+NmNu+DLkKkQgt
         9rtmV4LbegNiD4Gd28n8WJ9ye7IWqL7j0JT/bqCgdk3UkhfETobI/DmYYuV4o4MUk6vP
         y0Tg==
X-Gm-Message-State: AJIora+iu2qqYVNaPLTMVQU2kPZgGGzPFkaHY6+BccMASQ0v/Jvcqnwo
        Lmkdlk6l3Q7nDXsv/tV9MNrBwqK5nXa4sCpBM1A=
X-Google-Smtp-Source: AGRyM1vRBUJbU9eA1YvfUVXJYlPoeqAtG6MSip66r3o3aAfc+uBD+Bfru3mtoOF9lj3r3WeIhyNPd1w+phpqrVWjZ94=
X-Received: by 2002:ac2:4897:0:b0:489:f2ad:1191 with SMTP id
 x23-20020ac24897000000b00489f2ad1191mr2179805lfc.25.1657724799507; Wed, 13
 Jul 2022 08:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220710102110.39748-1-tmaimon77@gmail.com> <20220710102110.39748-2-tmaimon77@gmail.com>
 <8b1393e4-275b-6791-ad71-2edfeacd0a63@linaro.org> <CAP6Zq1iuMPD21dM7Gpg4AEfM1cqE1mFhnO5hhUWvDZvEz=rTqw@mail.gmail.com>
 <4ffc1060-671e-cbec-a100-5e26f1957eeb@linaro.org> <CAP6Zq1igaQhM79sUqTLdiH3WZiEG52Pva9k0g_A-BibAJKfm=Q@mail.gmail.com>
 <5dec7907-9cab-6735-4775-142aeede185e@linaro.org>
In-Reply-To: <5dec7907-9cab-6735-4775-142aeede185e@linaro.org>
From:   Tomer Maimon <tmaimon77@gmail.com>
Date:   Wed, 13 Jul 2022 18:06:28 +0300
Message-ID: <CAP6Zq1jvvUW6OL6diKQ3sW=sr7fsXiSCPd-zRrwpLp8-+Z62UQ@mail.gmail.com>
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

Thanks for your clarifications.

On Tue, 12 Jul 2022 at 23:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/07/2022 20:44, Tomer Maimon wrote:
> > Hi Krzysztof,
> >
> > Thanks for your clarifications.
> >
> > On Tue, 12 Jul 2022 at 16:45, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 12/07/2022 15:29, Tomer Maimon wrote:
> >>> Hi Krzysztof,
> >>>
> >>> Thanks for your comments.
> >>>
> >>> On Tue, 12 Jul 2022 at 12:48, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 10/07/2022 12:21, Tomer Maimon wrote:
> >>>>> Added device tree binding documentation for Nuvoton Arbel BMC NPCM8XX
> >>>>> pinmux and GPIO controller.
> >>>>>
> >>>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>>>> ---
> >>>>>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 205 ++++++++++++++++++
> >>>>>  1 file changed, 205 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..6395ef2bf5b3
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> >>>>> @@ -0,0 +1,205 @@
> >>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-pinctrl.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: Nuvoton NPCM845 Pin Controller and GPIO
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Tomer Maimon <tmaimon77@gmail.com>
> >>>>> +
> >>>>> +description:
> >>>>> +  The Nuvoton BMC NPCM8XX Pin Controller multi-function routed through
> >>>>> +  the multiplexing block, Each pin supports GPIO functionality (GPIOx)
> >>>>> +  and multiple functions that directly connect the pin to different
> >>>>> +  hardware blocks.
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: nuvoton,npcm845-pinctrl
> >>>>> +
> >>>>> +  ranges:
> >>>>> +    maxItems: 1
> >>>>
> >>>> ranges without reg? Does it even work? Did you test the bindings?
> >>> The ranges related to GPIO node reg
> >>
> >> But you do not allow here a 'reg', do you? So how can you have an unit
> >> address in pinctrl node?
> > I allow the reg unit address in the GPIO node.
> > This is why reg is in the GPIO node as follow:
> >
> >                 compatible = "nuvoton,npcm845-pinctrl";
> >                 ranges = <0x0 0x0 0xf0010000 0x8000>;
> >                 #address-cells = <1>;
> >                 #size-cells = <1>;
> >                 status = "okay";
> >                 gpio0: gpio@f0010000 {
> >                         gpio-controller;
> >                         #gpio-cells = <2>;
> >                         reg = <0x0 0xB0>;
> >                         interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> >                         gpio-ranges = <&pinctrl 0 0 32>;
> >                 };
> >                 gpio1: gpio@f0011000 {
> >                         gpio-controller;
> >                         #gpio-cells = <2>;
> >                         reg = <0x1000 0xB0>;
> >                         interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> >                         gpio-ranges = <&pinctrl 0 32 32>;
> >                 };
> >                 gpio2: gpio@f0012000 {
> >                         gpio-controller;
> >                         #gpio-cells = <2>;
> >                         reg = <0x2000 0xB0>;
> >                         interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> >                         gpio-ranges = <&pinctrl 0 64 32>;
> >                 };
> > ...
> > Is it problematic?
>
>
> It seems not, looks ok because of ranges, although it is a bit confusing
> that your pinctrl unit address is 0xf0800000 but ranges is 0xf0010000.
The reason the pinctrl address 0xf0800000 because the pin mux is
handled by the GCR registers and the ranges related to the GPIO.
>
> >>
> >>>
> >>> I did test the pin controller document and it passed.
> >>> bash-4.2$ make ARCH=arm64 dt_binding_check
> >>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> >>>   LINT    Documentation/devicetree/bindings
> >>>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> >>>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >>>   DTEX    Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dts
> >>>   DTC     Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dtb
> >>>   CHECK   Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dtb
> >>> Did I need to run anything else than dt_binding_check for testing the document?
> >>
> >> Indeed it will pass, because you do not have reg in pinctrl node. But
> >> your dts won't pass make dtbs W=1
> > After running make ARCH=arm64 dtbs W=1 I don't see warning related to pinctrl
> > bash-4.2$ make ARCH=arm64 dtbs W=1
> >   DTC     arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb
> > arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:69.7-183.5:
> > Warning (unit_address_vs_reg): /ahb/apb: node has a reg or ranges
> > property, but no unit name
> > arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts:20.9-22.4: Warning
> > (unit_address_vs_reg): /memory: node has a reg or ranges property, but
> > no unit name
> > arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:69.7-183.5:
> > Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format
> > error, expected "f0000000"
> > arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:56.35-61.5:
> > Warning (unique_unit_address): /ahb/reset-controller@f0801000:
> > duplicate unit-address (also used in node
> > /ahb/clock-controller@f0801000)
> > I did got warning but it dont related to the pinctrl, Maybe I didn't
> > run the test correct?
>
> Looks correct, indeed.
>
> Best regards,
> Krzysztof

Best regards,

Tomer

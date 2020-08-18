Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CC2247F07
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 09:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgHRHKZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 03:10:25 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44036 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgHRHKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 03:10:21 -0400
Received: by mail-oi1-f196.google.com with SMTP id h3so17067002oie.11;
        Tue, 18 Aug 2020 00:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pWu2reKsehPk8O8QMwZqkq9HDhUpVFSdtfnM5vROwk=;
        b=AOAqb6NH5LV67MEzG9T8C37bvwcfBSiwRSMZ1V+UPfTmx9O+qduxNIz61FvOnZ44ZB
         Aq7q7eds/PWj61uqrkEPlZrs4FPmL9+zV8fe6phiuzuAHRkVAHKGhnhrvM0Y7WWQQMYI
         mX75pHl1NzSuvVXQOR07bU/mFU+pE33sJaLM6SNT7VhaPGeRu3l/VkBOEwiSHUr1Topu
         D99Pvpr2JVaAq5LszmhnjNF31OyvGvMyM0iRedLQFbJd58q87xq8rH1gJb/xjbsqoHb9
         sptDa5FzkOQ3L7+asp5O0AHREOKn39sWnG+wg29IyCEbmVk1KMeHjUSGQQQ1iEncTSOM
         RiYA==
X-Gm-Message-State: AOAM5319lfDXOk0b/JHaYMQCoLz/miafD+qaeCzdLAB20Pc6277qF2ie
        BQXGtSt69RO5uxJI0y7VrrTbht89Kh9caACAHus=
X-Google-Smtp-Source: ABdhPJxlHpP9CutWWQ1WzZHFEX/kpODzKDecPSPVsGDlyQEZuovKBMm9EgyXUP0kzZUH0FPOVGAX2J+x5TrpOAvPnrs=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr11504104oie.153.1597734619692;
 Tue, 18 Aug 2020 00:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200807141345.6714-1-geert+renesas@glider.be> <20200817233253.GA1819982@bogus>
In-Reply-To: <20200817233253.GA1819982@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Aug 2020 09:10:08 +0200
Message-ID: <CAMuHMdV-NVycDcPggYw4-pvSkkwo079bUevA2yB3XM5YfHi9mg@mail.gmail.com>
Subject: Re: [PATCH/RFC v2] dt-bindings: pinctrl: sh-pfc: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Tue, Aug 18, 2020 at 1:32 AM Rob Herring <robh@kernel.org> wrote:
> On Fri, Aug 07, 2020 at 04:13:45PM +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas Pin Function Controller (PFC) Device Tree binding
> > documentation to json-schema.
> >
> > Document missing properties.
> > Drop deprecated and obsolete #gpio-range-cells property.
> > Update the example to match reality.
> > Drop consumer examples, as they do not belong here.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Still RFC, due to the FIXMEs near the enum descriptions.
> > If I enable the enums checks, I get e.g.:
> >
> >     [[1800]] is not one of [1800, 3300]
> >
> > Note the double square brackets around 1800.
> > The usual error message doesn't have them, e.g.:
> >
> >     2000 is not one of [1800, 3300]
> >
> > So this looks like a bug in the tooling?
>
> Yes, we only recently started supporting schemas under
> 'additionalProperties', but failed to apply fixups.
>
> I have a fix I'm testing out. I'm bumping the version requirement in
> 5.10, so I'll make sure it is there.

Thanks, looking forward to it.

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml

> > +  interrupts-extended:
>
> Just use 'interrupts' here. 'interrupt-extended' is always magically
> supported.

Apparently not everywhere...

    Documentation/devicetree/bindings/pinctrl/renesas,pfc.example.dt.yaml:
pin-controller@e6050000: 'interrupts' is a required property

Hence I kept it in both places, for consistency.

Cfr. https://lore.kernel.org/linux-gpio/CAMuHMdWSPDQBABXZVaPecETbSRsP2yyZXLHiL_+_R2n_-09jRg@mail.gmail.com/

> > +additionalProperties:
> > +  anyOf:
> > +    - type: object
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +
> > +      description:
> > +        Pin controller client devices use pin configuration subnodes (children
> > +        and grandchildren) for desired pin configuration.
> > +        Client device subnodes use below standard properties.
> > +
> > +      properties:
> > +        phandle: true
>
> Once fixed, this won't be necessary.

OK.

> > +        function: true
> > +        groups: true
> > +        pins: true
> > +        bias-disable: true
> > +        bias-pull-down: true
> > +        bias-pull-up: true
> > +        drive-strength:
> > +          true # FIXME enum: [ 3, 6, 9, 12, 15, 18, 21, 24 ] # Superset of supported values
> > +          # avb:pins_mdio:drive-strength: [[24]] is not one of [3, 6, 9, 12, 15, 18, 21, 24]
> > +        power-source:
> > +          true # FIXME enum: [ 1800, 3300 ]
> > +          # sd0_uhs:power-source: [[1800]] is not one of [1800, 3300]
> > +        gpio-hog: true
> > +        gpios: true
> > +        input: true
> > +        output-high: true
> > +        output-low: true
> > +
> > +      additionalProperties: false
> > +
> > +    - type: object
> > +      properties:
> > +        phandle: true
>
> For this one, you can just link it back to the first entry:
>
> - type: object
>   additionalProperties:
>     $ref: "#/additionalProperties/anyOf/0"

Thanks, cool!

> > +examples:
> > +  - |
> > +    pfc: pin-controller@e6050000 {
>
> Because we're been really consistent ( :( ):
>
> pinctrl@...

Oh, I had never noticed that was added in devicetree-specification-v0.2.pdf.
Yes, consistency... everything else is *-controller ;-)

Will fix.

>
> > +            compatible = "renesas,pfc-sh73a0";
> > +            reg = <0xe6050000 0x8000>, <0xe605801c 0x1c>;
> > +            gpio-controller;
> > +            #gpio-cells = <2>;
> > +            gpio-ranges =
> > +                <&pfc 0 0 119>, <&pfc 128 128 37>, <&pfc 192 192 91>,
> > +                <&pfc 288 288 22>;
> > +            interrupts-extended =
> > +                <&irqpin0 0 0>, <&irqpin0 1 0>, <&irqpin0 2 0>, <&irqpin0 3 0>,
> > +                <&irqpin0 4 0>, <&irqpin0 5 0>, <&irqpin0 6 0>, <&irqpin0 7 0>,
> > +                <&irqpin1 0 0>, <&irqpin1 1 0>, <&irqpin1 2 0>, <&irqpin1 3 0>,
> > +                <&irqpin1 4 0>, <&irqpin1 5 0>, <&irqpin1 6 0>, <&irqpin1 7 0>,
> > +                <&irqpin2 0 0>, <&irqpin2 1 0>, <&irqpin2 2 0>, <&irqpin2 3 0>,
> > +                <&irqpin2 4 0>, <&irqpin2 5 0>, <&irqpin2 6 0>, <&irqpin2 7 0>,
> > +                <&irqpin3 0 0>, <&irqpin3 1 0>, <&irqpin3 2 0>, <&irqpin3 3 0>,
> > +                <&irqpin3 4 0>, <&irqpin3 5 0>, <&irqpin3 6 0>, <&irqpin3 7 0>;
> > +            power-domains = <&pd_c5>;
>
> child and grandchild nodes exercising the above schema and issues would
> be good here.

Good idea, will add.  I'll probably have to replace the example completely,
as SH73A0 doesn't support drive-strength and power-source.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

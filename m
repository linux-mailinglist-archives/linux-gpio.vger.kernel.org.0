Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448B124B8A8
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Aug 2020 13:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbgHTLZe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Aug 2020 07:25:34 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:42045 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgHTKGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2020 06:06:42 -0400
Received: by mail-oo1-f67.google.com with SMTP id a6so283925oog.9;
        Thu, 20 Aug 2020 03:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7+CSk1ksXzy7e0WIknvr7+ji8pZUrOi3fj0VsGs4weY=;
        b=EXA02wWQsI5YuePA3VIgOVGGfySn9Nyv6KRdADkev9beQf15igej8ZcJYwdAqafunl
         0nsIU5GeAzT41tL22DqSVj4gQIu5wBPfuXQ7IETeOb8grj+SsQi+wQhqdPFXqGiAfH6N
         Ttvqnk082JjN2O+MoPp92mbjJX8IxjFpAsJctnAwLaYKwtJYQjIBXMjtWu3NCsqp30Tr
         rNWJb41EQnLC/jWn/D5C3yJtaik8lb2S8nKgiSbHxydfmsntX7uJ9fkW8+j03ouQdR3m
         TecMTKvVw8NY7VAV9NrjaFfjOMPHX5cZ2mwlVZ6JAOtTMerYKbsSMBY2cxiU38z2M8gC
         UEZQ==
X-Gm-Message-State: AOAM533/sBcqedcM2+5wXRGK25XzmS3U+kk0LaYQ0ZYIPWH9w5dOwWvS
        vC4KIEnasnMf+U30xZNwp9OwUBkqpL1iqX7W0RQ=
X-Google-Smtp-Source: ABdhPJzLpZOD1rs1p3nBtT5EFxS48HiVxoTkLH06KtZW1eQSDDDuEahrzdmBlpsHmdngJPIb1mx3MtQK7PAdAm1yD5w=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr1818497ooj.1.1597918001038;
 Thu, 20 Aug 2020 03:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200807141345.6714-1-geert+renesas@glider.be>
 <20200817233253.GA1819982@bogus> <CAMuHMdV-NVycDcPggYw4-pvSkkwo079bUevA2yB3XM5YfHi9mg@mail.gmail.com>
In-Reply-To: <CAMuHMdV-NVycDcPggYw4-pvSkkwo079bUevA2yB3XM5YfHi9mg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Aug 2020 12:06:29 +0200
Message-ID: <CAMuHMdWGu5+PYiYR9rdt97Hd1ribi0Yc0q68NBU6AFRBDCCg_g@mail.gmail.com>
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

On Tue, Aug 18, 2020 at 9:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Aug 18, 2020 at 1:32 AM Rob Herring <robh@kernel.org> wrote:
> > On Fri, Aug 07, 2020 at 04:13:45PM +0200, Geert Uytterhoeven wrote:
> > > Convert the Renesas Pin Function Controller (PFC) Device Tree binding
> > > documentation to json-schema.
> > >
> > > Document missing properties.
> > > Drop deprecated and obsolete #gpio-range-cells property.
> > > Update the example to match reality.
> > > Drop consumer examples, as they do not belong here.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Still RFC, due to the FIXMEs near the enum descriptions.
> > > If I enable the enums checks, I get e.g.:
> > >
> > >     [[1800]] is not one of [1800, 3300]
> > >
> > > Note the double square brackets around 1800.
> > > The usual error message doesn't have them, e.g.:
> > >
> > >     2000 is not one of [1800, 3300]
> > >
> > > So this looks like a bug in the tooling?
> >
> > Yes, we only recently started supporting schemas under
> > 'additionalProperties', but failed to apply fixups.
> >
> > I have a fix I'm testing out. I'm bumping the version requirement in
> > 5.10, so I'll make sure it is there.
>
> Thanks, looking forward to it.

I can confirm this is fixed in v2020.08.1.

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
>
> > > +  interrupts-extended:
> >
> > Just use 'interrupts' here. 'interrupt-extended' is always magically
> > supported.
>
> Apparently not everywhere...
>
>     Documentation/devicetree/bindings/pinctrl/renesas,pfc.example.dt.yaml:
> pin-controller@e6050000: 'interrupts' is a required property

The existing fixup doesn't handle "required: interrupts"  if that is inside an
if/then/else block.

> > > +additionalProperties:
> > > +  anyOf:
> > > +    - type: object
> > > +      allOf:
> > > +        - $ref: pincfg-node.yaml#
> > > +        - $ref: pinmux-node.yaml#
> > > +
> > > +      description:
> > > +        Pin controller client devices use pin configuration subnodes (children
> > > +        and grandchildren) for desired pin configuration.
> > > +        Client device subnodes use below standard properties.
> > > +
> > > +      properties:
> > > +        phandle: true
> >
> > Once fixed, this won't be necessary.
>
> OK.

Seems to be still an issue in v2020.08.1?

> > > +        function: true
> > > +        groups: true
> > > +        pins: true
> > > +        bias-disable: true
> > > +        bias-pull-down: true
> > > +        bias-pull-up: true
> > > +        drive-strength:
> > > +          true # FIXME enum: [ 3, 6, 9, 12, 15, 18, 21, 24 ] # Superset of supported values
> > > +          # avb:pins_mdio:drive-strength: [[24]] is not one of [3, 6, 9, 12, 15, 18, 21, 24]
> > > +        power-source:
> > > +          true # FIXME enum: [ 1800, 3300 ]
> > > +          # sd0_uhs:power-source: [[1800]] is not one of [1800, 3300]
> > > +        gpio-hog: true
> > > +        gpios: true
> > > +        input: true
> > > +        output-high: true
> > > +        output-low: true
> > > +
> > > +      additionalProperties: false
> > > +
> > > +    - type: object
> > > +      properties:
> > > +        phandle: true
> >
> > For this one, you can just link it back to the first entry:
> >
> > - type: object
> >   additionalProperties:
> >     $ref: "#/additionalProperties/anyOf/0"
>
> Thanks, cool!

Works great!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

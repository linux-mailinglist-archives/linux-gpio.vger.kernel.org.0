Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7DF23EE50
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Aug 2020 15:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgHGNhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Aug 2020 09:37:14 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44167 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgHGNhM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Aug 2020 09:37:12 -0400
Received: by mail-ot1-f68.google.com with SMTP id h22so1574149otq.11;
        Fri, 07 Aug 2020 06:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J44MR7fnREWFikV0B417NzGJrCU1jtFI1zOdoOpVzoU=;
        b=jc5pMFsPG8CIHkWD+Q0HjtkDM6OoXi/RiIU3J/092hCKE4Nady7oEwUEZfdKJworGJ
         7hzsiWZXxo8WNh2oCUyNwdM9xG1+x5LkSZXn34Yt5jPnKMDTK/ElNlOkkKwSI8W2y/ZH
         PtO8P9gx2nSOSdzBSQSjFhvXvnaSUij3hrBNiPFfwd2ISSM0bbzR95hBo4hE2BefyHAJ
         QRVB2+HIfK0Fvdi5wdlgU6GmAZ2w2zSg2JcwOvhRUmR6hfY0NKnnnNxok/DejHcHFMpn
         7kprdeYVbcInpQb5eVyTnqJY5rwVwQqHyMn2BW5inSKSCEROX5/rWqIh4o3YbvwnNcsj
         wLxg==
X-Gm-Message-State: AOAM532+jmrEXYHKect2/zP4dpFMAcsUTZYpAq6Sw7lcs+1/kMt0D//F
        K236S0GhbjeEA2zAvRnVFwnlnyWvM8HPwF9zShQ=
X-Google-Smtp-Source: ABdhPJwafn0EQZaoR3TYnh1FhNdc6aBGm7a0d+hS9M2QCMy4MOn+llZ4cz0+MLff0cZgTShD75DW+6jOu4NPU5if2to=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr11805393otn.250.1596807430961;
 Fri, 07 Aug 2020 06:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200417140920.22596-1-geert+renesas@glider.be> <20200430023237.GA23316@bogus>
In-Reply-To: <20200430023237.GA23316@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Aug 2020 15:36:59 +0200
Message-ID: <CAMuHMdWSPDQBABXZVaPecETbSRsP2yyZXLHiL_+_R2n_-09jRg@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: sh-pfc: Convert to json-schema
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

On Thu, Apr 30, 2020 at 4:32 AM Rob Herring <robh@kernel.org> wrote:
> On Fri, Apr 17, 2020 at 04:09:20PM +0200, Geert Uytterhoeven wrote:
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
> > How to describe that pin configuration nodes can have subnodes?
> > E.g.
> >
> >     arch/arm/boot/dts/sh73a0-kzm9g.dt.yaml: pin-controller@e6050000: mmc: Additional properties are not allowed ('cfg', 'mux' were unexpected)
>
> I shouldn't tell you so no one does this again...

Note that this is fairly common, as a device may need to configure
multiple groups or pins, or pinmux and GPIO pins.  Hence the grouping
under a container node.

Cfr. Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

> I think you want something like this assuming you have either
> grandchildren or properties, but not both in the child nodes:
>
> patternProperties:
>   ".*":

[...]

I couldn't get it to work with "patternProperties", but using
"additionalProperties" like ingenic,pinctrl.yaml does work for me.

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml

> > +  interrupts-extended:
>
> Just do 'interrupts'. It's fixed up in the tooling.

Apparently not everywhere...

> > +if:
> > +  properties:
> > +    compatible:
> > +      items:
> > +        enum:
> > +          - renesas,pfc-r8a73a4
> > +          - renesas,pfc-r8a7740
> > +          - renesas,pfc-sh73a0
> > +then:
> > +  required:
> > +    - interrupts-extended

I have to keep it here, or I get:

    Documentation/devicetree/bindings/pinctrl/renesas,pfc.example.dt.yaml:
pin-controller@e6050000: 'interrupts' is a required property

So I'll keep it in both places, for consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

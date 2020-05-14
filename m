Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D8D1D3E52
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 22:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgENUBG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 16:01:06 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44616 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgENUBG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 16:01:06 -0400
Received: by mail-ot1-f65.google.com with SMTP id j4so37397otr.11;
        Thu, 14 May 2020 13:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PtBjkIGGxXDp1dHFJEjYfiWUY2P5QlsKo/K6/+WZmeY=;
        b=eRLUE4rvRcOHfERfQ/lZ1rp8Kk//qNdCk4bS2xoOhfNO5mIntyKzTVA1Ew4NEPbqll
         Z9Xp/obclZWi7Rp8ZkJWnI40MuL/JroOONIWQ3nXX17Ik0xrhHlp8+icT4xbqol+nGG2
         wyHt6VeTrarxUE3nWZYnrDC90la4CRI3f76nNCy/F0dr7Tobz3XX4F/z44r9E8SPGR1r
         NCBRJhVH4t/cyHUR6WVUYzlH/VJnE++5Aq9t7nfgoU+qwF2NCK0ffxo8V3TT03M2bGns
         efQnrPDQqMiZyu1ayC39UUJAcEf4tuOgT5p26XiynCL178rf1RL27Vgd3IwFD0QuO0w5
         vV0Q==
X-Gm-Message-State: AOAM532+LP+Ow5o84UFzRHCjQ/WL+gkAC6gY/oXaZMrd6GDDH462NWkj
        8+JloxnL0KveMpiodaoOpCDwSFn/rQZtNOrNdJI=
X-Google-Smtp-Source: ABdhPJxlL7bOKztMOeZJClvcFRKGEuvOXp/eLE3eVPuXdamQTY6erD7PmPjlCxeaUKv6T7vSuweVf114QyJxq2E0ayI=
X-Received: by 2002:a9d:564:: with SMTP id 91mr4920155otw.250.1589486465222;
 Thu, 14 May 2020 13:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200417140920.22596-1-geert+renesas@glider.be> <20200430023237.GA23316@bogus>
In-Reply-To: <20200430023237.GA23316@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 May 2020 22:00:53 +0200
Message-ID: <CAMuHMdUySoqH+uCQrOVCQm9YU5h0F0JwZaPT5291Mo5bb8-Oxg@mail.gmail.com>
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
>
> I think you want something like this assuming you have either
> grandchildren or properties, but not both in the child nodes:
>
> patternProperties:
>   ".*":
>     if:
>       type: object
>     then:
>       oneOf:
>         - allOf:
>             - $ref: pincfg-node.yaml#
>             - $ref: pinmux-node.yaml#
>           ...
>         - patternProperties:
>             ".*":
>               type: object
>               allOf:
>                 - $ref: pincfg-node.yaml#
>                 - $ref: pinmux-node.yaml#

Thanks, sounds sane!
As there are phandles pointing to the child node, I do need an explicit
phandle property in the child node...

> If you did have a mixture, then you'd need the same if/then construct.

... so I have a mixture, and do need the if/then construct.
However, that gives me "is valid under each of" errors for all  child nodes
of sh-pfc nodes.

As both child and grandchild do not have any required properties, I
tried adding some, but that didn't help.

Do you have a clue? For reference, this is what I ended up with:

patternProperties:
  "^.*$":
    if:
      type: object
    then:
      oneOf:
        - allOf:
            - $ref: pincfg-node.yaml#
            - $ref: pinmux-node.yaml#
          description:
            Pinctrl node's client devices use subnodes for desired pin
            configuration.
            Client device subnodes use below standard properties.

          properties:
            phandle: true
            pins: true
            groups: true
            function: true
            bias-disable: true
            bias-pull-down: true
            bias-pull-up: true
            drive-strength:
              enum: [ 3, 6, 9, 12, 15, 18, 21, 24 ] # Superset of
supported values
            power-source:
              enum: [ 1800, 3300 ]
            gpio-hog: true
            gpios: true
            input: true
            output-high: true
            output-low: true

          additionalProperties: false

        - properties:
            phandle: true

          patternProperties:
            "^.*$":
              if:
                type: object
              then:
                allOf:
                  - $ref: pincfg-node.yaml#
                  - $ref: pinmux-node.yaml#
                description:
                  Pinctrl node's client devices use subnodes for desired pin
                  configuration.
                  Client device subnodes use below standard properties.

                properties:
                  pins: true
                  groups: true
                  function: true
                  bias-disable: true
                  bias-pull-down: true
                  bias-pull-up: true
                  drive-strength:
                    enum: [ 3, 6, 9, 12, 15, 18, 21, 24 ] # Superset
of supported values
                  power-source:
                    enum: [ 1800, 3300 ]
                  gpio-hog: true
                  gpios: true
                  input: true
                  output-high: true
                  output-low: true

                additionalProperties: false

          additionalProperties: false

> Now it probably ends up that the 'allOf' and everything else with it are
> duplicated. If so you can do:
>
> definitions:
>   pin-nodes:
>     allOf:
>     ...
>
> And use '$ref: #/definitions/pin-nodes' where you need it.
>
> That probably is not going to work with the fixups the tooling does, but
> we could fix that.

Obviously I haven't tried this part yet, but I'll keep it in mind.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

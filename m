Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0B738C487
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhEUKZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:25:24 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:42537 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhEUKZX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 06:25:23 -0400
Received: by mail-vs1-f52.google.com with SMTP id j12so5049654vsq.9;
        Fri, 21 May 2021 03:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07JcO3CRBM1HaXZjYTRFNn1m7ZvE1K/0YDoSBc48cOA=;
        b=DCR55WXLVvbEc2gYXHvo216Z7lt4UsQ5SqxlA1beSinb3WoIzabDzXfUyzWw7kYZyi
         6dgls0Vy9ebfJNDl4XQHzUwy8zxpNiMtQscsnRsFpDdYrmGxvuYbKqVGE4m8vi4dUQN4
         DnzA5jKxOHefpY5yL8pD2JoUDbZKR2eic70gRYbgbnoeE/p2JfKOryH9sgI4Wj3/FFwt
         3eOOeMKhlAXwcbD98c4CnqcChSLtG7YE28hrcZ+2CmlETsNpV1OupnLXEfKkfD7XENTE
         FB3KeZtTzu4xK9TNwVzAZFVwl+vdAlNxIJlHliOfadqkFsTlg19RogEbgBJ2BzqcW7Wo
         9wfQ==
X-Gm-Message-State: AOAM530SL8hFXYQwqyUQkBfrY3Se9HrTxpxEivxY4y99e77peRMvMp8g
        HX8i9KO7go1HC9YKGoBSke4ZttpYe0Q0ioh0o6trfRrM+4M=
X-Google-Smtp-Source: ABdhPJyT4gwI8EtwVgoM5wwCrEysIqEoC18HpnH5bpZlayQihXs9cyrp/kDJFN3CX1Upp0Aj9A5c3Ip+YMLH51kO8wk=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr9583479vsq.40.1621592638872;
 Fri, 21 May 2021 03:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621583562.git.geert+renesas@glider.be> <52df0592c81ac000d3f486a9ba5a4d84b0f42c47.1621583562.git.geert+renesas@glider.be>
 <CACRpkdbQE1-WgD_BBkHx9DvJ=GfW7-PCoF-73TKGpgh4c6Epxw@mail.gmail.com>
In-Reply-To: <CACRpkdbQE1-WgD_BBkHx9DvJ=GfW7-PCoF-73TKGpgh4c6Epxw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 12:23:47 +0200
Message-ID: <CAMuHMdUqAwTSJuPXxJWgXGX1Hb=WLR3QtEm+RuhbyivFA5fUKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: pcf857x: Convert to json-schema
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, May 21, 2021 at 12:04 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, May 21, 2021 at 9:54 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Convert the PCF857x-compatible I/O expanders Device Tree binding
> > documentation to json-schema.
> >
> > Document missing compatible values, properties, and gpio hogs.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> (...)
> > Perhaps the "ti,pcf8575" construct should be removed, and the few users
> > fixed instead?
>
> You would rather list it as deprecated I think?
> It is ABI...

All DTS files use the "nxp,pcf8575" fallback, except for
arch/x86/platform/ce4100/falconfalls.dts.
The latter ain't working with Linux, as the Linux driver doesn't
match against "ti,pcf8575"...

> > +  gpio-controller: true
>
> So this is implicitly using the generic schema in
> /dtschema/schemas/gpio/gpio.yaml

if you leave it out:

    Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml: ignoring,
error in schema: properties
    warning: no schema found in file:
Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
    Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml:
properties: 'gpio-controller' is a dependency of '#gpio-cells'
    from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#

> > +  lines-initial-states:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Bitmask that specifies the initial state of each line.
> > +      When a bit is set to zero, the corresponding line will be initialized to
> > +      the input (pulled-up) state.
> > +      When the  bit is set to one, the line will be initialized to the
> > +      low-level output state.
> > +      If the property is not specified all lines will be initialized to the
> > +      input state.
>
> Is this something we standardized or something that should
> actually be a custom "nxp," property we just missed it?
> (Looks like the latter... oh well, now it is there.)

Too late for an "nxp," prefix.
See the NOTE in drivers/gpio/gpio-pcf857x.c:

        /* NOTE:  these chips have strange "quasi-bidirectional" I/O pins.
         * We can't actually know whether a pin is configured (a) as output
         * and driving the signal low, or (b) as input and reporting a low
         * value ... without knowing the last value written since the chip
         * came out of reset (if any).  We can't read the latched output.
         *
         * In short, the only reliable solution for setting up pin direction
         * is to do it explicitly.  The setup() method can do that, but it
         * may cause transient glitching since it can't know the last value
         * written (some pins may need to be driven low).
         *
         * Using n_latch avoids that trouble.  When left initialized to zero,
         * our software copy of the "latch" then matches the chip's all-ones
         * reset state.  Otherwise it flags pins to be driven low.
         */

> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > +    type: object
>
> But this is already in
> /dtschema/schemas/gpio/gpio-hog.yaml
> for nodename, isn't that where it properly belongs?
>
> I'm however confused here Rob will know what to do.

If we leave this out, something still has to refer to it?
I see no other binding doing that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

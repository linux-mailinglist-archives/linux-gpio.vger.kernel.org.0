Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2EC39312F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 16:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236496AbhE0Op2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 27 May 2021 10:45:28 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:39920 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234476AbhE0Op1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 10:45:27 -0400
Received: by mail-ua1-f50.google.com with SMTP id f20so330512uax.6;
        Thu, 27 May 2021 07:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mrubqU354Bw50F6NhJan1ixpgJfHonbN1b5m4Qiwgio=;
        b=dEJ6rhKBTaObD7d0Lo828vL5ojAKRBNhjvScfDvspKbdVeLBneqDmhIr4SNz9Cy2Y8
         qBH24780dG5saxyDxrw7Q/OCY1H7Dxix9k8Vh1l22+z2Rig/4EStOR1yoYjW8iwQQ4le
         oDMGk3RC/LMaZ222y4D3cSKmFEKGYE2p0hG9ZEPslB2wfJ4Wvr3n8MLBrjcHPx64kso+
         hXbtEzT4tt6CsihbWVaOBuaVty/JH0MDcryuziqwdzfYtlLTCmX6JsHWkximY2pgqRxQ
         ubjHP65tUFUY4O4c1IBOh8Q0w4PRjX3BzPXhk5InCSdJi5RGL/m9VE9+W7sxtSr5Fuui
         v+cw==
X-Gm-Message-State: AOAM5326N2mI2ydwLoj1NCropEHGe9g8RvIDk3g4Zf8YF6QgjUuD419i
        zREW9qB/PpOrNq4KaZMdDsPd4nIxc89nEGOvIow=
X-Google-Smtp-Source: ABdhPJxbQEybwWGbInGZt3HUnlN6JAN7z8azG8ldl9Rc665+8ANZ8MQfrKZ9bI9VbY2xg+l//EvVWH257GMEDN8MfPs=
X-Received: by 2002:a05:6122:3c:: with SMTP id q28mr2430647vkd.5.1622126632870;
 Thu, 27 May 2021 07:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621583562.git.geert+renesas@glider.be> <52df0592c81ac000d3f486a9ba5a4d84b0f42c47.1621583562.git.geert+renesas@glider.be>
 <YKm1Z4/xULSzuoVV@pendragon.ideasonboard.com>
In-Reply-To: <YKm1Z4/xULSzuoVV@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 16:43:41 +0200
Message-ID: <CAMuHMdWwj7rwxmBX5CC+Qjnmkp1W+imXm1q5PXRZrm7ZB7jtMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: pcf857x: Convert to json-schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Laurent,

On Sun, May 23, 2021 at 3:52 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, May 21, 2021 at 09:54:08AM +0200, Geert Uytterhoeven wrote:
> > Convert the PCF857x-compatible I/O expanders Device Tree binding
> > documentation to json-schema.
> >
> > Document missing compatible values, properties, and gpio hogs.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Perhaps the "ti,pcf8575" construct should be removed, and the few users
> > fixed instead?
>
> Given that the driver doesn't match against it, that could be done, if
> you're confident enough that there's no difference between the TI and
> NXP versions that would need to be taken into account.

I've just checked the datasheets, and they're identical modulo
shuffling.  Probably TI is the mandatory second source for the NXP
(née Philips) part.

> > I have listed Laurent as the maintainer, as he wrote the original
> > bindings.  Laurent: Please scream if this is inappropriate ;-)
>
> I'm sure I'll regret it later, but I don't mind :-)

Thanks!

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
> The line wrapping is weird.

Is it? The different cases just start on a new line.  Which makes no
difference, as there's no "|".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

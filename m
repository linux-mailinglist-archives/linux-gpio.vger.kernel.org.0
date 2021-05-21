Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEFB38CD54
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 20:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbhEUSZf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 14:25:35 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:37792 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238940AbhEUSZ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 14:25:29 -0400
Received: by mail-ot1-f43.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so18850139otp.4;
        Fri, 21 May 2021 11:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M4QX6algtyH9gp6amFadSRByvGetkxKzfRSL1H+K+/U=;
        b=dZEBWLB7i97uJhGOXEvv+Z/vHAvr4LJkatbPmPWfo/GQ8XvCwDhG4UOWGxg2jlD++V
         ZpeUOr+k+5/npqypz1v9csH6VnwysvYTGUzmhQXP9efbSlIL/PRa07SWVILopE5hcKZk
         EzqhcrYHEQCRPSuEP9d4Nu/jbapjEYmYiqbVIplvm9PpEKIcoVsTTl0y6N88+uNMMyg/
         JW1tNyjzZf8dikHsp88q5sDK6Y1UNlxDbYegDQxYnKUmaZ5bi2PcWDt28a0APf8wVXQH
         v0BNkbTciYpFGiurSDdb4nJv1Pf3NFqtB4rrfOkI/LTd3Y+/smuVwhb+l9xC0wwm+0SS
         uCWw==
X-Gm-Message-State: AOAM532OrtSH9UmJ9EDhraO6gun2LWIOct1MWA/aU5daHle7YBiarL1N
        LlDQ/RKlz6t7PZzZ9gAjdE+/JO+dOw==
X-Google-Smtp-Source: ABdhPJwUvx6WTekj9uYPxR7A/4oGbDYAgyfdI2nVf7dJuc994Lp+MYYuUcF7UyWjvLf9ApJ6oufM3A==
X-Received: by 2002:a9d:51c7:: with SMTP id d7mr9244199oth.51.1621621445985;
        Fri, 21 May 2021 11:24:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t26sm1442453otc.23.2021.05.21.11.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 11:24:05 -0700 (PDT)
Received: (nullmailer pid 151912 invoked by uid 1000);
        Fri, 21 May 2021 18:24:03 -0000
Date:   Fri, 21 May 2021 13:24:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: pcf857x: Convert to json-schema
Message-ID: <20210521182403.GA50332@robh.at.kernel.org>
References: <cover.1621583562.git.geert+renesas@glider.be>
 <52df0592c81ac000d3f486a9ba5a4d84b0f42c47.1621583562.git.geert+renesas@glider.be>
 <CACRpkdbQE1-WgD_BBkHx9DvJ=GfW7-PCoF-73TKGpgh4c6Epxw@mail.gmail.com>
 <CAMuHMdUqAwTSJuPXxJWgXGX1Hb=WLR3QtEm+RuhbyivFA5fUKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqAwTSJuPXxJWgXGX1Hb=WLR3QtEm+RuhbyivFA5fUKA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 12:23:47PM +0200, Geert Uytterhoeven wrote:
> Hi Linus,
> 
> On Fri, May 21, 2021 at 12:04 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Fri, May 21, 2021 at 9:54 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Convert the PCF857x-compatible I/O expanders Device Tree binding
> > > documentation to json-schema.
> > >
> > > Document missing compatible values, properties, and gpio hogs.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > (...)
> > > Perhaps the "ti,pcf8575" construct should be removed, and the few users
> > > fixed instead?
> >
> > You would rather list it as deprecated I think?
> > It is ABI...
> 
> All DTS files use the "nxp,pcf8575" fallback, except for
> arch/x86/platform/ce4100/falconfalls.dts.
> The latter ain't working with Linux, as the Linux driver doesn't
> match against "ti,pcf8575"...

Perhaps can it just be removed?

> 
> > > +  gpio-controller: true
> >
> > So this is implicitly using the generic schema in
> > /dtschema/schemas/gpio/gpio.yaml
> 
> if you leave it out:
> 
>     Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml: ignoring,
> error in schema: properties
>     warning: no schema found in file:
> Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
>     Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml:
> properties: 'gpio-controller' is a dependency of '#gpio-cells'
>     from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
> 
> > > +  lines-initial-states:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Bitmask that specifies the initial state of each line.
> > > +      When a bit is set to zero, the corresponding line will be initialized to
> > > +      the input (pulled-up) state.
> > > +      When the  bit is set to one, the line will be initialized to the
> > > +      low-level output state.
> > > +      If the property is not specified all lines will be initialized to the
> > > +      input state.
> >
> > Is this something we standardized or something that should
> > actually be a custom "nxp," property we just missed it?
> > (Looks like the latter... oh well, now it is there.)
> 
> Too late for an "nxp," prefix.
> See the NOTE in drivers/gpio/gpio-pcf857x.c:
> 
>         /* NOTE:  these chips have strange "quasi-bidirectional" I/O pins.
>          * We can't actually know whether a pin is configured (a) as output
>          * and driving the signal low, or (b) as input and reporting a low
>          * value ... without knowing the last value written since the chip
>          * came out of reset (if any).  We can't read the latched output.
>          *
>          * In short, the only reliable solution for setting up pin direction
>          * is to do it explicitly.  The setup() method can do that, but it
>          * may cause transient glitching since it can't know the last value
>          * written (some pins may need to be driven low).
>          *
>          * Using n_latch avoids that trouble.  When left initialized to zero,
>          * our software copy of the "latch" then matches the chip's all-ones
>          * reset state.  Otherwise it flags pins to be driven low.
>          */
> 
> > > +patternProperties:
> > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > > +    type: object
> >
> > But this is already in
> > /dtschema/schemas/gpio/gpio-hog.yaml
> > for nodename, isn't that where it properly belongs?
> >
> > I'm however confused here Rob will know what to do.

This one is a bit odd.

> If we leave this out, something still has to refer to it?
> I see no other binding doing that...

It's selected by 'gpio-hog' being present, but here you need to make 
sure that's the case.

And I would hope you could define the node name to be just 1 of the 2 
cases.

Rob

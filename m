Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB5C3931AE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 17:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236731AbhE0PGI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 11:06:08 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:40930 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236752AbhE0PGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 11:06:05 -0400
Received: by mail-ua1-f50.google.com with SMTP id j2so366363uak.7;
        Thu, 27 May 2021 08:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3u3wWCo2lZGWRYWR5pjnSvnC6obG/x9fym7jnlVxBcM=;
        b=Sc/vgWF+lrjo11x3BduoHAVSi0bsJNjDff17iQWzJa+qVOhm1uy6+IU5BsPffJRjo1
         IvoIJkM1xrD61vXLD25AWFSbmSrBxXRboepZAYExcvSu0iZXtT3pBf6ZC7FZKesyzmNQ
         6CPuK48gLMYu/7IyNk2VB5SIerokpLN3UuxnODQHY7DMVeYpcpcLL6+QaEDPRrGt58g1
         PsgpYRN8ZtZt4jX04mz9MF0fxl2FJ9QOmo6FRguJMXbbxDzBM5hAur6D2ZytHTMMhdNs
         6ioxOATVS2pT9ee8qKVqbYKRno85GoGNgCjCwazB0HEFhXabspCHgGZmuz+P2DCNMHRc
         RS/g==
X-Gm-Message-State: AOAM531Jw9gbiUjn7aJrjPOHFSxFe9YuM1wX2YLfCk5NoNS5tTq0x1MG
        pq+KTx5sS+TKwy30TooTGe/UzURo52pkqcnLlxz/4sklMtE=
X-Google-Smtp-Source: ABdhPJzHaOLJBSw3gQx+wVzMZyw1XojcblD4dymCtSozCyRiE6ryYMrpQjtlVbuuU6nXtCljn2TrB5YZmEsVQ/NaFAQ=
X-Received: by 2002:ab0:7705:: with SMTP id z5mr2806791uaq.2.1622127871092;
 Thu, 27 May 2021 08:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621583562.git.geert+renesas@glider.be> <52df0592c81ac000d3f486a9ba5a4d84b0f42c47.1621583562.git.geert+renesas@glider.be>
 <CACRpkdbQE1-WgD_BBkHx9DvJ=GfW7-PCoF-73TKGpgh4c6Epxw@mail.gmail.com>
 <CAMuHMdUqAwTSJuPXxJWgXGX1Hb=WLR3QtEm+RuhbyivFA5fUKA@mail.gmail.com> <20210521182403.GA50332@robh.at.kernel.org>
In-Reply-To: <20210521182403.GA50332@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 17:04:19 +0200
Message-ID: <CAMuHMdWvK6+GybGKc0MBn3qxJk_JQ8dOe1-3vfiezeZmNmzkxQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: pcf857x: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

Hi Rob,

On Fri, May 21, 2021 at 8:24 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, May 21, 2021 at 12:23:47PM +0200, Geert Uytterhoeven wrote:
> > On Fri, May 21, 2021 at 12:04 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Fri, May 21, 2021 at 9:54 AM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Convert the PCF857x-compatible I/O expanders Device Tree binding
> > > > documentation to json-schema.
> > > >
> > > > Document missing compatible values, properties, and gpio hogs.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > (...)
> > > > Perhaps the "ti,pcf8575" construct should be removed, and the few users
> > > > fixed instead?
> > >
> > > You would rather list it as deprecated I think?
> > > It is ABI...
> >
> > All DTS files use the "nxp,pcf8575" fallback, except for
> > arch/x86/platform/ce4100/falconfalls.dts.
> > The latter ain't working with Linux, as the Linux driver doesn't
> > match against "ti,pcf8575"...

Correction: i2c_device_id-based matching ignores the vendor part
of the compatible value.  One day this is gonna bite us...

> Perhaps can it just be removed?

I think so.  All other users of similar I2C GPIO expanders just
use the compatible values of the original NXP parts.

> > > > +patternProperties:
> > > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > > > +    type: object
> > >
> > > But this is already in
> > > /dtschema/schemas/gpio/gpio-hog.yaml
> > > for nodename, isn't that where it properly belongs?
> > >
> > > I'm however confused here Rob will know what to do.
>
> This one is a bit odd.
>
> > If we leave this out, something still has to refer to it?
> > I see no other binding doing that...
>
> It's selected by 'gpio-hog' being present, but here you need to make
> sure that's the case.

OK. Fixed.

> And I would hope you could define the node name to be just 1 of the 2
> cases.

Yep, the latter is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

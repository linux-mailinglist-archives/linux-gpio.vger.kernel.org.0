Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495233681BE
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 15:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236663AbhDVNqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 09:46:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236630AbhDVNqO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Apr 2021 09:46:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D67961474;
        Thu, 22 Apr 2021 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619099140;
        bh=QC3KXdIOSNGgOkLCWo6id3fbWhn2ss9tO650jBq63qw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OUbbidoWGeMGpfyc2ufUGAuQwe0SiS+syanVdru5ACXVf9WARPL0JbAgIaThNGT4m
         mzn/EMcd7KFdezBnTtEkqc9PzIdKJKtuz9GW8AQtqUUB7NcErtqNNR7gG5LFgaUK/v
         w10al5zOIjVCJ5Tks8MK1cwf1oxZ14iweBChy23hYAkiIyigUbA8oJYE/7X8fCm3xV
         vuUa7sgneFZqYYZ+mwJr82CSkkGY2FqaWGUQxC7Nc8dA3XG2XbeSFZDpEj3Q5BldtL
         gCaQKfjy3Sm1tKsw15JzIQAxpG2R/DNRHMOjfi0cyNlUy7I+liUMl0qCVLhc8TvZwv
         dOcwGyyDUipMw==
Received: by mail-ej1-f51.google.com with SMTP id n2so68844338ejy.7;
        Thu, 22 Apr 2021 06:45:39 -0700 (PDT)
X-Gm-Message-State: AOAM5321hrdtVN+geJm4p8mixZIwkO3HR5M3bJrzMzeG69I273OtsEJv
        P+Ec//mpN8K6Uxamd9wVGnYpnbJIozlxMthBdA==
X-Google-Smtp-Source: ABdhPJxIlMzmWBvc+z6zFDoc9ubJY2LolnfwvLV7lxx8HXJUVpYJphrB8gnVMSg12DRcl7Uk7hOw6eTurfA9jo8tYHA=
X-Received: by 2002:a17:906:7806:: with SMTP id u6mr3321658ejm.130.1619099138450;
 Thu, 22 Apr 2021 06:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210421162026.41978-1-tsbogend@alpha.franken.de>
 <20210421162026.41978-2-tsbogend@alpha.franken.de> <20210421171727.GA1310436@robh.at.kernel.org>
 <20210421173924.GA15599@alpha.franken.de>
In-Reply-To: <20210421173924.GA15599@alpha.franken.de>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 22 Apr 2021 08:45:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLPCUni0tSybpGzqo7GRh5pfc4iUx=bWkygq+GnSDGo2A@mail.gmail.com>
Message-ID: <CAL_JsqLPCUni0tSybpGzqo7GRh5pfc4iUx=bWkygq+GnSDGo2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 12:40 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Apr 21, 2021 at 12:17:27PM -0500, Rob Herring wrote:
> > On Wed, Apr 21, 2021 at 06:20:26PM +0200, Thomas Bogendoerfer wrote:
> > > Add YAML devicetree binding for IDT 79RC3243x GPIO controller
> > >
> > > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > ---
> > >  .../bindings/gpio/gpio-idt3243x.yaml          | 73 +++++++++++++++++++
> >
> > Use compatible string for filename.
>
> ok
>
> > >  1 file changed, 73 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> > > new file mode 100644
> > > index 000000000000..346a57ef8298
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> > > @@ -0,0 +1,73 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/gpio-idt3243x.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: IDT 79RC32434x GPIO controller
> > > +
> > > +maintainers:
> > > +  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: idt,3243x-gpio
> >
> > What's the 'x'? Generally, we don't do wildcards for compatible strings.
>
> there are 3 different SoCs 79rc32434, 79rc32435 and 79rc32438. So should
> I add 3 compatible strings and use the first as filename ?

Kind of depends on the differences. If it is just fuse or packaging
differences between them, then probably okay to use the same
compatible. If the block is maybe the same, but not certain, then then
you can make the oldest a fallback (e.g. compatible =
"idt,32435-gpio", "idt,32434-gpio").

Either the first/oldest or a wildcard is fine for the filename.

Rob

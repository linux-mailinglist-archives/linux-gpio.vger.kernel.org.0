Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83893A9ED7
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 17:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234118AbhFPPXF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 11:23:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234002AbhFPPXF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 11:23:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C64161375;
        Wed, 16 Jun 2021 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623856859;
        bh=27eUZzjv41JFT/kKzRpcOFEIMGKaONkaM9MTgUB4lvc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=buypIobsBvwFCoYyKG42xHmi6qlL+WknZA0yV9zcssR1qukECIItvMs5lYF24rq39
         7G2rK+9x62EOIbBxA0GYsKblM2k/E/zY2ttt9SmAeF7mvexO/3Tz9FULTJZ4xZ8hQp
         qo21npzZcH3m2VJR+PEzbRav27lgret3OHmHLrMa+yzTf6uyIS2u06r0IfJ8J87NEX
         OqsnNy+LYpdR4X0lEw0DFSgZR3N9ejKQ6K068cLLxzaz7UHmmGuIxDDU53pfou+Y7I
         7PxjBInaO0mwtN8Ezuk56bJ2wt0T5Z4h3v7InClBkLr24pCiSYHUhSE/RiPZV2v6m+
         JY0BVpsRsnbVg==
Received: by mail-ej1-f46.google.com with SMTP id gt18so4491497ejc.11;
        Wed, 16 Jun 2021 08:20:59 -0700 (PDT)
X-Gm-Message-State: AOAM5319eO8cG75H/8uYamndOULFyyErZais8PlVoSTjOLana1TnjBwa
        rjaRFRhYxc2qqxkxtffs1dJdMJmbZy5+VesZ+Q==
X-Google-Smtp-Source: ABdhPJwVu+BsUV7DzrQnvv679MoG3zGD601vblw0HBeBpWUI8BezJDE8UWYZlHYd9yj6WnDUi1/TfNk1GXKkgoaWTXw=
X-Received: by 2002:a17:907:2059:: with SMTP id pg25mr76098ejb.130.1623856857816;
 Wed, 16 Jun 2021 08:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-3-steven_lee@aspeedtech.com> <20210610162320.GA1910317@robh.at.kernel.org>
 <f639f1bb-fe53-4c15-a6dd-91b45ea7eef1@www.fastmail.com>
In-Reply-To: <f639f1bb-fe53-4c15-a6dd-91b45ea7eef1@www.fastmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 16 Jun 2021 09:20:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ_nwwyCBDg9p+AnriKw=9dC0WmLCw7dcz6qA87hRAu5g@mail.gmail.com>
Message-ID: <CAL_JsqJ_nwwyCBDg9p+AnriKw=9dC0WmLCw7dcz6qA87hRAu5g@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: aspeed-sgpio: Add ast2600 sgpio compatibles.
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Steven Lee <steven_lee@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 5:27 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 11 Jun 2021, at 01:53, Rob Herring wrote:
> > On Tue, Jun 08, 2021 at 06:25:37PM +0800, Steven Lee wrote:
> > > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another o=
ne
> > > with 80 pins. Add ast2600-sgpiom0-80 and ast2600-sgpiom-128 compatibl=
es
> > > and update descriptions to introduce the max number of available gpio
> > > pins that AST2600 supported.
> > >
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 9 ++++++-=
--
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml=
 b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > > index b2ae211411ff..0e42eded3c1e 100644
> > > --- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > > @@ -10,9 +10,10 @@ maintainers:
> > >    - Andrew Jeffery <andrew@aj.id.au>
> > >
> > >  description:
> > > -  This SGPIO controller is for ASPEED AST2500 SoC, it supports up to=
 80 full
> > > -  featured Serial GPIOs. Each of the Serial GPIO pins can be program=
med to
> > > -  support the following options
> > > +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 S=
oC,
> > > +  AST2600 have two sgpio master one with 128 pins another one with 8=
0 pins,
> > > +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Se=
rial
> > > +  GPIO pins can be programmed to support the following options
> > >    - Support interrupt option for each input port and various interru=
pt
> > >      sensitivity option (level-high, level-low, edge-high, edge-low)
> > >    - Support reset tolerance option for each output port
> > > @@ -25,6 +26,8 @@ properties:
> > >      enum:
> > >        - aspeed,ast2400-sgpio
> > >        - aspeed,ast2500-sgpio
> > > +      - aspeed,ast2600-sgpiom-80
> > > +      - aspeed,ast2600-sgpiom-128
> >
> > If the number of GPIOs is the only difference, then I don't think you
> > should get rid of ngpios. It's one thing if it varies from one SoC to
> > the next, but if something is per instance we should have a property.
> >
>
> There are two issues:
>
> 1. The maximum number of GPIOs supported by the controller
> 2. The maximum number of GPIOs supported by the platform
>
> These are different because of what the controller does - here's some pre=
vious discussion on the topic:
>
> https://lore.kernel.org/linux-gpio/f2875111-9ba9-43b7-b2a4-d00c8725f5a0@w=
ww.fastmail.com/
>
> We've used ngpios to describe 2; this decision was made prior to the 2600=
 design - the SGPIO controller for both the 2400 and 2500 supported a maxim=
um of 80 GPIOs. With the 2600 we have to differentiate between the two SGPI=
O controllers because they support a different maximum number of GPIOs. The=
 proposed approach of different compatibles keeps the behaviour of ngpios t=
he same across all controller implementations.

Okay, that makes sense.

Reviewed-by: Rob Herring <robh@kernel.org>

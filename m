Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46869298557
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 02:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419393AbgJZBeR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Oct 2020 21:34:17 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47607 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1419379AbgJZBeR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 25 Oct 2020 21:34:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id A6C4A580366;
        Sun, 25 Oct 2020 21:34:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Sun, 25 Oct 2020 21:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=oLqCGkVxUyCN8ZI7GlPMtX4fYGxBLJX
        KLhqMOJPqSkI=; b=A3zdjZnlvWtGcmly78TCkHioFlt12memCak2EVM1XUd5FMT
        hlRX/0C9otvfWrApLGanyl1qMXOFNuOMbGWYuQ/pbHy9ops6ITSXxFjoPD/HalCY
        nK6tal9qUwj6w7fIdIwgguTgaiSK8TLTduDifEhFcHIzaZQFH7dv7mgq2S18nPEb
        9d7aScM06TTfbWUWaD/zbsmPYW94+acZAx119ZFZUHOfmZMtB2GqW14DGQ/fEw6I
        PaH94wImQGobxNNoJOWIhPbOmqYPWnQiBGHa1IrFgRdPiHKXSGWKmJXwwUK27vTX
        O5tYpEPh/4YYhdyyKeaewslH1W0Pb8OB9yvpfqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oLqCGk
        VxUyCN8ZI7GlPMtX4fYGxBLJXKLhqMOJPqSkI=; b=Qbp4D9e8PrBdK4qvrCOe8S
        zZ4r/IKlwvc3fADPsHqI7dzjrcUfURG/ZTZqJcWk+exY7xINUw+WccqSWE63GKyx
        +Vei2axP3ghOI5YE8IN+r6QDra7mglRPqrWnbhghVKqrxOPVLBVUCjBaEOjCBZg5
        9nxXaP2ZSsO0aOAFC2vG4KxSZ3rF2ArhdK/XzWnn8oGBkOLrDRz50m33fghS+ENL
        Wb87OYiDP3ouJzZJeVmP/efydGA/4IIzu1ay1TudZ0sRfD3qzlgXBRfV40KoU7Kl
        lucv00TUxKwTtgFhcgjKRgU505fqPM8mtoLM8cDmAMpFvI5nMOPrA8tn7b/ln9dw
        ==
X-ME-Sender: <xms:lyeWX8B9F2YgMB1REMJjuBXrUGGS6gtWrY8aNBI86PrA5DCma4zcCg>
    <xme:lyeWX-gm8Uej4-sZPaCSdlYOu4YiSRBD5nW6HO5zTNVA7du8Ih7bVtUmFJ1hpZRL5
    lxm3p1JXYPl9g1Ezw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:lyeWX_lY4k9Ll47gGsWGKrzGfhq_yuNqIKxEd13ehgdN1F0a-BAJ_Q>
    <xmx:lyeWXywEv5dQ0GfRN9OwAnI_I7Zs-wEsrIxWFvIAE7NlVCJ0Q-qnhw>
    <xmx:lyeWXxQT6HYlenMu9k3CAvrhS22IKf91lUe2f--iqsd81YjAqyzSCw>
    <xmx:lyeWX--HjYYXKgsQ0OrGjp-BdPLLFy_iQb4jfJ2XofDAKiMKHTSRTA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 476B1E050B; Sun, 25 Oct 2020 21:34:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <8625b8b4-4b3b-49ce-b35c-5de3920dc5eb@www.fastmail.com>
In-Reply-To: <CACPK8XdYvSmwdAkBzAO3kC8_PYa3CtPkNb0VxcOhmb2UYz5zDA@mail.gmail.com>
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-3-billy_tsai@aspeedtech.com>
 <CACPK8XdYvSmwdAkBzAO3kC8_PYa3CtPkNb0VxcOhmb2UYz5zDA@mail.gmail.com>
Date:   Mon, 26 Oct 2020 12:03:54 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc:     "Rob Herring" <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 2/3] Arm: dts: aspeed-g6: Add sgpio node
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Mon, 12 Oct 2020, at 15:05, Joel Stanley wrote:
> On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> >
> > This patch is used to add sgpiom and sgpios nodes and add compatiable
> > string for sgpiom.
> 
> You also need to add sgpios documentation to the bindings docs.
> 
> Whenever you add new device tree bindings to the kernel tree you
> should add documentation for them.
> 
> When preparing patches for submission, use scripts/checkpatch.pl to
> check for common issues. It will warn you if you are adding strings
> that are not documented.
> 
> Cheers,
> 
> Joel
> 
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  8 +--
> >  arch/arm/boot/dts/aspeed-g6.dtsi              | 52 +++++++++++++++++++
> >  2 files changed, 57 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > index d4d83916c09d..815d9b5167a5 100644
> > --- a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > @@ -1,8 +1,10 @@
> >  Aspeed SGPIO controller Device Tree Bindings
> >  --------------------------------------------
> >
> > -This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> > -featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> > +This SGPIO controller is for ASPEED AST2500/AST2600 SoC, it supports 2 master.
> > +One is up to 128 SGPIO input ports and 128 output ports concurrently(after AST2600A1)
> > +and Second one is up to 80.
> > +Each of the Serial GPIO pins can be programmed to
> >  support the following options:
> >  - Support interrupt option for each input port and various interrupt
> >    sensitivity option (level-high, level-low, edge-high, edge-low)
> > @@ -14,7 +16,7 @@ support the following options:
> >  Required properties:
> >
> >  - compatible : Should be one of
> > -  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
> > +  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio", "aspeed,ast2600-sgpiom"
> 
> I think we should add sgpiom strings for the ast2500 (and ast2400?)
> too, as this is how they should have been named in the first place:

Can we defer this discussion until someone adds support for the slave 
interface? Maybe the existing compatible could have done with some more 
thought, but it is what it is, and I don't think we need to muddy the waters 
further right now?

Andrew

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577523A09ED
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 04:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhFICWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 22:22:08 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56589 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234092AbhFICWI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 22:22:08 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id A80FA58098A;
        Tue,  8 Jun 2021 22:20:13 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Tue, 08 Jun 2021 22:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=yH98+tNlIue48V44BR5OWi6dPgDhJ1+
        sn8VoeLxfTG8=; b=MFtMabReIFKKmhNs842SgEuQe6DsqwSSjss6SAfI3hbwN6S
        6e/2QYt0gVU4ImuAWHCGa9oEVSv3dR76B/7yl6c9MOvSzvww/kFCWLzhpyOZpJiy
        nGYNo5QAd6sb6Rp9K6kwXSuHVu4MGtuL7/wjbvEsHSfzTCzgOWgZhXKJhkGS1YQU
        Utuli6ZFTVbCFuWVQ6yvJr7VW3vFIeuocP3KKpSOzVNJHKUqhapGg6pQ+4blhCl7
        IvC2QDKsW1X8mrM39ZCCT0dRdyxm+zzyED8Dvlowy4ws13RLjFPDwIHOGLklEg4t
        7pyUoJyGp7uzeWrvh+1z8JUanusMbdcFBtNCSGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yH98+t
        NlIue48V44BR5OWi6dPgDhJ1+sn8VoeLxfTG8=; b=qI70lI+9H17C6FSTbT8Vod
        cyrEHwqdUKOamlcxpTzyLF77Mg1KjiIwXDlw0td4kwfN5/iFSiwSueeXWlxukMXt
        mtlqEg6WbOkPQFGdB22GWD8zUckdqDnxgBP+7sln3MbgZylmN0DU4gvZ9hdGVr3i
        x31fDLWLa/7P4jrOm86F5pnhtwNkzd56VyoWtKJ+xVehfFiw3OXwDuQXX92MTexV
        4zF3YtF8rnuxI/x/Pqb97U18QDu1t1LtObhAj6ok2CJfuIGrlLFN0AA0aAcvSMbA
        WRCpEbtxJz7osbScySX1vsgrVE0pE2uLwkp6ukAbM04prQZPjRwTZoAj58L+0m9Q
        ==
X-ME-Sender: <xms:WyXAYGZEjLI2HcywwMWgk1ItXwtLPAs083RKADKgcnd11B4DQJtW-g>
    <xme:WyXAYJbfKtWWHB-1sv_dQTcj1uM5WzM43PLkaalLu0Ip1Svi-WpQrWYFFvhkAhv7j
    gikb3tdxl6VAgdrvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:WyXAYA9PynFPCFksQVFzevq2SfGHAO34qwd-540EPrMvS2Z5Dsz5Lg>
    <xmx:WyXAYIqP4l49UAd9H4fsSRgAP7M2hYAG-G1x8f_3eviIg5p138XzVQ>
    <xmx:WyXAYBre6C6ufO4cZP7brhGpPXbSR3B_DouuPrzjVWGkc9oeIYtkaA>
    <xmx:XSXAYOgqC6-2l6XavRGeK9HsGKfC-E7bzvGfSNQUu8MGkID0DGTSMg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9331DAC0064; Tue,  8 Jun 2021 22:20:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <1a15de23-4e02-45cc-aadd-088319244798@www.fastmail.com>
In-Reply-To: <20210609015148.GA14839@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-4-steven_lee@aspeedtech.com>
 <cef3e619-bd49-4318-bdcd-f844d2b80af7@www.fastmail.com>
 <20210609015148.GA14839@aspeedtech.com>
Date:   Wed, 09 Jun 2021 11:49:50 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Steven Lee" <steven_lee@aspeedtech.com>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "open list" <linux-kernel@vger.kernel.org>,
        "Hongwei Zhang" <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v5 03/10] ARM: dts: aspeed-g6: Add SGPIO node.
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 9 Jun 2021, at 11:21, Steven Lee wrote:
> The 06/09/2021 08:43, Andrew Jeffery wrote:
> > 
> > 
> > On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> > > AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> > > with 80 pins.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  arch/arm/boot/dts/aspeed-g6.dtsi | 28 ++++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> > > index f96607b7b4e2..c55baaf94314 100644
> > > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > > @@ -377,6 +377,34 @@
> > >  				#interrupt-cells = <2>;
> > >  			};
> > >  
> > > +			sgpiom0: sgpiom@1e780500 {
> > > +				#gpio-cells = <2>;
> > > +				gpio-controller;
> > > +				compatible = "aspeed,ast2600-sgpiom-128";
> > > +				reg = <0x1e780500 0x100>;
> > > +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&syscon ASPEED_CLK_APB2>;
> > 
> > The example in the binding document used ASPEED_CLK_APB. Which is correct? I assume ASPEED_CLK_APB2?
> > 
> 
> The example in the binding document is for aspeed-g5.
> aspeed-g5 and aspeed-g6 use different clocks.
> Should I add a new patch for adding an example for aspeed-g6?
> 

Oh, I missed that. Never mind then!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

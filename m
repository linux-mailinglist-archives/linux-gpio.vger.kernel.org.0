Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F64774D1A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 13:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391895AbfGYLcn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 25 Jul 2019 07:32:43 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49517 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391826AbfGYLcn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 07:32:43 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9B61F20009;
        Thu, 25 Jul 2019 11:32:39 +0000 (UTC)
Date:   Wed, 24 Jul 2019 16:14:25 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 7/8] dt-bindings: arm: sunxi: add binding for Lichee
 Zero Plus core board
Message-ID: <20190724141425.aycdkdwlgmljwpgr@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-8-icenowy@aosc.io>
 <20190720101318.cwrvv5r42wxx5k4r@flea>
 <BDF0C9F6-DD0D-4343-8E24-06A07055004C@aosc.io>
 <20190722192934.3jaf3r4rnyeslqyw@flea>
 <7d24576697521f4985617113dbc4cc41@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <7d24576697521f4985617113dbc4cc41@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 24, 2019 at 09:09:01PM +0800, Icenowy Zheng wrote:
> 在 2019-07-23 03:29，Maxime Ripard 写道：
> > On Sat, Jul 20, 2019 at 07:39:08PM +0800, Icenowy Zheng wrote:
> > >
> > >
> > > 于 2019年7月20日 GMT+08:00 下午6:13:18, Maxime Ripard
> > > <maxime.ripard@bootlin.com> 写到:
> > > >On Sat, Jul 13, 2019 at 11:46:33AM +0800, Icenowy Zheng wrote:
> > > >> The Lichee Zero Plus is a core board made by Sipeed, with a microUSB
> > > >> connector on it, TF slot or WSON8 SD chip, optional eMMC or SPI
> > > >Flash.
> > > >> It has a gold finger connector for expansion, and UART is available
> > > >from
> > > >> reserved pins w/ 2.54mm pitch. The board can use either SoChip S3 or
> > > >> Allwinner V3L SoCs.
> > > >>
> > > >> Add the device tree binding of the basic version of the core board --
> > > >> w/o eMMC or SPI Flash, w/ TF slot or WSON8 SD, and use S3 SoC.
> > > >>
> > > >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > >> ---
> > > >> No changes since v3.
> > > >>
> > > >> Patch introduced in v2.
> > > >>
> > > >>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> > > >>  1 file changed, 5 insertions(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >> index 000a00d12d6a..48c126a7a848 100644
> > > >> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >> @@ -353,6 +353,11 @@ properties:
> > > >>            - const: licheepi,licheepi-zero
> > > >>            - const: allwinner,sun8i-v3s
> > > >>
> > > >> +      - description: Lichee Zero Plus (with S3, without eMMC/SPI
> > > >Flash)
> > > >> +        items:
> > > >> +          - const: sipeed,lichee-zero-plus
> > > >> +          - const: allwinner,sun8i-s3
> > > >
> > > >If the S3 is just a rebranded V3, then we should have the v3 compatile
> > > >in that list too.
> > >
> > > S3 is V3 with copackaged DDR3 DRAM.
> > >
> > > It's pin incompatible w/ V3.
> >
> > Does it matter though?
> >
> > If the only thing that changes is the package, we're not manipulating
> > that, and any software that deals with the v3 can deal with the
> > s3. Which is what the compatible is about.
>
> Okay. Should the S3 compatible be kept befoer the V3 one?

Yep, something like (in the DT)

compatible = "sipeed,lichee-zero-plus", "allwinner,sun8i-s3", "allwinner,sun8i-v3"

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

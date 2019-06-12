Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B05B41BF4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 08:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfFLGGK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 02:06:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726538AbfFLGGK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jun 2019 02:06:10 -0400
Received: from dragon (li1264-180.members.linode.com [45.79.165.180])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03BE920874;
        Wed, 12 Jun 2019 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560319569;
        bh=VfQ07jf+Hvyl2Wul02CQ8cO773IXE5obZTrK/DXI6+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wChXuwCQvpHKTywuj+8QXCvsWOJYw5/uwCjAXSqo+OnErMV3FxNQHWS+XdVnXxDah
         aaO9ImYPZJIVnGv5x4nKgWV2mr27lFg5n9fdD475NNidm3I7R/LcyJOQbwKsN3Br5U
         mu9UAPuLmO22DvoKPegV/B+HmNXa5QBUk/Ys0meg=
Date:   Wed, 12 Jun 2019 14:05:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Anson Huang <anson.huang@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
Message-ID: <20190612060522.GB11086@dragon>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
 <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
 <AM0PR04MB421171336B9206D02FF6514080ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB421171336B9206D02FF6514080ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 11, 2019 at 10:00:36AM +0000, Aisheng Dong wrote:
> > From: Linus Walleij [mailto:linus.walleij@linaro.org]
> > Sent: Saturday, June 8, 2019 5:04 AM
> > 
> > On Thu, May 30, 2019 at 5:04 AM <Anson.Huang@nxp.com> wrote:
> > 
> > > From: Anson Huang <Anson.Huang@nxp.com>
> > >
> > > Add binding doc for i.MX8MN pinctrl driver.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > 
> > Looks mostly OK to me, but I'd like the maintainers to review, so Dong et al
> > please look at this!
> > 
> > > +Required properties:
> > > +- compatible: "fsl,imx8mn-iomuxc"
> > 
> > So should this not be "nxp,imx8mn-iomuxc"
> > or "nxp,freescale-imx8mn-iomuxc" or something these days? The vendor name
> > is nxp is it not.
> > 
> > I was complaining to the DT maintainers at one point that these companies
> > seem to buy each other left and right so this vendor nomenclature is dubious,
> > but I guess at least it should reflect the vendor that produced the chip or
> > something.
> > 
> > If everyone is happy with "fsl,*" I will not complain though.
> > (i.e. if the maintainers ACK it.)
> 
> We preferred to keep "fsl,*" for Freescale i.MX product line according to last discussion.
> And we already did this way for most i.MX devices.

+1

We do not see serious problem with 'fsl' prefix, so would rather stay
with it.

Shawn

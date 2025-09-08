Return-Path: <linux-gpio+bounces-25769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E54B49AAD
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 22:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD32B4E1430
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 20:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFC42D7DC5;
	Mon,  8 Sep 2025 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BHl1k5w/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278722D59FA;
	Mon,  8 Sep 2025 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362065; cv=none; b=oeamte24X/2w6iuqlODlfcFZpcfmpybW9GvmFy+iNSI2/DX6c/dQeYLDXS8/RnSEfPo9sJlBvpeE7ziDrK54JGiIpH8mE6AmObFriaB3sd/pDSjwsMkJXKEHei2k9Og6eumFSr4n6TDz8Tkvb7pIIqbhNFH9injTPwVWZstXWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362065; c=relaxed/simple;
	bh=LeZJP+pU9gKNfJpiPKIUW2+w0mvYsmt/t2VSk2lm2sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGcyCokekN2kcSmEc5JLks1aFW/4DvwGA3jp6UOWGe7uCoSjK5jlCY032ckmcz1hwhKO64Z7JHPM8S2/h2XJGuY/UQFlIuJdFPeaawGUAD50k702+arAMauSudA3SeDd1/vMsuzUrB9CmJKhmBp+3MCYj7G+P++1rt9BjzMSyGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BHl1k5w/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w1EwyTie/h44Yv/fBjzwXChmTw4VRBobXct3dwrWQS4=; b=BHl1k5w/fsuK6Mj33b29YF4MIw
	eA1CdklxrPNPohLDsJNrwVCyvYiOGdUefvcSJaltG3XQdjFwwLrye4/96faDnNb+OvaQncNEehOXE
	ffqq3hE9ySuCYsdNheSOwmCJ3V0O04HYoBIw4O86rpReEGHhVUlBJI3xmtrcRfXESDvQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvi9E-007iQO-Dl; Mon, 08 Sep 2025 22:07:32 +0200
Date: Mon, 8 Sep 2025 22:07:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Message-ID: <f271a9bf-e6c2-45ca-afc7-7f6ac683572a@lunn.ch>
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
 <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
 <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>

On Mon, Sep 08, 2025 at 09:14:49PM +0200, Christian Marangi wrote:
> On Mon, Sep 08, 2025 at 09:06:03PM +0200, Andrew Lunn wrote:
> > On Mon, Sep 08, 2025 at 07:48:17PM +0200, Christian Marangi wrote:
> > > On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> > > > On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > > > > With further testing with an attached Aeonsemi it was discovered that
> > > > > the pinctrl MDIO function applied the wrong bitmask. The error was
> > > > > probably caused by the confusing documentation related to these bits.
> > > > > 
> > > > > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > > > > is never actually set but instead it's set force enable to the 2 GPIO
> > > > > (gpio 1-2) for MDC and MDIO pin.
> > > > 
> > > > Is the MDIO bus implemented using the GPIO bitbanging driver?
> > > > 
> > > 
> > > No it does use the MDIO bus integrated in the MT7530 Switch. It's just
> > > that the MDIO pin can be muxed as GPIO usage.
> > 
> > Then i do not understand this patch. Why configure the pinmux for GPIO
> > when you want it connected to the MDIO bus device?
> >
> 
> The usage of GPIO might be confusing but this is just to instruct the
> SoC to not mess with those 2 PIN and as Benjamin reported it's also an
> Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
> (that is configured by a different register) but it's really to actually
> ""enable"" those lines.

So please extent the commit message: FORCE_GPIO_EN does not actually
force the pin to GPIO, but really means....

The commit message is the correct place to try to explain why the
patch makes no sense, because FORCE_GPIO_EN is wrongly named.

	 Andrew


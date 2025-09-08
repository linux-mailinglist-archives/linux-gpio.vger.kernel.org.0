Return-Path: <linux-gpio+bounces-25758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1124B49956
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9231C2083F9
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E5722ACF3;
	Mon,  8 Sep 2025 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KClgd9bh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA51E500C;
	Mon,  8 Sep 2025 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757358374; cv=none; b=Qf7l2lCLPkFCasaI5MzN8J0Sx4ocRiK1GkkOI5Kk8IB1UYZBCcpwjL4uaqY437h27RZMaZ1PAImbj6tH+wzIfxDbj++D3oy1t/mr8/6Is1GoqpzYcIUUgnqA/GgcgVjAop9EAewdLtGtXJPKPpXc+tHcilo4IB4S/W2lwUSvS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757358374; c=relaxed/simple;
	bh=lIFtwkBXSrNsvaFjgCMkE3JLuDN6ncd/6x/ZN3jh/8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLlmHq6yDC3tPcWRALjSVT7xIfVqWt2dwrDg3A1X6yJ+zXxgVT5ttZWCkB0G+fJoKBmj26o6FtvV3aMglj1qvc6bA8FaM8mX1QGy2SkZeyhxqsiUgDHd6nHKgqdvKVARt3b9U1KTJ+OwXSWvQXa98ma8Msy9teUgXCMd/p9gssI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KClgd9bh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=07LtSeWo/AmLZHtl6LX+u3Mr0O3ybeIZifoEkYMgMgM=; b=KClgd9bhUawW8/SwsL/AD4WJe8
	mMGpaecMywwKaJtk1DDS8s+hN2JLX2eStBVdYpymdA0NS7wP3vSmeJoGLFyoz7hwCL9joAkJQkY6Q
	MUBHr89CzbDUc8m/E0fKYpPC45i3/W6zumMPEPO7RrxSQ0wlyv4ywyxTU4BrGQw/VfLM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvhBj-007i1L-4F; Mon, 08 Sep 2025 21:06:03 +0200
Date: Mon, 8 Sep 2025 21:06:03 +0200
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
Message-ID: <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68bf16e5.df0a0220.2e182c.b822@mx.google.com>

On Mon, Sep 08, 2025 at 07:48:17PM +0200, Christian Marangi wrote:
> On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> > On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > > With further testing with an attached Aeonsemi it was discovered that
> > > the pinctrl MDIO function applied the wrong bitmask. The error was
> > > probably caused by the confusing documentation related to these bits.
> > > 
> > > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > > is never actually set but instead it's set force enable to the 2 GPIO
> > > (gpio 1-2) for MDC and MDIO pin.
> > 
> > Is the MDIO bus implemented using the GPIO bitbanging driver?
> > 
> 
> No it does use the MDIO bus integrated in the MT7530 Switch. It's just
> that the MDIO pin can be muxed as GPIO usage.

Then i do not understand this patch. Why configure the pinmux for GPIO
when you want it connected to the MDIO bus device?

     Andrew


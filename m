Return-Path: <linux-gpio+bounces-8778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A49559DC
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2024 23:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48A851F2194E
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2024 21:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A96D1553BB;
	Sat, 17 Aug 2024 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jp43IEaL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23113D8B8;
	Sat, 17 Aug 2024 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723930769; cv=none; b=TTcf2aOpFGBqO/5wy2JRd4TjuoPCRoc5NMSyx+snksSBLwXJZlYIxK4jGT1e67egrt6wVylZyBjXcRLGQlYeeJy9Y5AztV2OW8RS3BIwOXx/XnbggOrZoaO0I6msI1+tABg/Mi5uCiiCo6nyXZ8DwiXD8DIQjzRh90y+yq8zzC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723930769; c=relaxed/simple;
	bh=xAaOlb6LYUQpzGIEO8pxECu77oM2AmwcDMJoaETwyOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYTuTCSBG+dux/UzckJ1VlV725JAqmbKbjXslumrdL9WahzPZ8KpgMCL2WwBwRAGtq3jMmXrtxTo30UTEbYCk/cuBWHSa9e2bWORIzobGl5WpdshLCsvwxmSrsNGAyfY3zrl6UO8KuSmYViAx2mjPJnWT/OwQLaO07peEPM/Nxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jp43IEaL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=LKeP2yA49BgFrH6Vnp4a8g09dJac9cDvswQkanBMPIY=; b=jp
	43IEaLfN4cvmNWDt1v8OYqrOs8qLE04L5Fyv++RwlpCyyftXnGl00uVis14K23utTI7vW50dMZV99
	n9w5lYg6q2ynLjLwn80jl/dcqGvKWinKvJLp0pvOjWpA41UV8LOyGSDYdg7xnuayIi6ozmzYRIrRK
	B0UNSTjD9CSS6kY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sfR8q-0050ys-Jh; Sat, 17 Aug 2024 23:39:20 +0200
Date: Sat, 17 Aug 2024 23:39:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>

On Sat, Aug 17, 2024 at 10:46:10PM +0200, Benjamin Larsson wrote:
> On 17/08/2024 00:52, Rob Herring wrote:
> > > Hi, this is by design because of the register placement in the gpio block
> > > and the fact that the pwm functionality is intermixed in there also. As
> > > example the following registers are all GPIOCTRL:
> > > 
> > > <0x0 0x1fbf0200 0x0 0x4>,
> > > <0x0 0x1fbf0220 0x0 0x4>,
> > > <0x0 0x1fbf0260 0x0 0x4>,
> > > <0x0 0x1fbf0264 0x0 0x4>,
> > > 
> > > To simplify the driver code logic the complexity is moved to the dts because
> > > of that.
> > DT to OS is an ABI. Don't put the complexity there. The driver is easy
> > to change.
> > 
> > Lot's of h/w blocks are just bit soup. This is not special. If a few
> > regions is helpful, then that would be fine.
> > 
> > Rob
> 
> Hi, the pwm functionality is to blame.
> 
> The following is the logic that populates the direction registers
> (GPIOCTRL).
> 
>     for (i = 0; i < ARRAY_SIZE(pinctrl->gpiochip.dir); i++) {
>         ptr = devm_platform_ioremap_resource(pdev, index++);
>         if (IS_ERR(ptr))
>             return dev_err_probe(dev, PTR_ERR(ptr),
>                          "failed to map gpio dir regs\n");
> 
>         pinctrl->gpiochip.dir[i] = ptr;
>     }
> 
> 
> As example in between 0x1fbf0200, 0x1fbf0220 and 0x1fbf0260 we have pwm
> related registers.
> 
> The gpio block could if I count it correctly be split into 8+ regions. The
> dts list contain 18 rows related to the gpio block. So the savings would be
> ca 10 rows but a register mapping list in the driver would be needed
> instead.

How messy are the GPIO and PWM registers? Are there N blocks of
independent GPIO registers? and M blocks of independent PWM registers?
By that, does one block of GPIO registers contain all you need for one
GPIO controller? One block of PWM registers give you all you need for
one PWM controller? Or are the registers for one GPIO controller
scattered all over the place?

Could you point at a public datasheet?

      Andrew



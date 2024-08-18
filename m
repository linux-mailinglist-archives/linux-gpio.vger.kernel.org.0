Return-Path: <linux-gpio+bounces-8782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B083E955D54
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 18:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC8951F2138B
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 16:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEBD129E9C;
	Sun, 18 Aug 2024 16:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ua/E+l/1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E738D8F6E;
	Sun, 18 Aug 2024 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723996956; cv=none; b=lYvOensEAjV4TMj6h76RdalqgkbUS5XNnIl32apxHJ++/zKxAGqcSjUjd19UBG+uAIENAB0AqBZBn8adbvBJTqA5NHnGB4+fjQU9Z8XWhSbee6e33e6RCtoUYtaAiMpO3xhLpe98Gml7U8bfCQdebCgSdwzG86C6lhA4mQJR0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723996956; c=relaxed/simple;
	bh=i/vMm7Lf/dgUi87b8dIoCNOMTJW59WB9ADG4o0RGgEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSpje8pcT+mPU87k7jVpGDYw3FYq96lcJrWdV+jRS4yA18e6evwNP1zSfRzgegoVzdHkrnMv6dhNu9tmgmJuf9P5FiqOX9jJ8oKHAplwcXqOzXB4A4bujt4rRkzwcsclpNHuGzwtvnKfASWLiZErIjBxsZqIiiDRNyyftcwsq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Ua/E+l/1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qTJVVOGTm6h1jnQtTofjdTqgZNa2JyjM9oNmggGyDAY=; b=Ua/E+l/19X7kY0O5oAFNmpSFkf
	wEOmVRI5klbreimydDcnk2aW5mBVDTnnoJfsS26KCZYwSnx2Tz3dRg1mA7TVvYF0ibuSOXEVtFeP7
	haReWATUhwrbfE7qWhHHFVG5/iKjwY/LKchZqVUergoJvtWm2nhfJTmjTkEF36A5LCT8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sfiMO-0052ea-Ta; Sun, 18 Aug 2024 18:02:28 +0200
Date: Sun, 18 Aug 2024 18:02:28 +0200
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
Message-ID: <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>

On Sun, Aug 18, 2024 at 02:48:05PM +0200, Benjamin Larsson wrote:
> On 17/08/2024 23:39, Andrew Lunn wrote:
> > How messy are the GPIO and PWM registers? Are there N blocks of
> > independent GPIO registers? and M blocks of independent PWM registers?
> > By that, does one block of GPIO registers contain all you need for one
> > GPIO controller? One block of PWM registers give you all you need for
> > one PWM controller? Or are the registers for one GPIO controller
> > scattered all over the place?
> > 
> > Could you point at a public datasheet?
> > 
> >        Andrew
> > 
> Hi, per my understanding there is no public datasheet/register reference
> manual.
> 
> But here is the division of regions of the registers in the gpio block and
> how it is currently divided between the drivers (according to my current
> understanding).
> 
> 1FBF0200, gpio/pinctrl
> 1FBF0204, gpio/pinctrl
> 1FBF0208, gpio/pinctrl
> 1FBF020C, gpio/pinctrl
> 1FBF0210, gpio/pinctrl
> 1FBF0214, gpio/pinctrl

A typical SoC has multiple instances of a GPIO controller. Each GPIO
controller typically has 4 or 5 registers: In, Out, Direction,
Interrupt Enable, Interrupt Status. If these 4 or 5 registers are
contiguous, you could have one DT node per controller, rather than one
node for all GPIO controllers.

If the hardware designer has really messed up and fully interleaved
GPIO and PWM, it might be better to have an MFD. The MFD node has a
single reg covering the entire range. The MFD would then map the whole
range, and provide accessors to the child devices. Hard code the
knowledge of what registers are where. Given how badly the hardware is
designed, it is unlikely it will get reused in the future, so there is
no point putting lots of stuff into DT. Hard code it.

	Andrew


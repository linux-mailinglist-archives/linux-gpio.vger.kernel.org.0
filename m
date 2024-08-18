Return-Path: <linux-gpio+bounces-8786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A18955E47
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 19:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749991C20F10
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 17:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46A7288B1;
	Sun, 18 Aug 2024 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lZA9wdms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF684437;
	Sun, 18 Aug 2024 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002514; cv=none; b=oQ9A5XIWSnsNPoFnXWYgBGfDV69oqfqMUGaBpj52HIQz//ZnqCn8Qr8u26tYye+hx8fEGf5OQ4zIn5IVRuBEj9kMvHKsAi+iAMIknSnN9e8+yLuOkA2iiSsJRTFAmOxPBiDX/7IbBCwexnOP2d9S5jzc2eUY0bRQm5GwNYoSCAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002514; c=relaxed/simple;
	bh=2ec6B7vtx9NIiGMm/LawYlZDgs1ARemGE0OQGn89UpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n95h0YA3sFZWs2Bq+0oBKCOb3AsI6qp9lUDtJB+hUqRiV4nPirLBkIZqCz6UVPCCFsZnUarozygQRxIWq6v9pq4InpJV6TwtN6y4AU+xfIm+iY1HVzvjF2BXX0DhAvRA+Ko29//YjYjKCeyHw12sANbT4Ym7IYo44jHUCy7oh1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lZA9wdms; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=63Y+QYTGNkut9FxlBx+qh8tB1J35P7B3p1Wyc8Hfbgs=; b=lZA9wdms8JnNXozC8Q4QzS3bN1
	g1bG8O9M5vNx9ghGlok/q/1yKDPY47fKg6QJ8Cu4M2uNHdLP6VrdbWdDdesK27GZDzu4PCLpm/O17
	YFJKmUSlpN7OpmskuUCehlPGa+XEoU3PoHq7V+uLrEnKjmqTPOx9cc2sO+5lFRkGFHTU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sfjo3-0052wi-C1; Sun, 18 Aug 2024 19:35:07 +0200
Date: Sun, 18 Aug 2024 19:35:07 +0200
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
Message-ID: <4a7c9ef5-fcdd-4464-8871-041534f85029@lunn.ch>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
 <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
 <377507f5-e9f8-47b9-bd0c-d1fb0ffeac92@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377507f5-e9f8-47b9-bd0c-d1fb0ffeac92@genexis.eu>

> Hi, the pwm driver could be re-used on the EN7523 SoC. Future Airoha SoCs
> will most likely have the same ip-block also.

A lot will depend on if they sort out the mess they made with the
registers. Given how simple these drivers are, it is sometimes better
to just write a new driver once the registers are in sane blocks,
rather than all interleaved.

       Andrew



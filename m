Return-Path: <linux-gpio+bounces-16849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE34A4A551
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 22:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00064189BD90
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 21:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF4B1DDA09;
	Fri, 28 Feb 2025 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDo+kLJy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940821DC04A;
	Fri, 28 Feb 2025 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779302; cv=none; b=DpbLsxh2c+VyZu6uYMaHMGle8HFDqgcqnzR7TksJWcC2pPRZwIu1KzmNX6t3m3taT5U4cdQ7zSkI3H8PJnQlGFfZBw8J0i9d3JWkkmaHUf29nhZZpfF0obY2BSe5/AVp/I8ktqR7Y2ZFEzuPq8GqnF4lsXfxFmfr7KTmLqvCIQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779302; c=relaxed/simple;
	bh=ad68wow/kheHGqDYDcGvEp6n8B8FfKsoY8kEt3PnkdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2GvVGJRGiTqxLzXyj9YRWyIutg0aXlPj/zVlqvNFwjY0yJ+6KH5CXlLikmk+ZQgW7UU5EL1SlgJ0aM2kRICh/70FoLkOAhLXJYVzfSCj5v6SLpzKwIvIbb7lbSmoB5F4q8QweeBX0xh6/LTcGM+4hGQF5aKxTC+m/q6vFTVFoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDo+kLJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0D9C4CED6;
	Fri, 28 Feb 2025 21:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779302;
	bh=ad68wow/kheHGqDYDcGvEp6n8B8FfKsoY8kEt3PnkdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDo+kLJyacmZWp2zwhJpiTFN/LdjkUyb8HgjzvDmeZ68DuFT48fs6TITSR3JtA5oq
	 loqQODCiovoWGh+QbRsewzml3djG8uydJGJHW6fofHFFdwcZdt94y68YMa31jlL8aT
	 2zrvw95S/BaIJqnOHmbXB2mV4cT2E/OurfClijjj/0hAYOx1rtAcInC1DCExns15bJ
	 dv3/LAwkY1uVYELiycPCHybFPgWSqUk41t369+pN74xeE3d5nbz7LQhAtMRzpsX/Yh
	 uZLuY10Mk4eZmthk/N3gWbcuAMryzrZEBTKrxseAWaPUEmzx9K1K8IiBIbrB6FMT8Y
	 8ZCPX48vKA4Xg==
Date: Fri, 28 Feb 2025 15:48:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/8] dt-bindings: pinctrl: add compatible for
 Allwinner A523/T527
Message-ID: <174077929550.3754157.15994123507055894807.robh@kernel.org>
References: <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227231447.20161-7-andre.przywara@arm.com>


On Thu, 27 Feb 2025 23:14:45 +0000, Andre Przywara wrote:
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> With this SoC we introduce a new style of binding, where the pinmux values
> for each pin group are stored in the new "allwinner,pinmux" property in
> the DT node, instead of requiring every driver to store a mapping between
> the function names and the required pinmux.
> 
> Add a new binding file, since all the different variants of the old
> binding are making the file a bit unwieldy to handle already, and the new
> property would make the situation worse.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../allwinner,sun55i-a523-pinctrl.yaml        | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



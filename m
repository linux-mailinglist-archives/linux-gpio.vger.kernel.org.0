Return-Path: <linux-gpio+bounces-25907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375FB5196E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 16:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD8B5E20E6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 14:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD842322DD2;
	Wed, 10 Sep 2025 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vr3ts2KD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75E235072;
	Wed, 10 Sep 2025 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514801; cv=none; b=UClprmgiPcwKZXJGoNYiFKakaCXcpPo4JX0fMRSl0yxjHPpaVFUarPEaSUefNHvssU9MbUKMYi2xtWFrogFzRQyncYd9aPAU8Gabh1y0ouUudOel2ecXshnWMoVNCE8FJg6a0fVk6oCn98ABBOjMMMmdeHhEnVFUs0uQvUR8x0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514801; c=relaxed/simple;
	bh=iT7zclflmd1yORb9IPElJ8G2KRxHqWWg+3bH4wQEm0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmrv9s3OFrVhsZqDTK6l6c15DW++XN3Yj9X3VcrMLn5jikEDupddJpLcQjHmmDuQcWenyp0s7TqZSvmgU8islvWQJnTmJr4bAwbRZZ2HJLlEsjp5F2BBRMwbGw9Ni0vtQTG63/T1fb6V2j8+unz7CoFUp6jY3bKszkH0i8tCmgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr3ts2KD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC241C4CEEB;
	Wed, 10 Sep 2025 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757514797;
	bh=iT7zclflmd1yORb9IPElJ8G2KRxHqWWg+3bH4wQEm0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vr3ts2KDd9XCPSBzlJK5d/Gk7r8Bvo8ikCB+PM//j9dYWFCNEpneirBg76oSe5/Nr
	 Aqdx0Se1ICCl8jwrUigByaTPnXsCETPsstbUQzMSSfSL/jLf4xYakTyxRtAuVUzA42
	 PHFqyaoyJ4KCRrIwP+bG7T6V22uot/cUbYhvHWZJ172l70zU/byMQSVFmWZLTxoEcY
	 5bNtzPDmDZb0YGQrv9hbsoP2Np4aFsr6n1fJaTJoaPIPgDWAuPuN/E9qcO8IfXFaoz
	 tMjmCwgumy6CBB0vbnW5QNNe2MHBcWgldpQnm4W/IdWsEyo8B7xpSGGdMEcQ3z1d5I
	 skSOsWKHlqBGQ==
Date: Wed, 10 Sep 2025 09:33:16 -0500
From: Rob Herring <robh@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <20250910143316.GA4047084-robh@kernel.org>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
 <20250909120041.154459-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909120041.154459-3-herve.codina@bootlin.com>

On Tue, Sep 09, 2025 at 02:00:33PM +0200, Herve Codina (Schneider Electric) wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> 
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> ---
>  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml

Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.example.dts:42.13-45.34: Warning (interrupt_map): /example-0/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /example-0/interrupt-controller, using 0 as fallback
Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.example.dts:42.13-45.34: Warning (interrupt_map): /example-0/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /example-0/interrupt-controller, using 0 as fallback
Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.example.dts:42.13-45.34: Warning (interrupt_map): /example-0/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /example-0/interrupt-controller, using 0 as fallback


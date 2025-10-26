Return-Path: <linux-gpio+bounces-27614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2AC0B46A
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 22:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B98A4E657C
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 21:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AE72BD5A7;
	Sun, 26 Oct 2025 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuOAX+MS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD427EC80;
	Sun, 26 Oct 2025 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761514181; cv=none; b=pvC5A2sOOXk/jsinLESOykxB53gAXlDiktbsB/A+idvPYZD94Zmruz3MqAQW0B8h0fZgHznZ4EM2C0C8PQ7rkTLs3zz6/jFGow3ULZ9Cf7VBDmTxY4d3+z1E5C3EaionYWWaxLB9uSV1k8XTQnhGEZr7ct5r7bppCWOgHhB5CtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761514181; c=relaxed/simple;
	bh=UF92pzDk0A1/mGjAUSqLoZu8jSXaEykshCH66i1l3WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMscWjIUEYdLtbSI8tr9Uy5sxfHkhsJQMp0PfuBjnJRcpYzfJNwg4QAsCg+qS0P9QCkA8WOvR0wFDK0zeX5NhICfplaSiJb7I1R5L1vRh7gU25ff/FqVcBGXpzPP0vTLSJPHttge9WnMQXNA21zQ3HUnX9nZW4rlq37P8i9Ujqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuOAX+MS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B77C4CEE7;
	Sun, 26 Oct 2025 21:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761514181;
	bh=UF92pzDk0A1/mGjAUSqLoZu8jSXaEykshCH66i1l3WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuOAX+MSQaXWzHVshZJ/8AKilaBv7q/9C+n/nwjdQLDddov8Xsn+0+E0t+mhNm1Fz
	 iZgeb0KbHtD08jintxEMVVRCGpRkCsW/XNSZe/rJGlMxf9GjvMzLQ4qd9OQ8XgrXmf
	 Ux3lnNNKl3oHxFXF7a3NEY5C7/Ya/ID6lPPkrx22nTm1X8+22lELPIOup8+5wOeBFU
	 a/SJO2h29CHKhKDjQEHgoPpIloEMew5X1JwVut7O4NT8xHaLQfR2ggio1YfsMTlUX3
	 bUeX1AvLNjUeB/Fd5linTPgkttb0CQFf5pIUFtx5tUeu6Q9+lhO8YTKX4iiFWaR2td
	 thSlG75mL2vyA==
Date: Sun, 26 Oct 2025 16:29:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v5 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <176151417536.2973051.7650241150548488961.robh@kernel.org>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
 <20251020080648.13452-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020080648.13452-7-herve.codina@bootlin.com>


On Mon, 20 Oct 2025 10:06:42 +0200, Herve Codina (Schneider Electric) wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> 
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



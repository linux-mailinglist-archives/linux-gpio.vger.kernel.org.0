Return-Path: <linux-gpio+bounces-23883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBECB15282
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 20:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60F987A630E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 18:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33572299923;
	Tue, 29 Jul 2025 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMrVZJMH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D833C2AE90;
	Tue, 29 Jul 2025 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753812713; cv=none; b=txOA2MOCqX1XUINdvHfhU2vr1RQiMn6vwjZwADo6UDXugBZNoP7mOc68wmDYPRSNHmN7B8xyoruQ4WW1xFX+n2Cqlam+71rj3OoFJYw+umPG/5VkFl3A4qReabQSpqHZp89OR6hxmoa2E49U5TCZatTltde9EIB5d6UwSxlqrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753812713; c=relaxed/simple;
	bh=Kp4/gvOCoF4j3IVDGkFHzTtSG45DUv0mvG8JEJIXRms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcejsFvnCLYLyrkomb4WHQNyXAHTF14h4rpj3e40jKL3pdfEzPc+wnGQb7gBVN9GHSX0W//v8v0SrzTG20BDGLPWFRKsB26XJfw6rxwXBhuWhjjwbe7YY4cm3WLXPYZnfBgN2nX3aaJFgHZ8RD2A8C29OS2FoFKB9vvWDiPv1us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMrVZJMH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410CDC4CEEF;
	Tue, 29 Jul 2025 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753812712;
	bh=Kp4/gvOCoF4j3IVDGkFHzTtSG45DUv0mvG8JEJIXRms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMrVZJMHglSkP2KaUUVuDJgQNM6nyfHH7e8kAtn1Ns6BWW3CK72lNvEYZQZO5FkaH
	 qpWAE3/G6DactS67jtMhx64NbD/1fiQlscwmeLNJwgdn5KNm9BKSc1h1k0Ma3MTx/N
	 qdbAfLGVvO5jkvIzfCnQ79VwOvy0NTaKCVq0dqULFI/2PbCabhHkGneGiP6614L6CN
	 UWtQLnVeNmI3kjLYJS2Tffblp31stui3fYtHWLy0TbewtPCjfb+iA4874uuZJK9vZJ
	 zag/d5Mbw/SCbv20juyZN9sar7lhUI9A4JsRcNy832a+fJ6oaFg/0fB/to2vhG47aV
	 Ido0K7u1KyU/Q==
Date: Tue, 29 Jul 2025 13:11:51 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/6] dt-bindings: gpio: snps,dw-apb: Add support for
 Renesas RZ/N1
Message-ID: <20250729181151.GA530390-robh@kernel.org>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
 <20250725152618.32886-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725152618.32886-2-herve.codina@bootlin.com>

On Fri, Jul 25, 2025 at 05:26:10PM +0200, Herve Codina wrote:
> The RZ/N1 SoCs uses the Synopsys DesignWare IP to handle GPIO blocks.
> 
> Add RZ/N1 SoC and family compatible strings.

Why? Yes, that's policy, but so far we avoided it on this IP. Perhaps 
because it is simple enough. So what's different here?

> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml        | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> index ab2afc0e4153..ceb71b5ac688 100644
> --- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> @@ -20,7 +20,13 @@ properties:
>      pattern: "^gpio@[0-9a-f]+$"
>  
>    compatible:
> -    const: snps,dw-apb-gpio
> +    oneOf:
> +      - const: snps,dw-apb-gpio
> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-gpio
> +          - const: renesas,rzn1-gpio
> +          - const: snps,dw-apb-gpio
>  
>    "#address-cells":
>      const: 1
> -- 
> 2.50.1
> 


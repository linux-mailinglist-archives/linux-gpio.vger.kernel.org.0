Return-Path: <linux-gpio+bounces-28085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD8C34961
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 09:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA901921336
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 08:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA822E6106;
	Wed,  5 Nov 2025 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ambY5cfh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410772E54AA;
	Wed,  5 Nov 2025 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332553; cv=none; b=YUFthjuqSdnWfiFDcnS+5hTtS4+rysYJ/RRma1+bzUt5XRsHju7BzbF7iBcLTHDKF2hJn8+S8xBGpxWJ6Jgn+UEExwFMBuzGeJ34M5I5d4PwzdKDzm8PcS8mzqwYL/qEC0KjMFKPFSRfYH0NRONoaEfPiUugsgq4w2GGI6tNPyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332553; c=relaxed/simple;
	bh=coEYayeUbGvGe7paej8rFvEWoqfGX/Tp+Mse27cPRUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjP50uSQ4BaJ2BAmw0ORanljU1+EMRYl2uhwZn9WvYXB+XfZnfrN6cf2dVBBlmnz2eCKqNKkrn2V4UoCV5gDVBCOHCDmNpTJeaSebKjrUiagTF6PCJckz3N+yKK6z9tPiaixkJXUZz2UF9xzwz/N53WmQdpxt+Q5JeL3+DvMuxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ambY5cfh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D387C4CEF8;
	Wed,  5 Nov 2025 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332552;
	bh=coEYayeUbGvGe7paej8rFvEWoqfGX/Tp+Mse27cPRUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ambY5cfhAQ8gWMiMQps6UeM5cFeAvxIUNGMHwXKe8avT0NuBijw0hR5u3MZxE4Ha5
	 UTBQusbvck1T5ktL0EokcGwLORSW+btI13hVVmAZQLhCLkx/eEEVnBFXiZyHjnqmI0
	 y/zdLYqzgFiX55x5jkKab3NT6i34X3heTAKHkrlnfmtWhIRTI8/AO4ridobCpUZUfC
	 IYYr7ctz0i24EHl9cgFb22yaua+OMqzmpMyiPhvpDLc075oylpWJ1mVMOigFxtRBKy
	 cW+KHekEOZHEx46KDr/vBEA49hDrUEj/P1NoJO0n2wlJhNUkKZWAz6dcZ7+DWtuWUK
	 249nQQzjWSbMA==
Date: Wed, 5 Nov 2025 09:49:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: add gpio-line-mux controller
Message-ID: <20251105-judicious-ermine-of-drama-f13d52@kuoka>
References: <20251104210021.247476-1-jelonek.jonas@gmail.com>
 <20251104210021.247476-2-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104210021.247476-2-jelonek.jonas@gmail.com>

On Tue, Nov 04, 2025 at 09:00:20PM +0000, Jonas Jelonek wrote:
> Add dt-schema for a gpio-line-mux controller which exposes virtual
> GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.
> 
> The gpio-line-mux controller is a gpio-controller, thus has mostly the
> same semantics. However, it requires a mux-control to be specified upon
> which it will operate.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  .../bindings/gpio/gpio-line-mux.yaml          | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



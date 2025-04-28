Return-Path: <linux-gpio+bounces-19381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013ABA9E90C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21D723B6A9F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB911D7E5C;
	Mon, 28 Apr 2025 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEEvrYUw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F4E2629C;
	Mon, 28 Apr 2025 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824851; cv=none; b=qGSkKGqSzbe5ieG4VfeC8BhXMEW29ilocaJip7kKhWvdkEuP7G3RliVDvNG3bqPWaB8h+aIFpv0xz+NJWDTtKS/f8CMadMfbc3qVyBR0fgYhJEUl51lZxNJIpmN0MlSU6O7mCO95zduMARAuHyeFlmZ1e+PdBGvkjdcR59UZciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824851; c=relaxed/simple;
	bh=5tPn82Z4K4C3F6jERk27M/8ekeMYd4Wx2QdTkLSm6RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2XjKi6X3rSBdbZoub9hD9OO5fRkqSil3rF2CSsXMM+C4wTaXMIEVnwahikCJIbfIieBXh9LOJ1V9UYOfZIPND7SICjsqdlHXrrbRsI66hsXQJtpRbvvs1yytj2N+Y/5HXoav56y2Ont/jtr7H9MIQpsDH6ZaJ7KoDt0x/NO5zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEEvrYUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE7BC4CEE4;
	Mon, 28 Apr 2025 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824851;
	bh=5tPn82Z4K4C3F6jERk27M/8ekeMYd4Wx2QdTkLSm6RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEEvrYUwjp5iD+Fwc8MWJgYhGQRqUuE9fE+OTTYmEvR6lmLht2I+gnmBlAN9+ZWDo
	 oejuqWMM4LZLxEfzZ06PO+Hc0+jhsD0XxXffO/s5ofPgBkkzGoY0MCO/7YENkyWVcD
	 k35jZGWBRIgpA/53uaolNXyMfakImTsgEE+56sWE/FeMucH7ii6bjvZLEcvrtXV8kH
	 rIxucaj2U0WIS2SOYNrtY8TPKZ55/E0x/8OeEuoB3yU3on1KT59kc09plYHP2uy5hD
	 hSA21tKdd7XQ6U67JnwRgpgNX9xst/5/U8DRcbnxmOeC/Tv/9ZboLx+FWN3FgQCzqX
	 SaicGIYWeHBlQ==
Date: Mon, 28 Apr 2025 09:20:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
Message-ID: <20250428-smiling-azure-sunfish-7c1c25@kuoka>
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-2-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424062017.652969-2-uwu@icenowy.me>

On Thu, Apr 24, 2025 at 02:20:15PM GMT, Icenowy Zheng wrote:
> The JH7110 SoC could support internal GPI signals to be routed to not
> external GPIO but internal low/high levels.
> 
> Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
> "pads" to represent internal GPI sources with fixed low/high levels.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> index 3865f01396395..3cca874b2bef7 100644
> --- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> +++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> @@ -126,6 +126,10 @@
>  #define	PAD_GMAC0_TXEN		18
>  #define	PAD_GMAC0_TXC		19
>  
> +/* virtual pins for forcing GPI */
> +#define PAD_INTERNAL_LOW	254
> +#define PAD_INTERNAL_HIGH	255

Why this cannot be 20 and 21? These are not values for registers, but
abstract numbers.

Best regards,
Krzysztof



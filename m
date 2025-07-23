Return-Path: <linux-gpio+bounces-23696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0269B0F460
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 15:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8CA1C81CC6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BA22E7182;
	Wed, 23 Jul 2025 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwamNn4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D023BD1F;
	Wed, 23 Jul 2025 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753278426; cv=none; b=JKd29EN4+eTYTyx5d777nqgz+vNPE8oZuJZrm69g88aWWU858mRlLf8Gy1wGLOl9rb1cX6tlhGnDJtVWMX7mAy56FsPZ946mpml39bgXereJkOarsLrrgn23fOT6T3PIrZh/hKG+dKTqIp924NX1ShIwjIygbtdbJl54ibjzSWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753278426; c=relaxed/simple;
	bh=Px8gBix96tpJXZzdaFnoa/DdcC+iaCFv0QakGJFoD4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb0YpFcP4fkGlF/NoaZFCWXTYbso69vEW25e2oQ89O0yKfPNEgOwrDTiWVJ6P0kWvoqMSHo9+fH7IpbWH/MnbJdEzU4XKBL0pbsLJ2b6q26HikZOEtXxWRqfi4l3FG6q64PktHsYkEkPtE7xkuhXly8r5fYBpSR5fUjY4dICCXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwamNn4B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A99C4CEF1;
	Wed, 23 Jul 2025 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753278426;
	bh=Px8gBix96tpJXZzdaFnoa/DdcC+iaCFv0QakGJFoD4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwamNn4BoaqZcQV4LZoAtTCdgd5OPftSTu2rR5gNkOGdFAdazCFAgmaZfxl6+Jxv6
	 VYWmsNhSJtG56LNFRz3TCG/19X+dJk0aSwN3fr4jUFL0qqx+EhN1G/RYBBOrd11N1C
	 DSJ9pSzZoseMtHdTzFGzgHo30nyO65+6UyPEpgaflDwHFyTlDcOpi9CcJjvNmajc+T
	 6JGc2OdvDG1Y/3Ma7536Ke6KLNXQuqXnkuRzfdeZbjFoE478L2gmCtdbGsEXcHNe1l
	 xvRZECH4gaaf7SNbTi/RtIcpos463/CzivhfAikaRiaFauEP3Gma4JoKbwNGp/VJXz
	 u1Qx2NtfDr0BQ==
Date: Wed, 23 Jul 2025 08:47:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: gpio: rockchip: Allow use of a
 power-domain
Message-ID: <175327842469.2144459.7995862129200440475.robh@kernel.org>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
 <20250723085654.2273324-2-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723085654.2273324-2-jonas@kwiboo.se>


On Wed, 23 Jul 2025 08:56:43 +0000, Jonas Karlman wrote:
> The GPIO controllers in most Rockchip SoCs are part of power domains
> that are always powered on, i.e. PD_BUS or PD_PMU. These always powered
> on power domains have typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the GPIO controllers
> power domain.
> 
> On RK3528 the GPIO controllers are spread out among the described
> PD_RKVENC, PD_VO and PD_VPU power domains. However, one GPIO controller
> belong to an undescribed always powered on power domain.
> 
> Add support to describe an optional power-domains for the GPIO
> controllers in Rockchip SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: Update commit message
> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



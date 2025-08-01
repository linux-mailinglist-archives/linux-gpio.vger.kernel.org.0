Return-Path: <linux-gpio+bounces-23963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F000B18670
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 19:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADB9F4E01D3
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D931E1DE7;
	Fri,  1 Aug 2025 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2dMCxii"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358919C546;
	Fri,  1 Aug 2025 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754068790; cv=none; b=pngulXqNyt2D8qmltouax5J6kJov6KBi1DpNFwQMWqqj4ETTeJ9mSm90z3DbTH0dGCx8NN7XsYJ4G8fssv7YVqfYckC5aIrGMg5FkGWtWDJqLTyds41pv+jCGVXau87E+7IWobpDsjcKC+FN7oytaM7ELsepDOsqcAjsnRMZJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754068790; c=relaxed/simple;
	bh=1QG/YY4VsuAP8+Akf6wF4d+CfQtLKEQkwrhF47hA3wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOXzsqDj5xDrIx9A4JbdcLD+hRWp07H2U7CRqljMXlBBONpyMbHMOmxx6smXnmroy47YlrvqOCIdtKr1NqlxpWQPm+5BjRNnY3/bChbWwBQ/pEwii1k+ZbiphwT8rHWcgZCVxyqNm1Onu5Q23nVAdOtTxU6JK9odet3XQ6kyBIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2dMCxii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16DC4CEE7;
	Fri,  1 Aug 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754068789;
	bh=1QG/YY4VsuAP8+Akf6wF4d+CfQtLKEQkwrhF47hA3wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2dMCxiimBSUE/8WTlPRDbvOBBZCznp3sp60fZU+araGvGgnr/MYRFcTDn2LQEJba
	 Wh1bhzUZCVX83V1V50KV6aqulpcALSH2jz1f7GgHw//sTRi4gdpM/EzB9qjdZDXf2j
	 SJb0n2quFKyx0JhNsbcFmL2QzwD9hTq1zw8RKpCYVLmn+1ofpMVFxS38DKIWbwGpz6
	 t0dGbHfDjQXh9ekZcHU0Mcjrwqdsnyb0INgjnG9/v7YmChD7a1mHuO0AmxHpr/8nYR
	 5/pH1dvh9f94ywi9s2SLGvELGBViUkl5vRSQ7psjMZuqK8WKZyWbL9PKvV1nAJ3wwx
	 MeBHHeF8YnBNQ==
Date: Fri, 1 Aug 2025 12:19:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Julien Massot <jmassot@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-sound@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
Message-ID: <175406878860.3104776.852136364391160797.robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>


On Fri, 01 Aug 2025 13:18:03 +0200, Julien Massot wrote:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/clock/mediatek,syscon.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



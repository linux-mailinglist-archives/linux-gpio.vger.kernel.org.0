Return-Path: <linux-gpio+bounces-24996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11317B3737F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 21:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C170F3ADA06
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 19:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92363680B9;
	Tue, 26 Aug 2025 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haM0ExZY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D030CD8E;
	Tue, 26 Aug 2025 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756238260; cv=none; b=ga2gkjD0pt5HTpOlYL7QWaaPQCUVJ75SOabP8SaN6fZo1axwnUk3S431ia98oGtZsHzcJIngg7QVDH41i7wv5eFyNKqhQkkm8jDIjRyuvHjJr02WymrLddNtnzYWkgfY0RMQoh107XAh5rQR/rni56/7nqRZ4SfXX8+R4nHqPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756238260; c=relaxed/simple;
	bh=PfGpNnSfzrRB5yk7v6MA0cOlYzyufLWVDl3AitbdL+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ou27IfgSGdpdQN7PqALkmczMvni3/L3V7dKuprgI8I0dYULRHs5BuFTwMmMDGe3LJ4ZVbCK2M3+TW7hNbYRN3F+Y90xWfMgkpdwnrOf6nsZiXhIIl03r1zKbRVWrFohUubO6vopnlm14lftdlf7NRPU/tDTNEdT/pIHYRZGWIYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haM0ExZY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893E8C4CEF1;
	Tue, 26 Aug 2025 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756238259;
	bh=PfGpNnSfzrRB5yk7v6MA0cOlYzyufLWVDl3AitbdL+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haM0ExZYVTBYYmBTE971s991OEWhOJlPyK/JTrK9+nRHHQ056CNNfeMX7p8bsAvWU
	 Ww5A+PmsDPZpNN+9wmmN5sxOMr3WbF9KLsdexP4FNYNYtAbPe40kehVKiRwIXkRjAq
	 pKUG/VsyWevXj7d9ZeZlPyBaOJe5cjzPrTVSHe+qEXpNVVseel+eyqqZE3CEkj7gxF
	 AIOtoZbS523TGZmA+vvNSWMIGhohdBbygU3ZsM9uVK4qSHBWf1CU65V+5hKmbzpLNI
	 O6OPZ1cf1yW8KG55Onq1xBhdzQcwrIn9/wCOhvwHtn52QNv0lvGcte8Vz4GzoxBZfh
	 PuhFlfSzscjLw==
Date: Tue, 26 Aug 2025 14:57:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, kernel@collabora.com,
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Julien Massot <jmassot@collabora.com>, linux-gpio@vger.kernel.org,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ikjoon Jang <ikjn@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
	linux-sound@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
Message-ID: <175623822456.370694.11801087152503772115.robh@kernel.org>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
 <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>


On Tue, 26 Aug 2025 09:39:34 +0200, Julien Massot wrote:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../devicetree/bindings/clock/mediatek,syscon.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>





Return-Path: <linux-gpio+bounces-24817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EAB31C98
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B021D28019
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BE530BF6F;
	Fri, 22 Aug 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6aTAW7R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ABD27AC43;
	Fri, 22 Aug 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755873746; cv=none; b=lmny38pzREXZHuRTycXqBojdcJwju/eLnS0kUHgwl0t9Es5bFGYPZHiAZHOdWiCkr0fr/YPEpjerE/3c1JtVt2sikLEFWJbdPUu7UPX1RIUhqJzxs1haC82exv7KKkNt3C6/n90XeURGzdqV1Yd6wzG7A4YWuoEdbwk/m2a/DZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755873746; c=relaxed/simple;
	bh=HOIMNNW5e2oCIjRIAMTKZXibETeeQjJE5N0fK64fTNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv6xZQywCHiLoDYeIWBjyDeEC5jZSmFUf2/GE2BVgkBzAzCCuUQo2iPPREskaWkXuFfNMzhO6Vb2HYMzpvCwv1mDw8DG2x7vIsizLTSSVCZKrPwmfvlC5wMWzKvO8yn0kc3Bv7FQc7rO5wbkZW2Yf716DmmyCvLhwenyXZDnQIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6aTAW7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1097C4CEED;
	Fri, 22 Aug 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873745;
	bh=HOIMNNW5e2oCIjRIAMTKZXibETeeQjJE5N0fK64fTNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6aTAW7RH03I02SmNJvcSzczG+XkF1OmbOZFfHQjBkBL5CoX3MQvejU2ZVUMDvNIt
	 M5399RAD1sUKpwS3cMDhJTwXo8tIX3YHDr+3aN9DpAdolUNsfu6ubyjr6hwSXcqpbo
	 ugDnoQZATyxUBAdrw+qJxk0WVJq4wdM7G4ZE1ZKD+LDpSP//GfExCtId5oyhEJJEtz
	 faPJ8JpvvvnnJNkrUn5T6g/Wu+Uuj8JumCynArnafYlcePN8Q0pAr03k7Awa0mQlG0
	 iXCjGGEh0FFShsZ/MBhGq/ApmGgdSMA5esRmVoWZz2qb9nq65qTtRSmvpgK3fcKQcR
	 E2R70idYGc4Gw==
Date: Fri, 22 Aug 2025 09:42:24 -0500
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: sound: Convert MT8183 DA7219 sound
 card bindings to YAML
Message-ID: <20250822144224.GA3745327-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-5-cf4721e58f4e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-5-cf4721e58f4e@collabora.com>

On Wed, Aug 20, 2025 at 03:44:56PM +0200, Julien Massot wrote:
> Convert the Device Tree binding for MT8183-based boards using the
> DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> amplifiers from the legacy .txt format to YAML schema.
> 
> This improves binding validation and removes DT schema warnings
> for boards using these audio components.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/sound/mediatek,mt8183_da7219.yaml     | 49 ++++++++++++++++++++++
>  .../bindings/sound/mt8183-da7219-max98357.txt      | 21 ----------
>  2 files changed, 49 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b6fee3ff3af9a90820ee57efdf8efb3f3d474804
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8183_da7219.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8183 sound card with external codecs
> +
> +maintainers:
> +  - Julien Massot <jmassot@collabora.com>
> +
> +description:
> +  Binding for MediaTek MT8183 SoC-based sound cards with DA7219 as headset codec,

Drop 'Binding for '. Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


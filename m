Return-Path: <linux-gpio+bounces-23968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BFCB186B8
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 19:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959CF170D8A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEA728CF58;
	Fri,  1 Aug 2025 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezHZJ7uc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801221D3F8;
	Fri,  1 Aug 2025 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754069420; cv=none; b=j1ythgd2itXFUz26Zp6h6uGbFgB10CRRU+qYUcU8/4JvLapzCZQN8K8Jq0MZS/9V0RPPun4ICjtWnM1qbibnaSElPy9w7jUKhGaGVUA1C0UR1TmpiFiC2IxOMlHdFvV6w10RlifHnWHCZV3I3HfbMFwE5rbkI2iT57en/wAXmRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754069420; c=relaxed/simple;
	bh=lPzXpIa795/UAYucbxhQ/lqbSXcKmzSge/LIrsTQc54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twQgoYFthksj+YtQKeVu5hpRgutTJS0Gtw8KQyE4GaapggFs5Qwwvk5XBLJV6uXyIzJr1EZQNV7Ufjy4T/MRbrYsFq9CXu3YfGiwJtYOVXg3yrng+7Iw0gp7jZS8h0D0/ho6NTyC33C/uJ1EmrfEvlljM/HebKlIgqOXFuzwBDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezHZJ7uc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A6BC4CEE7;
	Fri,  1 Aug 2025 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754069418;
	bh=lPzXpIa795/UAYucbxhQ/lqbSXcKmzSge/LIrsTQc54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezHZJ7ucJnfPB4oUWD7FF4veHqBSUYQO2rfX/4jx70xPeYunQKDZVqndyemghEcFp
	 wH72RD4J/7gVUSywdQYJcrYLSkwp/ssF096SBbwlDhv6WYZacp3jkTl8KTJFIkFfz6
	 7rmu4tRICpaEqH2QyycjnjQY/mbfeQ8rZn6JbsOtlY9n4AYXAkTmGWRNgtTd2qtd0S
	 XLHwEBbWmDbQzJtWu1Gcqv++nwwKSyOSpenznLrG4iN3Fgf7axEOl+0HOLsLftmQw9
	 /Px4kVZLiq4qV57VJDVMFwLtznFe7mVTOktcyyiM5owy9f3YZMhX4sSW6CF24ufleb
	 2bvuniSyGEjCg==
Date: Fri, 1 Aug 2025 12:30:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Weiyi Lu <weiyi.lu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Julien Massot <jmassot@collabora.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
	Ikjoon Jang <ikjn@chromium.org>, linux-clk@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow
 gpio-line-names
Message-ID: <175406941584.3116245.5714988449223130745.robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>


On Fri, 01 Aug 2025 13:18:09 +0200, Julien Massot wrote:
> Add support for the 'gpio-line-names' property in the MT8183 pinctrl
> binding.
> This allows naming the GPIOs, which is already done in several
> device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
> mt8183-kukui-krane.dtsi), but was previously generating DT schema
> warnings.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



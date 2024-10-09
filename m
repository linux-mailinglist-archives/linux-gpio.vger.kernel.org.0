Return-Path: <linux-gpio+bounces-11122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C6997761
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 23:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59BA91C218C9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 21:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DF81E25ED;
	Wed,  9 Oct 2024 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXxiwNUK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D3819C563;
	Wed,  9 Oct 2024 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728508774; cv=none; b=khSWeU7gkqsO8LJEokQ/fg0wN6C277KMSaT7EQqX6zc3OsJQpEtzKx5WmykzsJrCzTUfyWjD1zuHLgxYknmIsl4PFl/F4ghw23L5HfRn+/BsYCF1ZsGnoa/rFctYXLvddihTeIq8Xq5l9l0mcKUPQACvxSuEN04RT78VaPyA8Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728508774; c=relaxed/simple;
	bh=Vt+z5p5sQcbBWZ3AwQ1076IwrQIkaCh7SdfsfMYjZQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pm4Bjh1YXV6Gi2cmf64XSRTDjouAonqVWS1pDwq3SztB4IYKg4Us/NFXyiwW85ep5DUCMyhKF4igYP7a21KDOyLXnJg2maemQo5ohU4poTuaAH4n4FvMWl25s38BOsYFBFt3ZvERt10iFGLozeJ7Q5U/GA88ZFe0yFXJePfa7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXxiwNUK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0292C4CEC3;
	Wed,  9 Oct 2024 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728508773;
	bh=Vt+z5p5sQcbBWZ3AwQ1076IwrQIkaCh7SdfsfMYjZQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXxiwNUKrF6OkSTYIaZo8fbWz/4mzh2UjHXR4xRlBFI7ovx1oHXRJKGKo+E3cuWDk
	 f4nrsL0Yxo4m8r733D4J0WLsndLHmC/9O8koEVe0zvOQP9PM0+p4Z/3/Us3NOH+QV5
	 WRKhYepQ64L00jmlGw4IoLQRIRcwP6KxsqR0cGBMxEAVHi3LNKP8TWt9dKRvSnT6xA
	 NzOhnyG/qazQBBXy5VlJgdMZrkOHcUg5ayqgTTheCfhqaKzfv1QW22fQCQpbVigxEn
	 RGFbs8kSedE3rDQBxqNnK82Lbt09aehYbIptEeD3PO2N6eL/c3PQ13GXVZ/P4GBDpU
	 INvipZOXA65UQ==
Date: Wed, 9 Oct 2024 16:19:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, eladwf@gmail.com,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>, john@phrozen.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, ansuelsmth@gmail.com,
	linux-gpio@vger.kernel.org, daniel@makrotopia.org,
	Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <172850877244.733887.12458885415029802904.robh@kernel.org>
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009165222.5670-4-linux@fw-web.de>


On Wed, 09 Oct 2024 18:52:13 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v4:
> - dt-binding: pinctrl: fix dt_binding_check fixed-string error
> 
> '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
> 	hint: Fixed strings belong in 'properties', not 'patternProperties'
> 
> changes in v3:
> - limit conf subnode name with optional suffix like mmc on mt7986
> - match mux subnode without wildcards
> 
> changes in v2:
> - drop gpio-cells description
> - move ref in mux subnode up
> - order uart-functions alphanumeric and fix typo
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 571 ++++++++++++++++++
>  1 file changed, 571 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



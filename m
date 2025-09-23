Return-Path: <linux-gpio+bounces-26532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F75B97981
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 23:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929E11B23510
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 21:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00DA30DD08;
	Tue, 23 Sep 2025 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKYPkq+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B362EEB3;
	Tue, 23 Sep 2025 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758663715; cv=none; b=lob1n8njaq99wOPfugtAr01M3OiXJPysWh5iHDBcQ4OC4aLre+Z9XlrB/vnNqI+PuHc4ZqIaqApbpe8884LF3HpLiYJGoWo4NywSotwOhshEcw8eX0XNq/3EhzTI+0PZCSuj0V2XjQoE4rJxv7tELmySpCMwWg9wmJ0IiUPASSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758663715; c=relaxed/simple;
	bh=K2AFaAphLag2Ez54TqgVqGYTS8Wuz1j2Ec7u9TglbZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuKDeSDQUmZi1Wsw8ZOOGjkuELv6mPqR0Q13ETCDfbZaunJMfaWJ9a0wUjEWReMrrP5HnfvrxzBbY2d7FQNsiFhlck4HZ00tKu2hRzOEVcvJP5+SnzWKEZYWXetkyXmG+4LICuWhIXxVlLXSUvTa4sf5t616NgBYpNchJf8haz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKYPkq+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED8DC4CEF5;
	Tue, 23 Sep 2025 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758663715;
	bh=K2AFaAphLag2Ez54TqgVqGYTS8Wuz1j2Ec7u9TglbZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKYPkq+6h1XJ9wGM5liz75OrgDFlseHe0NHVyy5OBATAdDhhLl6qIsBVWjON4BALj
	 ZiHkfUV3SznpvQb59DBKHUnG/7++D0QXpoIOXfpvH7QezalbMYSeoGjXFKOxgaywz0
	 nIYp+j4Ub6fj5zAQCJ08Vm89NHxlyz7qvS2+EQ/6PfQ2f8DwJJT/U4CkD9mtjvmRzK
	 ZM6hAohKtD19lHeS1AuMB+7dcsJilH5exq1kO3XGXUxBy8Sy7CaLCvQvBInusXcZf+
	 IVsk/ng0JtXK7e+lIXpL2Dn4aVXjW6WzNM0XW6TwDOQTeE2BImZXhdHzCM3OM3SRUW
	 BKY5R566k+9SA==
Date: Tue, 23 Sep 2025 16:41:52 -0500
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
Subject: Re: [PATCH v3 3/6] dt-bindings: arm: mediatek: Support
 mt8183-audiosys variant
Message-ID: <20250923214152.GB91441-robh@kernel.org>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
 <20250826-mtk-dtb-warnings-v3-3-20e89886a20e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-mtk-dtb-warnings-v3-3-20e89886a20e@collabora.com>

On Tue, Aug 26, 2025 at 09:39:36AM +0200, Julien Massot wrote:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller
> (mediatek,mt8183-audio.yaml) compared to the legacy mt2701-audio
> controller.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,audsys.yaml           | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

As this hasn't been picked up, I've applied it.

Rob


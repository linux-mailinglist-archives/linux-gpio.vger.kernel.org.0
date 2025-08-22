Return-Path: <linux-gpio+bounces-24816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF4B31C8A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404281D20127
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779A2313527;
	Fri, 22 Aug 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/84M/Ij"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230363128C9;
	Fri, 22 Aug 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755873642; cv=none; b=KZhgLAoTgXSvbHqP7SuLS/IeCEkVMkW6ni1tua7y+ovMaIFnxIZtEWqdPGAl3jmYAFlUfK+n5FiIE9/Q1r9N7+NwmiqDaqSyPxIQkMS0iObp4cYatE06NZz7hSbHrJnXbtHcsPiIIfODfveDLwOdqlKzrTWJICkfLAVAHxboRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755873642; c=relaxed/simple;
	bh=bhSe5dlYJAdq6mjCeG2oMHDgFoB39cQ6nyMGPbyEMp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H97wkYkIrjWvTP8er9MjbcA/O0Y150ldRtFK/aisE3ItgcgJlPahGVmZHj36q44LNDV3EIyq7FV+/SUmFEbW1hKt8tYDUiSVMjS/9dc04FjaIgpRpTb5H9LYGAsNn5IAIesk0ezXOOcG6hco46psP2avNclodeXbWYwdiGnXZhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/84M/Ij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1942C4CEED;
	Fri, 22 Aug 2025 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873642;
	bh=bhSe5dlYJAdq6mjCeG2oMHDgFoB39cQ6nyMGPbyEMp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/84M/IjqLSUe0+HMVanzoXlDpTCK+nKqW9JtOBOWuLgU7/06OXafn7g3HKLAGHrR
	 6Gy6En5shwo8oZlNxTddq8gaz0m80j55IqHfKG+w8X5eHTOl1RzD7GJUTSTOJf2PlW
	 n0ttSArSzWQ40eIDMLf8+nMbwN3ZXe0/e3JjrBzYY5ZW8vKgzuFnTuXwA1Ru1iS3kk
	 KP3HblmM7yMjRbIkTinI9AouRLWqlrwnUwb7ub/dB8m95/jMEUp2Mzr3WZpYkXoF32
	 kZjuMW1TzyfNZku3dVYyTpgTjKQWjn+qxWfuSmq3O4ae6Kj8/uWIuOOtsyaEc2Fa3N
	 73QoCyUUCVYzg==
Date: Fri, 22 Aug 2025 09:40:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Mark Brown <broonie@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Ikjoon Jang <ikjn@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Julien Massot <jmassot@collabora.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: arm: mediatek: Support
 mt8183-audiosys binding variant
Message-ID: <175587364044.3744053.7111449158430262490.robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-3-cf4721e58f4e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-3-cf4721e58f4e@collabora.com>


On Wed, 20 Aug 2025 15:44:54 +0200, Julien Massot wrote:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller binding
> (mediatek,mt8183-audio.yaml) compared to the legacy mt2701-audio
> controller.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,audsys.yaml           | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



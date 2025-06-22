Return-Path: <linux-gpio+bounces-21961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DD9AE2F89
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Jun 2025 13:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BBC1892063
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Jun 2025 11:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8B51DE2BC;
	Sun, 22 Jun 2025 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPMQSNwR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6B4FC0A;
	Sun, 22 Jun 2025 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750591553; cv=none; b=m7eYFRPKGj86ptArQJiAwY4RB5WMj9o7WDtoyloqpW6QzmVwokLqDqbcMNDOuUEKOyX37TFVIbBAT13nW68kSY1w7fJTtPAdQLz5aUnK7SV0xkJXExUOnuxB1N8BcLQtqrbNP42hUtYLfuDvE8Xh9bpxt6OHkjIZ7ZigbZALi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750591553; c=relaxed/simple;
	bh=vwzHuDsB0/SdFuQt7+V1uPfJcognh02DJouc4VcjdcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPtkPI9S8jNdnetsexWUbj4WJber4Bnh8HUrHADNLPjsCHp8T9rWF5VvsJvU5HMesiKeen1GWQQTV5zMlFYHIiNSo4qCZb6ITNwqP1n5qjqZtJnQvAMxU9TM+MvVJC/MikFyDM+badM4TdcWsTsx3/XcKO/R5hTxNSrRts8Vn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPMQSNwR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F844C4CEE3;
	Sun, 22 Jun 2025 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750591553;
	bh=vwzHuDsB0/SdFuQt7+V1uPfJcognh02DJouc4VcjdcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPMQSNwRH9NOz3dM62atPvYTlKypMvatdggN6H24SQyi1z+aFn61P922wOcyciZlZ
	 diTprVJeGg5I5eWZJQYdobT8ASj7MOoU/hS4DAKsdqfxtWDlkeB88Ko0RjC9/P33jU
	 sBgk4fbOzXkQluVAA7+xiZvlJdosLJ1dtnbdVhtuteyWoEE667Tlnkdispa9DxLYkH
	 AfNnfyXMaEzrgtvpJzFCoe79iAfs5BNbIYylmC1GwYpBBacQK/LOtqtDyDTokJO0pG
	 +lKYzkIpMBHVexb36GBab8KJlHf110/SMytiqtwWW1OBp/1A2DgvNUQZ380mYggfSa
	 unMccCxWyVC/g==
Date: Sun, 22 Jun 2025 13:25:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 10/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: Add
 audio sound card
Message-ID: <wagq67zdc4vak3rs4fne7tree3g6tsvj7fvrgfmd2oq7ottudb@w4gunlglta4j>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
 <20250620094140.11093-11-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250620094140.11093-11-darren.ye@mediatek.com>

On Fri, Jun 20, 2025 at 05:40:43PM +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add soundcard bindings for the MT8196 SoC with the NAU8825 audio codec.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../sound/mediatek,mt8196-nau8825.yaml        | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



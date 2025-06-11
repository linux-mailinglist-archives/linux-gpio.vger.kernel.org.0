Return-Path: <linux-gpio+bounces-21372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C387BAD53A3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55CD1188357C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC342E612C;
	Wed, 11 Jun 2025 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UW/oVHTA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DF2E611E;
	Wed, 11 Jun 2025 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640499; cv=none; b=SNxV2kcWIJvTxDkzQyTDOhDD34bNE805ub7x9WS5IgBTpxgcYAirhxltHnlb+f+tdRwSGqJd2jop0i8wE9krVlabDwIgXxOh0Kg/Xklxms1/EcA+X+540qKuMilUOGoeQ1EhE1KRQtNdm+D0zDp24CSak4IPx6TPk1K9fCgjE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640499; c=relaxed/simple;
	bh=xoTzQij77wJqxKu/8WOJivHo5xvIanP8StGNmp1ewxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFdsCHTxSzWPUWoSND9WcnF5/kXor7uXWSU1tRO4zdHaYxnUkUxt9vrKZa2B2yoORp78h+Uq7VS9IsCJ+TnnHGjK5naNmITiwBRbCtOtk7/UNjpeZAjWAEJZjcThAkItbtGk/PEsjNZIgzvWBSsXItLk8xrQAyoddY/+08fwbpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UW/oVHTA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640495;
	bh=xoTzQij77wJqxKu/8WOJivHo5xvIanP8StGNmp1ewxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UW/oVHTA/HuPIQy39vzAQ7DA1PBC85oXq9visjD+/znO4tH1rAuNncJk7GIpCza8Z
	 NkJYneqv/byx/sB3AzA9mHYHsVnvMDH39Qzg+cJxGpZYLqMw35tG4YtCW/UlBljvgt
	 SSHevCKLFTzbtMwSM7OG5tJMAs7FxDqJNOYYId38nYUePx/y8g65jhRAeKj6T129bb
	 tYyvyPRuaamYqgV+zK5zS9OaGByXCmkMrUX/QYs8wz03ouNmTyfU1W0IeiGKep1pYI
	 RKF0sX21fDaXM0/WJANlVHC8WLQq2/DeV+6iLHMj49MhbCbChRJJFCSei0rjNEDSZl
	 mUWhfOw23cFNQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EA3D17E10F8;
	Wed, 11 Jun 2025 13:14:54 +0200 (CEST)
Message-ID: <5cf01f45-ea0b-421e-81a7-163c069aeaf0@collabora.com>
Date: Wed, 11 Jun 2025 13:14:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] ASoC: mediatek: common: modify mtk afe platform
 driver for mt8196
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250610092852.21986-1-darren.ye@mediatek.com>
 <20250610092852.21986-2-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250610092852.21986-2-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/06/25 11:27, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Mofify the pcm pointer interface to support 64-bit address access.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   .../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++-------
>   .../mediatek/common/mtk-afe-platform-driver.h |  2 +
>   2 files changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> index 6b6330583941..a86594dca2b7 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c

..snip..

> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> index fcc923b88f12..9809e60db511 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> @@ -12,6 +12,8 @@
>   #define AFE_PCM_NAME "mtk-afe-pcm"
>   extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
>   
> +#define MTK_WORD_SIZE_ALIGN(x) ((x) & (0xfffffffff0))

This doesn't really look like alignment to me, so perhaps change the macro name.
Also, please use the GENMASK macro.

0xfffffffff0 -> GENMASK(39, 4)

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
>   struct mtk_base_afe;
>   struct snd_pcm;
>   struct snd_soc_component;




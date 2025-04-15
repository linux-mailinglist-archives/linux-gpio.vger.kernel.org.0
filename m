Return-Path: <linux-gpio+bounces-18850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C37BA89CA2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEE8916A5DA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8573D28E5EE;
	Tue, 15 Apr 2025 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OIw6Wy9e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FADF1CD213;
	Tue, 15 Apr 2025 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717046; cv=none; b=LuxZMBhY9aV3Ft8EsewtxzdE6WjTSnGHvtSUeuGyPjPGEfIwS4QeWQoP/1rTxw2+yGdT/iFgzyhCLqBrqXvl4hSc4hZ8eWbvCGrhaVZ1b627fJBOpmAjUBajzTHJt3TRTnS3oazewvUJhLxJvSR2DssJJvM2rxeKpgK8RlEW4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717046; c=relaxed/simple;
	bh=LL2E+u91dO99wB41wuqyXT2j19QaB9gNRGI2R7/b5YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iva4hA4xb3FwO/MbNAxksR2X5jvTg0Ou21xHSFVqc9qEkneHL0+Sn7vxTDLVySExXpckW0uICuevXkRa0JprvCqgxdO7eePDThAh+JMc3u1sh7AItOLu5p13Ktos/xbWTHdadh/C6JWtAiUG9xtDH117tx4fpb0COB9ZTZRubeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OIw6Wy9e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744717042;
	bh=LL2E+u91dO99wB41wuqyXT2j19QaB9gNRGI2R7/b5YQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OIw6Wy9e+R7VZf18fWQAN7uWonzzfJXvfUPULmxni+zAEvAbUSPu4wFgV1x8Jo/YN
	 2KVmpk3L296/aMW+vmusHHvUCiqcInGNYexO+3bITYSFxCGwZR7Imge4ArE94dvKih
	 25NKYIeh0R6M+wXAv/fdnZ3IcFn/W4FQBrtWVy2ri4bbm42RPIt8dN2c5ZzbmkGz5c
	 U50PruUlqwudkueNNS1OZI+XqxqHoh5TMf0a1Sj/R7zopgf4NYYDKLD8zuk6DbJE9P
	 O+Lku6ssL0tg6mpKFuBIENzpjYgrX9NIOS/zKOK3cLwMzfZu/Bpm1laYEZRQeLotaH
	 tqtYa/LZCXtcg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B9AD17E03B6;
	Tue, 15 Apr 2025 13:37:21 +0200 (CEST)
Message-ID: <c648c4f3-f20a-4255-93eb-69a80c695fa7@collabora.com>
Date: Tue, 15 Apr 2025 13:37:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Hao Chang <ot_chhao.chang@mediatek.com>,
 Qingliang Li <qingliang.li@mediatek.com>
References: <20250415112339.2385454-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 15/04/25 13:23, Chen-Yu Tsai ha scritto:
> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
> 
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
> 
> Reported-by: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



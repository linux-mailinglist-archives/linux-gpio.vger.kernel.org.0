Return-Path: <linux-gpio+bounces-24006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45281B19D23
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 10:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC25A7A8B8B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 07:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AABF242D9E;
	Mon,  4 Aug 2025 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a8RMqx2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C92242925;
	Mon,  4 Aug 2025 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294381; cv=none; b=ugyEKYTs4E0arfQIbVUR9GDrdu6Hlo5BcLvj94tHHPO9a2HF5hX0uiT1N+YDKwcnqD+qAvfuaKPp518Nad0DSQDLC1wjdozTu34UNg+hRcG8Vf2SCRo9gnhp7anSX3WbebzWqiH/sk60IsOCVpWe4bivyB47HWVMYwhMLTnzrmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294381; c=relaxed/simple;
	bh=Wb0/PwjqRVNZZEx4HaUyk/C9PottFAx2KXPeqXxgZ4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgAVk5iNfH7cIni+PIMzSD3A/TKu5oznoyt6mSMZHjuodGdz8fYGod1zjj6+1Uy/4+QxnVkzSlrjJz7MzuU0tRYx4Up+UOj60ZOaalkTwdvoKRv0Tn6nvysXQLzCU8UHxaTgGPTLbibtZ1f9JgQL84mTMh+PfghlZDC+jMMZeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a8RMqx2f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294376;
	bh=Wb0/PwjqRVNZZEx4HaUyk/C9PottFAx2KXPeqXxgZ4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a8RMqx2fxWamIp5II5pBCC/u32HYVhwbQOAzhBNHdNJHV+DpTUxGRahlVAsHv2Di6
	 iW0/mWuwCVyPxUueoBQUDD9fchOgdz1/AXcWSOyZw/Jb3Yo5h9DLbwxtMSv/hKcwDQ
	 mxZdXKKAesO1R+zwa59KVmYKDiQfvmSAbh00hR6aN6uG0a8Ht3ebCPXC3jXA3bdTzs
	 Cpj7WlEYGOgp/Sy0qHjEbOwlV68orvKIfczG/viHrbUKfhV0R4zeogXB5pemE2kWs7
	 XlGFD1GsKbtugYUKxxsRyxasbCC/j62Q3ZMfvPb85Yp4MvzIM/3XeFLnzlfXKg4Vyl
	 0X22RaNKfr8gg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D536917E1274;
	Mon,  4 Aug 2025 09:59:35 +0200 (CEST)
Message-ID: <c3b94078-db1a-4ee0-a0f2-d667de03f4ba@collabora.com>
Date: Mon, 4 Aug 2025 09:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: mt8183: Rename nodes to match audiosys
 binding schema
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-3-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-3-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 13:18, Julien Massot ha scritto:
> The binding for "mediatek,mt8183-audiosys" expects an audio-controller
> node inside the audiosys block. Rename the nested AFE node from
> "mt8183-afe-pcm" to "audio-controller" accordingly.
> 
> Also rename the audiosys node itself from "audio-controller" to
> "clock-controller" to better reflect its function.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




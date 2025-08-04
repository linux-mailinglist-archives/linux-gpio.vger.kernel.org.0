Return-Path: <linux-gpio+bounces-24001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D4B19D0D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 09:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FB253A9AD0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 07:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEAA23C51C;
	Mon,  4 Aug 2025 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U1vt6Uio"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32DE2367AC;
	Mon,  4 Aug 2025 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294368; cv=none; b=DXG1VqJB2QSXI86dnBs+qkDwl53kvrZ3900wGVd+c3r4a8byo7VAl4ftp7HVr9wqSgvH3RJBqYDXOIpPaYvd/sYBGYeKKTEGgYuI0hSWPoDrqEbpDkc155M+gL2LGAKiYsLfBWi82ej5PV7OEWtgiHMgiCZfNDmosILzOXcwcFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294368; c=relaxed/simple;
	bh=X4o4s9Dn4+GeTOmvLKdvkw5ruolTopoLW+FCQOyPkuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3eij/EqvYdxh5ggObzAmD1oBM8+2rHCMU+mH3tyK12z8wbiAI9sSszEMRq5fNErV8GvBAyM3UgZ1rkFFoOig6U/3mI/0++ZFmctTpQ+HpUxrU1dZ3VOfYn30/y4OBV7OpMqlTRYs3Whn5ajmXlrvLtM958N/th++G5nHYjPTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U1vt6Uio; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294365;
	bh=X4o4s9Dn4+GeTOmvLKdvkw5ruolTopoLW+FCQOyPkuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U1vt6UioWz6+3WAPDg819Zoo1/TvoYA3DoA00EGWx0bpvfQ//7E5QnkvA6I4DQmIu
	 Y0hEXWS20M252gh9sKq8LzYlVTaV2p8/KeC4Q5pw/tFwQYdlHHle45r5v9Bm5Rpq80
	 CYTGrvGnrbSUim24ovCZEvkQn9Fct1OU3aCeAT55E4w5KGiJaSULfphUH8Whv27K70
	 xliOrfUCIw9j5mEeXCAlljj9h6JG3qBBGXp/bW4TkZJj+jDJNUgPL1ybPHQiAVA2g3
	 iDZQ87nlz0MiU5UsHnClJMwE1FkfYBhZXltvPCfQDU4gVpO9/ve0zejDaZIf9IEhlz
	 a4U7OrYitVVog==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE37617E1110;
	Mon,  4 Aug 2025 09:59:23 +0200 (CEST)
Message-ID: <732d07e3-753b-4900-9591-db3654e3aafa@collabora.com>
Date: Mon, 4 Aug 2025 09:59:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
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
 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 13:18, Julien Massot ha scritto:
> The properties `mediatek,pull-up-adv` and `mediatek,pull-down-adv`
> were using incorrect values like `<10>` and `<01>`. These values
> are parsed as decimal (10 and 1 respectively), not binary.
> 
> However, the driver interprets these as bitfields:
>    - BIT(0): R0
>    - BIT(1): R1
> 
> So valid values are:
>    - 0 => no pull
>    - 1 => enable R0
>    - 2 => enable R1
>    - 3 => enable R0 + R1
> 
> Using `<10>` is invalid as it exceeds the accepted range.
> It was likely intended as binary `0b10` (i.e., `2`),
> to enable R1 only.
> 
> This patch replaces incorrect values with the correct ones
> and removes the leading zero from `<01>` to avoid confusion
> with bitfield notation.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




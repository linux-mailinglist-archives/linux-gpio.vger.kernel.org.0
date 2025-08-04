Return-Path: <linux-gpio+bounces-24000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B90B19D07
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0AB404E06B0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 07:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E90423BD04;
	Mon,  4 Aug 2025 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gkx6tK9s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EA62F2D;
	Mon,  4 Aug 2025 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294367; cv=none; b=G9O9oszM9flbeJmmVxyqcwV4s+XRnM++hrA5jDmVCWTzJ2kuaF8ky289pIBY11YKnQLwmaSRZHfWovXMvDl8s24e428hyUKdkUkD3ub/BE8IC7hpYuCH1ZpdLKWC9wXPIUfK3WYLzWr4EiDBoGnSm80QPWbM6CbokuESey4FM5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294367; c=relaxed/simple;
	bh=DhZaGvDnHzhvvEn/KJtNh+O9TwECXprdfpivhu5JG30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrPDIbysNl6jIY5HIaWfyuGBJCcCRDVrDJKOf8GiKrL1am/DwHn0E4NOtDZsqoK0f86bfhZ5KSBWHFV0AlQ66yTm56Et5J+URLzPVcwhcNSyeqHkUAhm0hiLeJWxfz4XVvHgZX2M8U+mdOFqdwu5jGi0ujIrYYGywpgRxGve+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gkx6tK9s; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294363;
	bh=DhZaGvDnHzhvvEn/KJtNh+O9TwECXprdfpivhu5JG30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gkx6tK9szWCOZj+Jkhi1gAO/3QpgGlwC7Gzn2DV9jOJNdB8pJ9CqchTchk1uJbGJU
	 bhFivd/PMQvStNtIsAeRsofUyh85u5YkjN0CGp/RmFUpBYk6NKeevfYSib6W+CdrIm
	 TxdTeHEQXVSt7APT4B8z9pZkbXZ/SU+KoNsmwzEF3HYJrmu05O0oyDbelJR4VM22Wx
	 0B/7isb5lcX/F964qFZu1g/xMNlzjkNlgwO/PquSxKO7oaBzOUImSnI9LA3z2rd5hh
	 tBp896tYogqKK+hPUG7UPl9c0zVv4xwuvktPAH/lCM292W5bVBM/BtX/NvFLMRg9j1
	 uth7BwtTJ5XrA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 699D617E0DD0;
	Mon,  4 Aug 2025 09:59:22 +0200 (CEST)
Message-ID: <315a69a4-aa45-4cb4-baf0-bb5612884155@collabora.com>
Date: Mon, 4 Aug 2025 09:59:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: mediatek: mt8183-pumkin: Fix
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
 <20250801-mtk-dtb-warnings-v1-9-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-9-6ba4e432427b@collabora.com>
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




Return-Path: <linux-gpio+bounces-24002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3CB19D10
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 09:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E38A1784CA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 07:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5844923F40A;
	Mon,  4 Aug 2025 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SpVluudi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2B23BF9F;
	Mon,  4 Aug 2025 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294370; cv=none; b=TUSFdYbqwH3/9BSOk/1xF1iOwh0Jtllae8FmRVXENGZsEwWKHiGTWVa3/JGxYLnIXs/qzHpZgyLLZdn7fd7SvA7ZW441I9uUmBoVc5HjE2NhBICcdX1ydEiegvvrm4ggoK2V/EHAJOAck6opz3lj4ly1k1GhVOlxOj6z4qZeNzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294370; c=relaxed/simple;
	bh=l22hdRool1+i8p3XtMz4/jHHCxV/g1CG6Ymfm7j6uhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmQ4NNoYgBV5SjyMR3tBT9Fc4AMAVkdbPZn0gpWMYuBGJBMOAMy7zGIldCiQg5TK49f9G30m+RAwlvx3YaEDYmsjewdeEwd3qQq6yCbSYfIa/N1/rF0CPWxy2WM7iiYBECr7ajjeTmYMllX+BytujSTeFBB8H1sy9jBn8S1VkqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SpVluudi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294366;
	bh=l22hdRool1+i8p3XtMz4/jHHCxV/g1CG6Ymfm7j6uhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SpVluudi4lBqunLHi8HQiiXBax2fQlve98/g7D0la8NIo5TYsMcrlEWpZWRh7+BxO
	 ndOQdUzGtFOGq1Z1hFgGw+aoD+sX0nr9OetcnWiW6r+ml8E4ClH9J1xEsfMj7AGB/Z
	 YxIseIBysZNp00Y/TlAHGHbeSI9IOq++IXvt0mlLtgKiRJ6NiIBvMbQ63GDhdyBv2H
	 ppvWaBgeGBBoyKNAe+G59R88h1/ZsJd7/l3Y/yV+iK8N4zRQBL6tTKm5rbOdwSWzNm
	 1fxYe04yoePQu+cA/2o7UfQnDxQC4CH2CTyOdR1gyylkZpidnQGAoQ3Mizici/AnSd
	 YspMiodgfYfGg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E2FF17E1274;
	Mon,  4 Aug 2025 09:59:25 +0200 (CEST)
Message-ID: <a260336d-57e2-4e45-8df5-8330328eb224@collabora.com>
Date: Mon, 4 Aug 2025 09:59:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
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
 <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 13:18, Julien Massot ha scritto:
> Convert the existing text-based DT binding for MT8183 sound cards using
> MT6358 and various other codecs to a YAML schema.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




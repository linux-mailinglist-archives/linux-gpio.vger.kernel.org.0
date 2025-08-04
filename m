Return-Path: <linux-gpio+bounces-24005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E83B19D1E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 10:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474CF178B10
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 08:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A6E242D78;
	Mon,  4 Aug 2025 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZpZqGDK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01307242938;
	Mon,  4 Aug 2025 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294379; cv=none; b=jrlRLVQiYpqmI6s8g0H3512+V/QVC57Ad3uJjt2A7SA4j6XKwRTERTFS8Gc3CuFNDwINXyMQEAgynnyS+xK6Vx+siwSz2Rp2fejv8p4y9vQ+oz5wPnVioDmf1LTK+WKncGcMBZM4k91Ua6DkyLoqvrV9XOS4UrIcCyc5NC+XKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294379; c=relaxed/simple;
	bh=mrssKrIR8oW9ZUMovsji6QqwAFu2XtWWgavRe+usC4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTLOgi10SkLe7Yl6KFH8XDO8nCdQXORWfxPgtjpZVinMVmt0QiAfnhc1mQf9QxGAi5vW7blRxd1kkakqDq5/rNw367JyMkPkvFbYasAMhND73949emixcositqS1GooFM65FbHhit/f0ii6a0YFg676eY+HknMliMVwMhpXtFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZpZqGDK9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294375;
	bh=mrssKrIR8oW9ZUMovsji6QqwAFu2XtWWgavRe+usC4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZpZqGDK97dJdLVRO6Uyp41Q1jlqbmrkzwWKQirBabTcrqBVk5oAiSQ+F4ZHaJpiQX
	 fEEw8CkXPLM9FJv2Tq0FTgm+PG/QnM8JeNgV8+x+lGTGF7eC+fSj8tqsas3jaA8XlQ
	 bPrR2GPGfIDfWlGdnVVd6xVO3gRK6flIePNA66C59+0sgZuQ4JCPYlhYCiWjAiUkhG
	 qFyqOLiXIBMYYGmvFv++ViKeZ5amlE0NmWrw8RgBKNGc9eF6oqxCzYXuy+XcTMWULX
	 gdo/zKf62gTQrRiLhvjcosJF4pO6+UZ5qomJhYX0ux4n9UTa+Dnn3ZFjhS0RFXShtT
	 uH+plK7osWWbA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1753017E0DD0;
	Mon,  4 Aug 2025 09:59:34 +0200 (CEST)
Message-ID: <8e43a498-8a08-4f94-aac1-65868b8651f1@collabora.com>
Date: Mon, 4 Aug 2025 09:59:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dt-bindings: sound: Convert MT8183 DA7219 sound card
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
 <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 13:18, Julien Massot ha scritto:
> Convert the Device Tree binding for MT8183-based boards using the
> DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> amplifiers from the legacy .txt format to YAML schema.
> 
> This improves binding validation and removes DT schema warnings
> for boards using these audio components.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



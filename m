Return-Path: <linux-gpio+bounces-13651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC19E9499
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8FC9161D4A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BA322489A;
	Mon,  9 Dec 2024 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bl3gop7W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F2F184545;
	Mon,  9 Dec 2024 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748285; cv=none; b=PWONOIQZ2s91xQ5MkD5/fUXWbLTNPuXx1d/zGEbpNV6zaRlBTd/m3vA84Ih8zfdMvgCfwjCPir+rtQh0ciMkItdos9TWyOP/oNQ5ah8B1yDiCZm3dPzQzFdAk0NESxu/GMAsicaWfr5btHfuO+MMr+26/GEKSO3AxvIvQdrVz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748285; c=relaxed/simple;
	bh=aRM4AjETfxblgVQs2jCylFYpTFhBx0s71WVjQD11xxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpqmiA4t2o11oXdvgFKK7uVIjAGDQNzne+9uaOTkSe59hAP5qHUQS6PIO8/BAdr/0E2V+nqlpy9nN1soBIxiVU9L7v0yu1aTBTwsA9WYv3dCwhZiEJbEAdXa48duFbrod5n9IGPyglTlPiI9YKSlh3+JGwgw6GIRMeQ6cHVaJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bl3gop7W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733748281;
	bh=aRM4AjETfxblgVQs2jCylFYpTFhBx0s71WVjQD11xxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bl3gop7Wy7pK0sFk0FHAjU48eqP/0utLBOC+nkcjHPhp/6Afq/lA2E7r0CMZ6MAvw
	 kHdABAIbwOZ1FULOPWc8s68WIhxcO1Ui54KcduCBWNCiRun9u2y8ZWCRweC+UdlWAr
	 nZzvNA6tBbubuSauaI0Ar6KNqIV4VG9torEgsN18lZERZw7MudJXQxuPg5n5kn/Rml
	 b+VaP/IfHdFDXeI2BMTv4FSpo0KPUR8KKTuF/MRZa5tKGxecaHcXscJE3GoPnF6LV/
	 QEZw1ULFSVlS33iex53SVVYFn3NbLYhlOrqzr6MIDc9EgClANQ2KvN1gDhZMU2IfCU
	 p8SeUt/kLXuYA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6B4E17E3750;
	Mon,  9 Dec 2024 13:44:40 +0100 (CET)
Message-ID: <d6be8228-3448-49a5-81a7-98acbdd19fbe@collabora.com>
Date: Mon, 9 Dec 2024 13:44:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] pinctrl: mediatek: add MT7988 pinctrl driver
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Add pinctrl driver for the MediaTek MT7988 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> [correctly initialise for the function_desc structure]
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




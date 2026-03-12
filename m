Return-Path: <linux-gpio+bounces-33251-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGYeKCazsmmYOwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33251-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 13:35:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A1271DC8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 13:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10D523073A65
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9681C223328;
	Thu, 12 Mar 2026 12:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Mmxw8NDP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2287080E;
	Thu, 12 Mar 2026 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318686; cv=none; b=DIzG+PLokrbe/dgbevuIpGXZuNoCjIlyLGwUlT0DX8H0WzD94ZWhWuaGV98OPNHt9zBTxOoiBUb3rpUvXYSS5zn0DrGDl58LQT2wWl4rnRJEd8SGaaQhbLL8mBq22bciqb8dbwA/ICN6XJlBUeFCXjTPZvmtuGuXgXcJTAMBgdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318686; c=relaxed/simple;
	bh=gDX4Ye1h2qpbq7w/g5XbwbOmEL2tD+9twVkJmshODY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXiUORsf9263SzgKL0JCaFQblW5tI1XUWQCZzyYiJJonaX62a9rANE4jgCWp8X7KEiRWcBXU9AhVJ3KaUgYibpVxBKEGUYu1Y+aTp/RUxabbywjFTQIhTnSI2LzgO62vG5gJhbbC4aZm/dkSWmqDNcSMenKymGQMW6jssZ2hh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Mmxw8NDP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773318683;
	bh=gDX4Ye1h2qpbq7w/g5XbwbOmEL2tD+9twVkJmshODY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mmxw8NDPSOhoemTb2DqKWY7cl1FxbNTWVmoo175N7a5yfZeQSUQZyyaGvF/Y7JyHj
	 ChzA6xpuCPT+7q3rugMXstQAkpehoN0MLJCikjd0vgrpVLZHa8cFD6O5J+DYiVRHhD
	 1XGMz/rctdtd6KpvfcIeGam2J2Q0tDrCwJAduRJls3RT80A6Z7Lv+N/3wYRjjQtoo3
	 sITY4vdxs+mzPHLNPEvNeVpBYXWWzzVA0SHTMJ0RBGC5muMA1ZLdJrJHXtuE1ckrBy
	 9GOT81h0CoJmWztpH+udqqCAwogmwCmy4KeN91DxzMqhbOsCF68K+/Aql7D+t37IH/
	 px8b5q0ii8OIw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35B1017E0E6C;
	Thu, 12 Mar 2026 13:31:22 +0100 (CET)
Message-ID: <cbe7771d-9da3-444b-98fd-61c6ef504c91@collabora.com>
Date: Thu, 12 Mar 2026 13:31:21 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] pinctrl: mediatek: Fix gpio-ranges and include guard
 issues
To: Akari Tsuyukusa <akkun11.open@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linusw@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, hui.liu@mediatek.com, nfraprado@collabora.com,
 linus.walleij@linaro.org, mars.cheng@mediatek.com, andy.teng@mediatek.com,
 hanks.chen@mediatek.com, sam.shih@mediatek.com, rafal@milecki.pl,
 ben.ho@mediatek.com, erin.lo@mediatek.com, zhiyong.tao@mediatek.com,
 Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, seiya.wang@mediatek.com,
 tinghan.shen@mediatek.com
References: <20260312041533.187553-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33251-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 625A1271DC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 12/03/26 05:15, Akari Tsuyukusa ha scritto:
> While looking at MediaTek's Pinctrl driver and device tree, I discovered
> that on some SoCs, the gpio-ranges count was a little less than the pins
> defined. This means that the last pin will no longer be available.
> 
> And fixing this issue, I also discovered that the #endif comment in the
> include guard for some header files was different from the macro name at
> the beginning. These issues do not affect the compiled kernel, but they
> affect the readability and consistency of the code.
> 
> This series addresses the cases that can be confirmed correct without
> requiring datasheet verification:
> 
> - mt6795 : gpio-ranges 196 -> 197
> - mt7981b: gpio-ranges 56 -> 57
> - mt7986a: gpio-ranges 100 -> 101
> - mt6779 : include guard #endif comment fix
> - mt8188 : include guard #endif comment fix (two files)
> 
> The following additional issues were identified during this investigation
> but are not included in this series as they require further analysis
> or datasheet confirmation:
> 
> MT6779: gpio-ranges = <&pio 0 0 210>;
>      This matches the number of pins, but GPIO203 to 209 don't have
>      GPIO function, and the driver also has no control over those pins.
>      Probably needs to be fixed to "gpio-ranges = <&pio 0 0 203>;"
> 
> MT8183: gpio-ranges = <&pio 0 0 192>;
>      This seems correct because it matches "pinctrl-mtk-mt8183.h".
>      But, mode/dir/di/do are defined from pin 0 to 192.
>      "pinctrl-mt8183.c" looks wrong.
> 
> MT8188: gpio-ranges = <&pio 0 0 176>;
>      According to "pinctrl-mtk-mt8188.h", GPIO0 to 176 have GPIO function,
>      and GPIO177 to 189 are EINT only pin, but mode/dir/di/do are defined
>      from pin 0 to 177. "pinctrl-mt8188.c" is likely to be wrong.
>      At least "176" is wrong, probably "gpio-ranges = <&pio 0 0 177>;"
> 
> MT8192: gpio-ranges = <&pio 0 0 220>;
>      "pinctrl-mtk-mt8192.h" defines GPIO0 to 227 which have GPIO function,
>      but mode/dir/di/do are defined from pin 0 to 228.
>      "pinctrl-mt8192.c" looks wrong.
>      Also, probably "gpio-ranges = <&pio 0 0 229>;"
> 
> MT8195: gpio-ranges = <&pio 0 0 144>;
>      Like MT8188, GPIO144 to 164 don't have GPIO function,
>      but mode/dir/di/do are defined from pin 0 to pin 144.
>      "pinctrl-mt8195.c" is likely to be wrong.
> 

The whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Akari Tsuyukusa (6):
>    arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
>    arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
>    arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
>    pinctrl: mediatek: mt6779: Fix include guard comment in the header
>    pinctrl: mediatek: mt8188: Fix include guard comment in the header
>    dt-bindings: pinctrl: mediatek: mt8188: Fix include guard comment
> 
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi              | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi             | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi             | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h         | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h         | 2 +-
>   include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> 



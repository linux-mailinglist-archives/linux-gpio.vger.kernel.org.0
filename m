Return-Path: <linux-gpio+bounces-26020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E789DB5465C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 11:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE61AA7E14
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682B32765E8;
	Fri, 12 Sep 2025 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e3NUhl7P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104C625A2CD;
	Fri, 12 Sep 2025 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667648; cv=none; b=N2E+xdm5zbLnHb1x3f1MqhhQw2rfZzDLbV7hLI0WFq3rPbPZoGhWrMzM/jKxMbCClreVavmfKJQ6RA2Cw2pTilxUIBgaPjufTMqID/zfjU81CiD/tvmK/QHiLS08yjxrj+M0UgBuwQ4c86PZslqFsxyp+DnvKf6W7TEQSSqV9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667648; c=relaxed/simple;
	bh=I8lnMndXG8pdCIl26nEFltqvWn8FNn3OcwqWnXiwNbY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DKyxBIUOPweK8L15gqdArBB1ry2VtGKub26NbDnH/b++TlEVe0Z5WySAChxe5CVOvN2GpicHVtce391e+HyYnb1vZqahglbBgX8aPwIvaryV3sO7cI6Mil0Gqt872QSI8+pfPCUJ3ci1M2wlq6zex9cA7ByEZ2K5lhvF+IVfK6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e3NUhl7P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757667644;
	bh=I8lnMndXG8pdCIl26nEFltqvWn8FNn3OcwqWnXiwNbY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=e3NUhl7PV7etZf6rkduBXP9LFytOiLRWRVHpQQi34pLQH2vmBc4DiFZqBhkEoahk+
	 5lqCt82nU8wxCLKpQoITHdJ8Z0JsAUN8gOiCPGkt/3l4KRabrWgd5GMXOYQR7MNjEN
	 w8GljBH0yMYh7X4ylpEAJ7M3LR9VBwXXRQIkre1CLWp79yxx662xYoLeF+NA97Tx9n
	 BwwzxDPf26QjC+A4fKFR3wlu0CKWesFtQY6iOeUPiM6YJbLuMgtk36+zTtoNy9JK3J
	 z2oi2V/9DNedgWdar2swblhT1SWvuu35nFikjvuz8hxt/bUi712fqQesF/nE5n4J3I
	 4es+30UGJcTSA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43F6A17E07EE;
	Fri, 12 Sep 2025 11:00:42 +0200 (CEST)
Message-ID: <56380fe5-8358-4341-9478-ba4ce52daeed@collabora.com>
Date: Fri, 12 Sep 2025 11:00:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] dt-bindings: media: mediatek,mt8195-jpeg: Allow
 range number in node address
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org,
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-15-angelogioacchino.delregno@collabora.com>
 <70ae6787-ee0b-43a0-851e-1fb6c82f6c31@kernel.org>
 <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
Content-Language: en-US
In-Reply-To: <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/08/25 11:02, AngeloGioacchino Del Regno ha scritto:
> Il 24/07/25 11:14, Krzysztof Kozlowski ha scritto:
>> On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
>>> The dual and triple core jpeg encoder and decoder (respectively)
>>> on MT8195 are far apart: the only way to have this to make sense
>>> is to split those in multiple address ranges in device trees as
>>> one big range would overlap with other IP in at least the MT8195
>>> SoC.
>>>
>>> Change both the jpegdec and jpegenc bindings to allow specifying
>>> children nodes such as "jpegdec@0,10000", "jpegdec@1,0" or for
>>> encoder "jpegenc@0,0", "jpegenc@1,0" to resolve dtbs_check issues.
>>
>>
>> This should not be needed for standard MMIO/simple-bus nodes. I think
>> DTS is wrong here.
>>
>> Which cases really need the ','?
>>
> 
> All of the multi-core JPEG enc/decoders on MT8195 (and newer).
> 
> The DT changes are included in the same series as this commit; check:
> 
> 20250724083914.61351-35-angelogioacchino.delregno@collabora.com
> 
> Cheers,
> Angelo
> 

Any further comments on this?

Regards,
Angelo


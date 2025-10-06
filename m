Return-Path: <linux-gpio+bounces-26808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56703BBD778
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 11:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 151663B2993
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 09:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8016C946C;
	Mon,  6 Oct 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FfB/DOix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC381F131A;
	Mon,  6 Oct 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743538; cv=none; b=mXcSvsVfV86YjfEsjQXR4aLoJ7BPXZ+J2CN6dGZiRQqyPU89OWk0LknunewfqmJKb0E4BhU4tY3aDasp8UcOOT1dp3VpSx0WvELCigkGFlteybZP2QJf7ZF8LFS9Fbx23VV367wErr2As619PJFZcDAfMkJTMKk7qA+UPXROrz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743538; c=relaxed/simple;
	bh=hscnZUUxLtA7mtlzePy0AkMC7fr7x+NOSL1u/YrwjI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tj330FMOizYWJUXEfbzhG+Shv7sHYGh99BA0EIwOzf7R7W8FzNvpTnsm90BN/R9rw576E/EMCVRouhkmVFSZvq3WmvQr8iQdFOl/Ig29Xz8OD6aXL3BGxKuVU1Dr1tWZdt6tdYPJyrEeW1zWNpSuX0J5tXHgVTjk2s16sjX90uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FfB/DOix; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759743534;
	bh=hscnZUUxLtA7mtlzePy0AkMC7fr7x+NOSL1u/YrwjI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FfB/DOixx8HLns5gxS3GWfSeqUHQh9Zn+MOChQtuYcKtwwGAeKMu/J+xyBmVsS26U
	 BK2HVTT3DrrIQKYiRu0IOq+dILLssOqQNvJJfPeCmVNsbHbeBZUjF7hDHQ1Aab8NGk
	 PkRXUpJ1+nIQhApB038PH4umro2D+cD+stTvT1TgtIWga8vPkaYn2CBQ7sSgw5OYZZ
	 xD7v9KOhhBGQsC8xlRECre44Ljm4tTlLe3FHI0wK5v/JSyaMabVqrTY53Uv4ezwP2f
	 6vBguUeMMAm+XojFDoiOA8/oWP0Hh2UL3K8jQimxt4GGn8X1XghOolIyjjkuPSA4Zb
	 DvEmPozR5YjqQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 534CD17E0071;
	Mon,  6 Oct 2025 11:38:54 +0200 (CEST)
Message-ID: <1347051d-187c-4aa5-a4af-cfd8b275f066@collabora.com>
Date: Mon, 6 Oct 2025 11:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: mt8196: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/10/25 16:00, Louis-Alexis Eyraud ha scritto:
> The mt8196-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8196_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8196-pinctrl" dt-bindings, leading to possible dtbs check
> issues.
> So, align all mt8196_pinctrl_register_base_names entries on dt-bindings
> ones.
> 
> Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




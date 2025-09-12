Return-Path: <linux-gpio+bounces-26008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0EB544BC
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 10:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F6C57BCB37
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65FA2D7DD3;
	Fri, 12 Sep 2025 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eeE5f399"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF42D63E3;
	Fri, 12 Sep 2025 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664699; cv=none; b=q/eDm6Nw+qlDnburxicejub40IdfaNVN82Hpugio2qCSQPyTi6WBYddNPdgtsvt4dcSTCQzPX86/HXndn8kXvwwgv2NzkoLMFvWHgnzZBRVVW5y9F8n0WTHKqjeXZwuZpoW8Vm2uiwmKmaSjlrNBo1AIkKpdJU03JbJb2l+XGKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664699; c=relaxed/simple;
	bh=KjG8Shhom3ptheFneHi2DOtT3R4n7iwULOcuxa4vRfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3sO2xzTd/I/MjUSLyzvH62J5AuzBPU6moJ2JgjweFxoLOdgBoVIeyc/kHtW6zt6ZT+4VUbQiIt96CR8yzRFMwpnaj3ersLcrq3DTKZL7x7ikHg+8PtrdxIS9b1HtYxX3+JL4HjPbttD8/hKppzPtyTJ7Vt/QxQpm0vXGNTu/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eeE5f399; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664696;
	bh=KjG8Shhom3ptheFneHi2DOtT3R4n7iwULOcuxa4vRfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eeE5f399qEpPII2CaBiyLBTsmDdK8fMjj7NBb/wZVK6Rn/kzLJjGKmiuv/7M4/LXI
	 jdNMN+rKbS3YlpfLTBFWksZDVTRSTlF/dt/KjlexFAIYJklY1HHWoGK90O5RB7Vfde
	 DTgs2pih+PtyWTEMIwxoAgCgddkS2lGtd4+2+1Z0w7g/X9dFls1Dbwp+2wOWI1sumr
	 qTOE77ZANhMVf7aUL92O4mJP2F57yIUzFH7zERPc/PhlORaWpsd0dcrfneSp0jMKaO
	 7Dbh5o9Dos2L83yhzIHLu2MyNGCYr3fRzKVLHN8c2joFDPLA54h9wctXFkvdOheZRa
	 hC8Q8vBryFVeA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F296D17E12AE;
	Fri, 12 Sep 2025 10:11:33 +0200 (CEST)
Message-ID: <008524f2-9411-4229-80bc-a6b56ecca123@collabora.com>
Date: Fri, 12 Sep 2025 10:11:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl
 node names
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-8-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-8-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> According to the mediatek,mt8173-pinctrl device tree binding schema, the
> pinctrl node names should match pattern 'pins$'. Fix this.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




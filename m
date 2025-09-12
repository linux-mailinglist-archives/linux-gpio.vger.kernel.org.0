Return-Path: <linux-gpio+bounces-26013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93DB544E2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 10:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673B23A1741
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542362D7D2F;
	Fri, 12 Sep 2025 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R0dWqSGH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA11B042E;
	Fri, 12 Sep 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664811; cv=none; b=JGitqaRhDjwEO4mzbGoV1V5tioOoF3tUWwJL2s0AiT42761Q0LWsImfrysdSx45lW2W3rnw5iXwdwsTisaykfLmaIM/DOFvpNZ56NxsPeM48ASJuUSiitnPTdO2Nr1jr9FiAZvEpLBIpAdcH4+9UC89bnvSYeNDr5fSLwyOOBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664811; c=relaxed/simple;
	bh=PVzSvXABa8GXSjgAUepECwM4ACTyEKcHNTczAbtBCjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Unr+qFDhrBuTR4JL1dQC7ujtabiSqV8rdmGhBlM1HgzTySJTajDQATP4pi00MD1vN150Qx+j00xonPwvefRhnPGMEOIyl2laFZKfdLrmozvM09aySNUgzEdDPUJepyW//RdECtb9YGZJczFcaPnjieTEdwXj761rj5iGG0i8hsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R0dWqSGH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664806;
	bh=PVzSvXABa8GXSjgAUepECwM4ACTyEKcHNTczAbtBCjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R0dWqSGHxdsV0gXXW25c4EibkmCsCm2OPiHlXMnpPIBKSNJie2tyslyzzq6WNg2mF
	 rTwsEjaY34TvtovRAl9MZ108lQd7YytIzGM1DzsUn5QAxtwqs8N0bTv9DBh7vzwJ94
	 lrtktDu/FiCs5ZLZpuclhTOZSrhqz5gmv7n0TBU/W+IkBcDcOCJLUTVxwTsQhMvbh/
	 u3MgQg7a2cB2EtIxANExKbqnJXQiwHuPLX9ECknbYnHbgiIvg4YDMEAxr8oiv3e4uZ
	 bbyCjLrIMD5otaK5/0pn12bBoxXsZPfP53ATCpl+6SIavMPIkFGRwJH96tVnfQt8qJ
	 B5EU1dBwHXOcQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3FAB17E13B8;
	Fri, 12 Sep 2025 10:13:24 +0200 (CEST)
Message-ID: <3526ce55-41bd-47f4-ad8a-118a4b14a076@collabora.com>
Date: Fri, 12 Sep 2025 10:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] dt-bindings: input: Convert MELFAS MIP4
 Touchscreen to DT schema
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
 <20250911151001.108744-13-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-13-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/09/25 17:10, Ariel D'Alessandro ha scritto:
> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
> controller to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




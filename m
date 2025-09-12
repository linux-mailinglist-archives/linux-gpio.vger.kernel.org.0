Return-Path: <linux-gpio+bounces-26012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7BB544D4
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 10:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6216C48826B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC0A2D6624;
	Fri, 12 Sep 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S+MPOBou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44EF2D59E9;
	Fri, 12 Sep 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664728; cv=none; b=LuRzTenz+YLPMnH79jLuv/AfOufFW0zYLG5yU8OOyUSgc4KdE33ZREzQJs3xNUSjidqdz5V+ySd8mSC1Ns/j5ktkozpC/d41Ec7SakY/SblEycXKyBguv8fjyNtXtXgrMzE7H4KMVyJuig/j3Iw64fXqj+HctPhqHQh5p2SUCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664728; c=relaxed/simple;
	bh=eWR3vaX15OYYOq96vK9zNVE0Car4mWmBLZ+FSu8GRD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqtVBC70aQDgSNaWECVVtXZtAwOgRJRF9BWL6Wk76DQ7MMJ0FX0nsECtSX3vWWA95j5iGDtIAAOyjeOf7hDrCz3E7dW1HanJ6n1QkCrqPX7xcpP/Ovi6Ty1CawlTUd+xCPe19pxlnM4gzor9J1xNhiYeNtP7MjPtBB7aVPbNamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S+MPOBou; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664725;
	bh=eWR3vaX15OYYOq96vK9zNVE0Car4mWmBLZ+FSu8GRD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+MPOBouXjh2kEqeq27ZiA0yzeUPQ9i45uteJlppl8S943xiCtHrTqzxBkIQoMmXF
	 aJUMkXghcWX8a+cb1UfJtIlSMOQNFl8LWm6vi2eDDA2EkNnnVMXjU6hnwpIDhEM1MR
	 hmxx9CNSXQAXiHoJcmS7qG6L6gyy8QS3S4us+FfTHTCM0eYM5q9t4IhweCFf5tie+0
	 jw+3VPbWoQf+SCU9koDGrLL3vphgqvmA2rmvR0hBT1GjDMaR+PU5evzHUCWd3imhjm
	 X+6Z/dJ8L0ELwkO/x9y1DnafowMz484TjHqY8HGS9O3fAhISKOaCH8dhhpA40LAuOp
	 r/WJ2ML9lvQNQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C410F17E1389;
	Fri, 12 Sep 2025 10:12:03 +0200 (CEST)
Message-ID: <1963f06f-ae2e-414e-a218-01da0322723d@collabora.com>
Date: Fri, 12 Sep 2025 10:12:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] dt-bindings: pinctrl: mt65xx: Allow
 gpio-line-names
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
 <20250911151001.108744-9-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-9-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index b9680b896f12f..aa71398cf522f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -43,6 +43,8 @@ properties:
>         the amount of cells must be specified as 2. See the below mentioned gpio
>         binding representation for description of particular cells.
>   
> +  gpio-line-names: true
> +
>     mediatek,pctl-regmap:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       items:



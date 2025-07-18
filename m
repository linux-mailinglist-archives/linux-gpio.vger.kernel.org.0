Return-Path: <linux-gpio+bounces-23431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B8B09BA0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5065A3B2CB3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 06:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF6420101D;
	Fri, 18 Jul 2025 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Fu23QsMJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF01FE45D;
	Fri, 18 Jul 2025 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752821105; cv=none; b=MOxCehCbA6XhWPmSGe66YGMAuevS5tSL7LxGoT8xjHX+PbQnAQ4hjfehXSBAVmfHsbfBx8oIQpXKH9TZgt+ixPgS2WErwonEU1h1jwkdwRWWvl9dGcWb0StMPigSCBgzMIFf7taWQMyk+Qjzm9Opzf5R/ZxVnC2xbdb+HPmRY+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752821105; c=relaxed/simple;
	bh=sGbj5FKKg+88/BDygAxdWai9Cf3SHGZigk3s46T72ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXMym6PQelDLQETFOujLRj0cpdbpjWT2jcm1ljsrgfc18dmZnbiaNioaabiJUxTs4T+mGNbGsptoNaoBhIeM6igfNYg5fvveT9Qw4RVytB+Abx4NgJ7naAd8KfEysDcBalTUQ/zshhoJORGUSIh4me7Mx+1zLAs0EqFqgH5gbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Fu23QsMJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752821101;
	bh=sGbj5FKKg+88/BDygAxdWai9Cf3SHGZigk3s46T72ok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fu23QsMJypE9g+UTg1Qa9uvMU6FeZvBncgIcGIexPNIiog9kWIkqimRqQSHiGziYK
	 3+y9SEAiaPmtjT4oQnCZBLUXo2dF1gsixtdBYWnMNMg1DhqFjDkKMkoO7vjdPqWfyQ
	 78KqzOMmjs513mek6T7pYDbJk1eZKi8pVpiFmSiyS6VzN/hDXPK8GPAsENlz2vNZOH
	 n+bNno/I0fVLR3v5A6eyY0XgNjXkgvnV74G2/W2W6h7sltRV/gedGj8GHBSM93PUoO
	 xyx84itTrjWg6/UuAyz1libm0gzIYB38MR8S20AEsZ70fTBdCwggQyfts7i7N2ubiz
	 IHMZxHkv7uS+g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A03DE17E1439;
	Fri, 18 Jul 2025 08:45:00 +0200 (CEST)
Message-ID: <987aeeef-6f3e-4ba3-b04f-a60e0cf201ac@collabora.com>
Date: Fri, 18 Jul 2025 08:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: mediatek: mt8189: Add pinmux macro
 header file
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-3-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711094513.17073-3-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/07/25 11:44, Cathy Xu ha scritto:
> Add the pinctrl header file on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 +++++++++++++++++
>   1 file changed, 1125 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> new file mode 100644
> index 000000000000..f9c270ebab89
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> @@ -0,0 +1,1125 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + * Author: Lei Xue <lei.xue@mediatek.com>
> + *         Cathy Xu <ot_cathy.xu@mediatek.com>
> + */
> +
> +#ifndef __MT8189_PINFUNC_H
> +#define __MT8189_PINFUNC_H
> +
> +#include "mt65xx.h"
> +
..snip..

> +#define PINMUX_GPIO27__FUNC_GPIO27 (MTK_PIN_NO(27) | 0)
> +#define PINMUX_GPIO27__FUNC_DP_TX_HPD (MTK_PIN_NO(27) | 1)


> +#define PINMUX_GPIO27__FUNC_mbistreaden_trigger (MTK_PIN_NO(27) | 2)
                                ^^^^^^^^^^^^^^^^^^^
Please fix: this has to be uppercase as much as the other definitions.


> +#define PINMUX_GPIO27__FUNC_MD32_0_GPIO0 (MTK_PIN_NO(27) | 3)
> +#define PINMUX_GPIO27__FUNC_TP_UCTS1_VCORE (MTK_PIN_NO(27) | 4)
> +#define PINMUX_GPIO27__FUNC_CMVREF4 (MTK_PIN_NO(27) | 5)
> +#define PINMUX_GPIO27__FUNC_EXTIF0_ACT (MTK_PIN_NO(27) | 6)
> +#define PINMUX_GPIO27__FUNC_ANT_SEL0 (MTK_PIN_NO(27) | 7)
> +
> +#define PINMUX_GPIO28__FUNC_GPIO28 (MTK_PIN_NO(28) | 0)
> +#define PINMUX_GPIO28__FUNC_EDP_TX_HPD (MTK_PIN_NO(28) | 1)
> +#define PINMUX_GPIO28__FUNC_mbistwriteen_trigger (MTK_PIN_NO(28) | 2)

same here

> +#define PINMUX_GPIO28__FUNC_MD32_1_GPIO0 (MTK_PIN_NO(28) | 3)
> +#define PINMUX_GPIO28__FUNC_TP_URTS1_VCORE (MTK_PIN_NO(28) | 4)
> +#define PINMUX_GPIO28__FUNC_EXTIF0_PRI (MTK_PIN_NO(28) | 6)
> +#define PINMUX_GPIO28__FUNC_ANT_SEL1 (MTK_PIN_NO(28) | 7)
> +
Cheers,
Angelo


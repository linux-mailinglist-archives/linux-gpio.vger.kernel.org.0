Return-Path: <linux-gpio+bounces-11269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A10299C254
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3EA228112B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 07:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58828154439;
	Mon, 14 Oct 2024 07:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J1CbHuoa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5042E14B946;
	Mon, 14 Oct 2024 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892750; cv=none; b=k1IXL3Kvy7ngtMURh8O/i1ZBsyX+PSjFqMCIq4pSsqs4ZRTeS5Vp4TRBMEDXGuAFO88CR5lpdawYgrrEmWPrh9Na67ykOQXV8HMMihLdgP/HxsBtPWy7TNDKDZOKRUjLBS87NedwmuKPNhsEpUue1ThEdqPE3JWJm/3iaLsysHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892750; c=relaxed/simple;
	bh=W+cHl7IlQoiGhHQv9LKkyFt5GXD/dU8V71qLOXnRP/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxAx61DYpV20SDrYxCgsErxYQOlk9mQ8zwlqMXk4CklyR502LCRqoiz9HbAW1YSb3AwSCQifJgGvZ1jFD/nsJWztR/HV0aShSty//R77ZT3sD/kQWf6ra0TScYUDW/t376bY/bicsgN06wcQylTG29DfjREvXNM7N2XHEROU37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J1CbHuoa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892746;
	bh=W+cHl7IlQoiGhHQv9LKkyFt5GXD/dU8V71qLOXnRP/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J1CbHuoa5+YDRoE0wlR5ZqbuEVKI6pMJOiObf3nRtXrcnFHIeJtFsAjayselWHdXU
	 EoMxmYpXs3JcGk8s60E5PdahN9TRnl8mdDzqXwmBMmxJTIlReV6i3Y1r6I72RHi4oJ
	 Lg45Tp+7FUc4Evr81rkWSnjxWxeWuoxzzLjrUe5hZb3cIb4mIlYtClB1GMlQnkpP23
	 MSVfiD/yCIhuZM9D8E+EMc/fs0AUMVIqphcVvdOaRpemD/pV0KRNn8tcmY3pJl/q62
	 7kSqXCR/h5SXM4yQJv9/0IDLHjVYm/GojExllNa9yjWXKMB+AMsLU1atDPENJb8gnj
	 DIRiUovB1n1MQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3E7C17E10C2;
	Mon, 14 Oct 2024 09:59:05 +0200 (CEST)
Message-ID: <66ad5cd6-cac2-400a-95c2-f72d68b2a706@collabora.com>
Date: Mon, 14 Oct 2024 09:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6735 pin controller
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-7-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-7-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT bindings for the MT6735 pin controller, which consist of macros
> to be used as values for the pinmux property. Each macro corresponds
> to a unique possible pin-function combination.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   MAINTAINERS                                   |    6 +
>   .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++++++++++++++
>   2 files changed, 1154 insertions(+)
>   create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e336dab6fdd1a..f95ae886f9fd8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18311,6 +18311,12 @@ F:	drivers/pinctrl/mediatek/pinctrl-rt2880.c
>   F:	drivers/pinctrl/mediatek/pinctrl-rt305x.c
>   F:	drivers/pinctrl/mediatek/pinctrl-rt3883.c
>   
> +PIN CONTROLLER - MEDIATEK MT6735
> +M:	Yassine Oudjana <y.oudjana@protonmail.com>
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> +
>   PIN CONTROLLER - MICROCHIP AT91
>   M:	Ludovic Desroches <ludovic.desroches@microchip.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> diff --git a/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h b/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> new file mode 100644
> index 0000000000000..1134caf9022c5
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

They're all called "pinfunc", even the newest mt8188 one, so please:

mediatek,mt6735-pinfunc.h

just for consistency and nothing else

> @@ -0,0 +1,1148 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H__
> +#define __DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H__

#ifndef _DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H
#define _DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H

#endif /* _DT_BINDINGS_PINCTRL_MEDIATEK_MT6735_PINFUNC_H */

Cheers,
Angelo


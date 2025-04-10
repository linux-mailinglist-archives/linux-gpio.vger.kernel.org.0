Return-Path: <linux-gpio+bounces-18624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0780A83B9F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE4EC19E5131
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 07:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77C81DF985;
	Thu, 10 Apr 2025 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jbx9V4Z6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09D1B81DC;
	Thu, 10 Apr 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271353; cv=none; b=CGJJwfPXGhCPLbic4cp6oNCdHOvqTt8PThexgkK+jjSXDgwS7WchTkYXQpD9fZBFjCOEFIMBadUErDoIZuTj5srSJs+ilYPUBm4j/LYN8pb4k4Vv9LkZPqT87T3XeoEe53/R3ENTxnxCmZE7Rd/EpuUaGLqfOjTI8me8aHWUSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271353; c=relaxed/simple;
	bh=ivk3g2xuuWzp02wJHrEL79rm/ijdgS0pYE3iPtcnQ94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsPzVp9cMri+zCokzLIzxOaifvc11urhcOLkb/rd5hHz65eeVZdAbDLf3Sv2aZz0Oc15tDz0GiUquH2RIdt1oKbVG9oMQFFJ96kT+u311u4hlh5//X6x+qQY/14/CTTfOh/FXzzxeAiU6eAd9fcwphcPwRL1wnrUxvfy4Bub1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jbx9V4Z6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744271349;
	bh=ivk3g2xuuWzp02wJHrEL79rm/ijdgS0pYE3iPtcnQ94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbx9V4Z6DWUoU2FXPTLYMh8Baz0STBgWnytWTfreUVWvbr0cTFRO4VZYiZ9al2LOI
	 giTpUXroI3ZQtJur1zlcFZx5s8tBcHfswO1hrY5UjZadLnG9b8c//71sQ4OdNRYjfO
	 YV5yPWulenhUJJ5FlzZF8J5nOl3xYmVaQPYL2UXW+FqmN3DYK2VOpu8tNg/ODZDfyg
	 q1QU1nZ+FRiJCbn2gt5w3137KFG8+LgQ7VWHgJFfkOYZ+9M+y9TzR0/A+Cw40euUat
	 7wDME0UQw4PTNRjrYRfltKx/ixnbDGw3TaCm7oxyQR8QoOP6dmnbBttUUH7onIQpcQ
	 ncq3vrwIqSg/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92A2417E0402;
	Thu, 10 Apr 2025 09:49:08 +0200 (CEST)
Message-ID: <7e77b50c-1808-49fa-a711-956a570ad208@collabora.com>
Date: Thu, 10 Apr 2025 09:49:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com,
 Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com,
 Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/04/25 07:48, Cathy Xu ha scritto:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>   .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 220 ++++++++++++++++++
>   1 file changed, 220 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> new file mode 100644
> index 000000000000..cef7e0321722
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> @@ -0,0 +1,220 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8196-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 Pin Controller
> +
> +maintainers:
> +  - Lei Xue <lei.xue@mediatek.com>
> +  - Cathy Xu <ot_cathy.xu@mediatek.com>
> +
> +description:
> +  The MediaTek's MT8196 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-pinctrl
> +
> +  reg:
> +    items:
> +      - description: gpio base
> +      - description: rt group IO
> +      - description: rm1 group IO
> +      - description: rm2 group IO
> +      - description: rb group IO
> +      - description: bm1 group IO
> +      - description: bm2 group IO
> +      - description: bm3 group IO
> +      - description: lt group IO
> +      - description: lm1 group IO
> +      - description: lm2 group IO
> +      - description: lb1 group IO
> +      - description: lb2 group IO
> +      - description: tm1 group IO
> +      - description: tm2 group IO
> +      - description: tm3 group IO
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: rt
> +      - const: rm1
> +      - const: rm2
> +      - const: rb
> +      - const: bm1
> +      - const: bm2
> +      - const: bm3
> +      - const: lt
> +      - const: lm1
> +      - const: lm2
> +      - const: lb1
> +      - const: lb2
> +      - const: tm1
> +      - const: tm2
> +      - const: tm3

Why is there no EINT iospace?

Regards,
Angelo




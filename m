Return-Path: <linux-gpio+bounces-26153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23357B5717B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 09:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E04318836F5
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 07:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAD92D5955;
	Mon, 15 Sep 2025 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LfDSNl+V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CEE2D5410;
	Mon, 15 Sep 2025 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921341; cv=none; b=mm5X0mHtt5x2e5V+pFgtE1fqki6kR0lELASqNgDoGW0vjw6L2RWS0k9BsbJCx7GmEUHTohvYXvMoo/D8mTwjNWaK+EtPqtSB5mj4pHrswwZ3OGnc3K00FXNJUt6xCkrNO8opZo0KS6mVFJo+4raCjCk4MYz9GWMsY7m3ORAnZ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921341; c=relaxed/simple;
	bh=GXEPazfaV4yHZLRavKhdyKStvO3E/DjBkytTjtx7oYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZE8YqeRYjfPLJzw9VohRfXUVehXF+8NoAV8YRD0CvZBPPMBGuf0BgOGzfJhKYSiSN2Lma5gGFwhs0bS/ow4hssbskKdrBEAsn12kxxt29DXPI5xkszLJSQp6v4KLJ4br3z7iXGCj30189iu+8WlQb6cA8mYt0jsc5X8XJQfA2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LfDSNl+V; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757921337;
	bh=GXEPazfaV4yHZLRavKhdyKStvO3E/DjBkytTjtx7oYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LfDSNl+VFT3HhTIWTMkRiyNe781kVDlIlyWFraoYz0tlEIfTvGX1/ULcCrKlXvOoh
	 Ywjaz2qMjH24AyXSe5b8qNWWgwHLvVUKC7WYG52ku74vFv7CtdYLj1uLsT3KBD+AHe
	 13xsGCqvephqcHESgMgHNU4Oie2mNy1bWPwfL9GTZKhE8FgwYyqoA34QzVbfsycetB
	 0dumOr/X9ie8215pyMubkphHrfjASAzvEOHm8udMCXST6Dh9HPTuS4Hyv+p0NS2o6H
	 r8eJuiZd3P/q1M5BAiJDssxFAcH6iY3al1w06QfezBf9zqtFQkuEDpwdMN3q7Q2Yz6
	 sGf99VFaO+3Qg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F36D317E0AC3;
	Mon, 15 Sep 2025 09:28:56 +0200 (CEST)
Message-ID: <7bacf8ca-4ec4-4b06-b989-52e287a812d8@collabora.com>
Date: Mon, 15 Sep 2025 09:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: mediatek: Document MT6878
 pin controller bindings
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
 <20250914-mt6878-pinctrl-support-v2-1-254731aa3fc2@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914-mt6878-pinctrl-support-v2-1-254731aa3fc2@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/09/25 16:51, Igor Belwon ha scritto:
> Add device-tree bindings for the pin controller and the EINT controller
> found in the MediaTek MT6878 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  | 210 +++++++++++++++++++++
>   1 file changed, 210 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f320d286ad2155bc4aa449c195ddff3a8686204c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> @@ -0,0 +1,210 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6878-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6878 Pin Controller
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
> +
> +description:
> +  The MediaTek MT6878 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6878-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pin controller base
> +      - description: bl group IO
> +      - description: bm group IO
> +      - description: br group IO
> +      - description: bl1 group IO
> +      - description: br1 group IO
> +      - description: lm group IO
> +      - description: lt group IO
> +      - description: rm group IO
> +      - description: rt group IO
> +      - description: EINT controller E block
> +      - description: EINT controller S block
> +      - description: EINT controller W block
> +      - description: EINT controller C block
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: bl
> +      - const: bm
> +      - const: br
> +      - const: bl1
> +      - const: br1
> +      - const: lm
> +      - const: lt
> +      - const: rm
> +      - const: rt
> +      - const: eint-e
> +      - const: eint-s
> +      - const: eint-w
> +      - const: eint-c
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below mentioned gpio
> +      binding representation for description of particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true

Krzysztof asked you to restrict the maximum number of gpio-line-names if I
remember correctly, you forgot to do so :-)

Cheers,
Angelo



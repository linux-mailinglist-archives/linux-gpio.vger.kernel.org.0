Return-Path: <linux-gpio+bounces-24008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89706B19D27
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 10:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B26F1899634
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 08:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF5C2451F3;
	Mon,  4 Aug 2025 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ltw4DBWg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4D24468A;
	Mon,  4 Aug 2025 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294384; cv=none; b=ka2u7o67lonbYKO9ixN9SMpYOLwrMzJesN48xc4LiXw+1Ro945Kiw8TwNyIqY3K5HbLbacYee52S9Pr6I8BQAYlKYr+3vt9os432dz6o1GTychwsPEjPR7r/5oIjCsprq1dvhVxL1LG8kpDN9lsqL8k3PPu1eVTqIghkwr9XWbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294384; c=relaxed/simple;
	bh=IBXZ7nSQOKi0kqZYEQGLEV58gS4Z53xGfxUWv08M4f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uI4LqyXSP+JalThJxpSsCzkSbkH2goUtV04zaOsN6wm0x7xpWVnfUbasoLT/608NTkfPLJ0XsDCOEx8Y/3NmYuWVLS0ecOCyIgapVM0bdXVL0XBtsJ8bl9PhqzFYHq82oQs410t1Wy6nGLqID04AxedWiXeYu2Bh5RlNnnhePUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ltw4DBWg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294381;
	bh=IBXZ7nSQOKi0kqZYEQGLEV58gS4Z53xGfxUWv08M4f8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ltw4DBWglDgA5GAc6JaQwwgXfzFmD0Ngc/7DTsm/ftT4OLSHJg+9t+fB2+eEAOp/G
	 xp+aEw/HrAL2sTNdcXPUiePzn99rqHR3k6pLb2VZYwPH7YNbCBg2AJMrCnfcLz8RPk
	 KF4qq4/BN3c9VnNtXCNNd5xGD6LQ8depQpJQdDE/xHgMDu7wM5Rn9koqEGs9/tsFDw
	 9j+pn9SP2d/9O95CZa8fsAtz/TF4LHQJbwtVm7MmUT4fIpLSEMqBcSz3OcsUZklYhF
	 pHMoeA7SJb1Clk5+sVZVN/WpyQeEhL1RkcYvUCFTkyd4ekJRVcTxYAUaRnp7N38Rj/
	 V+GJHXPhHnUjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1135E17E04DA;
	Mon,  4 Aug 2025 09:59:40 +0200 (CEST)
Message-ID: <ab97489a-9493-4005-9a1a-9f88ad970b05@collabora.com>
Date: Mon, 4 Aug 2025 09:59:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 13:18, Julien Massot ha scritto:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Is MT8183 the only one?

if:
   properties:
     compatible:
       contains:
         - const: mediatek,mt8183-mfgcfg
         ^^^^^^^(if it's not just mt8183, this should be an enum)

then:
   properties:
     power-domains: true
else:
   properties:
     power-domains: false

(check if the above is correct, don't blindly trust what I wrote! :P)

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

(if it's not only mt8183, keep the R-b on this commit regardless)

Cheers,
Angelo

> ---
>   Documentation/devicetree/bindings/clock/mediatek,syscon.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
> index a86a64893c675ac134af609b3a49242565db6ad8..1011bc46cfcb97b90b86019e95a7e4bc8a819342 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
> @@ -76,6 +76,9 @@ properties:
>             - const: mediatek,mt2701-vdecsys
>             - const: syscon
>   
> +  power-domains:
> +    maxItems: 1
> +
>     reg:
>       maxItems: 1
>   
> 




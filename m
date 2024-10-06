Return-Path: <linux-gpio+bounces-10900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C9991E50
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 14:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBDDE1F21ACB
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 12:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2846D176230;
	Sun,  6 Oct 2024 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3fe97gF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183216D4E8;
	Sun,  6 Oct 2024 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728218856; cv=none; b=ueSjC3ImGZP1bI2ASFV3zRnGhruEYDF8BG7TdCh8PpSfo3Z+eAIvIt3f0ajKXSb4OJRSN4EjyO38GixeltTy3gBNDybYiIEyiXUT4FQDkXmOJwpeExco1eBFCx0CFt9Li/b/2B87AZ1tjJ2qeQyIN1yTMJnPksXEwslmdnEdmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728218856; c=relaxed/simple;
	bh=AvaqHiW6YBwhtBJJbJKHvvdReZ767Nx9pY7bI7eLXLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICZh3T8ynC29fNf8GhFhc94IXiL+8dqZeQ/ul6W0x6pLBwGna2J4koZVMWtZTNiTr3gkVQz+oCEMkXLw773XKrpGoeq9dXoyaE62xGtILoyupyxESGY4r4cDBFUW6zqACvgOGCfIvkXOvmMi+MC3BEsBktd4A8g8nVUoQ82Gun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3fe97gF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF33AC4CEC5;
	Sun,  6 Oct 2024 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728218856;
	bh=AvaqHiW6YBwhtBJJbJKHvvdReZ767Nx9pY7bI7eLXLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3fe97gFneWXirJqu9oC4yIjBak7BMOaI2EGU0tGl5B00h9IcuR4TUUwGmyhL9CQL
	 eCHAQVT+AtdTOnOw8zCDpWTG4SD/T0HtGYO3qROCo1rdPnWlEfZTqh0I9Yr2MszMxh
	 6EEeDETov8pr9JhkXfZRkMZWwBUDTEIzarRWW35pEhLC5CAerYhjwDGgNQM8y93I2B
	 2zUtAlxy9a8SgkPm7wAO9bF6vnrIvWqpseH/LVR1HCobkBMSag/+MntlVrQkSXWq9l
	 IKMx4JD54Jqvco0dYT6X3gVDW7TfhqT3T6QIEQOVlxDYPtC2l9MS+5QZRoZwWYObNX
	 RiWu/3upU2a0w==
Date: Sun, 6 Oct 2024 14:47:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, 
	Frank Wunderlich <frank-w@public-files.de>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, 
	john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Message-ID: <4pmhzc5sf2c7dww3tihyqq5coco6u5nx7xvtqami7u55442gij@mqvyvqrpa6ft>
References: <20241006102154.17087-1-linux@fw-web.de>
 <20241006102154.17087-2-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241006102154.17087-2-linux@fw-web.de>

On Sun, Oct 06, 2024 at 12:21:48PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add binding definitions for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index c532ec92d2d9..db7d1c570aea 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -21,6 +21,7 @@ properties:
>            - mediatek,mt7620-mmc
>            - mediatek,mt7622-mmc
>            - mediatek,mt7986-mmc
> +          - mediatek,mt7988-mmc
>            - mediatek,mt8135-mmc
>            - mediatek,mt8173-mmc
>            - mediatek,mt8183-mmc
> @@ -263,6 +264,29 @@ allOf:
>              - const: bus_clk
>              - const: sys_cg
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7988-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: Advanced eXtensible Interface
> +            - description: Advanced High-performance Bus clock

Why ahb is optional?

Best regards,
Krzysztof



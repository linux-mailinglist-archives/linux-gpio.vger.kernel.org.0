Return-Path: <linux-gpio+bounces-14494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7FA01127
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 00:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02CCD3A4719
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AC71C3040;
	Fri,  3 Jan 2025 23:56:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA7D1B0F15;
	Fri,  3 Jan 2025 23:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948583; cv=none; b=L42s6STdRMP0OYOe+EBXVhtk2rETZ7NuiXlG3RkyfvjOuNt/qAyAy+KcI2AC1PFzZ2etg4murOQfIsjW0Moz3S+0Qc+JjuPWft4UYe6nuQEBVbCi+4q1feFAXNRu5ZhHTBvs/FTqs1fMksLxsKMa6SBiV0RvPrZOeVlkTobfTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948583; c=relaxed/simple;
	bh=IG3Yy5SWhH+xltKsmW6o6NPqWQytUerwDJb9WhU5Vfw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKHlw//z3PhZCJnqWQmEbciz81rob90qktWAXHklqqzrQviqV2o9tGDDOTkpcDF3kAY8XxnO6S1gSK47R8CDlgOwODMzwgi/SQpL31/WLU3TRqvhsLCQEr6csHBOze8LXjotI0m2tXH5Pdb2gLRqfKE6EfvmjY8gA7XaVCNFAts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A419A1480;
	Fri,  3 Jan 2025 15:56:48 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 809163F59E;
	Fri,  3 Jan 2025 15:56:18 -0800 (PST)
Date: Fri, 3 Jan 2025 23:55:15 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: sunxi: Add NetCube Systems
 Kumquat board
Message-ID: <20250103235515.6b2540fb@minigeek.lan>
In-Reply-To: <20250103204523.3779-3-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
	<20250103204523.3779-3-lukas.schmid@netcube.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Jan 2025 20:45:18 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Same double Signed-off-by: here as is patch 1/4.

Also would be nice to have some prose here, maybe mention that it's for
industrial(?) embedded applications (as opposed to some hobbyist SBC).

Cheers,
Andre


> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 046536d02706..f536cdd2c1a6 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -589,6 +589,11 @@ properties:
>            - const: emlid,neutis-n5h3
>            - const: allwinner,sun8i-h3
>  
> +      - description: NetCube Systems Kumquat
> +        items:
> +          - const: netcube,kumquat
> +          - const: allwinner,sun8i-v3s
> +
>        - description: NextThing Co. CHIP
>          items:
>            - const: nextthing,chip



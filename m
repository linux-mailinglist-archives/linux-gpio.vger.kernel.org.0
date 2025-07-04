Return-Path: <linux-gpio+bounces-22811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F6AF9C92
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 00:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9373B216D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 22:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E1328D829;
	Fri,  4 Jul 2025 22:42:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29EA28CF6C;
	Fri,  4 Jul 2025 22:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751668932; cv=none; b=kr40Op2SB7QCvLouVKqtStIcHldOO9sYuU7uNd6RcJzT0Hsfs/EItO9o2WMoz2vmpCIEbGcGt3eUWN2GBgKTL5f9Evj6W9jLXR9CEtoyrA88dOphyaZUZVS0uyB2xTU3yZjC2LXioqfLPzAu1AQa7z7faC8nQzsAd/67m+e/XIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751668932; c=relaxed/simple;
	bh=cPRhYI67+/sP1Rd8C91MlGh50ZiwNxh5/Zs6B0xSiM4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jRvLN6W3g5tPfpcVFNut7IpQt+HgIjAQTOGYTLMJEyjb4Q44zVj60uYx8x00J8NXDH7mt56b335KT/u8sry+/iKv/DyEd7x+OVVo96EXDOZzOoWFAq/lTVIyBd/JZPind5NXT+GU8JrI6+78IoZ3fDTu6D4uAyhyoO8/UtDUM90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B2BF1C0A;
	Fri,  4 Jul 2025 15:41:56 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC7763F63F;
	Fri,  4 Jul 2025 15:42:07 -0700 (PDT)
Date: Fri, 4 Jul 2025 23:40:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC
 compatible
Message-ID: <20250704234040.5021c468@minigeek.lan>
In-Reply-To: <20250626080923.632789-4-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-4-paulk@sys-base.io>
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

On Thu, 26 Jun 2025 10:09:21 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi,

> The Allwinner A100/A133 has an Ethernet MAC (EMAC) controller that is
> compatible with the A64 one. It features the same syscon registers for
> control of the top-level integration of the unit.

As mentioned, the A133 has two Ethernet MACs on its die. Both look
compatible to the A64, but EMAC1 uses a separate syscon register
(@+0x34), so needs a separate compatible string for that one. We don't
seem to have an example of any board (or even SoC package) that uses
the 2nd EMAC, but I suggest to not slam the door on that possibility,
and use a name suffixed by "0": allwinner,sun50i-a100-emac0. There is
precedence for that in the H616 case.

Otherwise I can confirm that the EMAC is indeed compatible to the A64,
so with that fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre


> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> index 7b6a2fde8175..0ae415f1e69c 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -21,6 +21,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-emac
> +              - allwinner,sun50i-a100-emac
>                - allwinner,sun50i-h6-emac
>                - allwinner,sun50i-h616-emac0
>                - allwinner,sun55i-a523-emac0



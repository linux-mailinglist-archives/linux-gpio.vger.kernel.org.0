Return-Path: <linux-gpio+bounces-14362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA29FE6D2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 15:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 276AE3A2050
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 14:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8F71A9B54;
	Mon, 30 Dec 2024 14:07:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC9678F34;
	Mon, 30 Dec 2024 14:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567667; cv=none; b=p+uITNB/93l76D5fPV98ZzPMKYBEcN9UU+XHaEfAMaNAa/Erv1Olrwq0rTAqgzoU7xsPKndQRwZVNJypCJB+MeBKahMeOeKaS/kptNTTZ1Dqe9UHpoWl9I+qmuNUgw1Xgffe2mux4j8K9dP5PQLSvbA8mchiiGsdi7LeK3oI/Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567667; c=relaxed/simple;
	bh=kMKlPcKexh2PSWhdStPuQrjXgzk3tm2csuLK44HKfiw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRlzlvY9OyJ9swxNjmZScvMh8AFP18RDRXd937dWnmEQwawNN6os58dH4V/MRJXJNuqIN56bVRnfJP+J6NkeUpm3XIl8865ZhT5ZYjUOLkbCRfD+wDT+s3eA4dkvQFWCW/Xt6N80I+GtiMF+a5HfdTQWlYgQQK3WTGeMDb0+tPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE42143D;
	Mon, 30 Dec 2024 06:08:11 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D758B3F59E;
	Mon, 30 Dec 2024 06:07:38 -0800 (PST)
Date: Mon, 30 Dec 2024 14:07:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 04/22] dt-bindings: clock: sun8i de2 clock: Add
 a100/a133 compatible
Message-ID: <20241230140728.78629cd3@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	<20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Dec 2024 18:30:53 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

> A100/A133 uses one mixer without rotation support, which is same
> as sun8i v3s. Add it with fallback to v3s compatible.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> index 3e00905b66ca..ed038967929b 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> @@ -23,6 +23,7 @@ properties:
>        - const: allwinner,sun8i-h3-de2-clk
>        - const: allwinner,sun8i-v3s-de2-clk
>        - const: allwinner,sun50i-a64-de2-clk
> +      - const: allwinner,sun50i-a100-de2-clk
>        - const: allwinner,sun50i-h5-de2-clk
>        - const: allwinner,sun50i-h6-de3-clk
>        - items:
> @@ -31,6 +32,9 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-de2-clk
>            - const: allwinner,sun50i-h5-de2-clk
> +      - items:
> +          - const: allwinner,sun50i-a100-de2-clk
> +          - const: allwinner,sun8i-v3s-de2-clk

Wait, does this add the same compatible string twice, once as a
standalone, once with a fallback? This doesn't look right.

If you positively know already about an incompatibility, just provide the
single string. If you suspect there *might* be something, use the fallback
version for now, and we can revisit that later.

Also please note that the semantics of the fallback is:
"Any driver supporting only the V3s can also support the A100 version of
the clock, as the new device is either fully compatible or a subset of the
old one."

So what would it be then here? The driver patch [16/22] suggests it's
compatible, but that might just cover the part that the Linux driver
implements? If it is compatible, you wouldn't need any change to the
driver code at all, the DT core code takes care of matching the driver
using the fallback.

Cheers,
Andre

>  
>    reg:
>      maxItems: 1
> 



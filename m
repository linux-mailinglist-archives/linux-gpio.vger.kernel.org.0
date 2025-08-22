Return-Path: <linux-gpio+bounces-24813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F4CB31BFF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC82D1D63A71
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2C633EB19;
	Fri, 22 Aug 2025 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQzBiOPb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722230BF64;
	Fri, 22 Aug 2025 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872781; cv=none; b=k5GCuWFc3506PYb5FJjwKdLQNqYO7tcpCBfVC4cxPoHcyx9c3SEJPpHc0FlO7JeBqdBgKQPiW8YlvfBjlwyDBJuguf3B1Av1r4F2Ni84i2IKNBBnuBBSiX1eGa5dXL4K2xl2T/PQ4iWTtkKK1sv9pf49IYHWk7lla8civPeJiLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872781; c=relaxed/simple;
	bh=yR2a0hlZlJWNqa5Pxnw/o59qiFkj48Ytcl2iMJos3kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJkbAR1IU7Lxc4dJ8V6YEyxgcBsayjKERsQuVAySSKHp5TzqHLwDJE2qEDDl6Iu2/Ux3bJXkPhu8kLF9xluW00T+IRJdvDKiosjA/jlb7dWlWSRKasCTeZxYKM2cM4yFCNVDFrf69g/YmopISx84iRju/1V4gqwLoe60Vbi7FVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQzBiOPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D665C4CEED;
	Fri, 22 Aug 2025 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872780;
	bh=yR2a0hlZlJWNqa5Pxnw/o59qiFkj48Ytcl2iMJos3kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQzBiOPbnIVW6CB9d95xFm5RvZ+attj48I1C+754UWEl/6LMuipPV4vAKFH6R8/1U
	 FhbENl/wdK5bEkZller7c6jkdXC/+cqle4XJPGK21roguSd+s7E23ZmKyFKHIw4NXt
	 57X1fom3ZEN0WWLoqEHNu5hrDgXj1ye5DK5q02AkSfdQ+REOB2u562kgjPnzAzu/Cf
	 VrpSskC3JlAxDdVw2ujqGpvF57vx9P48HdRwouCCnaNwSgYuHiYCz1mTfnzSbA08Z5
	 Nx1Da3bpxCKu8PN3wqy68twiUVZhSJE0nH94Q/HofkcTjmYJTLxThN8v7KMHSnWLV3
	 NOPoQi5njx9Ig==
Date: Fri, 22 Aug 2025 09:26:19 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: Add bank width to Intel IXP4xx memory
 controller
Message-ID: <20250822142619.GA3633655-robh@kernel.org>
References: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
 <20250820-ixp4xx-eb-mmio-gpio-v1-2-0e167398c8ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-ixp4xx-eb-mmio-gpio-v1-2-0e167398c8ac@linaro.org>

On Wed, Aug 20, 2025 at 12:59:44PM +0200, Linus Walleij wrote:
> This bank width is necessary to set up the memory controller
> properly unless the peripheral is using native bank width.

What's the native width?

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml  | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
> index d1479a7b9c8df4dbefc24a4706b1fecdda37bc6a..e306344373c5cd5c1bc6f4001d1252d8d0485f60 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
> @@ -15,6 +15,11 @@ maintainers:
>    - Linus Walleij <linus.walleij@linaro.org>
>  
>  properties:
> +  bank-width:
> +    description: Width (in bytes) of the device on the chip select bank.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 2, 4 ]
> +

Is there a default? If so, we should be able to omit that width.

>    intel,ixp4xx-eb-t1:
>      description: Address timing, extend address phase with n cycles.
>      $ref: /schemas/types.yaml#/definitions/uint32
> 
> -- 
> 2.50.1
> 


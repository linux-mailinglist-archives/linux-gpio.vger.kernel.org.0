Return-Path: <linux-gpio+bounces-11834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7B9AC22F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D68471C23B62
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83E315D5B6;
	Wed, 23 Oct 2024 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+vIG12j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFA156F27;
	Wed, 23 Oct 2024 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673512; cv=none; b=fGZ+6inwCUnn+2p8K2gCVQA++cjQtl6MBaaWmPvywc/T+bzRhwoIFraoD72ZCfCcLGxxl8bkpi1sAyWxvxDnmOAbJp4awMRtx7lu5FCc5rtaANzHtkLKJ0LmDfScu3B9sy5SNx1EdLW8rN7JfmVZZc2kHcDWfy8j1tlTpk5LUpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673512; c=relaxed/simple;
	bh=HgvIm+497Hmdq2R0Wn5snLjGoTlA1hQo19CTjG70174=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA6Z36ghnnOhP46bToymShXijrne1fgPjfYOsKIbzlhGCl9r8YUf5WkgsbwD9/7LHJ7unCTgtppnqm4FAMJ1lGQEgK+wXjEC0uEXLVOnxmE5ualxR84LDfZ0M2U0w8a/ZvnOB9J6PEsmxfbm6h5zxmmcsCGDYMgb8ci6wcxqLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+vIG12j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D1C4CEC6;
	Wed, 23 Oct 2024 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673512;
	bh=HgvIm+497Hmdq2R0Wn5snLjGoTlA1hQo19CTjG70174=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+vIG12jWtj69d2TdKEb+dkCv8jMcz0EKHpltNBDS1/400GbeSIBlOjBfIXifOSao
	 7lVwe2DOdbLkI4ynU6aWPCyBeZxpxNEIcWTRjMCNfAShdZU9wo+G3x1C5rxg8eOTz+
	 7knWRBkXcPbr0cU4fWLfeEvpL210+BtxZhI2DF8+3Ehm7MJE3Wbh/31v+P34652Hzh
	 OSOGLh9C2YSVW6Brd2I8ce7rdwt/QowMBuh7OFAvrn85lWHrXF9gCl+iZtIX1LWEPS
	 ku7mqABnrIxLKHV9pPti3C1e8uXKFOnIUiL7oszjv+3WU3QTUrcRf/cBW1SExRfbzm
	 TM3BCIrikeLFw==
Date: Wed, 23 Oct 2024 10:51:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Cheick Traore <cheick.traore@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: stm32: support for
 stm32mp215 and additional packages
Message-ID: <2g65375shtjq4udjfarfspqtpg5q27oeerqskt2uzwj44pvnbb@rderpevnrzxs>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-12-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-12-antonio.borneo@foss.st.com>

On Tue, Oct 22, 2024 at 05:56:55PM +0200, Antonio Borneo wrote:
> From: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> Add support for st,stm32mp215-pinctrl and st,stm32mp215-z-pinctrl.

So all previous patches are for this? Then they are supposed to be here.

> Add packages AM, AN and AO (values : 0x1000, 0x2000 and 0x8000)
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 +++-
>  include/dt-bindings/pinctrl/stm32-pinfunc.h                   | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 9a7ecfea6eb5b..0a2d644dbece3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -27,6 +27,8 @@ properties:
>        - st,stm32mp135-pinctrl
>        - st,stm32mp157-pinctrl
>        - st,stm32mp157-z-pinctrl
> +      - st,stm32mp215-pinctrl
> +      - st,stm32mp215-z-pinctrl
>        - st,stm32mp257-pinctrl
>        - st,stm32mp257-z-pinctrl
>  
> @@ -59,7 +61,7 @@ properties:
>        Indicates the SOC package used.
>        More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
> +    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800, 0x1000, 0x2000, 0x4000]
>  
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
> diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> index af3fd388329a0..01bc8be78ef72 100644
> --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> @@ -41,6 +41,9 @@
>  #define STM32MP_PKG_AI	0x100
>  #define STM32MP_PKG_AK	0x400
>  #define STM32MP_PKG_AL	0x800
> +#define STM32MP_PKG_AM	0x1000
> +#define STM32MP_PKG_AN	0x2000
> +#define STM32MP_PKG_AO	0x4000

Why these are some random hex values but not for example 0x801, 0x802
and 0x803? That's an enum, so bitmask does not make sense here.

Best regards,
Krzysztof



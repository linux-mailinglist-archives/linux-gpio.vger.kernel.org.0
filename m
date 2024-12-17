Return-Path: <linux-gpio+bounces-13957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511F9F4A75
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 12:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64B9B7A1160
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 11:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB94B1F37D8;
	Tue, 17 Dec 2024 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSMnlegB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF31F03D5;
	Tue, 17 Dec 2024 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436710; cv=none; b=FamM4+GUEkX6xblw+9rK5LslyBb27OzH1zqsyigoCpeE3bkxzF+Ojfoa24wdm6305Kvw3MTLObs/JU1fKSpCUTfp+HQ2K37RvOejLTGHw7Y0BxUjDqGh7zFL8ynYarEMO4TXzcuTuz674UTx+NOfZLAXSw4Gua2iBKGogzSvQIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436710; c=relaxed/simple;
	bh=bZGnTtL8I4wF27grhHMD5fheet6iy1hz0D6X5C4mhrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCJ8SN8wXcFnDJ174//SZZEH0nDJLBZvnHNPzKL/yhtGRppDVBZHbIjgrkBATLxmpqypYCzpO/DkC8cn3b3n1mn4hUmWPfmFWHJavTUoIEYKXu3ESxXl75RNB7iuC0W0xT8bMYEJBCOda7hoVOIlqrn3dOYv129UdDO91wxPu0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uSMnlegB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0723C4CED3;
	Tue, 17 Dec 2024 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734436710;
	bh=bZGnTtL8I4wF27grhHMD5fheet6iy1hz0D6X5C4mhrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSMnlegBConI/ucMw6xiatXEGdK9EsEshB9wxpAJ6VX9RjiH7M/hVAg67Efu17HUR
	 lEDBwTGh4KytiMzaP5sBcbZEe0AXqWqqWEXs9SAEnFY3teTnbMLqE+Re75QxxxD3uP
	 PL1x3hvM2Pk1hsZGWd9TbkEP+kiLtvBxUOVAYAmiLJomiIMTYtdPtqQw44yQX3q3BO
	 H/M5hfLcLKHbgR4iaC84jvQY+mGqYd5H+DUrsF+F96/T9HY8m5XJ/LWc/fIZxSpaVV
	 lHBjNGLW4b/aOc4F6dDm7sE9ASo/r6i77e0+kjw5xuQ/QiSJcOrs5Rocq5MgryirT6
	 IdHwQyDnaFR/w==
Date: Tue, 17 Dec 2024 05:58:28 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Message-ID: <20241217115828.GA859895-robh@kernel.org>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216195325.164212-2-biju.das.jz@bp.renesas.com>

On Mon, Dec 16, 2024 at 07:53:11PM +0000, Biju Das wrote:
> RZ/V2H has ports P0-P9 and PA-PB. Add support for defining alpha-numerical
> ports in DT using RZV2H_* macros.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Added new header file with separate RZV2H_P* definitions.
> v3:
>  * New patch.
> ---
>  .../pinctrl/renesas,r9a09g057-pinctrl.h       | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> 
> diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> new file mode 100644
> index 000000000000..9008a7e71609
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/V2H family pinctrl bindings.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_RZV2H_PINCTRL_H
> +#define __DT_BINDINGS_RZV2H_PINCTRL_H
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/* RZV2H_Px = Offset address of PFC_P_mn  - 0x20 */
> +#define RZV2H_P0	0
> +#define RZV2H_P1	1
> +#define RZV2H_P2	2
> +#define RZV2H_P3	3
> +#define RZV2H_P4	4
> +#define RZV2H_P5	5
> +#define RZV2H_P6	6
> +#define RZV2H_P7	7
> +#define RZV2H_P8	8
> +#define RZV2H_P9	9
> +#define RZV2H_PA	10
> +#define RZV2H_PB	11

I'm not a fan of defines which are just 'FOO_n n'. And these are if you 
speak hex.

> +
> +#define RZV2H_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2H_P##b, p, f)
> +#define RZV2H_GPIO(port, pin)		RZG2L_GPIO(RZV2H_P##port, pin)

So the user does RZV2H_GPIO(A, 123) instead of RZV2H_GPIO(0xA, 123)? Not 
sure the bounds checking the port is worth it. pin or function can still 
be crap.

Rob


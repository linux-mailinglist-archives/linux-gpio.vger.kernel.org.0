Return-Path: <linux-gpio+bounces-11833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F99AC228
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0990F1F21CE3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF858161935;
	Wed, 23 Oct 2024 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rN6WKyaA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5F15E5BB;
	Wed, 23 Oct 2024 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673389; cv=none; b=ofahYoAket1p0gMtBKxrW3z65YWqRgGFnUxFccMlfP/wfN93QfKUBgI7x23SxxHcpeSIpzApz5ootJSy0kHviEIxEW0i4P78vxS9jDuBk/bSSzyJnde/aNoO/w902WuOX+H6AqIvmpcTIQsesAXTQ9r2vi4EaUMKAIweYuc7Jl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673389; c=relaxed/simple;
	bh=lgGbkc6uaJYpUzsc1Gh3kVF2XFhM1rzwAZjnJSwPphI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzmzX4BdpjCinmrHqiE6Mpq4Enf0tozOk3CnDd6KFFa9D9jYCBp0WdrZa9dpWq5XucxFx0MlABaq9u5PMo8ompq9M7BlNaJugZApYU4Cp0rG5Jvch0gDyzHO4PmjtRuEkhcQs+LoaAeVaLiSsjrQ/WCBS8Li9IgQW5jDlfNtp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rN6WKyaA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F54C4CEC6;
	Wed, 23 Oct 2024 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673389;
	bh=lgGbkc6uaJYpUzsc1Gh3kVF2XFhM1rzwAZjnJSwPphI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rN6WKyaA6gR0etHHoxMHugUoM5I4bhZAvWw0Ih5lCiYC9+06idpzCaGNDt9NvmdZi
	 Q19ul2J0lVL4ndKksr0hM2KOnjWV8LhUyDO5LRUIlfmS2iDUhzrf7cjOqubyJ1eHA2
	 8EsC5ZBfdj8hChTqynVuEK8Ee57NxEc5PgM/ZacW9RvRXX83tIOLW1SoOGCK1Ip7qU
	 25QoQhymEmjdUcY8Nvwr5t7g5mWV2QpwMvpcO16SqPmBwDZ/3X8Oa/rH3DR23eTbQb
	 n+RINzAmQv5SOWrdMC8yUxe2O1zKphVfJDfQaH2jDrLaEmmj2HUrjJSjJvnHkhjw5a
	 Ho9lsRDUwqTvA==
Date: Wed, 23 Oct 2024 10:49:46 +0200
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
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO
 synchronization parameters
Message-ID: <e6sz7p4lgkmuvgosafob5dvwtvp4ruzuzmwz4oyepcajfui2xm@fom7mj5fbik6>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-8-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-8-antonio.borneo@foss.st.com>

On Tue, Oct 22, 2024 at 05:56:51PM +0200, Antonio Borneo wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> 
> Support the following IO synchronization parameters:
> - Delay (in ns)
> - Delay path (input / output)
> - Clock edge (single / double edge)
> - Clock inversion
> - Retiming

Why? What is missing for existing hardware support?

> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 5d17d6487ae9c..9a7ecfea6eb5b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -207,6 +207,54 @@ patternProperties:
>                3: High speed
>              $ref: /schemas/types.yaml#/definitions/uint32
>              enum: [0, 1, 2, 3]
> +          st,io-delay-path:
> +            description: |
> +              IO synchronization delay path location
> +              0: Delay switched into the output path
> +              1: Delay switched into the input path
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Why enum? Why not bool? What is the "synchronization delay"? Why this is
needed per board?

> +          st,io-clk-edge:
> +            description: |
> +              IO synchronization clock edge
> +              0: Data single-edge (changing on rising or falling clock edge)
> +              1: Data double-edge (changing on both clock edges)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

All the same questions.

> +          st,io-clk-type:
> +            description: |
> +              IO synchronization clock inversion
> +              0: IO clocks not inverted. Data retimed to rising clock edge
> +              1: IO clocks inverted. Data retimed to falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

OK, so if not bool why this cannot be a readable string?

> +          st,io-retime:
> +            description: |
> +              IO synchronization data retime
> +              0: Data not synchronized or retimed on clock edges
> +              1: Data retimed to either rising or falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Missing blank lines everywhere between properties.

> +          st,io-delay:

Use proper unit suffix. Or is there no such?

Best regards,
Krzysztof



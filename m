Return-Path: <linux-gpio+bounces-29999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB2CE9446
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 10:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E5DC3002D01
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98282D7812;
	Tue, 30 Dec 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbXCjB2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896A71EBFF7;
	Tue, 30 Dec 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088317; cv=none; b=bEJTUBbhWguVU8LrpuGcvBS0Y7wnrCHUdqfhw8ySui1GIf6BzY1KmvVTzMTTfb/TM3daKV+wIxkmm6u09Y01hj4rdZ3rRR+XcElTqUnf9NsSJTsgM7uCb2Ife8ZHr44vVIb0ijcOAb52ZzJO75PTiBx9CPhPy1urfZeDvy41Ybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088317; c=relaxed/simple;
	bh=gBRYhXzdxpgW2LbKNyYvsM7152M325zjOsxLOggdP+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+S5/+FHFFFB7QJ2f/7/4ATmLVVzPBxhk5hS4MDW/0Yox7Z/+VOA1/pdSMB2mkyYDFnTfn4ka1kKkXboK7DlDJiPGnCRDQ38TyYsGLze8XDuetQHDTng+dRZv1+qYrH1t+tU6jE8gwT6GEvp1j4IhEqzx1idWHr53HtOQ92tpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbXCjB2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA6CC4CEFB;
	Tue, 30 Dec 2025 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767088317;
	bh=gBRYhXzdxpgW2LbKNyYvsM7152M325zjOsxLOggdP+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbXCjB2fOucaUCT6DZ/4HYmb/t1btB8YpboCpdi4/TkEXOCWY5BL5HZ/thDpGB5SI
	 kB/7ou2/eMO0Ov6ktO87snHDPIlPI9nvsNYZe3l1S70JLx4i15nK/kytMr2Lo/aaL4
	 +MQcWMtecazKK1IY7rNYBe480dAGT51WHhSJlGIz8DV28oMXnJSX3MFL4xEVLPOTrO
	 Jo8JOVZlm+WVSYlzNNL3NXsRB+eR2/8yLu+9Ui9uzpKggDKRJG8q8Om7WPhwYdQ1RR
	 t4t8nJ4jILRNVX+8jU5qfBwi1l6GA1yUcOz+35Z7OdO2fKc6eMfKCL0VgK4sNbeaBE
	 Y5LGO5wODwDSQ==
Date: Tue, 30 Dec 2025 10:51:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add
 exynos9610-wakeup-eint node
Message-ID: <20251230-dramatic-gregarious-stallion-15bc07@quoll>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
 <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro>

On Sun, Dec 28, 2025 at 06:05:52PM +0000, Alexandru Chimac wrote:
> Add a dedicated compatible for the exynos9610-wakeup-eint node,
> which is compatbile with Exynos850's implementation (and the
> Exynos7 fallback).
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> index f3c433015b12..deb2730855bd 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> @@ -48,6 +48,7 @@ properties:
>            - enum:
>                - google,gs101-wakeup-eint
>                - samsung,exynos2200-wakeup-eint
> +              - samsung,exynos9610-wakeup-eint
>                - samsung,exynos9810-wakeup-eint
>                - samsung,exynos990-wakeup-eint
>                - samsung,exynosautov9-wakeup-eint
> @@ -107,6 +108,7 @@ allOf:
>            contains:
>              enum:
>                - samsung,exynos850-wakeup-eint
> +              - samsung,exynos9610-wakeup-eint

This is not needed. Device has 850 fallback, no?


Best regards,
Krzysztof



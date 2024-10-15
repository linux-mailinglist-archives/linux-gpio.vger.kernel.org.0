Return-Path: <linux-gpio+bounces-11376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E799F835
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 22:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21D7BB227E8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 20:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36571F81AE;
	Tue, 15 Oct 2024 20:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcgzRTHz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510C9158D9C;
	Tue, 15 Oct 2024 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729024809; cv=none; b=EiVrXbYhHh00fOoJpc8StmxcyZleEj1ROFT3QlUqssR4qeyjyZwEgcRw1nroWkVX9yMEYnnI59233zOJQtRNHwEbC/GuSz9QhzY/LGbQulYiyIM1ZsMvQbpcRW/V1MEsyUxhsHsSdQdWSFNSOMcockkSwFVnaN1f8RmdGXdvLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729024809; c=relaxed/simple;
	bh=0wWYi439brCW/pXJK0fnqR2LBbpH4OIgiVOrCpdGInk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlyhSa5zyl/qlFOXELu4JB3DYVOWaLxs3iEv0V/ygNuXxjhZ4J/4fJpxq9+9N8F8DtrqioxQ42UayU+qZLYuh8/VOUBSYSDKaUGRRkvKFbQVRyWEPAz8K07RsOz2LQLOAEL7/VRI5rjEmZrxrCvWZD7h/kHdopJMqy3kXTh2HaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcgzRTHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A079DC4CEC6;
	Tue, 15 Oct 2024 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729024808;
	bh=0wWYi439brCW/pXJK0fnqR2LBbpH4OIgiVOrCpdGInk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcgzRTHzFNR/xIadpsTQRxfGRzN0HSl8WrBPM0bP35P6s5qe6f1EIrSgkxMfGFhdQ
	 kU3ScGv8rTUEAjTPB2Ya1f6pzuHFn2YwrwA9wM8itcojnY5WQhRVsSHoryXNHSb0eh
	 FlgCJ4M54YEMemWAmiGDiIqyied/ZBm/6vlAFhEq01wsOrBdzD6ezxz+hyYY8U2ZRo
	 oOPFpM2XNFB8kvENVdr6yaHrKCM91Im8KY2+hosXEUUadphXXb8b9b5Y+/GsJTlkZ/
	 swo00HexgFEL9GCYegPGMWvnC5AWHmzrkwRQIqcqxEI7L6nP/psZXs0Z1N0ltMYBNx
	 EG2T6b9Qr1Maw==
Date: Tue, 15 Oct 2024 15:40:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Jaewon Kim <jaewon02.kim@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: samsung: Fix interrupt
 constraint for variants with fallbacks
Message-ID: <172902480730.1923750.8393362089469271008.robh@kernel.org>
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>


On Tue, 15 Oct 2024 08:58:47 +0200, Krzysztof Kozlowski wrote:
> Commit 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7
> fallbacks for newer wake-up controllers") added
> samsung,exynos7-wakeup-eint fallback to some compatibles, so the
> intention in the if:then: conditions was to handle the cases:
> 
> 1. Single Exynos7 compatible or Exynos5433+Exynos7 or
>    Exynos7885+Exynos7: only one interrupt
> 
> 2. Exynos850+Exynos7: no interrupts
> 
> This was not implemented properly however and if:then: block matches
> only single Exynos5433 or Exynos7885 compatibles, which do not exist in
> DTS anymore, so basically is a no-op and no enforcement on number of
> interrupts is made by the binding.
> 
> Fix the if:then: condition so interrupts in the Exynos5433 and
> Exynos7885 wake-up pin controller will be properly constrained.
> 
> Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallbacks for newer wake-up controllers")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../samsung,pinctrl-wakeup-interrupt.yaml     | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



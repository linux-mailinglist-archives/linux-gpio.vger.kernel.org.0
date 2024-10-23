Return-Path: <linux-gpio+bounces-11830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 528779AC212
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7783B2448D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF53B158A33;
	Wed, 23 Oct 2024 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrGTwzfl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8664436E;
	Wed, 23 Oct 2024 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673190; cv=none; b=dYXMxj2GNG7z3ZFB4/0EK3+PiJUSUyGFQQYTfMLL7veBSao+5eC5js2blZgJXU+SNKToXgZCy32QW+wmE9GCBZZGGjS9zc9hksM2f6pihHZ4v4u+QOHwY3jhGteWWSxNChMj1dIXPPIfeEpYRx6MBiCwN1P4ih7b5XDhfSKZHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673190; c=relaxed/simple;
	bh=EyZ4QiVXvPEbdDEY9GYHE0FBEpWxqBjav2KP4V+fZmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KClwmaTslhz8vww7ts5B+y2VAM7XVDyZbZgY7s/Nk4KQAlXOAPY8CNNUZ5+7Ie+QTX1nZ0Uv9ouNhSdKjZ/cIjpQi4+xInJERAhnCYvfLL9NuN6zQfj+C41r3LYaRlCWBdulx4Wo+DMreKDv86STKX+lLIh8wUZE2GKGWKet33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrGTwzfl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4126C4CEC6;
	Wed, 23 Oct 2024 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673190;
	bh=EyZ4QiVXvPEbdDEY9GYHE0FBEpWxqBjav2KP4V+fZmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrGTwzflVTlJdLIYjkTXefJWDQspCdNwO9KK8hrcJ8ViG8MqtrEAXscjMMkwEYP+A
	 T+wzl7dpb9x4hhedL38JuarGMqJjqWsjoRxeEFLJl4DDo5fm311snn7nopIYzbaqfp
	 dVPRLzJsNyAN6twwq2zRatp/Y/rrZzqK/8ZFMkojCjJ9n379WOiFBUwyWpGBr1Fa3k
	 dc+bgfJCa2ZVFEZyQZGkQhA2Rdo+ThVHyFj721UoR9Gh4kZJDHwhSLHYPU8CIGmQj4
	 NdtMkoyp8RHC5ID7k06/gbWk+wybN0bw40moyYK7E52Nt4drdkwyY3IERFdGyQA1k/
	 R07zGMfUYWV+w==
Date: Wed, 23 Oct 2024 10:46:27 +0200
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
Subject: Re: [PATCH 04/14] dt-bindings: pinctrl: stm32: add RSVD mux function
Message-ID: <vvmrfkpzs4ns2bhvcx2k2fdvacxqjdx5p2oyygzgr7zjrbdl6h@cvfo6623oxl6>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-5-antonio.borneo@foss.st.com>

On Tue, Oct 22, 2024 at 05:56:48PM +0200, Antonio Borneo wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> 
> Document the RSVD (Reserved) mux function, used to reserve pins
> for a coprocessor not running Linux.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml     | 8 ++++++++
>  include/dt-bindings/pinctrl/stm32-pinfunc.h               | 1 +
>  2 files changed, 9 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



Return-Path: <linux-gpio+bounces-11832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 819759AC21B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21A54B25649
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B721684B4;
	Wed, 23 Oct 2024 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1VlbBu3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E89C15B149;
	Wed, 23 Oct 2024 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673230; cv=none; b=dgK1FqSA7+YbRnhchXVGEaYadpu9/7RAfltCifa28/+pxW+OAQ2ac2m2JxV9Hl04hj1kgGpscm+JgZltMIWcv4nXkuisgtz6KATHZVyWhNumZ3Mc4bLDlLQCbpOkjyowXRo3yW/XOH7qycfcNE9bnivAXKC6nzcKVlmi8cnAb5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673230; c=relaxed/simple;
	bh=sQCaL8wIVaWesMEl2IuBh8yvFnEYERMyZxkVskwu+gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/DX8ScguhW5393cO2oKwItDGfa69dfu0ZnkI/TfL69Bt1mnlkMM/665NkZyvjMXczHxNWjg8oRMkEm3DjttVQxE7Fmg6xi7CithwN2wa+4Qf4a+aGifI56tQ7A6kWOF/WGVG+eRsQq4c8oig1Xi+8NDGL4nhYIPTTQSAN1bG+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1VlbBu3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508BAC4CEC6;
	Wed, 23 Oct 2024 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673229;
	bh=sQCaL8wIVaWesMEl2IuBh8yvFnEYERMyZxkVskwu+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1VlbBu3skf4BjgI8ETke0TDHkMsFdd/J0wO4Ydwx65B+gLJOzbDiuhUELm3g32uA
	 wN7IdytXIswgmShGb3dH4bMatayOTP4FigLInhS4PTYUrZ8RbQcy7av5m66uxEGhPf
	 fn0nBeGeYRO6WHBBHx5llN6eO7kIz3U1auSKhO9GHS771LdLMqNQHg6JBOiP7nLjkQ
	 3itSdsZh2YwHK/wbafbyzupDM5uEfiuAxMPqabh+I0LD5Qrcs6NKOHUFeiCtcj4ViO
	 RP9Vd6gZuVSMcRICAL1Y8cwF/APmDkq7c88DMkw8xy3GTs+LIv3Odi6IfowmWGgM/e
	 MRzRzv6Sb19WA==
Date: Wed, 23 Oct 2024 10:47:07 +0200
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
Message-ID: <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
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
> 

BTW, which *existing* SoCs use it? Aren't you adding it for the new
platform?

Best regards,
Krzysztof



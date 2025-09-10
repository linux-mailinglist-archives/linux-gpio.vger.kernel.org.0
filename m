Return-Path: <linux-gpio+bounces-25849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E95B50AC8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 04:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DDA47A23B5
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 02:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EAD23185E;
	Wed, 10 Sep 2025 02:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GITImNdl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE422D7B6;
	Wed, 10 Sep 2025 02:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470120; cv=none; b=fgOAdz3krfDiRFpFkfY2yNpXN575+PyvoUH3mFvm+isyZi8xegjaJqA5yrCl7eLeFy5bLgpIHWno4DyFLMFFzFbpFKpXzqfZgGNLm+yQj6KduWNYmAOS/VFkYQkYVxnV503jI6VPDMqLkKxLGWZadVuqFW2onKeUnCUyMTlCKSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470120; c=relaxed/simple;
	bh=oXLn8INDpdCoJrpkQGlJIpgFhY/DdHeBq7FxlLPN/QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvxuiwGtVCPl+wBQ/A9xPyjSE0K9m+PPkdb6eHJ7QWxrl4rXz7HhjmNnu1OyLd5oCVYB6tT1u14rWHIFvz7fLE5rem8ee85T+aTXzwdF4yI976PyR0fytQIX0yrygUWeqmvKWNjVcaWQsTKaPo2GWwGA/qG2/AMkAsnEo6GLUcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GITImNdl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F02FC4CEF4;
	Wed, 10 Sep 2025 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757470120;
	bh=oXLn8INDpdCoJrpkQGlJIpgFhY/DdHeBq7FxlLPN/QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GITImNdl8yjBYTBk+yQX/0uVI7ltS4/7XTrkNfaxIJHXYKft1RXu9SwcEiy/Sy5bs
	 6bdVpM6Gwf1mjLTdS9K5NE+Pl3DXTqFkPbfYd/R8q3fgo815ac2nao1ORqBMwNhGqk
	 3dwdifNPSWhqoyBB6unLZ9lZyRslZOtg+2nqu+DKJqgRNTyMkHjgM2bGZEBNxdC5EX
	 7B4lT+XR/2wik9T6Wd+0XsIhMwuaQrVeDpewcB22N9NtIDUSCnIbZrXtJIotOauMI7
	 BaAxguReXGE32lMgS9CzrOu9nkoeXk+eP2fJqReOyu5th/roU2pO5hMyPxGJlBHxA5
	 kk5KMFM0JGx6w==
Date: Tue, 9 Sep 2025 21:08:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	Valentin Caron <valentin.caron@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: pincfg-node: Add property
 "skew-delay-direction"
Message-ID: <175747011863.3632305.14159900534334210899.robh@kernel.org>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
 <20250905135547.934729-3-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905135547.934729-3-antonio.borneo@foss.st.com>


On Fri, 05 Sep 2025 15:55:40 +0200, Antonio Borneo wrote:
> Add the property "skew-delay-direction" to specify on which pin's
> direction (either input, output or both) the value of the generic
> property 'skew-delay' applies.
> For backward compatibility, 'skew-delay' applies on both input and
> output directions when the new property is not present or has
> value '0'.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/pincfg-node.yaml    | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



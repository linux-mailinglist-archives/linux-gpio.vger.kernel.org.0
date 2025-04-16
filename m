Return-Path: <linux-gpio+bounces-18947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7BA8B93E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 928B817415F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302B21B960;
	Wed, 16 Apr 2025 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izS7D6Jh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B10184E;
	Wed, 16 Apr 2025 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806947; cv=none; b=ou3wDc1REYWuX72wLQVwPUEa2Ez0vdllK8cjTmulofdfKIOGpoJ/ZtqXc46Ghdbhms0OieChRX4SaRvxMssSaM+dIAsZEaqOw5zrmIKTfEL6NRqIzQ45Dvyjxv+HeC3w7pv+NGiWno3cWKHZEnbpVGLWRmUQBVWCSGvTpiGsrC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806947; c=relaxed/simple;
	bh=cGbYrDypZIXD1Iyx6gn7NMdklUEpAlhTMM2TWrA08ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9kJ/qWHAKRKknMBr+6FgbFVIEqthnAc+kdUPfehqj0c9Eyh4FJChbRb/5gmdCnhl5yFce2gaDWrHvDWik6TnhfvMpprxqjVZNVwn1Ef4qddVP25qWwV8QjgzFiGwZFf/fmIWlM6o90p9exutI3AvSKdYg1hAfXgxnBDAObDYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izS7D6Jh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A656C4CEE2;
	Wed, 16 Apr 2025 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744806946;
	bh=cGbYrDypZIXD1Iyx6gn7NMdklUEpAlhTMM2TWrA08ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izS7D6JhJB8WrMHqsK4OCqdE5EQXrndb28B9CCtpDEAPBvSNUpAp5AlympvIFSkMa
	 zC5ns0sXJnwDtvn1Htr4C9WdRLc1b9fQXzyavSMzwOOJtguPxImtl3K1xvu8N7BURP
	 cCvFxLgOdZdjkg7x3eyut9ZqKNr1olu3CnxdNHUOT7WLoV9cqNvZehx5nc9icz4OoH
	 Tc9E4xL8AkuJUszE8OaMZFbe4qLHdSZjFGuQLU3t172YLHd8kjjbDuu/Xk7b0ueuSe
	 kd1hxOHPKgLrd7PlyBOK0P27fC5+p7kvc9bxdTBbLpJbdMkoA9Ip8yGT6TAGcVzgDA
	 wmQPyNuXez67w==
Date: Wed, 16 Apr 2025 07:35:44 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt
 to yaml format
Message-ID: <20250416123544.GA2469371-robh@kernel.org>
References: <20250414192606.3349661-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414192606.3349661-1-Frank.Li@nxp.com>

On Mon, Apr 14, 2025 at 03:26:05PM -0400, Frank Li wrote:
> Convert fsl,vf610-pinctrl.txt to yaml format.
> 
> Additional changes:
> - subnode name force pattern to 'grp$' to align other imx chips.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,vf610-iomuxc.yaml    | 83 +++++++++++++++++++
>  .../bindings/pinctrl/fsl,vf610-pinctrl.txt    | 41 ---------
>  2 files changed, 83 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
> new file mode 100644
> index 0000000000000..c201a3daf2a30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license. Freescale was the only author on original binding.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


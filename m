Return-Path: <linux-gpio+bounces-11569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA759A2EA1
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 22:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 730B11F2173B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 20:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961BF2281E3;
	Thu, 17 Oct 2024 20:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dns8aEgL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC2017BB32;
	Thu, 17 Oct 2024 20:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729197411; cv=none; b=EiR3N86rHbCqX7z0mtxyBKlinQ764NJ5qnpm8yh/ld8JR3j7BhHX7iBN60ciO3Kj0s2xJUw0M6AXhPN4fiwh3Y1LVdBSeAtkkPF7mIwFXLFGvjV0d7VMuhpt3CzNMdgQKgVLzpSr5iD1nbkfDnxueGZiEt/1QLfi9SJoenQAG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729197411; c=relaxed/simple;
	bh=3pORoOZs/yeiJDi/XhX2w922zKobaooCEiTENuXDMS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKrPN7VZR8q8OD90oCvNL8Vz71l7u4kNINC7lqVl2efV6Ek539c41cBGarwHSb0puIK7rycBKbaAkDaKal4tgdBGi1tfeUThxSs5tKTsSsIQX42GGZJ8/auKHhAzsMFGfw2tNtlT5UfvMva0xo48Lurs2X+f36v2oiXPD2ZkvUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dns8aEgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBEFC4CEC3;
	Thu, 17 Oct 2024 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729197410;
	bh=3pORoOZs/yeiJDi/XhX2w922zKobaooCEiTENuXDMS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dns8aEgL9oz06vBjmKgsjs5U/WQK0+HMPVsHtyG72gLWPXo3uYyvmvdg3/epyGjY/
	 Di6Nuo1+0mPE+slaPlrsKbYcGrB+XpLjUsWcjAFhc4AwF8HR2c21/iPKrPCeAcsQsZ
	 dRpgZkOGt7h4iY7TRQ0qPGDFPzpJqRZhnVjzwsX/8WSgiVEUwyZxQ1MyyrOS791Trr
	 HD/Xr/robdZSO26qsbDgQv18XBPWcLyx3+M4TmuivGGyegxEiL7S79AXD7fk1zrf6W
	 swbGLxDnTHtRJ26E1/XpIYYvj2vS6SbT8HyJvXh4UCEPORSLDTCFtNw4/mKmNMGCoL
	 D+7ux1Yxo1IYw==
Date: Thu, 17 Oct 2024 15:36:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>, imx@lists.linux.dev
Subject: Re: [PATCH v2 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
Message-ID: <172919740857.813589.2711206203512774093.robh@kernel.org>
References: <20241017000801.149276-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017000801.149276-1-marex@denx.de>


On Thu, 17 Oct 2024 02:06:47 +0200, Marek Vasut wrote:
> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
> Remove the old text DT bindings description.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> ---
> V2: - Use DT schema to refer to the fsl,imx35-pinctrl.yaml file
>     - Special-case the iMX50 compatible string
> ---
>  .../bindings/pinctrl/fsl,imx35-pinctrl.txt    | 33 -------
>  ...ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} | 88 ++++++++++++++++---
>  .../bindings/pinctrl/fsl,imx50-pinctrl.txt    | 32 -------
>  .../bindings/pinctrl/fsl,imx51-pinctrl.txt    | 32 -------
>  .../bindings/pinctrl/fsl,imx53-pinctrl.txt    | 32 -------
>  .../bindings/pinctrl/fsl,imx6dl-pinctrl.txt   | 38 --------
>  .../bindings/pinctrl/fsl,imx6q-pinctrl.txt    | 38 --------
>  .../bindings/pinctrl/fsl,imx6sl-pinctrl.txt   | 39 --------
>  .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt  | 40 ---------
>  .../bindings/pinctrl/fsl,imx6sx-pinctrl.txt   | 36 --------
>  10 files changed, 78 insertions(+), 330 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt
>  rename Documentation/devicetree/bindings/pinctrl/{fsl,imx6ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} (50%)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



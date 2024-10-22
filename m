Return-Path: <linux-gpio+bounces-11730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 057879A9704
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 05:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C205287AD9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 03:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA328131BAF;
	Tue, 22 Oct 2024 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="k2pWVWwD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E9518037;
	Tue, 22 Oct 2024 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729567610; cv=none; b=u963ZvPOYLioDHhHSRa+mesAC0+wCYIFaPjX5NK74kdASYmLtGDMJT2KvTMNGwZ5/bxB593CYr1ex3TTH2uO+EVanhrlBr9A0j5PLVI/OglcoUQtepuTa+vORqSD3WGNKMkotGv07qeRwCIZuaopNF3RciPWyMGgJUd5b0fJO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729567610; c=relaxed/simple;
	bh=z2hBaEruSsLM6/Zo7sUE44f+ijaXA6DoNK/dOgi5T94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPbX2loYdaml9992a7N9cePmiJ37DLyuWh7/MDAHbMNkbMH3O+3A3LdmPkhi33P6iltI/nkO14/vfXQFkBFd3gEoAC92Ek4/rHxsNRuh4MRt6n+PNnAK6P3sE7E4Z85lZgY1hdji8GZAn2GwBL9DkihQYAnQ/h4k97scobiUcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=k2pWVWwD; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7RbKn0b+kpGQ6S/hPfYtTmOrZZ+NkDPxwPNincGKVpo=;
	b=k2pWVWwDB7l5kvwmEf1ffX2oPM4Ibh1Ab1X045zZtvzYcmI2tr/kak0B7gMobM
	pRmGUxOFIh1yO0d/AXFTJqI1p4sdeH2sElXKwRcQKCLu81/vu/BgRwjFHIZ/QxzF
	mUDR3HD7m4Mb+NBR63rXBDU18hJVtZhcYkD0kAG4l+HWk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnL3MdGxdnoa2UAA--.5286S3;
	Tue, 22 Oct 2024 11:25:19 +0800 (CST)
Date: Tue, 22 Oct 2024 11:25:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
Message-ID: <ZxcbHb5v05+XhFnM@dragon>
References: <20241017211241.170861-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
X-CM-TRANSID:Mc8vCgCnL3MdGxdnoa2UAA--.5286S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAryDuw1fWFy7Jr1rCrWfKrg_yoW5uryrpa
	nIkFy3tryrAF4xG3s7ta40kry3u3WxAr10gwnrt34ktrZxZrn8tryakr1rZ3yDKrW8XF45
	JFn8Gryjg34UAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI9a9UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBACAZWcXEdoi0wAAsr

On Thu, Oct 17, 2024 at 11:11:18PM +0200, Marek Vasut wrote:
> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
> Remove the old text DT bindings description.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
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
> Cc: Stefan Wahren <wahrenst@gmx.net>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> ---
> V2: - Use DT schema to refer to the fsl,imx35-pinctrl.yaml file
>     - Special-case the iMX50 compatible string
> V3: Add RB from Rob
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

I'm not sure it makes a lot sense to have "fsl,imx6ul-pinctrl: " in the
subject prefix.

Shawn



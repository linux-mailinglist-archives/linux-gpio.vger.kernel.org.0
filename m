Return-Path: <linux-gpio+bounces-11457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEA99A1093
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5A941F21F37
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 17:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F88A20FAA7;
	Wed, 16 Oct 2024 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXKGxwga"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58F318732A;
	Wed, 16 Oct 2024 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729099604; cv=none; b=T8Rt8bdhF34CTYVvkEmdY3mBYls3MgGCRqW/N6PRQziAK10DARza/jc5vhPrEYeW/Shb7A80LyfyDGLryv2rSmuBIzaOVJJ1HqYnJsSGqQ4U0mbcRGQu037kJeD5HM1KFDXx2ARkr9tKJ47enyGAUj70RCG16cAQno0qLBJneM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729099604; c=relaxed/simple;
	bh=hVlu1hU3ASIiy3+g6KLNJAuWniSogilK3Nzm74AlCoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUmr78Se3oh83OGjEvrcC6/jKr5SViq0qS1rSLeMeZ+jBeW4WQe15amFqtoScJCkSHR7sDXM0qD1kocfF9QpBtwhw7SgE0Vdt4rDfLJ+ct4DdJI+148IkbEv2vNDeEsybRCgMErMPFoil6IZ9VXRSomg4qz7qTnv5KKmEWbRrAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXKGxwga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E384C4CEC5;
	Wed, 16 Oct 2024 17:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729099603;
	bh=hVlu1hU3ASIiy3+g6KLNJAuWniSogilK3Nzm74AlCoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXKGxwgah5bwH0E7RiU/V1xffhKnQabV9zZ5cSasYKnygfFLqWf0q0crRw8N1EwAr
	 yM5F/+zzdmq4YIqfMASGO/QBFMSoiRelopd0vrZgodEMzhfVp/qtT9aT+1Y/+TulJJ
	 KyQ/IDhCNSk7xy/dw5VF7o/RnMeVAeKyCxEUxpE74Z89d1WLZaneeu8cmombhLK5Cq
	 +2Ey0DBWr4xLp3DQ/IRSC8NDIbXHeVQhAZveYptNeq3X8DTd8UvjMq2+B29xNlACr8
	 W1EJkKJITRZM9HtourFnwdvTbsyRms+Q6VOgoBml+9ORgcrIs/jKRg6WhTbYfLkk9F
	 0FehuVNr9fhTQ==
Date: Wed, 16 Oct 2024 12:26:42 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl,imx6ul-pinctrl: Convert
 i.MX35/5x/6 to YAML
Message-ID: <20241016172642.GA1991636-robh@kernel.org>
References: <20241015232107.100771-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015232107.100771-1-marex@denx.de>

On Wed, Oct 16, 2024 at 01:20:51AM +0200, Marek Vasut wrote:
> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to YAML DT. Remove
> the old text DT bindings description.

Just a nit, but I prefer 'DT schema' over using 'YAML DT' or just 
'YAML'. YAML is just the file format we use and YAML is a lot of things 
that's not DT schema including other uses/attempts with DT. 

This generates lots of warnings (patchwork has the output) for pincfg 
nodes which don't match 'grp$' node name convention. Do we really want 
to "fix" all of those? We could allow anything, but then we don't 
enforce anything on new stuff. Or this could be split between new and 
old platforms. If we decide to fix any old ones, then just have to move 
them to the "new" schema.

Rob


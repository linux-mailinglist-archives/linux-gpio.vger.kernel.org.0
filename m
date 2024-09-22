Return-Path: <linux-gpio+bounces-10350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251E97E39E
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 23:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7CECB20D7B
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 21:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A63757F8;
	Sun, 22 Sep 2024 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMIs72kT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE07174F;
	Sun, 22 Sep 2024 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727039100; cv=none; b=D30etXSIa0NDGLiTbaNP53aHIEicgSjrC1O75dOhcczrgCBJLUPBsF/FaxyAGlLM+kr8UstB2uk0njsoapEjXRB6W//YHgLa4HGRI/OdSouebY0vR4lTbHR6CrifJdnPnW5XWmr6E5EXTWF0v3frd6Pwe80Ae62l5f21zVs87Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727039100; c=relaxed/simple;
	bh=aW+AYVHWflQyBTpEDnr1koP2ePeieS4kjZ0M29gidK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYTQ3n1Q5jZfylKABV6fZNlvd1gJyiB6h6uSFEZ+zW+Zoc4CxzxBrJsD4X/5er1mBFM0Q1fcQdUwOYjwPtmwLoZiZrsEBSNKrzgHOisLdeKoLm1IOS4e1Qx4jdOMsnUjFy/ARBHcRfIqIMxEuhvYTIianZ+Uttp2bQ06O3Y/c9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMIs72kT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEA4C4CEC4;
	Sun, 22 Sep 2024 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727039099;
	bh=aW+AYVHWflQyBTpEDnr1koP2ePeieS4kjZ0M29gidK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMIs72kTXluKSw4mySRj7a+xN59t2z9j99oPZYa0NjcGFXN2vIfJwfzZsd3daxvX2
	 6f5OJ3ujTp9+9S0gyEBT0CbF3fl5HJ9laSg2pk0lkExLrGiHgvyyldpopHmG65riIB
	 +qyg7/x7/BaHl7wzU78l+fJ71JJ6hMTGRUG8pRmE/Rj2hnKmO2x/CyzEEHXhb/E4Ey
	 CKpBI92oGFUXnTgmfP1OaVty701YHEQzE1vPhQpS1cRBCKujTzaxcpflB30/AeDDb/
	 0PNHIzMPTDpzENpVRP55+a36LbMIdWh34493YBG8fVbjsBNZQa7t8LhCahvlQJad6L
	 I+NH2QGKiXS7g==
Date: Sun, 22 Sep 2024 23:04:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <3c73mvygog72vjs4qkg7cvk5ayncy6izeysgyfxj33ua5vuft5@dxbzlnxvb653>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>

On Thu, Sep 19, 2024 at 04:47:22PM +0300, Andrei Stefanescu wrote:
> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> 
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> new file mode 100644
> index 000000000000..0548028e6745
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause

Different license - see checkpatch.

Best regards,
Krzysztof



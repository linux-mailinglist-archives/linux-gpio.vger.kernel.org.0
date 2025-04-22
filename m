Return-Path: <linux-gpio+bounces-19129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB51EA96C1B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 15:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB0E3A54AF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 13:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5062281363;
	Tue, 22 Apr 2025 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZpXQOku"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9475A27466;
	Tue, 22 Apr 2025 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327390; cv=none; b=kSApXvsc0CVe+tdVjqTr0ChKe0WxgUkt7JUszLr1tv3Xd4vEJnHpjxQgOaoOwzCN6TiEaDm/ZMT06qgndCcJ7gMwdOVAkYnSI9dxpEnkoJsp/OSt2a/3dd60JSjnwx0ijGLwme5O7ea7oLlY8CO5ffuCj4H2UjROFTTcL/gBADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327390; c=relaxed/simple;
	bh=BEx2KaD/mS0zMAQs7LahMUkYPebN7yNtc+yXj3QXDNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKWwheElKgcx9ZE/Wyxoi2TxWBkMK2S7ycexiEPpnW6k/0XhCZJjWTwF6IqM+sYBtygTl7MeevlLR/nx2/kJOLQguOBholEtR4USV5MLaykeVzS7kJMSY4lcPwDzTn9JP0ZZ8iCx09dOQJKqpP1tcL56hUI3dZaSpUb1Dtfen+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZpXQOku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7313C4CEE9;
	Tue, 22 Apr 2025 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327390;
	bh=BEx2KaD/mS0zMAQs7LahMUkYPebN7yNtc+yXj3QXDNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZpXQOku0cTPUuOLSbem5KBzHMXQSFgGD8UvL8Bgola6TijHA8i8dI1fZdJa/SGrs
	 rJNrQ5e04CMvgjkjAhWWs0ec2zqbALFifzOWPV95KK5wCr97J1BrTHtDofRONx4BsX
	 /k2pnqBXqQdJ80q1fcKb1bnDtUITwsgQitg/KArtlIoxKMtp8Vu/QlFy2Stfo9Ft6G
	 +EGu0N0A38sFznGSmrzYK96HsDFWEg1i1PZkzCbOM5H7DpblLsTeadhI5mVAWoIdSo
	 eh42bm3b1zB0+lHI21J471ba+CWMHqvHQEerCjjuMc9OX7r8WwMJZb/285dET8PUwK
	 FZAh94y2wi5eQ==
Date: Tue, 22 Apr 2025 08:09:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev, Jacky Bai <ping.bai@nxp.com>,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	linux-gpio@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert
 fsl,imx7ulp-pinctrl.txt to yaml format
Message-ID: <174532738787.1019688.10866076280609935749.robh@kernel.org>
References: <20250417152158.3570936-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417152158.3570936-1-Frank.Li@nxp.com>


On Thu, 17 Apr 2025 11:21:57 -0400, Frank Li wrote:
> Convert fsl,imx7ulp-pinctrl.txt to yaml format.
> 
> Additional changes:
> - remove label in example
> - fsl,pin direct use hex value instead of macro because macro define in
> dts local directory.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml | 99 +++++++++++++++++++
>  .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt  | 53 ----------
>  2 files changed, 99 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



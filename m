Return-Path: <linux-gpio+bounces-9270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2839628EF
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 15:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB06283927
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 13:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1C6188003;
	Wed, 28 Aug 2024 13:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ufak4esb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A1B186E4B;
	Wed, 28 Aug 2024 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852517; cv=none; b=nJ2+LXAKPVJ7bL7Qb1N6cEDcXbOkId/CpCpAAXW9TM31gol+1sw1hrm/7bz7y4LWrByIR19uIHNLnOE48B/aHrnTeuHaiWQZp06CJQ4dpY+ZiH6nC9JB/ml7S2zV6Alk+H6Gxv6B6/sj6x7mAWj8Z1MHnX6gca6bzw7dcqoM1jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852517; c=relaxed/simple;
	bh=a2swbrR98wISn+eYtffCdkI+7ImxeBOzuWP7GOb5gpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKsohlI1a3uR5hVNkWkh/Xg2CBy4xNoyJ7zv+J5dvPe4QFElqYClqH4d5HhqT/vzZk3xTyo/Uq3+O4cdn8IpIX0KQRn3LNYnpsa+bkH420IliOSxfCqTrPpW/fbXFGzJTR0Cco0tBfudk0w45yXC+70mj6OjvauXHoOYYdbR2X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ufak4esb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A50CC581BF;
	Wed, 28 Aug 2024 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724852516;
	bh=a2swbrR98wISn+eYtffCdkI+7ImxeBOzuWP7GOb5gpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ufak4esb9vRxDU4GXWxGafmlJTaaq4y+jEUzLh7YVE4uiQMPQ83Ft6+XewFe94s4D
	 FNSQ6lEyET56QVve7F3q7ILt31ZxLKe/stiwlh1KArGfGN1zrJBxVz3Lb4UAYpXXbH
	 Xa1fAc4sQdH7f2f+Ia1OCsm3lDcOVwDwdd2qnY1z7dxxkPnXF0uCJxN75Wsa/lDK3Z
	 AwW/zPEUD4tQB7wVyZJYppBwcu0FJ4zD8yyJijlAQjkxBO2aztydzi3duvsjQ990CJ
	 31Fp721OMzvYoe8BbXyNS/QwrRMlSJQfFszL9R7HyGkyWXl8LMbBeV6tW5+NmhyeKX
	 1DPFCurUvPooA==
Date: Wed, 28 Aug 2024 08:41:55 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/3] dt-bindings: gpio/pinctrl: add missing type to GPIO
 hogs
Message-ID: <20240828134155.GA3656223-robh@kernel.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>

On Wed, Aug 28, 2024 at 11:35:56AM +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> Patches are independent and can go via different trees.
> 
> Description
> ===========
> DTS like:
> 
>     device {
>         compatible = "fcs,fxl6408";
>         dummy-hog;
>     };
> 
> should fail, but unfortunately it does not if "type: object" is missing.
> Add missing type, so this will properly trigger warning:
> 
>     dummy-hog: True is not of type 'object'
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
>       dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
>       dt-bindings: gpio: simplify GPIO hog nodes schema

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


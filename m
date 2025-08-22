Return-Path: <linux-gpio+bounces-24819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86892B31DAA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A7F8BA5DD1
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD151F76A5;
	Fri, 22 Aug 2025 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndsnKge/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468E1E2834;
	Fri, 22 Aug 2025 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875451; cv=none; b=TiV7iwUfnWvCaO7yUJeiWd3ROdsYyimj7qxuTlWmdNcQPGofdnDaq5T+AASk1jscWxkQgZVsHM7XRHHx6r3HizSiUaw+Lptztbg6Y0y7kLHsKTNwH/ctmC+/2e9MK2iF5i/zQogl0QxTg+RiYjNbjanyoFlXdUZeWaevalahXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875451; c=relaxed/simple;
	bh=qBAyRodyfRh78G2uxakZpehoj7ao6KSddD/e4iAX3sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Geuo+yc1VwdW5zzwpqj9iNj2w0FiDQBAv7rwTFpBp+Z1YwLQI6VL/4/VveLniesM7E/pLxYyESx18cdijZDOL/uyQSfJvkW2ae+/Ta+KGW+XMkVF5z2dHaNOf/1cUyJEzxf7ufqXhJaHwEKCLb0FQykdB3bCQ0G8HnTiUh9U0LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndsnKge/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C07BC4CEED;
	Fri, 22 Aug 2025 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755875451;
	bh=qBAyRodyfRh78G2uxakZpehoj7ao6KSddD/e4iAX3sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndsnKge/6j/Z9BWT++REFN7u9tKc0uGX6xVqKti8YWkC5pta0hltDhTEfpFvObz7t
	 I7p/IoRdh/tQt8wPXqSjEW05GDJLBKPsVh8pYocv0mpBFdC+3GQeaAxgKtx3hzVm/S
	 K7VMIoNXDcum9s3cmJDwO3zk4Cuy4N6XdR7uyZbqajfcna2zj7VrVvInUAnA+xmJiU
	 Yy/+sfL8Cb/ZFPF5z5eGSl6xmjiQJDcp4PFcOej9ezDiMLS/1SFexRoCt1DuiEaqNq
	 +7Xn0hZWhcqRDIZ3H6W+Awnth0kL0A5zy3JLRf1pqbJssms1xD5c+6T6HyJnaHUZBT
	 /Tw+cGl0a1MJA==
Date: Fri, 22 Aug 2025 10:10:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into
 gpio-mxs.yaml
Message-ID: <175587544961.3817064.4646134256095091634.robh@kernel.org>
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>


On Wed, 20 Aug 2025 12:49:45 -0400, Frank Li wrote:
> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2
> - Add more description about over 10 years devices.
> ---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  80 ++++++++++-
>  .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------
>  2 files changed, 75 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-gpio+bounces-25199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B5B3BCD1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 15:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D811C1C2165C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086ED31AF3E;
	Fri, 29 Aug 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J08iN6Rd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F41EE7DD;
	Fri, 29 Aug 2025 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756475459; cv=none; b=p8bkhB2Rnit/eON7/CVcIS18ZXcvCHnq+B+byZcQR/IaDJZ5bIChR+5ZMd0qU0NPXppE9atnXhkRFe9M6/iKb1PyJjtQS0uDms5WlfyvAFFmf7xFGHXX/RLaknAy30IdpsZW4xbLSqa6svS2teJWmSw73lQYPH4wX2lxMnlW91o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756475459; c=relaxed/simple;
	bh=iMyE22m+SMBuDDViYX2YsQUqlBSUcMMIUputDrUwsPo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=occ4AQbdWW+3x6vF7f0kIpuzEgXJfuR6rmK4KxLObF8WLuPm8HfQtfTCCrwrbRw/Q1Yg+ioi5daMGBEZKTOL4InJm4pQyL8GloM33ixAj0gSVy5XmCPSOdDsVw3Gy09U9+htYG7mjaReglc2ob0+6xf9rfYdkleXPgNrDGGSK0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J08iN6Rd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166FBC4CEF5;
	Fri, 29 Aug 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756475459;
	bh=iMyE22m+SMBuDDViYX2YsQUqlBSUcMMIUputDrUwsPo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J08iN6RdW+t2gMQ59Tr1GMVwa3UffcElZFqa4Zg99HY8zZzGt08x/uKqmpkG3ubKu
	 8TrwqgVR9+6I7fMDTZau5j1fIgrT2uDHUJ1priylIHzrnyc3fR3hIpJ8eTY8ey8x7P
	 yLjGFysK0NlqW3ZnoBjqFzZlX1vxIVPDnnWMy+kC0t12AUmzfX9idKKzeSc5A89pg4
	 b2xpZlqyBvyquHWQKX8Xb+U/E8UTUXQNo3dWmER5QMINukZ7pGdDqmLST4KVRDuv6W
	 qe93O16t/bYXFGKjMEY8G56asDFR9GSQg8s7cyzLMJ0UHOEhFTUr4jfqB+KHxTiQA0
	 tEPnD46DuqdnA==
Date: Fri, 29 Aug 2025 08:50:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 joel@jms.id.au, andrew@codeconstruct.com.au, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com, linus.walleij@linaro.org, 
 lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 openbmc@lists.ozlabs.org, brgl@bgdev.pl
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
 <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
Message-Id: <175647456196.394574.546840408984626348.robh@kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx


On Fri, 29 Aug 2025 15:30:28 +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in the ASPEED AST27xx SoC.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 135 ++++++
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 452 ++++++++++++++++++
>  2 files changed, 587 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: syscon@14c02000 (aspeed,ast2700-scu1): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: syscon@12c02000 (aspeed,ast2700-scu0): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250829073030.2749482-3-billy_tsai@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



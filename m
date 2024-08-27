Return-Path: <linux-gpio+bounces-9198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172E95FFB0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 05:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B4628331E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 03:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7DB18030;
	Tue, 27 Aug 2024 03:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2Fm6A06"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505BBBE5E;
	Tue, 27 Aug 2024 03:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724728953; cv=none; b=Gn6m/xU1mOEYwwSBxIy+R3VgkQzA0pPjVwMn8R4tmSG2mi9ji+2uEUz6qW44XMEnGx9p/0z0sPw/Y69J4VoIqymIPQL8SUjuHBLMc2N09UAh5C30YeF0HH71XPU7dW462mLgvMZ5QWdZztK0NbyRaPRVyQJ3mwiYJPicn1GR8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724728953; c=relaxed/simple;
	bh=JA4Rrl0gSqFn2h51HnJ2rwMHcWPIgHb9IG2HsHXFITE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=umXEqMXZ25UGeE4xDAQgmbunAOhSRKusCp9Hwkkjb+Ia3Xi5oyEA1M/rBcMYXWsC9rAw8r3N4gUZCS+7I20AXLEVlu2H1guz+/xweXSstTysz26BRd/vDwg3a02GUf1+BioAX27TRFDvRXRcQakjewqYyaA//STGlH9eiAI2U3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2Fm6A06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CB6C8B7A5;
	Tue, 27 Aug 2024 03:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724728952;
	bh=JA4Rrl0gSqFn2h51HnJ2rwMHcWPIgHb9IG2HsHXFITE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=r2Fm6A06EIDJCVN7uy5A0M33DaPpTTg/oArTg63+j6kCNzDW01SsKXYbkTrg5tj5e
	 QWtqJ8orlwnwcj7PW4k0HD68rkGj4fXl72S66I/SQ9rlB0dyulmxrzagSALnLdkig0
	 K4fsHHJQrKnXC04vt3BFQLBChUagrO1n2+IfxrhS6fS9vXql3xY8qK1+UaI/oP4Nd1
	 4GQnUdw1P3P9LXQErr7P3RFwF2nk4/4O4t6tBLXKWc+wGeezrEcEFj5Yhhb/aTbWtl
	 N2Wl2ZIedsseOaXCMuab0DEPe5AN2UwRHju2ZqjHeYCXqjgYki0UBY9erIJjs0AVZw
	 wNYMdazGOmfzQ==
Date: Mon, 26 Aug 2024 22:22:30 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Leonard <David.Leonard@digi.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 devicetree@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com>
References: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com>
Message-Id: <172472894855.2520648.730159395986149947.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: Add fsl,ls1012a-pinctrl yaml
 file


On Tue, 27 Aug 2024 12:10:44 +1000, David Leonard wrote:
> 
> Add a binding schema and examples for the LS1012A's pinctrl function.
> 
> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---
>   .../bindings/pinctrl/fsl,ls1012a-pinctrl.yaml | 83 +++++++++++++++++++
>   1 file changed, 83 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.example.dtb: quadspi@1550000: $nodename:0: 'quadspi@1550000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/spi/fsl,spi-fsl-qspi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.example.dtb: quadspi@1550000: 'reg-names' is a required property
	from schema $id: http://devicetree.org/schemas/spi/fsl,spi-fsl-qspi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.example.dtb: quadspi@1550000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/spi/fsl,spi-fsl-qspi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.example.dtb: quadspi@1550000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/spi/fsl,spi-fsl-qspi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.example.dtb: quadspi@1550000: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/spi/fsl,spi-fsl-qspi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



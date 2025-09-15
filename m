Return-Path: <linux-gpio+bounces-26180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5BB582AA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 19:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8823B1263
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 17:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D349288C3B;
	Mon, 15 Sep 2025 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIpRrK5a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152472877EE;
	Mon, 15 Sep 2025 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757955710; cv=none; b=puCpl63YzChvdyxMoHruNoLPJYJ39pizbJtB0k0GjjPpo8WbUjxrvVESYll0EdiZOXm+jXYUnV2+n27RAlmPE0jl1r8io0oh27Vj2CZO2EFzfQasGI5Pw4FycpmnFy93GXF2Zv0uD3lVXva9Gr0ZqFDtJzjkFrAuBCaIk2aJXTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757955710; c=relaxed/simple;
	bh=QfMb1HpuFeG38fHDI6tCfAUn5W1fBs/IsVlp4qa634Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SwhVShdpHq2r3FDNPHtd2XhEdgsG++VIoEOlTxSgKQZ100yfMCr5j+2UojMNAg7pQMKGVFY4Z8f51L1dS/aeBOAcokDAfCcUCfEEi1H/4QoVN4Wxfmr0qDHLDjFvP5lM4Fc/AcB8KevOiY3qWfrn21PfudPGUvnpqKQHm1VEyBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIpRrK5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E4EC4CEF7;
	Mon, 15 Sep 2025 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757955709;
	bh=QfMb1HpuFeG38fHDI6tCfAUn5W1fBs/IsVlp4qa634Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZIpRrK5avY0CcrCG8oKli31q4scXkDnX1Cm90msFMyE8mUhDFmqNF4ZqZQrzvDC6S
	 2o1ryxFOvTKE+oLUcQdvCNeeTjp+R3cA+8HlLjPg7+yFRdd7vfDzUrTWN1ZJ+8COo2
	 tobaKRBXYemvu4zlmYbnIfZJBzD3Foet/iOwdJ/UzoQNb0LjOQYp0iV4libmJAR4sG
	 /fAuTdnE2AnAef5vmYd8Jj8XLPBCl8+GAt9BSMWyGTclXmjmFQZ4Bw6uz1n+UKX1MM
	 JHlC85LLF0I+Bc/sbZFezV3tw4weIA4wT+l78b3CScaEFH85DAi2yQSQYunaHmKvd+
	 pe2yy6ME4zh7Q==
Date: Mon, 15 Sep 2025 12:01:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Lee Jones <lee@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
In-Reply-To: <20250915122354.217720-3-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-3-ioana.ciornei@nxp.com>
Message-Id: <175795551591.2905389.5429318820981350810.robh@kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support
 to also cover the LX2160ARDB FPGA


On Mon, 15 Sep 2025 15:23:47 +0300, Ioana Ciornei wrote:
> Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> 
> Since the register map exposed by the LX2160ARDB's FPGA also contains
> two GPIO controllers, accept the necessary GPIO pattern property.
> At the same time, add the #address-cells and #size-cells properties as
> valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> addressable.
> 
> This is needed because when defining child devices such as the GPIO
> controller described in the added example, the child device needs a the
> reg property to properly identify its register location.
> Impose this restriction for the new compatible through an if-statement.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Enforce a unit address on the child gpios nodes (remove the ?)
> - Enforce the use of unit addresses by having #address-size and
>   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
> 
>  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.example.dtb: board-control@66 (fsl,lx2160ardb-fpga): gpio@19: {'compatible': ['fsl,lx2160ardb-fpga-gpio-sfp'], 'reg': [[25]], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-line-names': ['SFP2_TX_EN', '', '', '', 'SFP2_RX_LOS', 'SFP2_TX_FAULT', '', 'SFP2_MOD_ABS']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#"}
	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis-i2c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250915122354.217720-3-ioana.ciornei@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-gpio+bounces-6751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B85478D248C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E92071C27A1F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05830171E59;
	Tue, 28 May 2024 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9osUkAl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEADCA6B;
	Tue, 28 May 2024 19:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716924094; cv=none; b=D+JzyqbIBRETnmg9mfX4adBhj4Jll3jO4SeXbEzXPB5yIjfWYY08FcV5C3Rbx1aNHCFJSXtgrU1AFstcHUI5HEKdetHGp1qDsfczawzT8bMfSHsw5VfVLJlpbejVuxUlJC8siKGHoj/K3krSn232GPXwCyK9WlCexDXNYeV1hIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716924094; c=relaxed/simple;
	bh=nERATCnJUma75OlFMaPK6NarihzSqRnL0s3MyxC+jXw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=XseE/GpDn049xFxW35cZbiYEEJ9L9K45LNHOjSjcpupSrjaSuGM8T7WlLQhOrnVvq2IYZ5VMeR+hXCfyh1kdjdctsqNiRB7wSvBN7TnE+YU2f6KUnflKeqYJ+MuP2F81mUHnoqn7tkD3uoSf3+g3R3ZgfjXGf58Ugue1wYU2Xj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9osUkAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB66C3277B;
	Tue, 28 May 2024 19:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716924094;
	bh=nERATCnJUma75OlFMaPK6NarihzSqRnL0s3MyxC+jXw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=i9osUkAl4+BTv5JtrEdN8cGs6AbIy7WaSFRz1dFCckYshmOoi2VCALJERIAe7c3oA
	 qh09EYMPDVVGpBVdfmhM+DnmEc96EFk/2xmYCWvOq6OSr2hseIYzu4lmYzjS5bBTXV
	 7ijP9hTh49b2u9bN0en3Cd9S8bkpGPePsYeLykPqVJ4JEIBw1J+MLy2IRP84iJgoLJ
	 bV6WUGQZxGlKERuGzaBJ/vKZ+OyTFfTB4/Z75p9PcTJOuUbr+w08Ur4SS3cZ2QrxdJ
	 bZZBBc4OHXPhs4J2VajA/uR/T3jsbzFpVHj8+wwKHtOqrznXBeCw/kYqn+hBsout5R
	 Jo8dqaU6yrKVQ==
Date: Tue, 28 May 2024 14:21:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 imx@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240528175647.2604295-1-Frank.Li@nxp.com>
References: <20240528175647.2604295-1-Frank.Li@nxp.com>
Message-Id: <171692409304.1455174.10633971399777065443.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format


On Tue, 28 May 2024 13:56:46 -0400, Frank Li wrote:
> Convert binding doc from txt to yaml.
> 
> Remove redundated "gpio1: gpio@2300000" example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Pass dt_binding_check
>     make dt_binding_check DT_SCHEMA_FILES=fsl,qoriq-gpio.yaml
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       CHKDT   Documentation/devicetree/bindings
>       LINT    Documentation/devicetree/bindings
>       DTC_CHK Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.example.dtb
> 
>  .../bindings/gpio/fsl,qoriq-gpio.yaml         | 80 +++++++++++++++++++
>  .../devicetree/bindings/gpio/gpio-mpc8xxx.txt | 53 ------------
>  2 files changed, 80 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.example.dtb: gpio@1100: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240528175647.2604295-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



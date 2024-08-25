Return-Path: <linux-gpio+bounces-9131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D334695E3DC
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 16:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D90A1F21415
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 14:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8C6154BFF;
	Sun, 25 Aug 2024 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xz0fqWmP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3713E04B;
	Sun, 25 Aug 2024 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724595776; cv=none; b=jt9CjnW1gMJdzvXy4pKdydYSBwr3d2TTHFoW5SvMxwdz0YlQL9HERIj4WKk0EG8wrGB0M/LW4nW0EL1Y6mOz7gGK2HmXt5Ji06h37Kn2C252gr29GzKQoDVbVd/FDA2lDLo5VAbeUvsmJZpMrgzHJsUnVKySd6BOpptX1flOcWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724595776; c=relaxed/simple;
	bh=rkM9g5ut8ywJerR7d/mwyAA5vHOU2dkdY0f6Jmpzmac=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=MpIjwC8MjKSqZCYbVUVXTSvEuSEKJYhNuE0flh0AwuiggMCQjIkxEEZ5rvI640r6KprT3ZyYjwLyH8HRlBCc8hvQp8DVPPTE1V0AcxwDq5ToTA3zBN94vcfwkkfx3tTh/D9gvm2Linnt9H95G/LzoBihUzKrHHo0KOI5Wz6tQ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xz0fqWmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834ABC32782;
	Sun, 25 Aug 2024 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724595776;
	bh=rkM9g5ut8ywJerR7d/mwyAA5vHOU2dkdY0f6Jmpzmac=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Xz0fqWmPZPSg4jiwhxs39YBOFbQPsN0KG1K/Qa/qt7Gk/UEh1FeMBEMoIBVZwDuDK
	 tN/qOtV7RWXaLVlOFjQAdC33a90uackR9kNV4W5RRUoIO9Vg2Yau4wffY2l0cjxqgF
	 EQos4hGwcSZtmWjXLgB2VKLU1Yv1qbfy6BMGEuCrtdliMULQqTW5qHCv26nP9bUP/m
	 5Nj+o4BuTmjtaSK9rpcDUmSdoSMl+/rfjaJ+vRy/IdKPdc6bpjK4V7TXHCywedgfjp
	 YDf2YIX7NU6BEyK8PnVMlnzJVeuk8MYwjglmDo4rHlNPRQxsLzSi5NY9LwNeCM6IIi
	 IrL1+i4yKHn8Q==
Date: Sun, 25 Aug 2024 09:22:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Jesse Taube <jesse@rivosinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
Message-Id: <172459577302.1848940.15978105845752882956.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents
 for K1 SoC


On Sun, 25 Aug 2024 13:10:02 +0000, Yixun Lan wrote:
> Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> 
> Two vendor specific properties are introduced here, As the pinctrl
> has dedicated slew rate enable control - bit[7], so we have
> spacemit,slew-rate-{enable,disable} for this. For the same reason,
> creating spacemit,strong-pull-up for the strong pull up control.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
>  include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml: patternProperties:-cfg$:patternProperties:-pins$:properties:drive-strength-microamp: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.example.dtb: dsi-phy@10215000: drive-strength-microamp: 4000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.example.dtb: dsi-phy@10215000: drive-strength-microamp: 4000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins1:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dtb: pins1: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.example.dtb: pins: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.example.dtb: pins: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pins: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.example.dtb: pinctrl@d401e000: '#gpio-range-cells', '#pinctrl-cells' do not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.example.dtb: uart0-2-pins: drive-strength-microamp: 32 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-gpio+bounces-17317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A36A57E33
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 21:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DCCA3AC631
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 20:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB9B207640;
	Sat,  8 Mar 2025 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1Xj1Ynd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389C1E520F;
	Sat,  8 Mar 2025 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741466700; cv=none; b=Tp3+tVSDjO5TeCbSA9BX1aspj3RooDGRCVzD9NPsplmePHwjjSd3cGizTUnV7rRO3Jm/JPoJgRBf64P9milClIXoKBuCu7ihgDcdBfOwXrtP+m0q3qmxvv+GapzESHYDLxb1XY7A2Boy4uqMdoPeObG0nJ/G/it4X+BIpebG/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741466700; c=relaxed/simple;
	bh=tr48GDVJ9ubc/rK1vy/TnLT/dYRqQiZDykt2IihIkqI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=d0BbI2pxs03xxJ9wOvbw1mEa1IZ9UQ5IT70usNpIrGJYg+i54sf1/3WAL7KIHgmyTk9I6cQV45soSvlKmTUHQzmYUJgs/vyfWmMaUh5Fmk1NrByyS+vt7nYvclTJ8WjEpWrkFDeateYngGsQvplM24Vl8pJuOdhxphCgEPPjKkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1Xj1Ynd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216C2C4CEE0;
	Sat,  8 Mar 2025 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741466699;
	bh=tr48GDVJ9ubc/rK1vy/TnLT/dYRqQiZDykt2IihIkqI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P1Xj1YndpLOFs7ExaR6pvYlDWlE+qPPWrJ7QxlA3bHfVzpenwZMpvKPEoHxIeuNpU
	 ExfXSFO7nPJn6Lg1onodUa7yPtMuxaTkR6AX0mys/ulU/uoDgQE6XInzqOxB+a8LdI
	 Rpz7vMnvC4takNIvlOI21QQaIt9DVwY0QpGmbeeRouD8wD+Xme8t9S285wqh3997FU
	 Ezjw5TIlOaqPf2Jg2up1chPaZKHYjWse5CYy1XJ98nZISn51ZDV5ndP3yW4bG+45j8
	 Ia3qG+qqRCU9kYytyCcGG81+9Jjb+h7uF6j9hGQBaZ0heXAGGav+IgnLXhEkf1lkkr
	 /orlaFVDWc+BA==
Date: Sat, 08 Mar 2025 14:44:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Will Deacon <will@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 linux-staging@lists.linux.dev, Ross Burton <ross.burton@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, 
 Eric Biggers <ebiggers@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-media@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Ihor Matushchak <ihor.matushchak@foobox.net>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Zhi Mao <zhi.mao@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250308183410.3013996-5-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-5-demonsingur@gmail.com>
Message-Id: <174146669680.3550268.1623859001392058870.robh@kernel.org>
Subject: Re: [RFC PATCH 04/24] dt-bindings: media: i2c: max96717: add
 support for pinctrl/pinconf


On Sat, 08 Mar 2025 20:33:33 +0200, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
> 
> Add pinctrl/pinconf properties to support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../media/i2c/maxim,max96717-pinctrl.yaml     | 71 +++++++++++++++++++
>  .../bindings/media/i2c/maxim,max96717.yaml    | 16 ++++-
>  MAINTAINERS                                   |  1 +
>  3 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-rx-id: 'anyOf' conditional failed, one must be fixed:
	'min' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-rx-id: 'anyOf' conditional failed, one must be fixed:
	'max' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,rclkout-clock: 'anyOf' conditional failed, one must be fixed:
	'min' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,rclkout-clock: 'anyOf' conditional failed, one must be fixed:
	'max' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-tx-id: 'anyOf' conditional failed, one must be fixed:
	'min' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml: properties:maxim,gmsl-tx-id: 'anyOf' conditional failed, one must be fixed:
	'max' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96717.example.dtb: serializer@40: i2c-gate: 'anyOf' conditional failed, one must be fixed:
	Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'sensor@10' were unexpected)
	1 is not of type 'object'
	0 is not of type 'object'
	Unevaluated properties are not allowed ('VANA-supply', 'VCORE-supply', 'VDDIO-supply', 'clocks', 'compatible', 'port', 'reg', 'reset-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308183410.3013996-5-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



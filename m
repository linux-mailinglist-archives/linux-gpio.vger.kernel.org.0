Return-Path: <linux-gpio+bounces-12913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B99C6A92
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 09:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBEA0B23FE8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 08:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2609118A6C3;
	Wed, 13 Nov 2024 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/ClBW7J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FB11CBA;
	Wed, 13 Nov 2024 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731486677; cv=none; b=tmicqV9swm9+UjYyuETJFGaO8TfOFE+9oPxZRwCdtMmRP8SFFVnjf8AQ8AS3eHEWXYlnwywzqJcXpAE90Q/Wz2n5xcH4wO2g7HhP1oaE4oqDUndnquh6nZPldwwtr+keCqoBRivuF0WyGiyKBss0dxCKqjdzlLWAJrHdFK4hirI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731486677; c=relaxed/simple;
	bh=bM0X38UhkBzintoDYGOc67/pd8CabjjLBzBwfbjIAU8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Wnr5uos7FVseb9t1UjpDPTjFtInrTZvSNlSXTK9OGAe6UdO3XDunTBWgcy5W4QK+vNzwzfIyd/zHibuDlap41IBA8p2fOlMMro8HHhL/S8hhAGNVndYIY6h8++DZA4N9nFcW2LVbaS+5MVpMyHntD/Mo728Qj45IYpMuWKpsdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/ClBW7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A3CC4CECD;
	Wed, 13 Nov 2024 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731486677;
	bh=bM0X38UhkBzintoDYGOc67/pd8CabjjLBzBwfbjIAU8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=V/ClBW7JwcDylSEPox1BqKSEFHkB+LEzuBaojbVOGIy5b+8a+S9VJV/1wKjvDGtV0
	 xIS+YSt/XmC/DGYp82maL5LSjKKKldeiQBG0tt1iO6CR2A8256Q9TW88RcWeKul782
	 2rPdxf9wR/C6F+3wSKfViRTW3D80A4BN+Xmiwdi7TYtidAqEGeQW02n7FEnXhfXZzu
	 zVSu/f5IXmlPvHY3FuiOgv4U4g9J1Vq1XWVdJGAXAJv4mciSkwQO8a79YowB403YBf
	 40kCVTCcm9QaMAS1UuzvQTfhy3XI9dXXXg/iUz+k/JJ5aEa3vZFLo5OLcu+aSP7sud
	 tjBAAe6yRErhw==
Date: Wed, 13 Nov 2024 02:31:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com>
Message-Id: <173148667456.3371316.2229241108190941426.robh@kernel.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: pinctrl: move gpio-cells property


On Wed, 13 Nov 2024 15:29:39 +0800, Xianwei Zhao wrote:
> Move #gpio-cells property from common yaml file
> to lower-level yaml files.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml          | 3 +++
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml      | 3 ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  | 3 +++
>  .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml           | 3 +++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 3 +++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 3 +++
>  6 files changed, 15 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



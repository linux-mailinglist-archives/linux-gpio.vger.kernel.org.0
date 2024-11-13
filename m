Return-Path: <linux-gpio+bounces-12914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3259C6A95
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 09:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7281F23FF1
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 08:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D706718B499;
	Wed, 13 Nov 2024 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+IQMb7v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2D411CBA;
	Wed, 13 Nov 2024 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731486681; cv=none; b=Kz7KF7Mj7HGlE4oUEcY3R7jj+kK8PVcDH+q6chDvtPWiubzJnEG4JyMW5bwkvztpCqDSt85iZx15HOeooEDy8VZZaApyqZTZl9WfL3eL0Ry91EwxbSn0V0uUgZgkc6mh87xKP7dj2cccWcQjnIfCJy6h7f/eYLb06RKNVnwYnDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731486681; c=relaxed/simple;
	bh=l0aV/85UGh+TiyIXs15oLeWBBhnvktxy+Ao2xmqdPEU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=u5Cjp5AXdYj/qiRV8SYVpRIO2S5bHQqb+ypHK25XNbtqfylqeCSbh1jUT7RYQZQSVE1JeIyormrb2/NkVUnoANVAkJ4fpVTvprFYhwr150UTeBhV+miW9bEMsjLH/bqLjJihfOap6vvdNnUkvnoYLcdOWZdeMzpY7uohe/4rRTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+IQMb7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20D1C4CECD;
	Wed, 13 Nov 2024 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731486679;
	bh=l0aV/85UGh+TiyIXs15oLeWBBhnvktxy+Ao2xmqdPEU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u+IQMb7vc+ybZwRlOggvAhtm85ytDrq6c9zHkN2yooJE8m+gQFoEKPWK6I8MIclz+
	 d7RWYG1Nxf/xG0BZ9vP4/S/AvlDtGGou78bAL+EnYJhJcrZvhu6G7bMB4mgwrrVJJK
	 pTZzVkj0aGvVniYBG6ZSyPFmzmVn/WglUcnH/0XOz6/23zBCwePmbAky1VGfG7pQ6J
	 B1P2HH3O9oQnEIZjw/N5eFf7r+e1K50TzuvV97d6j3b45AMlX04PSydWmVMnc0wuP7
	 iofodvFB6X09burdwn1n9hqMs/Q18Z8TPQxb1nTATC4UESeq1YtkWoPKTz0qC/ko7J
	 Tdeg5o1J/8OJg==
Date: Wed, 13 Nov 2024 02:31:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-2-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-2-35ba2401ee35@amlogic.com>
Message-Id: <173148667535.3371357.17914251694384557561.robh@kernel.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: pinctrl: Add support for Amlogic
 A4 SoCs


On Wed, 13 Nov 2024 15:29:40 +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic A4 pin controller, and add a new
> dt-binding header file which document the GPIO bank names of all
> Amlogic subsequent SoCs.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml | 80 ++++++++++++++++++++++
>  include/dt-bindings/gpio/amlogic-gpio.h            | 45 ++++++++++++
>  2 files changed, 125 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113-a4_pinctrl-v6-2-35ba2401ee35@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-gpio+bounces-17448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4CCA5CDCB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168D3189EC31
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D2626389D;
	Tue, 11 Mar 2025 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fexKVTeF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA51D79BE;
	Tue, 11 Mar 2025 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717387; cv=none; b=en9tvNSCn5f2DNXwCPIG7KcKu8BQR0e25ExQ95jrZtIGi1j+wGFZMzIPvMStLuRHt0EmqN5KHvSKwOTtcQh4canuzE9Jl5DTXi+t921wHzdAyzeryeVMj2brMkgp5JLxYCVN417aqmNVYHxPV03aWb6XqxjSJw65yfSf5GEaXhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717387; c=relaxed/simple;
	bh=OKgUmyfCm5KWfufOmtbwO7y0D8vMs8o5fmUjqAFAc2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHPhJEyx/sZGGD43rrmcxT/UuIz3CTy2n+Huh79B/PeCqMS0W0GFyzY9eXne9u9VkH02wXX3dCx2L3lm7TC1A1/LhuH+RMeWKA07YtLac4sdZ6WOR0S8YJEoS5VG+mMs4O8P+UbOsdqeGyEL/0soP1RtgoRfEj6fBObUuyYPA/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fexKVTeF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6097AC4CEE9;
	Tue, 11 Mar 2025 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741717386;
	bh=OKgUmyfCm5KWfufOmtbwO7y0D8vMs8o5fmUjqAFAc2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fexKVTeF0ZI1hyXWGq0/Oex33Rpv/AAqnN33eDYnZ7GB34N/YakJ2uNyTI8L7QEDP
	 tzWgBIdvmOTes9rM9d4MH91vK1kHM7v3qJEVIL4z2/9o/Ot1vLgKFAxLMNu7j+1yLe
	 KJEx+KpPnKkJzev3lAtR/OZpOd1nog29HDuHqCe13qLdxonElVUIGmHPNAozGheWFT
	 e8w6kueMdUBY4AmfGrd6V5I4rFYmvNU9SFGLV9qr62Y2FeMA8iaCoUn4IM6o570MPc
	 DU995SibTurpmIHWQ4YTt9sFJ7nk+fK4eDJfL6raIRYicB3T8UkMknqI/fbmJQXuBv
	 xAVlSmqw6Lifw==
Date: Tue, 11 Mar 2025 13:23:04 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 04/16] dt-bindings: media: i2c: max96717: add
 support for pinctrl/pinconf
Message-ID: <20250311182304.GA3925099-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-5-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-5-demonsingur@gmail.com>

On Sun, Mar 09, 2025 at 10:47:56AM +0200, Cosmin Tanislav wrote:
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
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
> new file mode 100644
> index 000000000000..347e66a5320c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Analog Devices Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/maxim,max96717-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim GMSL2 Serializer Pinctrl
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +  - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +unevaluatedProperties: false
> +
> +properties:
> +  function: true
> +  pins: true
> +  drive-open-drain: true
> +  drive-push-pull: true
> +  bias-disable: true
> +  bias-pull-up: true
> +  bias-pull-down: true
> +  output-disable: true
> +  output-enable: true
> +  output-low: true
> +  output-high: true
> +  slew-rate: true
> +  input-enable: true
> +
> +  maxim,jitter-compensation:
> +    type: boolean
> +    description: Enables jitter compensation.
> +
> +  maxim,gmsl-tx:
> +    type: boolean
> +    description: Enable transmitting pin value to GMSL link.
> +
> +  maxim,gmsl-rx:
> +    type: boolean
> +    description: Enable receiving pin value from GMSL link.
> +
> +  maxim,gmsl-tx-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Identifier used while transmitting value to GMSL link.
> +      Default value matches the pin number.

Use normally wrapping or blank line between paragraphs.

> +    minimum: 0
> +    maximum: 31
> +
> +  maxim,gmsl-rx-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Identifier used while receiving value from GMSL link.
> +      Default value matches the pin number.
> +    minimum: 0
> +    maximum: 31
> +
> +  maxim,rclkout-clock:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Clock value.
> +      0 - XTAL / 1 = 25MHz
> +      1 - XTAL / 2 = 12.5MHz
> +      2 - XTAL / 4 = 6.25MHz
> +      3 - Reference PLL output
> +    minimum: 0
> +    maximum: 3
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index dd28cc397674..0a43582168a8 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -120,7 +120,21 @@ required:
>    - reg
>    - ports
>  
> -additionalProperties: false
> +additionalProperties:
> +  anyOf:
> +    - type: object
> +      allOf:
> +        - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#

You can drop the allOf here.

> +
> +      unevaluatedProperties: false
> +
> +    - type: object
> +      additionalProperties:
> +        type: object
> +        allOf:
> +          - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#

And here.

> +
> +        unevaluatedProperties: false

Do you really need to support 2 forms?

This also allows the node names to be anything. We do that for existing 
cases, but for new ones you should define some prefix or suffix. 
Typically, '-pins$' is used.

Rob


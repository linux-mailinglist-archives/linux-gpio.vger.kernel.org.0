Return-Path: <linux-gpio+bounces-20174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736BAB787C
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B8493A69C9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FCE1F0990;
	Wed, 14 May 2025 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyXr+1Vq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D331C8CE;
	Wed, 14 May 2025 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260091; cv=none; b=SFvYO22rnX6FqZHy16KA+kXnuBzO0boHS2YajZV7CF98tSPKJ9vmEJoTpcVQTtZFFb0vg86XRn5tPjV808Hz+zv8k8UJqtA/BCQUwt3F15cCi6gxxTnIutvTcz6kR3miGWf4nVSkF2MpS1SUO8TgoactfYsME7ESznH56g4PM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260091; c=relaxed/simple;
	bh=MyzjnthvybELOM4JvFy1xzr8PF39cyQLUmn5pDE6Ihw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=os43krEPFN+zkpZwI8C0szDBG10CbvxTiSlOtGRP7quRvkhcZwg6ZmQJidaZMY3i7/nVwuhARCTSidItt4OY2jq52tAyxv2kV0njDv21RBnG5S6mzMVyS70mAXPN0ALVw0yMSZa1D0qusVxZEQSs08hQGF+yv0A0Ny2MCQYz+cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyXr+1Vq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AC3C4CEE3;
	Wed, 14 May 2025 22:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260091;
	bh=MyzjnthvybELOM4JvFy1xzr8PF39cyQLUmn5pDE6Ihw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyXr+1Vq93LQsdNac7iCM7MAdHJtBYJE3PYL1oocxeEjvmEWQL+dF1/8+ROuUCvFK
	 dY5QplCKRZO9ty72rWusWC/7wJbeDaxSfXfqSI6zdjaL9NNmxtYF289fODYD91OMmg
	 IJtsvT7FswkQj1bEMhC7fxVPFqnnjAHNqCZKDfrVyynZ0/xJXm2KeRL3AYxILtc+GB
	 sA6y2STbAzTbGL/FmxFS3qg01TnzB3GZ9jxQB4E26LeqYvfW0LhAISYclCngk8XLD7
	 3JSBmPEvSRiHAcPqgmQ2MJqYa8KYJSJnf2VBvu7eS7h+vGzr/pffM/XT7Zqedcxx9X
	 SxL1hABJnE2yA==
Date: Wed, 14 May 2025 17:01:28 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>, Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 03/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
Message-ID: <20250514220128.GA3111478-robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-4-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-4-demonsingur@gmail.com>

On Tue, May 13, 2025 at 12:28:12AM +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
> 
> Add pinctrl/pinconf properties to support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 167c3dd50683..5998e2518be9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -121,6 +121,116 @@ required:
>    - reg
>    - ports
>  
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum: [gpio, rclkout]
> +
> +      pins: true
> +      drive-open-drain: true
> +      drive-push-pull: true
> +      bias-disable: true
> +      output-disable: true
> +      output-enable: true
> +      output-low: true
> +      output-high: true
> +      input-enable: true
> +
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3
> +
> +      bias-pull-up:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-up
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-up
> +
> +      bias-pull-down:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-down
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-down
> +
> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.
> +
> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,gmsl-rx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while receiving value from GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,rclkout-clock:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Clock value.
> +          0 - XTAL / 1 = 25MHz
> +          1 - XTAL / 2 = 12.5MHz
> +          2 - XTAL / 4 = 6.25MHz
> +          3 - Reference PLL output
> +        minimum: 0
> +        maximum: 3
> +
> +    required:
> +      - pins
> +      - function
> +
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +      - if:
> +          properties:
> +            function:
> +              const: gpio
> +        then:
> +          properties:
> +            pins:
> +              items:
> +                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
> +                       mfp8, mfp9, mfp10]
> +
> +      - if:
> +          properties:
> +            function:
> +              const: rclkout
> +        then:
> +          properties:
> +            pins:
> +              items:
> +                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
> +
>  additionalProperties: false
>  
>  allOf:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f463ebca056..f8ffb7cff9c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14201,6 +14201,7 @@ M:	Julien Massot <julien.massot@collabora.com>
>  M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml

Don't think you need this...

>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>  F:	drivers/media/i2c/max96717.c
>  
> -- 
> 2.49.0
> 


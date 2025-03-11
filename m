Return-Path: <linux-gpio+bounces-17447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33163A5CD9F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AE29163E4E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C9B263C63;
	Tue, 11 Mar 2025 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMkcqqPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B901E5711;
	Tue, 11 Mar 2025 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716929; cv=none; b=gs4XLAbaD5TNckahkgxC7CXi6hCn5cfKhvWHqJI2ZccDVUD26EGiQjcQTEfkIWJrQMb/3ybhp4Po0cZenmmqsucyvFXf3eiuBcCq01k5XmUpN41uM2FMKCObOWLCB03AfLNkrzBooc1BLT5lYHsELJ6sJeCoxC8odE9C+UdN14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716929; c=relaxed/simple;
	bh=vpOOffpnSh0fvqCTw4JxWUJ/X6ZreK0VQ8Rv3J0Zuk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iryhtz7dl/6//DB4MgQvgUE/mveZq/NhB34Wug27nQSHN8EZDWcY8TBdm0cpQ7h8ja7ECJNy3ad/QAt3npbeI/WlIVnSFfGe4pPCbDncby/jDUd2caafCczPa76uggsuMg/z18qtYOch+LpX/Jl2U2cb6pgUt6AW9GjmEmBi0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMkcqqPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74968C4CEEA;
	Tue, 11 Mar 2025 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716928;
	bh=vpOOffpnSh0fvqCTw4JxWUJ/X6ZreK0VQ8Rv3J0Zuk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMkcqqPMiAosOQ6797LvVM0cf0//2QkwY7Y/WX+Xbe0fHcYlmDB9hImV1m+0dtdnw
	 SYaxhK5zIlVTYBS1aaho5ir9czEEetG18LYiuwbQnHwbq9Xn8MrEMAIcU+TmTEY/+U
	 kNC4q11UEKsCy430kwd4TwECWpAajaMHNCHLe138iuX77M4uXnW80k9TDnky1HC2jU
	 PMeLHqszfc/RldC++sAMTVp4TaECEq+CZZqZ9P3sqg5w4nz5J3sCYZdeZGbB6wJLoh
	 k0nVEhynYytlveBn+KVgO5IFD+8+MEjjQTafF2lFnCIb6VSsc9dEB2ASZuc9n191hC
	 OACZj9ubp4j4w==
Date: Tue, 11 Mar 2025 13:15:27 -0500
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
Subject: Re: [RFC PATCH v2 03/16] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Message-ID: <20250311181527.GA3917837-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-4-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-4-demonsingur@gmail.com>

On Sun, Mar 09, 2025 at 10:47:55AM +0200, Cosmin Tanislav wrote:
> MAX96717 is capable of address translation for the connected I2C slaves.
> 
> Add support for I2C ATR while keeping I2C gate for compatibility to
> support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 1026678a17a7..dd28cc397674 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -91,6 +91,30 @@ properties:
>        incoming GMSL2 link. Therefore, it supports an i2c-gate
>        subnode to configure a sensor.
>  
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^i2c@0':

This allows "i2c@0anything-you-want". Based on reg, you want 
'^i2c@[01]$'.

 
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -98,6 +122,21 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +  - anyOf:
> +      - oneOf:
> +          - required: [i2c-atr]
> +          - required: [i2c-gate]
> +
> +      - not:
> +          required: [i2c-atr, i2c-gate]
> +
> +dependentRequired:
> +  i2c-atr: [i2c-alias-pool]
> +  i2c-alias-pool: [i2c-atr]
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -- 
> 2.48.1
> 



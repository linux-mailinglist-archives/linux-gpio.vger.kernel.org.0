Return-Path: <linux-gpio+bounces-17452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91862A5CE66
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F5F3B213C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B23263F37;
	Tue, 11 Mar 2025 19:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noD6Dzl6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C3A15820C;
	Tue, 11 Mar 2025 19:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719645; cv=none; b=FHZChmrMSPYU4YnqXjZMqAlaumfPekyUu+naRpeT4GgZJ8+v2mIc8DA6FEyjFeogWG0MuoYdV/YS8OVQ1LJEYlcvT93NB2G+PS2uPGJDLu0/epach0Z9rLU3BbNk0Jwna+1q1o5ZKKcaDhSqXS91JqHqU/VVhyJNEfOhJk4zdDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719645; c=relaxed/simple;
	bh=DJE3hrk9AdamWIG94xUchIGvrt68FJeglEzl24bMVIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVEw82/Ci2uGDLroQP0bpBaO4re3ZJFvhgIAIOivLVXgik1KSfkMb4/s6zZEPz+b3hF+JVKl9AEeNueEElQOUP4OrVfRqBi6DzmTIgZDLeb37xr1XB3dS4WG3VWQQvFydvXdoXhVKM1THDCaCu6DsQ7RAyFVjw4nBNLbR2C+5FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noD6Dzl6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D776FC4CEF5;
	Tue, 11 Mar 2025 19:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719645;
	bh=DJE3hrk9AdamWIG94xUchIGvrt68FJeglEzl24bMVIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noD6Dzl6CI/9uwK7fCzJAuLvtMDhUifR+zkPqMtS82Pbm3M/HB43Gvb3uUjktjPSQ
	 3p9P8RphfJrCAlmTjDb47syFRwFczUq9TmWfrkkkAJUXqA4UNfxIQPR27ojOegA73S
	 20A/hH2NQ9XNesAzO3EUIE5WiNQ90Q/qfwZfeUx3XvRInbaultpVpizrR/vSxD+4UX
	 wkbvjTxBnjjOj5mMuIei4wspAPJtR53NpQAZyoXhlBDBJzYzmhW+1xkptCrZjQF6Z9
	 Z883MEpS7mQiCtLWJgokj4AMw8AOcbxIzxWdotiB2/+ntvMeWXOk49aq/zM32mB8K7
	 jqZu54PpSj7Bw==
Date: Tue, 11 Mar 2025 14:00:43 -0500
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
Subject: Re: [RFC PATCH v2 08/16] dt-bindings: media: i2c: max96712: use
 pattern properties for ports
Message-ID: <20250311190043.GA3972023-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-9-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-9-demonsingur@gmail.com>

On Sun, Mar 09, 2025 at 10:48:00AM +0200, Cosmin Tanislav wrote:
> The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
> the selected PHY configuration. Use patternProperties to document this.
> 
> The input ports are all the same, use patternProperties for them.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index efdece2b33b9..bf8c861c836b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -40,27 +40,15 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> -    properties:
> -      port@0:
> +    patternProperties:
> +      '^port@[0-3]$':
>          $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 0
> +        description: GMSL Input port

GMSL Inputs 0-3

Though generally every port needs to be documented. So really, this was 
correct before.

>  
> -      port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 1
> -
> -      port@2:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 2
> -
> -      port@3:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 3
> -
> -      port@4:
> +      '^port@[4-7]$':
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
> -        description: CSI-2 Output
> +        description: CSI-2 Output port

The input port numbers are 1:1 with Input numbering. I imagine that's 
not the case here, so the relationship of port #s to outputs needs to be 
documented.

>  
>          properties:
>            endpoint:
> @@ -78,8 +66,11 @@ properties:
>                - data-lanes
>                - bus-type
>  
> -    required:
> -      - port@4
> +    anyOf:
> +      - required: [port@4]
> +      - required: [port@5]
> +      - required: [port@6]
> +      - required: [port@7]
>  
>  required:
>    - compatible
> -- 
> 2.48.1
> 


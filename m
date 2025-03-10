Return-Path: <linux-gpio+bounces-17356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41511A59495
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F960164B79
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90DA226D1A;
	Mon, 10 Mar 2025 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY0FhGNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474221ABBF;
	Mon, 10 Mar 2025 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741609931; cv=none; b=i8yAzn0j6ziePYXmg4wlu7iWgKNMgFFukkU8K3P/yzM5O2hPxueefU+HRszPMlfeAhyML/K2dNxgiBnQMASEpzshWFWncD98NK3ud+dsNnZDdUEUQDHK+hKopVeGZA5rysBijpBt1rTgqRebi47hVJoQwX7WTKoLu3bUNPp+300=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741609931; c=relaxed/simple;
	bh=+yJXW3oB2sKwOAYNjS/cyatF0So7vPbPll756fs5Nps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggZmqlPbK/JcjidgVpBspCJ2S1AbydLu8/Ma/6MURXwHBDJJcAS0lzi0qrE7vlTTyEZaKeADoHpTJLiZ1I5vwMzeQ9rsssy25nmNZw5ZG0bovXgK7/jSntRRDFlKC/6/v6c/Ll7aC81UnSBZSbhMlsqkfkIXJ1xOKX6pHJi3QgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY0FhGNz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D320C4CEEA;
	Mon, 10 Mar 2025 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609929;
	bh=+yJXW3oB2sKwOAYNjS/cyatF0So7vPbPll756fs5Nps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XY0FhGNz/+TRaq1rubNK8SAY4CBRiH1RDdjwpGzDXcryn/LGrKkpSiJXxMN05qTto
	 GktCOuoFSdnUrIfGHOgrQo1OZFKBgcTJnyRqazDKuhi69HD8z3SJjX6rQDCAQ86oI9
	 H6KWiijonJVFQ+kGlJ3Qwx8/N7RZlUiYRaT3zAB/eLpnodG4uneirLn775Umqp9GvP
	 FTw5LBehq9qDwlE/arO5Xh9TtJW5betOcs0PF/moAReVhf2hEvMQuStoZ2EhVYtjtC
	 XbxYxvPMHJNgDlOusvJQWYu1/xgKTNZQCi+z0HAHBB5dn0RwjotXYCFZXjm6SVxsxT
	 lBwykbgDebHfQ==
Date: Mon, 10 Mar 2025 07:32:07 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make
 i2c-gate conditional on compatible
Message-ID: <20250310123207.GA3853920-robh@kernel.org>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-10-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308183410.3013996-10-demonsingur@gmail.com>

On Sat, Mar 08, 2025 at 08:33:38PM +0200, Cosmin Tanislav wrote:
> Devices to be added in following patches don't use I2C gate.
> 
> Make this property conditional on the compatible strings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> index 2f453189338f..d0a2aaf7df9c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> @@ -84,14 +84,6 @@ properties:
>      required:
>        - port@1
>  
> -  i2c-gate:
> -    $ref: /schemas/i2c/i2c-gate.yaml
> -    unevaluatedProperties: false
> -    description:
> -      The MAX96714 will pass through and forward the I2C requests from the
> -      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
> -      subnode to configure a serializer.
> -
>    port0-poc-supply:
>      description: Regulator providing Power over Coax for the GMSL port
>  
> @@ -101,6 +93,19 @@ required:
>    - ports
>  
>  additionalProperties: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max96714
> +              - maxim,max96714f
> +    then:
> +      properties:
> +        i2c-gate:

Leave the original definition, invert the 'if', and here you just need:

i2c-gate: false

> +          $ref: /schemas/i2c/i2c-gate.yaml
> +          unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.48.1
> 


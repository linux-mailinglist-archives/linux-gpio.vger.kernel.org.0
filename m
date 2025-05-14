Return-Path: <linux-gpio+bounces-20181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F702AB78C6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA9794A7377
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63412223313;
	Wed, 14 May 2025 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ad1Bi3K8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8821BC3F;
	Wed, 14 May 2025 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260603; cv=none; b=sOY7PwqbSGFH+6HfPbzCyQxeBPOupnoxsAVgYR3SodS6YB0sgPDgFYhAcpyhPcxQlGwE3P98baQYZj6yT2EAveNbpd0gue9gMSoiMwr1mLoPckAAu0fv4FJBj7QPKOZEbh/zxE1NDhcfgQzobGhXKirFeGEqWqfcNKp6km6c/Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260603; c=relaxed/simple;
	bh=+AHy91Zm18iqzvNONIywPewRCFhZPA5DZZNdhCtRybk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRz+nfp4r9TD/35GM3tXI6fY3t9RUtP07xGzxe3KcEo56gbVusFFYmbIAOdzZlOVQyqA18Yu3TPF++Cqp4eVKE+aRMYbyZlQDf4B8NHmNhJCtaQIIA4022wUMJHzTFvyAUjeH+PxYhwjt9WCYtSPgnujmGDZ90/3HSLnyKkUtq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ad1Bi3K8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965E6C4CEE3;
	Wed, 14 May 2025 22:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260602;
	bh=+AHy91Zm18iqzvNONIywPewRCFhZPA5DZZNdhCtRybk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ad1Bi3K8PAVcJOJglaeuy+lYOjyjLoUx5ozjJYMmLg2/Rae5Eyq7mtCKh657YkgHw
	 Srtm1SiImLwHY7QI9mRalOId5l/i0wjlTcQucBFGxtnttev7XeUsA06lKiWa9oARrf
	 K2DKEfQWdS2toqXqeYYGC5YbOX/dpXaC/R4jREBpDgUONYMq7JZDctkUa/LNCZ4uxj
	 JUzQUW0O6KA4UnbZsBwKB2mCL8EPeKy9MQPMtNi+1WynLhK4VxlpXlw4ivNNdl0NPC
	 fC8K+JA1Wuwn818qcyPTt1qWHYGBelDmeiVCnLX9s5tFeeXUS2fhiMegE5Xb6IyosZ
	 m4hcvHXRl3fng==
Date: Wed, 14 May 2025 17:10:01 -0500
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
Subject: Re: [PATCH v3 10/19] dt-bindings: media: i2c: max96712: deprecate
 enable-gpios
Message-ID: <20250514221001.GA3125068-robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-11-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-11-demonsingur@gmail.com>

On Tue, May 13, 2025 at 12:28:19AM +0300, Cosmin Tanislav wrote:
> The MAX96712 actually has a GPIO named PWDNB, which will put the chip
> in reset state when held low. Esentially, it works as an enable GPIO,
> but the naming is different.
> 
> Deprecate the enable-gpios property, and add powerdown-gpios as the
> rest of the GMSL chips.
> 
> Change the example to use powerdown-gpios.

I don't know that this is worth changing because then we have to 
maintain both forever.

> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml  | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index b345305acc4c..e38213209973 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -35,7 +35,13 @@ properties:
>      description: I2C device address
>      maxItems: 1
>  
> -  enable-gpios: true
> +  enable-gpios:
> +    maxItems: 1
> +    deprecated: true
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Specifier for the GPIO connected to the PWDNB pin.
>  
>    i2c-alias-pool:
>      maxItems: 4
> @@ -128,7 +134,7 @@ examples:
>              gmsl0: gmsl-deserializer@49 {
>                      compatible = "maxim,max96712";
>                      reg = <0x49>;
> -                    enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
> +                    powerdown-gpios = <&pca9654_a 0 GPIO_ACTIVE_LOW>;
>  
>                      ports {
>                              #address-cells = <1>;
> -- 
> 2.49.0
> 


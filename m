Return-Path: <linux-gpio+bounces-17449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467BA5CDF0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A6977A889C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5FD2627E6;
	Tue, 11 Mar 2025 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5w30VCq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8867E156F3C;
	Tue, 11 Mar 2025 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717831; cv=none; b=gyC+DaCefS2t+/C90wSBicjQ92zI7cGVfeclMOnukYXBPHcK+nJa8oObE7RYoLE26SSk7wsOxazZ5uKPb9U6DOmBHKL0RR6bpU/GIX4y+T/eZnPKuJlDAb8sPrc+poqk7prhcyJ5GlcAv8E+tItG0KmXEI3Q9HSijFTbksl8tPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717831; c=relaxed/simple;
	bh=LfsP1qD1UixHyLWZ+BVqcc7KJb/AoO47XMtQU9zN91U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbSrdBLee+takxefujRq5kFqZ2aftCZN6iASkUNOVQqBjmJFR6qyogwKQfy0oggQ8DpnL0Id7Dvb8utBDI05nVWTyFx0ShvFhc8fdizclKNDHlscx7PNNAYMYdbOZakPQ2w0XTVKjGj9ZavLM17cEDlECyo+rAVyXyfMN+oCsVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5w30VCq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D87C4CEEB;
	Tue, 11 Mar 2025 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741717831;
	bh=LfsP1qD1UixHyLWZ+BVqcc7KJb/AoO47XMtQU9zN91U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5w30VCq3PkMpKSWE5/3EWYD1W9vpCIoatlFxl35rE5UabEOZHWhQ//an4RBbs72V
	 tOiAdDKyID0cT0PqoSo+FBxKHjNjH9+zcUjtE8+pCCuOxCwiKNRmU588sNAJSfUX7u
	 CmSrBZUENaNraghVqc4b4ROIRXnfI2ARvCDLVaKR3peh2O01RYTm1C3QAFgkzQvZOi
	 j45PaaT32l5jMyIxeohinGAQ9Sqm/1iSEuh5btVnz5LFKGU3+l/Mp5TgWA1i57hSe2
	 zvBuAu0q1jCBR5o0+5AvNQhKeTNjbPE92gBmHklCugPBSjzvSwssXnPv4eB0UtoDa9
	 W4aJl288c7wug==
Date: Tue, 11 Mar 2025 13:28:13 -0500
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
Subject: Re: [RFC PATCH v2 05/16] dt-bindings: media: i2c: max96717: add
 support for MAX9295A
Message-ID: <20250311182813.GA3934398-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-6-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-6-demonsingur@gmail.com>

On Sun, Mar 09, 2025 at 10:47:57AM +0200, Cosmin Tanislav wrote:
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
> 
> Document the compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 0a43582168a8..31fb62debdc7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -24,11 +24,14 @@ description:
>  
>    The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
>    forward direction and 187.5Mbps in the reverse direction.
> +
>    MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
> +  MAX9295A only supports pixel mode.
>  
>  properties:
>    compatible:
>      oneOf:
> +      - const: maxim,max9295a
>        - const: maxim,max96717f

Make these 2 a single 'enum'.

>        - items:
>            - enum:
> -- 
> 2.48.1
> 


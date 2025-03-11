Return-Path: <linux-gpio+bounces-17446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0CBA5CD41
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198E3189DA28
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5688F262D2C;
	Tue, 11 Mar 2025 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gbn9Y5lb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D361EC01E;
	Tue, 11 Mar 2025 18:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716552; cv=none; b=WEN8VJIo0lY+hxXXsM7mqqQyBK9d6UpXFEgoyPrKdwOBJYzRWhb6zYR5TD/hCdMsF12JIIqeAT8X/G97tUrFhpwacih+cJDRKJMRSghjd55OX9ZhmPJz/OEoVznckmsCOJ3eqNqBuTqwLPb3XC6dWtV1QN7gl8LtiukYOVOKWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716552; c=relaxed/simple;
	bh=rkr+MYPP/xd4K2DHcaPS2KuUJTGBzM0NtVFOM7N1J1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to2YBgb9yO9vzqYA6b7KsHB6cZP5fjNLEwwJJOiRBwshxZuzGxxU2UFVWW9hfQM2mXWbvKBXhTsSI9Jgp1baoAEDgPEJg6A4zh6qms/SBkmwdLOG6ZSOzyIVJ+0NK501DHg3AoRL+oB6r2CSpQGie36iq+sD82DcLUEYjO+n2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gbn9Y5lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35008C4CEE9;
	Tue, 11 Mar 2025 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716551;
	bh=rkr+MYPP/xd4K2DHcaPS2KuUJTGBzM0NtVFOM7N1J1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gbn9Y5lbkjZe040Ba/4mIfjbFEbAzel6Rd2OdFOpWJjJT4fLwpdUd89Bsr96l23hG
	 jPS168nV34DkfYi0pUd0M/2EJ6XsvRINQmAsA8Pa0TSjNYyzCi4akzTtXaNYb7bFOv
	 WGaLCiiYrbS/GmIj7MHEMBRF2jDYSxGqYxkXxiUoV4OffWyG7vIzH2iXux6dH0ZTuk
	 CpWBof+b4Gz/SBIKX7N3a920OmnOxaQzH9W1n1pKRHdzHmYcVMq7pXge2NZo72QNN+
	 EWavL6vNwlmv/Mn8u8JvT2jBppi/PPstPkWl7D5LwImIcostcp+YJt8dlSKcFtxSsk
	 3oay5uSIki0cA==
Date: Tue, 11 Mar 2025 13:09:09 -0500
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
Subject: Re: [RFC PATCH v2 02/16] dt-bindings: media: i2c: max96717: reflow
 text
Message-ID: <20250311180909.GA3915230-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-3-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-3-demonsingur@gmail.com>

On Sun, Mar 09, 2025 at 10:47:54AM +0200, Cosmin Tanislav wrote:
> This text is using weird line lengths. Fix it.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 15ab37702a92..1026678a17a7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -12,16 +12,15 @@ maintainers:
>    - Cosmin Tanislav <cosmin.tanislav@analog.com>
>  
>  description:

Use '>' token for multiple paragraphs.

> -  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
> -  into GMSL2 serial outputs. The device allows the GMSL2 link to
> -  simultaneously transmit bidirectional control-channel data while forward
> -  video transmissions are in progress. The MAX96717 can connect to one
> -  remotely located deserializer using industry-standard coax or STP
> -  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
> -  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
> -  data received by the serializer.
> -  The MAX96717 supports Reference Over Reverse (channel),
> -  to generate a clock output for the sensor from the GMSL reverse channel.
> +  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input into GMSL2
> +  serial outputs. The device allows the GMSL2 link to simultaneously transmit
> +  bidirectional control-channel data while forward video transmissions are in
> +  progress. The MAX96717 can connect to one remotely located deserializer using
> +  industry-standard coax or STP interconnects. The device cans operate in pixel
> +  or tunnel mode. In pixel mode the MAX96717 can select the MIPI datatype, while
> +  the tunnel mode forward all the MIPI data received by the serializer.

> +  The MAX96717 supports Reference Over Reverse (channel), to generate a clock
> +  output for the sensor from the GMSL reverse channel.

Is this a separate paragraph? If not, the wrapping is not right. If so, 
then needs a blank line in between.

>  
>    The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
>    forward direction and 187.5Mbps in the reverse direction.
> -- 
> 2.48.1
> 


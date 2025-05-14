Return-Path: <linux-gpio+bounces-20172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B82AB7845
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 23:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD89F4A78C1
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30C4224240;
	Wed, 14 May 2025 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTCdstgH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB70223DF2;
	Wed, 14 May 2025 21:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259807; cv=none; b=Jqw7tpato/HCQh9X6sSeI8R7KpmsiwmYmdISJWwd9/99uMuWqY1OGtsZyh4iffb2HJdb0F35VCygKLMJYyv3RmaMOvcP+WiA0QQb6FneG2aED8fAsB/0UIdiEi/NIQxEbcKOQjWUuVm5LmjK4nnMB5DmFCVXdtmrvbCXtWje5F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259807; c=relaxed/simple;
	bh=RGYu87/MAqgKB3NyYtwwQKOk3FvzBnCoc9OCA815Hsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwux0wAQzivly1eebwdkplMfP7fZd0wgqqdQcP9ICTGni8Yfa3U5mcV76tu+Xhz18XxkkzTTODgjUvukpljZQmNlEtraGK9sVDQxcGKAvR46efy9EAzBhHENOSgLc2m9wE82dgLtK6VGHeyBalz81FKXkrWG6brdcu0atsyUCAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTCdstgH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFE4C4CEED;
	Wed, 14 May 2025 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259806;
	bh=RGYu87/MAqgKB3NyYtwwQKOk3FvzBnCoc9OCA815Hsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTCdstgHWRrldh1wABpKj5eRgkuQhNB8/qHdUFoPG1CrYo9NuhWXZzjVQkImNGzNW
	 5V1YXwpoqKfb1yoSTA1qt/WlcAV8ROqTVWhLYewcBW1/npMuTgTScjUBPx0e+5HLvC
	 x7EceodlirCQuQktCWkdKiOkNGMXbXYAGg7Fvsi6S92q6TPzHxUq6fDRM8ArrW3v0t
	 uluNe7pVtRuBgTTpZE7pZvPo20pgcB/uNFM6+J2naS0V5HJHKc4cNlEGI2dSpcdkpX
	 sBBwoRnlz/seX7ra4MgDLIU8runuxeffmDssmHoLvXlZfkUiMXpYOhi7bYwFVCo9P1
	 D20Lm3eykWjRQ==
Date: Wed, 14 May 2025 16:56:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Julien Massot <julien.massot@collabora.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Will Deacon <will@kernel.org>, Ross Burton <ross.burton@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Eric Biggers <ebiggers@google.com>, linux-gpio@vger.kernel.org,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 01/19] dt-bindings: media: i2c: max96717: add myself
 as maintainer
Message-ID: <174725980451.3108487.13826253376011337133.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-2-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-2-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:10 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



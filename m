Return-Path: <linux-gpio+bounces-20177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC9AB788A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 915AC3AA484
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE3A224B1A;
	Wed, 14 May 2025 22:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNAcmINZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E58A223DE9;
	Wed, 14 May 2025 22:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260208; cv=none; b=aMVeKyRj5c6CA14Z0oYWcAImcmPVInKoJ5z7148yaT4TIz0slhLNvNXNatKIFNqqUr5iRv0qyCLwFlzk28tMXZkzitkhk71M5elLKZR5oDpeobB0Kxv+HmHDxZOAcevQy01WTVT6WeQS/GmC5tb0nf0Ui0778DEhi6XDxTNCa7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260208; c=relaxed/simple;
	bh=tFUiw9jSDFGQfWMjyTIVRcA/2nR4HJFoR2JXQACUWVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdppElCDsT8pAfS5f/iPUKuZa0y0bgMSX5UfiijWnORnI1UACCmjlVJzE76xXFlP90f5zbFcoEx6FQqPIcx28i2lh1zKRKd0mVBynqm7JOIlhNcryCBhXaqe8vYo2L20rr+8Z5F6lMQLVQFmVFhEZkN1KIZvdyH9YY/H45uIZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNAcmINZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DDAC4CEE3;
	Wed, 14 May 2025 22:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260207;
	bh=tFUiw9jSDFGQfWMjyTIVRcA/2nR4HJFoR2JXQACUWVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNAcmINZbZC/ZEeYVuEEblerwJddQSMo4nY150rrTEnOu6LSOqT5JX2MOZrtePd4o
	 qJUOrQajMD4N5f+rDe6pdYXTbzvaTnOpkwWIfSrzmngft90CUFQprpQpn46ixd9mcv
	 NHbCeCGxfsLnS55A4N2mFzXKlcCgAUXTP9UtfiM10/JgbydtSH30jYj7ISkhr/AAGk
	 LapX7TNAHEbsRPZdEB7Zqrar/h+dQS/oBg8zcPdPUA+yhM8e2m2IksHkxRrw9HtIZK
	 Cm1va2pKB98dsZFYoo3fchwwCb8bT+VvsmU20gJXLH/WyEotfRcY8qQZVCdA3jol1x
	 GvwjOUO8nsGuw==
Date: Wed, 14 May 2025 17:03:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Liu Ying <victor.liu@nxp.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-media@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Will Deacon <will@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 06/19] dt-bindings: media: i2c: max96712: add myself
 as maintainer
Message-ID: <174726020521.3121912.17909444436858791493.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-7-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-7-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:15 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



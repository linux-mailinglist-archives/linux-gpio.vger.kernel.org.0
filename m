Return-Path: <linux-gpio+bounces-20179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C91EDAB78B1
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE9F5188BC1A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B4B233727;
	Wed, 14 May 2025 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZvDOd5I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE2522577C;
	Wed, 14 May 2025 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260280; cv=none; b=j14oSrAuG4U7o9Azd8y7VpJzLKsTvoPJCOKqm6sMh1AGm3WmaLQZadOb8qQtraCMzUWThXhTUM6Db4h5QP0XJ2MlwRm4LC3wQ+D0p8D0E1M28h2n67PrQsKwu02tobDPPIot5WrC3IiIcdUoxNudp1jLFQaIwbtYtQO15Tg7ax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260280; c=relaxed/simple;
	bh=VF/6ptY3YAA/WhG9VLCXpoTM5T1oQlAmB00KMlDK8LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+56FoJMKU2GVwND4mZgAO6kTNdOkREUqRQYcTsbgElOEd09e1xAeX+uVpE6smdP/uC9CIE5nDHf2syLfJXrxhiYD4g1SLYKJBCdYyianKKq+Uq5OJUPK78uegtudNWPZMCNCVpy7j/0ZwWt4oTU+T3skLw8YsGRfp1SkPym2fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZvDOd5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFF9C4CEED;
	Wed, 14 May 2025 22:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260280;
	bh=VF/6ptY3YAA/WhG9VLCXpoTM5T1oQlAmB00KMlDK8LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZvDOd5IsEj3W7FooGL26wkWPwWGxk8bH/xzhj85q0rf1OJ0umY1BbrW2e2cubOq9
	 FZbQ1zAV1yAdrPaWE658yaUur5UHhW85U8fQJNQI+eJmXigtQT+P77QHGj/zoMHVh9
	 U8rQqKcZti+UbL9XHXJjj3VmMdqmm32ZrR40hEI4/elboe1ZSuNpjvimNHLBVz9LMw
	 mGeYfLKOIl0+4MetZAh5uzPZYG8pEmSQRYi3x4pElF6d8o6b5aKGi/SDM9Vj1ySsBL
	 5lXS3v3eRMGysVRbj6BDqp8WcIrUggMWqKiqDnbOtD641TOh0qjOsdbz2KT7je2B+R
	 tMA7KQOKqYiNA==
Date: Wed, 14 May 2025 17:04:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Eric Biggers <ebiggers@google.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zhi Mao <zhi.mao@mediatek.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-staging@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/19] dt-bindings: media: i2c: max96712: add support
 for I2C ATR
Message-ID: <174726027793.3124111.7562097751443784673.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-9-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-9-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:17 +0300, Cosmin Tanislav wrote:
> MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
> capable of connecting to a separate serializer. If these serializers
> have the same CFG pins configuration, they will also have the same I2C
> address, causing conflicts unless the deserializer changes the address
> of the connected serializers.
> 
> The MAX96712 and MAX96724 support changing the I2C address of the
> connected serializers.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



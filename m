Return-Path: <linux-gpio+bounces-20183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 184ADAB78CE
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 316251B616D3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5862224224;
	Wed, 14 May 2025 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vi8krzYu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90971222572;
	Wed, 14 May 2025 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260635; cv=none; b=s+Dt8KfDmTvUqf+TgnJw20Q+uGO6csfQRKL9cI3UJjo0nd27jWQj4xwhYE3zXfUw4Eaj+fE+W9mUtMAWR9dfDndYHIAjNx2HJJtCp9+YrAGzWoxGABNqiUVIfFV2XlzkVv39ArIcoXZLjMZeFrLWtV2biZ0jXLqC70Z42RRy5OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260635; c=relaxed/simple;
	bh=Wwrv2UhO43VIjIV1UCjx5uhQxg/LgnMUNYlez1/6DQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=falrvnql9vBJKYHV4mEQSPPKa7ggBAEdGLBwHcqLud4xMZM+QmbOQlYRzaOYtSCUezZjPkftDhcShhSGUIXa9LmiP/IKLkixyZoVVnK6TurXDf3ad6dAcNkywRZrQHOGuziHhcmDkapKotQtVUBL/2ApbuEambxqlIy8Cpxl2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vi8krzYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E5CC4CEE3;
	Wed, 14 May 2025 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260635;
	bh=Wwrv2UhO43VIjIV1UCjx5uhQxg/LgnMUNYlez1/6DQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vi8krzYuz9+9Xad4bChJ3PEfgRgtAamMGhnpUjFE9eO2bmZGPtYun5GrbU+vclIYb
	 IzTZ/Q45f0uk6ug0j+1NEMXkm7iBvkj3wMXrEUJcvmZzg+WNr2R7XYxqecOGDVB8KA
	 zB4yDEqKbqtN0Fd9L0QaO2EXHLRzWG1BY/stP8jsBYjRUXdOLJF1Hr2xNc+PIEz6Ak
	 8QUa2UnO4/g5+EUWGh67B3jyrxcymDyx0+911YTcQgJZKOkdE4JYoYbaNluPuqXihj
	 iJPqmgcgcRHTxommRA6FVIxMRBFOup/8dqbYc4u1PRTzFQW6iyAbA2sll49hWbffVE
	 iJZVBMK+FKtRw==
Date: Wed, 14 May 2025 17:10:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: linux-media@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>, Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eric Biggers <ebiggers@google.com>, devicetree@vger.kernel.org,
	Zhi Mao <zhi.mao@mediatek.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 12/19] dt-bindings: media: i2c: max96714: add myself
 as maintainer
Message-ID: <174726063286.3132588.5517805662447106335.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-13-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-13-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:21 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



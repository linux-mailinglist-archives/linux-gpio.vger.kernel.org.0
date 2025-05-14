Return-Path: <linux-gpio+bounces-20176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE80AB7884
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40ADE1BA4A87
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EC321CFEA;
	Wed, 14 May 2025 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qcz1V5NN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829561F0990;
	Wed, 14 May 2025 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260186; cv=none; b=cr+KdlBQ0i6rv/Bfo20GIavXjXRU+I4vOEWMzt7nZaIG/JFEwZ1r6826VI6in41xELGDW+lrU6pFH5otaKKXi3fNDRpUIW1E9GdiDL8nz+ltyfJW5sGuQLX/zI588WLdttHe7kjHj/4dCcYrnykESepG1VhqdfwgqfDNN988JP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260186; c=relaxed/simple;
	bh=DOxuecpOoYFFBrNEOqQW+VQSF4O2eelHquHDUs7IvFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/W9CJxja/Sb2iMpC/gNEw7Oxmh7bK5AHfaEUK8VFtXm05aiXihEwTkmYuYXbUbIwHQ84h8365jcpltZoVnnp8vqpF/Kk/fc+gtS2lDMX8aUPveUcEoj4RZgz/fG7mUPLomoxuILzg7HOp6NzQmIFhpC84St3zM/JUHWHhsj+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qcz1V5NN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0404C4CEED;
	Wed, 14 May 2025 22:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260186;
	bh=DOxuecpOoYFFBrNEOqQW+VQSF4O2eelHquHDUs7IvFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qcz1V5NNoxnsrIJM+0EFJ4R8aM5wx5kTpQAYgGvPSKivx39MglvXa2XTROUxkMlCo
	 XwWUYXHyX5ERRIRlSkrktWf43CVjIKkcCUcgpIcijQxSUk+9f5Ubk+e/2mGrVsUxG5
	 WgYsIwGfFNiCcVQiXcxVIzaJTeF7FE6uyulCG3q78F4/msR/DSk92C9gET8xV5T0rF
	 8cAiAIiTtKca1LGhXrVQUtxmFRlAJeMiAQLaLQDOluAULotoQwKmmhluwaBSXMzxnu
	 UVYrhwC5EE6KOsE0o8j0EsDlF3gBf2z9mM1Qz5F02BpRud1OiTpoc/WAVxwVhoPrsb
	 w0vwPjc/MiriA==
Date: Wed, 14 May 2025 17:03:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-media@vger.kernel.org, Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
	Julien Massot <julien.massot@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, Zhi Mao <zhi.mao@mediatek.com>,
	linux-staging@lists.linux.dev,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>, linux-gpio@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v3 05/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
Message-ID: <174726018371.3121119.12710872984241960937.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-6-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-6-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:14 +0300, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



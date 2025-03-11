Return-Path: <linux-gpio+bounces-17445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C30A5CD36
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 533183B4E46
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EA7263C77;
	Tue, 11 Mar 2025 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IssCg3cS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC29262D21;
	Tue, 11 Mar 2025 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716416; cv=none; b=PoySHhhlHALakB02R0gARVFX1Yyw76XtCG6ungMXYZ/hAzUp2XZicjw46MjoAVKpDIm9LxvldDeTADhhr/z3RUiltammZtAyXfLllAt5FM+99GKnqssQkm35U4e/7Pi8KlNWQvAPoBa4R+5pFned9qaarDdCRtSwWBho4jWuRrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716416; c=relaxed/simple;
	bh=XuObIYw3RDsk53zQsCVI6/Eb60dSnbERWjSJp+4yvEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYQBedToJY6JsDDaGwrnzkx+PIeXBWx83lJRc0Bsb9O98HgOHEmY/mt98Rak83eqit4c3F71G1lyScuLeuhloNAFUy8ROabUhRjUMvgilUk4n5+Xak/emrfNCSYytnWDdOL+q9pENstf/zfUesMKAqrYJWMrvDVGFzRxzQGF29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IssCg3cS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EE0C4CEEA;
	Tue, 11 Mar 2025 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716414;
	bh=XuObIYw3RDsk53zQsCVI6/Eb60dSnbERWjSJp+4yvEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IssCg3cSilF7/wjdOftUOaTpCwST0CEsEV8ami2djc4HT6zPBbMCiV/cHwuS2qMND
	 BkfRj2zSV9ascPDRQScmPra88Z/6OcwtlZIL7RGSerTgdXK4JbyQXZXkwysZ84tUzd
	 gZ4N7XKY03vtOf/cOvrtsofH3ARPwTzhgLplkpSlhm0dIPwjn5mAlA8Q/vUIIbFzwj
	 m4/QuKDoZcuIu69BBnRgW0ygpuhOPul9039z1kpkUtdnd+ZONfpPLcMbjkREjK8hY+
	 cYmP28DjU0MSVrPw+EdEscCB7XKfcgomXkUj5k7doC8sXSppC2e8aGi+cTIHea0aNn
	 wfgk00fV7KDxw==
Date: Tue, 11 Mar 2025 13:06:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Eric Biggers <ebiggers@google.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	Zhi Mao <zhi.mao@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-staging@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	devicetree@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [RFC PATCH v2 01/16] dt-bindings: media: i2c: max96717: add
 myself as maintainer
Message-ID: <174171641225.3915054.13208024290734160025.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-2-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-2-demonsingur@gmail.com>


On Sun, 09 Mar 2025 10:47:53 +0200, Cosmin Tanislav wrote:
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



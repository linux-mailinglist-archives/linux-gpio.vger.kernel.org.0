Return-Path: <linux-gpio+bounces-17453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11635A5CE6F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C0D3B2F8B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACA72641E2;
	Tue, 11 Mar 2025 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZY6YGXK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6672641C0;
	Tue, 11 Mar 2025 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719713; cv=none; b=KcKrQM+JnvU4B/wug9oFsB/LZC4FG/Ze9AITkYBiCWdzmmPB5EcNviWMsmeltZObWdV1SD+xKADERSQaEYvzHp55ryB0avdkQKqpGDcYpZI7hpm6GBFMW5latcYpCqYVdg+H34y7T9Fuu+7jrCIBXT2IYFWxpPMOry34P9ycIp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719713; c=relaxed/simple;
	bh=0Nfwq+o/IjqVRo3eRbr8bUtiQdKmbKP077wEPUEz2zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7EpUb/pwgbKr3ybg5kVQaKrRikCEaa0XUUS0ml+8q6R/cDizOiRJ6vsS4Iw+A/GWk7TgRK1XvGB01Pg56dVGH6FpM5q+LfRdT/HbbyHC3U1gey+0qgVXPcCdoidZlI0O+eNxg8RCkYFOtqRco+XJbBn9qmok9Dd7ZQXCsX5ds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZY6YGXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8B1C4CEEB;
	Tue, 11 Mar 2025 19:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719713;
	bh=0Nfwq+o/IjqVRo3eRbr8bUtiQdKmbKP077wEPUEz2zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZY6YGXKCb1uTU7OezaPlgZioViMjGooBUqKf89gxYxAHZcGmfZ3cE1abOY6DVPhV
	 GNo8mCd1Ny9tVwPTMbMYlqS6HshemvYMjzUz6krcVB1H6mxaU1jTnF5w6G0BqFD4Oc
	 /Uf1a707YkpBeD23JMUTjRLncrk44MjwbvxLNrcaumDCnD7QPPUShatjz+ocwFNgDU
	 Ypo9/reXpehajLhy9M6h5A02ymO+0FOK+4lXJZ02ql7ZYIkDI0pxFPDL3d0Xuy20Lm
	 qzSoEV233vG9OBiu+i5Q9QHjdxfZdZWC3gRFuwr7e1w6qn+KFJnCmZmU48bEAiQ0oV
	 e0GzyMG7ssSkQ==
Date: Tue, 11 Mar 2025 14:01:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Julien Massot <julien.massot@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Eric Biggers <ebiggers@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-media@vger.kernel.org, Will Deacon <will@kernel.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-staging@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v2 09/16] dt-bindings: media: i2c: max96712: add
 support for I2C MUX
Message-ID: <174171971116.3980957.12739233832407896359.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-10-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-10-demonsingur@gmail.com>


On Sun, 09 Mar 2025 10:48:01 +0200, Cosmin Tanislav wrote:
> MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
> capable of connecting to a separate serializer. If these serializers
> have the same CFG pins configuration, they will also have the same I2C
> address, causing conflicts unless the deserializer muxes the I2C
> channels. Moreover, the serializers can have the same hardware attached
> to their respective I2C bus.
> 
> The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
> to facilitate communication to each of the connected serializers.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



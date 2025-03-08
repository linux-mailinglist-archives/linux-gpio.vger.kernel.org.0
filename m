Return-Path: <linux-gpio+bounces-17318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE388A57E37
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 21:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8EB116BD22
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 20:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455B4212B3C;
	Sat,  8 Mar 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz1LBSgr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BEA20F07F;
	Sat,  8 Mar 2025 20:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741466702; cv=none; b=e/juhXs11IIPryM61VTZMh138WbNCz3h9hDXHLMXuAMHC4ppr2j6xK4h7rxCG7McAxxan5VCm6cQX4HWx6HYhcoyKpx71gu1SBLKm5gfVFiflT32ktvDN2Q6wwFEVOAU43mJB+KqU9bfmXTFUVqNxNR12h2fkSXHAE7FW9VX+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741466702; c=relaxed/simple;
	bh=10nSWWi5MGce0BH+GQkLNo0/x4b1dtShGmGc6K9YmIY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FNvim2VRqGGPkjrKT1cWMSGl3P1og5h574f/liHOvBaqdWS0x5c5vpRaJOik0Alt+fKJEDSCzBh4UnjptZTM60YEUwZJHMYq4uQG0K27ZDV3RfuP9Hivjr06klF7NifeeqD4JWiOeEm4kB6TYoKkAkfQZbfWzVTkMIi0q7NHLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz1LBSgr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2458CC4CEE0;
	Sat,  8 Mar 2025 20:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741466701;
	bh=10nSWWi5MGce0BH+GQkLNo0/x4b1dtShGmGc6K9YmIY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Kz1LBSgrogv+lhsn7L7DdYBf6ZHwHChsXvgRU+mU6ABQDwN9mDk8O0mvvImrQfxA3
	 +6cJoz5rO/+wVrrqWjG+CMsxuxz7PIKH+Habq2cisTL/QpOcjfCJmolFfR62CGiIUf
	 Jcvd9uykI4kWXvDLSgcD4uSC9YlpPCBPq0wtPBt93UIxRBCqbxGRn18MahlajdRYz2
	 JtIts04s1WUZ7r3BxY1lnOV9mlm3OD29pY7V4AaPgIiO/2c+IoOchKcXVvc3pP8SVx
	 GZ9HsT6YFxXfc1f481f1IXCoEPi2G+pq4FoiOAxg91rko91KYb6ayRgXSws+ijHsIk
	 HgvPceEkU+wXA==
Date: Sat, 08 Mar 2025 14:44:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, linux-kernel@vger.kernel.org, 
 Ross Burton <ross.burton@arm.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, linux-gpio@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Eric Biggers <ebiggers@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ihor Matushchak <ihor.matushchak@foobox.net>, 
 Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 linux-staging@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>, 
 linux-media@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Zhi Mao <zhi.mao@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250308183410.3013996-10-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-10-demonsingur@gmail.com>
Message-Id: <174146669769.3550313.9537741171612632999.robh@kernel.org>
Subject: Re: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make
 i2c-gate conditional on compatible


On Sat, 08 Mar 2025 20:33:38 +0200, Cosmin Tanislav wrote:
> Devices to be added in following patches don't use I2C gate.
> 
> Make this property conditional on the compatible strings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96714.example.dtb: deserializer@28: 'i2c-gate' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96714.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308183410.3013996-10-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



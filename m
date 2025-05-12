Return-Path: <linux-gpio+bounces-20006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B4AB47E1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 01:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31771B42A28
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6393F268688;
	Mon, 12 May 2025 23:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/miODGV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCB322338;
	Mon, 12 May 2025 23:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747092361; cv=none; b=U1g9gY1OL9kxcOYS+ljGjKIazSiOMVdATHyZersVgq7t3SghbhkhTeUwVHyN9eQtMcwVPhwL25xHlgga2Wijun5HP07+ZjXs2A7gQm7cjyJdcGK9MWhIPxOenQEOeUykmbd2KwYI+UeLAgg8M+GsPzecfGpqlB44sPfTI0GbavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747092361; c=relaxed/simple;
	bh=ocrZSi8DrO1EDikoZUP7oF3uAlxlKAV4CCYK0E7ESY8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WsHt2OKnc5WXTbQaNlS+Uz7n6phS+3UHbj78FMFkqh7prg/+ZO1RICKOd25p1P53A/rcCYIzB2u6QfL5niuOJp6ZkCQmLzgCkGCq+4q1u1k+Zl7Z9Kno0rD6AsOOLK3JgOrYNn4LZklOci+fgsKwk6xiIZThgnXfJL1ah8+Ii7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/miODGV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD71C4CEE7;
	Mon, 12 May 2025 23:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747092360;
	bh=ocrZSi8DrO1EDikoZUP7oF3uAlxlKAV4CCYK0E7ESY8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=G/miODGVrcGeq496mvoRikgxy5uBNnOkysR4Bjkvdh99lpImJjlM0Q5BY/YOvD2eX
	 Tphg+iiW8oLW9MrYAirmoLLIf+pWgv0NN0Zk9AcXiXyDOzLVLNem6tdFThiaJGVPmN
	 15PcatmTdyI7Ze3ctlGjCRzcnYK33f2W6MXt7KXMSpKfzycAYk0STYuZkp3uKIuVUI
	 k+diB3b7yfILzHv2GmGN/ceT6plbGrTysUtzmgENfnumE3CYdoWsmKvoxqQfNfc46P
	 D1nIFgQTzLfQuUP5n0LDuCL/V7cexibccQXFb3mQqBCAeX6jGDDqlvTPgrFGHqhPOg
	 KR1Fk1UXvw5pQ==
Date: Mon, 12 May 2025 18:25:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Ross Burton <ross.burton@arm.com>, Will Deacon <will@kernel.org>, 
 Eric Biggers <ebiggers@google.com>, 
 Julien Massot <julien.massot@collabora.com>, linux-media@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-staging@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Zhi Mao <zhi.mao@mediatek.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250512212832.3674722-15-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-15-demonsingur@gmail.com>
Message-Id: <174709235870.686179.16618194990565341079.robh@kernel.org>
Subject: Re: [PATCH v3 14/19] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A


On Tue, 13 May 2025 00:28:23 +0300, Cosmin Tanislav wrote:
> The MAX9296A deserializer converts single or dual serial inputs to MIPI
> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
> in the forward direction and 187.5Mbps in the reverse direction.
> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
> GMSL1 links. The serial inputs operate independently, allowing videos
> with different timings and resolutions to be received on each input.
> 
> MAX96716A supports both tunnel and pixel mode.
> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max9296a.yaml    | 242 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.example.dtb: serializer@40 (maxim,max96717): compatible: 'oneOf' conditional failed, one must be fixed:
	['maxim,max96717'] is too short
	'maxim,max96717' is not one of ['maxim,max9295a', 'maxim,max96717f']
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.example.dtb: serializer@40 (maxim,max96717): compatible: 'oneOf' conditional failed, one must be fixed:
	['maxim,max96717'] is too short
	'maxim,max96717' is not one of ['maxim,max9295a', 'maxim,max96717f']
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250512212832.3674722-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



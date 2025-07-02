Return-Path: <linux-gpio+bounces-22653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089DBAF5E42
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 18:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 216F2162766
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 16:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF6D2F85E9;
	Wed,  2 Jul 2025 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkDoA3qX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7C2EE5E7;
	Wed,  2 Jul 2025 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472863; cv=none; b=pMe3YQxfl5r0W4US8DIkP8xsnYRdrC/GkU4Rv51zq68X+8U/eZH0209G58bemJgQgXAYPbxbNOvoOaB0pmJK4Zb468NTXz5AUVbZp0FCloMSKMxVbvAhpk+qixhLv0U+mALDaJigm2Yc28NCbtK6xmATETJMyd2vzyFS2lpRdOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472863; c=relaxed/simple;
	bh=qAqCnDiXmDWDKpsRVEMIVXLauOz1Q2uyONAQFH9F8c0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cW/JECTUdRh88E7cNl9i+rjRvdyTrU33GglZaRk+TpdN3syar+WhKIVbSBWZh0y4wV1LJ/55r17tXWa2OjBD3s8cMvnwXF8p9Tsk4nXGr7rvvJkKIhaN5nJjEV2UWVP9u9FeH1xCaA5Mc/7QcFnvU1x1SIM0xXT1/u+PxSqfj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkDoA3qX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4687C4CEE7;
	Wed,  2 Jul 2025 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751472863;
	bh=qAqCnDiXmDWDKpsRVEMIVXLauOz1Q2uyONAQFH9F8c0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XkDoA3qXcO87nKbrvLlQAOcEuefHPBdeAAhnCzoT3xJo364HpCdXMR1XT/fpybOb7
	 ZVKKm6zwfmDqUiZglStC/614VObrg24NyJzETSAuy0tG/78OJ4VL9BJQT26gC5G9Vs
	 SXe7ARU4hsSQoM8N29HOTpXCyY7JrlykGiZza9My7fFrlfjVhM8QdTnMM2Y89mIn+8
	 R2xoI7cmqcAdkyFIRBs72YU22l2yS4RWaOypt2DXFIHdqhHIIFa5CFVoqnT529jNKl
	 Ufvvg2YmIYjzrNwJKq3VOZcQnSCuZlTxafY2Eq9iXDPkv4uP+rERmf+YjLjhJmrLRX
	 fMIxVhWJ62qwg==
Date: Wed, 02 Jul 2025 11:14:22 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 linux-media@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250702132104.1537926-15-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <20250702132104.1537926-15-demonsingur@gmail.com>
Message-Id: <175147286213.1836974.10095173958992106810.robh@kernel.org>
Subject: Re: [PATCH v5 14/24] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A


On Wed, 02 Jul 2025 16:20:40 +0300, Cosmin Tanislav wrote:
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
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250702132104.1537926-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



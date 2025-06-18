Return-Path: <linux-gpio+bounces-21769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C2ADED2F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E23AA16CE5E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F66A2E54B4;
	Wed, 18 Jun 2025 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYpXFz/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB342E3B10;
	Wed, 18 Jun 2025 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251603; cv=none; b=rJYPsvwDEyEw83Yc8wEcYAGU2tBuIGsC9gLy+79TAavkjocK1ikoABgrJrQTlLq9Fa6AR43orjSIkI2rByJpTLg6cOyzxunt1bRR/7im0O7SJgW4nhnD+Jz6ASZwkEAoH66C/QoLxgCAt/+4Qh5Ou5fJ83tJbySWNeB8RSydwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251603; c=relaxed/simple;
	bh=MRqEecx1OOYe0w2vHR29KSY1Ek3v/BZj9saNCAG+GcU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XFzI5Q6/ZHFAqrSwTbleUwYaeIZ51eZAXwTDAlXw32NRPTamGvLNCMwX3Voql+na1tu2np6HhN0KXmCb5YqK+DKZ/mwuxwjuNTlpVz6HdNsX65JA7JVooPzeTll9HGvNc89Eia10ynpfnF6vOYKZ/lsqwrIOGUXU3FXWFZ/k2Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYpXFz/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F52EC4CEEE;
	Wed, 18 Jun 2025 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750251603;
	bh=MRqEecx1OOYe0w2vHR29KSY1Ek3v/BZj9saNCAG+GcU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hYpXFz/fg2f586yRIe9vDvlYwHywwIg0QM6bbGgAQbSHP2zJ3LRwkbMPvxZZhnD4j
	 5HML5apfyR7mLMacWrp0GHtla95F5QQ0Z8qAAImLDDNO8bcIOOXvT6EQo5ZWLsLvUo
	 CNtU84SZCzK5IopukR/e2cuBlEbpeMOEjWySxTHbEDW69nBk8Ph9xfIaRYsClnmsAE
	 0tvqhIhiYhigWID4OzVbfOoCLFZhp2rzX+Zwe2Y9Z8lKu9u4A7HgTDaWuhjy7IgFRH
	 NVrAV08GT0/wxvz7swU4LLhBPpEnSrFxN4eewqX8N17G5xWyZCcjWi2RV2g/3zW16a
	 MmUAKAPG6EkGQ==
Date: Wed, 18 Jun 2025 08:00:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Julien Massot <julien.massot@collabora.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250618095858.2145209-15-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-15-demonsingur@gmail.com>
Message-Id: <175025160249.1545873.9100402029038186913.robh@kernel.org>
Subject: Re: [PATCH v4 14/19] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A


On Wed, 18 Jun 2025 12:58:50 +0300, Cosmin Tanislav wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250618095858.2145209-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



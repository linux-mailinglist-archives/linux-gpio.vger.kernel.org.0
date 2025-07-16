Return-Path: <linux-gpio+bounces-23390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC9B07FB5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 23:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882AA7B5CDE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81C62EBDF8;
	Wed, 16 Jul 2025 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIYCGT6K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680F266F05;
	Wed, 16 Jul 2025 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752701714; cv=none; b=amdBEIXpwn2KBCEeBaU9J7nKrzfNRw9G8oojnb4Z1RyHmE9eDdVR/A2GsDDIZWetR/kF2OsmWZw4PVOd93ZzBtGNA5Q8lbgdY23PXelx8AS4ajqRgb6B2wlAxDEWUWZZePQ1DgaZQYNk1n6qXljs9OYUBVyOYTLr86KyLJGiwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752701714; c=relaxed/simple;
	bh=I+SsuYKuKb1oPJn8xEiqBq/dE2QgqTu7aIwJzz2nSGM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=u95FbmDK//CIXtzZP+we6XfjqcXnnQQ6WLLPTxgpVO7BcPOM+Gzh3RkmThtC5VappBPHAbGaEUGdiekHTaoQJkaUWl4dKlprMLDcavCIAPIT79zcq62RWXvrlYNnp/x7XGUNuUTHKbB1rZ1a7eJ1Q/J9V80YeOybzwbWr++FDOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIYCGT6K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CE1C4CEE7;
	Wed, 16 Jul 2025 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752701714;
	bh=I+SsuYKuKb1oPJn8xEiqBq/dE2QgqTu7aIwJzz2nSGM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TIYCGT6KEhF7zj5LNSho42EyJc1rH7Veqeu4TNU3xuXjY10FO0fGt9OdG/o9ZEPIi
	 TqifTc+caMjefREvUC2W6hZutwGSG4S/jDenIoeuSKkBDOhgxDzBhXXCaAIV9R7vyc
	 tNVDpbGA/yxi/fHzZWljc3+u7E7Jt3QELfNn7TuViQ6wxYBovpIO6GvExdHpFBv6Qu
	 HG0WWH296RmLIrHnJByQZw5Rv+owREEvR7MgvBDCj3lG4TkFfoX/RMcX9Xmf4r0u96
	 Gd4Nvo/IhlEQn6aatWlC4xrZQTBMz2tqAJ6TN0obzv+SEsk3MzpKnKIC6kESvHSnCZ
	 uJtUnAS/kAhZA==
Date: Wed, 16 Jul 2025 16:35:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, linux-staging@lists.linux.dev, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250716193111.942217-15-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
 <20250716193111.942217-15-demonsingur@gmail.com>
Message-Id: <175270171321.1284786.126748563521510901.robh@kernel.org>
Subject: Re: [PATCH v6 14/24] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A


On Wed, 16 Jul 2025 22:30:59 +0300, Cosmin Tanislav wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250716193111.942217-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



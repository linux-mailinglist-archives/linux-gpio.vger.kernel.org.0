Return-Path: <linux-gpio+bounces-10054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8D2977C3D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 11:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F8381C2453F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542221D58B2;
	Fri, 13 Sep 2024 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9BxO6h/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08474175D45;
	Fri, 13 Sep 2024 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726220152; cv=none; b=d6begquK8+EqZNj8JVQoV4TLSzSWA+2xoOatVA6me3Czorsxay2BxCrPU3Snpg7ksGfyAwcK6OVb45WzLTdXmlRCnbtRabJG4g7noP4zxYfaBr9Y+dFQt42TqhipdxfS/vnCxt2F4Kk3+crSUEQjGV658r6gQon9gricL4Ce0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726220152; c=relaxed/simple;
	bh=RHaelLa6/GKnvmZfK1KHj21+T+l1dsx4khox488sQF4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=bKoTsyxb2utMTkmAIOaJG4QrniQCcwUA/6I9SCInVkJs9Nw6a6BoJX3Xr2IQNV7BH7qdu4mb5Lh0qDe6vmkqnaaBe9k6wsF0ipEN5htzkrGAB+MkoTamOiWmAGy595urMlGuWgk+wpyAKEMIgmhYrull1lnb8S4M7i9FEbSA4tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9BxO6h/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45C0C4CEC0;
	Fri, 13 Sep 2024 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726220151;
	bh=RHaelLa6/GKnvmZfK1KHj21+T+l1dsx4khox488sQF4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=D9BxO6h/jCHprQts9ZQw37k65i4jUXJRh3eZweJoFUn54BDgXZ76Xy5abdbgv0sHJ
	 +bQmhQWb86ISDD8FZEa+PC/8GNxXUUNtYKHKNcctOOsKNLHirtpmSUqH8ExN3Vqq2s
	 TA4LOxutzTgVo11qigU89hj9PZCDqvRsVxeTv1IZD9+4Fr9RFQxs3UOMU9dSvr2M2Z
	 ZfihrQpjXoF7qTIZci8sP600vsCoZp9FIxWSc7YPBdE7laREXA4eX5hAXZyDueuD7I
	 eNA2qtZW28UYG9+EG8bPixa86KnZunlvvAZbnxdb21Wibluck+BJ07lEGcdGtWJxtC
	 5DGUSsiHSEx+w==
Date: Fri, 13 Sep 2024 04:35:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
 NXP S32 Linux Team <s32@nxp.com>, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chester Lin <chester62515@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <mbrugger@suse.com>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240913082937.444367-3-andrei.stefanescu@oss.nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-3-andrei.stefanescu@oss.nxp.com>
Message-Id: <172622015057.2463404.4285438986782752017.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs


On Fri, 13 Sep 2024 11:29:33 +0300, Andrei Stefanescu wrote:
> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> 
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/gpio/nxp,gpio-siul2-s32g2.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240913082937.444367-3-andrei.stefanescu@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



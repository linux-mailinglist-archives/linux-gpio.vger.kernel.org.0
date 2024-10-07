Return-Path: <linux-gpio+bounces-10974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FAF993266
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D52101F20FEF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324C41DA11C;
	Mon,  7 Oct 2024 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhLdJsPA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BB1DA0F1;
	Mon,  7 Oct 2024 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728316945; cv=none; b=Stufwh2AzSmED7DOxL9dGjPszgM2rKdDFX1eP5K3Qzf+0sHcBSSMJoDpEVebwopz2r2/Q2n53fH3zMW4mKc7xeS+dMn8cLjQ7Sptc0B9SYYMzLI1x+w8fLX6yS19nLqxniB4E4ImgwGTE0tGMGoxB51zEMN4cIDiz487bh2VDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728316945; c=relaxed/simple;
	bh=Q4PsbsVHT/o1CZ8EWpNOAe3Ox6YRWovXBHM9oFa8aR4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=BpKn/ZqSltJ7WXTsoiotFOvFf3Iu7u6DUIAfZxj3wsCz/HGObVCQEMdjs3L4IfqFpxyEtVd6y3Qq1mm37j5u8SKgxdhln4yOTp1JlCSJ2QtkudFJnIWv8o1BGbzL3JH+Ojo3/QL6IjZ19h5Jbbs1DJtChuaDtSEHH8ECsyD3csg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhLdJsPA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF93C4CECC;
	Mon,  7 Oct 2024 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728316944;
	bh=Q4PsbsVHT/o1CZ8EWpNOAe3Ox6YRWovXBHM9oFa8aR4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZhLdJsPAu6oaApYdnnxdnGgnBFHJDRCEmMzed5EEnQVaTIZxZ+FqQX7u7l7e7OXEU
	 l52MlkeAHqXSgFemKixvZf6EsmPPHBvvt/18kSnP5uUxLDdoa7kId8W548V/XL9SB6
	 1yW8krRX6UL4id+bP4xofIi0TCBNZ36TrS3oxP41XmK5LwyUNkn/srgJrT0mLYoYkl
	 v3BRAV4h5PMHHEO5t+TXVZdpe7J68GX5dioDtR9OUu/iLUKJl9LNjjbShEC8rytu9+
	 71aU6hgiTIptNBgdasrjt7GV6dXOEIH4mqvsxa/9vco9IbCQTu2G6z3UVRrv/ODYWL
	 KSqivgsgKdybQ==
Date: Mon, 07 Oct 2024 11:02:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-2-d3d838540033@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-2-d3d838540033@linaro.org>
Message-Id: <172831694330.937353.14650435678577353929.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: amlogic,meson8-pinctrl-cbus:
 add reg for cbus pinctrl nodes


On Mon, 07 Oct 2024 16:16:26 +0200, Neil Armstrong wrote:
> While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
> reg property for Meson8/b cbus pinctrl node was ommited, fix this to finally
> pass all bindings checks.
> 
> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.example.dtb: pinctrl: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-2-d3d838540033@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



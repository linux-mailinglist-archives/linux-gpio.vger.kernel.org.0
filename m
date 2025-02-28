Return-Path: <linux-gpio+bounces-16834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810DA49DE0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 16:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DDAF16F4AA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 15:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC19272906;
	Fri, 28 Feb 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+KOHVkB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CD7271818;
	Fri, 28 Feb 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740757549; cv=none; b=IjLIVv88CjMuhP6YmBMPtEy3npXTSrqAPxJoG1/qLPqZn7gHcnArUoisq4YUv5y0u11/daKQo501XdY141s7gV6LOX2SxxXsqPwiAeOjUptt+oVqitSJnWEuPZO/EOaHkuS688Z9LEezCDWYboB2UI1MWMqjjTmr6pnOVpEzYzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740757549; c=relaxed/simple;
	bh=Uts4A/r4zPPP3eb6uT940KohT1wufjWOeBrUa3ZwzW0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bC5YlI1DkfOs3SkV/FSj7hHqa+6kapVh/RON14AL5iq9SDjoD4oNWv8bWbuOgpmG+h6wuOvc+MbeFl2iPntjIR0746l2P3c84BpaqwLGLuCosV9KHfVPbMVAPnI8panzRIRnBFUaTCx/Tdm5qZQ5ApDgKU87Nm0AiErkrHcrl/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+KOHVkB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48564C4CED6;
	Fri, 28 Feb 2025 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740757548;
	bh=Uts4A/r4zPPP3eb6uT940KohT1wufjWOeBrUa3ZwzW0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H+KOHVkBepTuiGOdNZCr1sE8MgPyu2ITrZv//mbC3+GgJW5VYhaMeeoM0FCPRzplZ
	 QDhj3H44LgVoPA5mkE+fMPzmMBa5GPNc+G1ZR4KtpA7xkxcXDPshBwNtM7UyyRwHHc
	 6MyVJSzoqWvd2g3XPwgWtIrINBwBzDuXmU+HJp6SFWjqu/OeDiHT/UonlcCKlCfitI
	 G7hcCkRtoPbf7m33XSRqTYrJwkitZ8ZLiGfDqrJQT7H22CTKtyoYTKX+m5TGCjiMNm
	 htCTDGaFQmYkSk9N+vMc90oXAEJvUSJtAqRfRkyVzhZqHsVE34iTVb4qPEXsA9whnV
	 /1xSPsR/qD/Aw==
Date: Fri, 28 Feb 2025 09:45:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, devicetree@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 kernel-team@android.com, linux-gpio@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Will McVicker <willmcvicker@google.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250228-max77759-mfd-v3-2-0c3627d42526@linaro.org>
References: <20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org>
 <20250228-max77759-mfd-v3-2-0c3627d42526@linaro.org>
Message-Id: <174075754475.2982392.4279311619113496432.robh@kernel.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: nvmem: add max77759 binding


On Fri, 28 Feb 2025 14:25:16 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes its storage module (NVMEM).
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> v2:
> * drop example as the MFD binding has a complete one (Rob)
> 
> Note: MAINTAINERS doesn't need updating, the binding update for the
> first leaf device (gpio) adds a wildcard matching all max77759 bindings
> ---
>  .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml: Documentation/devicetree/bindings/mfd/maxim,max77759.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250228-max77759-mfd-v3-2-0c3627d42526@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



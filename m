Return-Path: <linux-gpio+bounces-17961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F4A701E4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 14:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F40D1887CDC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 13:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D64277801;
	Tue, 25 Mar 2025 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+xohY4m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E507C2777EF;
	Tue, 25 Mar 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907312; cv=none; b=BXacayDyZd1ImKfmZTB5eUZknl39a1y4i+s3T0FDks3b81XitvkxzexrvqVEuTJWB3Oi9PF2X1HYXZ4cNiD8NNS6xgOswkFhffoJ0N0QMQLxNn0O7OPT3wwdIsvInT7Lurw+dihB09SoVV8bYtJD7GWrxQ6Q1F0JJq6TXUgYm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907312; c=relaxed/simple;
	bh=Gzqe8KG3mL2X0aFpFByEdGVC9IKJlemR9Ei/T9bGfYw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aL83Z3dX0uAWOTGssNYIq9KZxvCEtbEPs1iBWRay2DC9XJFDwtmANo2cqckBH8+LxlEzrKpcMh6lwoYFdatWOUEBQxK76hBpJUPQx04ODdim2vslhuODjc6pkbGfFCj7qjesRPuIXZi/PsEZMSsgw20TPkZ7HJdh7tSury1Y/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+xohY4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090D6C4CEE9;
	Tue, 25 Mar 2025 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742907310;
	bh=Gzqe8KG3mL2X0aFpFByEdGVC9IKJlemR9Ei/T9bGfYw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=k+xohY4mLWc5/92N1dCl+dQbPe9PMVZm4a477b6yneNcKtcaaNnEElqa/+jB7TWur
	 5ZeN/aMyq+yFN5SFnWogHZSdNSD3i/xrlJKohRFR74xtwcfJk+mnTAhbLMtOub+UnI
	 yi4p54ywElxJbob/ebCfSm2jYx+RThTP0GecGeJDSjLC9CxQRINxzRUgolIwcNeWcS
	 I5/kYyY9HQYsbmZscko3zg9j43cByKJjk2ZM/Ru/RPabBUrwkbWrm9BXLsaVvFZuOB
	 d5fOZ3JgP40L0atUmk4Tn4f0cp8KbmGCiSRjO/tmRBPLDQ9bMRMui40DbXCrPe7wwq
	 Ows6f0RCw3BJQ==
Date: Tue, 25 Mar 2025 07:55:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will McVicker <willmcvicker@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Kees Cook <kees@kernel.org>, kernel-team@android.com, 
 devicetree@vger.kernel.org
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v6-2-c0870ca662ba@linaro.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
 <20250325-max77759-mfd-v6-2-c0870ca662ba@linaro.org>
Message-Id: <174290730682.1654974.16103236890365619009.robh@kernel.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: nvmem: add max77759 binding


On Tue, 25 Mar 2025 08:27:03 +0000, André Draszik wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250325-max77759-mfd-v6-2-c0870ca662ba@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



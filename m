Return-Path: <linux-gpio+bounces-16833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1309A49DDE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 16:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90DE1165DDD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 15:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800E2270EB9;
	Fri, 28 Feb 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+kxnesL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA5186E20;
	Fri, 28 Feb 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740757547; cv=none; b=MinqEgwWIkR23wbCOdRODXAqgoWbZXoUZH0EyU6YwbatpfMph6CgpDrqd8XkDFhPWSaGzQNVrkYnduuYBFGODMo7mbM80u2SuMr7EL1EkNTI4nGga4WLeUS/WEzfpQihNhlol4Vytz5NQZfXm2YQuTJ8AZQjHbKvSqwoJsxGKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740757547; c=relaxed/simple;
	bh=5nP7KH7x87oSyhZzLyi7xNGYya5Yqe7l7kW9rlTyesA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ocjxmdAePQHVurCWuhqwyMsvqqcD/AHpPppdYiW0PM2r2VYDd5wUByArVqJhSQGrE/MVNFAz6vQw2znjZE1BTchcwQ03nrZUGZA/KupsP/7TnlWtK1ZriHY3UQgSMxm4qxAaZwOtQwMVldNLDX2OweudhGZgtV62lm+J4j3sl70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+kxnesL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0BFC4CEE2;
	Fri, 28 Feb 2025 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740757546;
	bh=5nP7KH7x87oSyhZzLyi7xNGYya5Yqe7l7kW9rlTyesA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g+kxnesLwcgC5KTH48/RY+ddqXaR4y3mKzA3ebnf2/i7cks+pv43VpOt5MpO+DYgT
	 6D1Hf5/2VoeGuhlLV05Fg/IcZi/wfCfyQeEvN1erUotxi26cp3bdKWtVoycAfCSyIA
	 lX+KzxlLNGBNrZthg9K2K3V8y7ExhPosmenjJcv5iXE01ZMaUU1osC6UbMtNn/rICl
	 EtiduL6YBSZGLYrbgYMTPDCJkopaM6OGSq5KLg75uoeWxodbzzEBqVBeexe5eNZ58n
	 sDx9vDKL8EK6GbYs42XhTl/sbJzWD7gWYHyuGJLEmUPRXtgd0nD1T6WqRKA57Oufdl
	 OEPS7MHmaQu3Q==
Date: Fri, 28 Feb 2025 09:45:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 kernel-team@android.com, linux-hardening@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Lee Jones <lee@kernel.org>, 
 Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250228-max77759-mfd-v3-1-0c3627d42526@linaro.org>
References: <20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org>
 <20250228-max77759-mfd-v3-1-0c3627d42526@linaro.org>
Message-Id: <174075754372.2982326.17447607347334540253.robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: gpio: add max77759 binding


On Fri, 28 Feb 2025 14:25:15 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes its GPIO module.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> v2:
> * drop 'interrupts' property and sort properties alphabetically
> ---
>  .../bindings/gpio/maxim,max77759-gpio.yaml         | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 50 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml: Documentation/devicetree/bindings/mfd/maxim,max77759.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250228-max77759-mfd-v3-1-0c3627d42526@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-gpio+bounces-16659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84380A46C76
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 21:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402F5188CE2C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 20:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B501E1E0C;
	Wed, 26 Feb 2025 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UN9hkMfv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B54B4438B;
	Wed, 26 Feb 2025 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740601852; cv=none; b=M2Z+WIHEcGtYJMMb9CUZiqiot+JZP33bSuWyG93JAISD6ABcnaV93K87e5xrzS25OJOaaGP4QSsJbDorfR4ohuvoo2YiSSPt+6+s0gOkulMdGwiDV8WhZevKrlvTGRjxLOimcnHRwoL3rlCbnpZbL/uuDc0bVz/G1zw0dt0mVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740601852; c=relaxed/simple;
	bh=FOpMpPdnsC/Ffhw7zqdqp5avU6Q0msmffQzJVlfldJU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=in+1r04UL3rEsBLVaiPJ1gW7v+DldCZ3SwrABZhEB9J41z0bE/toF5PmSw9fm5KSLDMP1EKtq/tBdsAcJsnVApTReE+gU7Xo9hjLsORKH8KfIDlgo+F4ChoD0fLhzAY72gBigcE0akDwQAhQgAvscgFjnD8WCUTuE3JQ0+7sX9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UN9hkMfv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372F9C4CEE7;
	Wed, 26 Feb 2025 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740601851;
	bh=FOpMpPdnsC/Ffhw7zqdqp5avU6Q0msmffQzJVlfldJU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UN9hkMfv6Ptd+9HnLi61p5HRBCNfi9pDTQCzWHW3XFcc/VCLIgKBbmtPwSg8XHg3p
	 bvEdOoPPGq6HN2xCXj3qCCkTPLJ5sjWzoGf4e9ZIYMhVei2I8xercP9HEwtqSiguxw
	 ZxDSkfeahO83/b9wWRfaqBN5tqTWQe6QOAdpiLoxR4C0bnG3CmFk0pF4PDr5wCc0I8
	 Rwq5ETB/woGlNhURrVmgAs4svNBpAzKZRriTFqejyHwtIG1V4pIk+rOSfnw4O5ezyz
	 L+f/uj0nMyG7/iOnlMMZs7feTMcEmqWy73hzCMi6KzddtF7cW3ZHpRqmKkueSAgHQW
	 O7HSiLxSatEfg==
Date: Wed, 26 Feb 2025 14:30:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 devicetree@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 kernel-team@android.com, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
 <20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org>
Message-Id: <174060184807.3654907.17826939583833772128.robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: gpio: add max77759 binding


On Wed, 26 Feb 2025 17:51:20 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes its GPIO module.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



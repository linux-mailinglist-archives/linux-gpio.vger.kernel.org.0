Return-Path: <linux-gpio+bounces-16660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2203A46C7A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 21:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69FE4188B0C7
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 20:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C4C2459C7;
	Wed, 26 Feb 2025 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkM225aU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB25238146;
	Wed, 26 Feb 2025 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740601854; cv=none; b=C2l94+VG7F7aUmPRG1DzjdOWUjbSGKdD3zOksBhwpWG+gTtECYhxI5i1kxSQ3ERFwIDnCEdQ8JB+Xi/2nsHBafTEKdY6GTc+eovYTZ4GzzEimk6oiPFXdNWfuJeDG/LxkXrtj9YcqPrXfGSxDi2TDdKwEJzlPHRtXrjm1uTolCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740601854; c=relaxed/simple;
	bh=0ccKtFnXDB07VVeLwC94YQRQ143ygv+T8cM2gWnw+MA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MGR74WvHJUxTnFmT9bUuZp0Gt3xk0asFuFheRxLIfvyRaIzOpZvX8nyevIy6/QIdZCqBQl5FDzxf2TOS5lDDxpQ0dCn4hWw1fRMm2oDUeMe8G5d3QCGoiByp6brEcMBcFXRefB72XaRhaVA3KA7qYxPNIqFOULhfnuYFclZwhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkM225aU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0E2C4CED6;
	Wed, 26 Feb 2025 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740601853;
	bh=0ccKtFnXDB07VVeLwC94YQRQ143ygv+T8cM2gWnw+MA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JkM225aUbbxbtU78vlu7XpOd2Fa6vOfLxduFBX1OjcyJOPSfwGFYayrER7I69IsA4
	 eLFUbSww2CSrppzOLgZOwWLX7hKqinqeZzGKpPG/WygcvYIbXrmHPVOFO1kr78qHPT
	 7CgccRDM6HBhx1JdaEzoE2qmjrKjrNkkAOsBPpSX9xWAJjoA9LDqU3PYm96Xh+EQjx
	 zYLe+mXa44yUm6Ype1JfZuhiPZ9hsMY/6sdAPND8v5iZk9LQPc07Qmbec05ZSKJ7DT
	 R0O4FQILWk0l553BAkSRNW4WJwEn8zNbZHM7bZyAJOcz8cp7j7QC46EQMqL2UMlbDV
	 n3x828+lB/sVQ==
Date: Wed, 26 Feb 2025 14:30:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-hardening@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 kernel-team@android.com
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250226-max77759-mfd-v2-2-a65ebe2bc0a9@linaro.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
 <20250226-max77759-mfd-v2-2-a65ebe2bc0a9@linaro.org>
Message-Id: <174060184928.3654973.15577720820922594753.robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: nvmem: add max77759 binding


On Wed, 26 Feb 2025 17:51:21 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes its storage module (NVMEM).
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250226-max77759-mfd-v2-2-a65ebe2bc0a9@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-gpio+bounces-19426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0FA9F549
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 18:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6451A8211B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 16:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5316427A13F;
	Mon, 28 Apr 2025 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaIJgJt+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDE627B4F9;
	Mon, 28 Apr 2025 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856761; cv=none; b=SS+Nk5dMAY7CtdZIRoa/uo4U3rj1oCCpR/ifPBfFNdev9CGFNVk+mZ8Gg7JISSqi3al/YF5wqCjDrw8PRn0EApiQ/nHciFRIu3svKO3rtNu77yIot8lKnkz8bn1Erq6xn4unNCUnjihToOWnUcpLLiTGAJ+qGI2URu4X+47kTIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856761; c=relaxed/simple;
	bh=Ucpgunkpy6U/IjEb5XHK0SIzreigneomegn1oB6Tnow=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XSulZiC3Nxr6uLZL+nGToTDTsN5EdRnfdk6VOaVFwWEEw2KlXX3TtXSv9TSxTqIFnKOxfGrkZp8hRha4mch9A9nRtclT49uD3ANpig1J819Obudc4vQskaZDpIXpSoSdIWU3IvXMvQ3TdQRTUjJ0C26QStM4vCQXWaTIp5YCpGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uaIJgJt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC3EC4CEED;
	Mon, 28 Apr 2025 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745856760;
	bh=Ucpgunkpy6U/IjEb5XHK0SIzreigneomegn1oB6Tnow=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uaIJgJt+DJaMG67WjKi3sdigCzl/72lz3imb2odO9xWNkJzqi4qzGKb+O/bB4Qa6f
	 PU2S2K7obAU4IxU8ve2cW5qfyAn0drFc+2pQXdak6nzpN+jm5IlHzN5N3ggyHKOjIF
	 GdKPcU3AI6AMXnLHwvEkbijjecDmcaVICihnkVMXPdmV68TBA5XiYZkLX9DizAX4Tb
	 fS80ZZbUBkyAJmw07JN5rtrMxrF9kaifLyw57CqrC4zLRHFsck6VB7u2MXwWVn2gTD
	 1sb1wA5XutyZDS7KIyUVH9k4NwnvD0mwr98QzHA6zTvfJnC0kiDxV6C+kGTURWjQ0n
	 /WhagvG3Zg2SQ==
Date: Mon, 28 Apr 2025 11:12:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-hardening@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-1-edfe40c16fe8@linaro.org>
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
 <20250428-max77759-mfd-v7-1-edfe40c16fe8@linaro.org>
Message-Id: <174585675718.1413056.7895723185749789189.robh@kernel.org>
Subject: Re: [PATCH v7 1/6] dt-bindings: gpio: add max77759 binding


On Mon, 28 Apr 2025 12:36:04 +0100, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes its GPIO module.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250428-max77759-mfd-v7-1-edfe40c16fe8@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



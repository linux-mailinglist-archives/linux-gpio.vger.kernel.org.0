Return-Path: <linux-gpio+bounces-19449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E980AA0799
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 11:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914CD1A807D7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 09:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ED02BD582;
	Tue, 29 Apr 2025 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vckq1zKv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53468227EAE;
	Tue, 29 Apr 2025 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919874; cv=none; b=bDBcFc5n7QDTxA69Aglu0mX+QAuas1e9KhH2TI/H9Oa735I854rC7vPapgqOrxcSQquCLjxMcEMZlPbFxm9du/+bdD5d3UTIn1EjWyID5+5fST/wQzQlWKyU50DpsQJ79v2nPAfQVYShdj3FoKR/3BnOTSv8WlzQVNCxn9A0YCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919874; c=relaxed/simple;
	bh=cMjWeWLk0YlayJX3cFhaPz5HshuNh9HtB4xyHn/IFAI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dKouML4v+O4QOneQ5A/k49LPkbqCH5xLIBs3/aALDtxwBOAkhZXIjRGL1nPuiNcNp47u/GqP8W6aWa7Dy3oMSogP8iWIueTdQGOiT/ybVLxjLrNe0bTimtfiUHFO6L+WnsL3ki4EqHMuGaLB2FpNB9sTPVRIkRI5Wp+1CtoLCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vckq1zKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD015C4CEE3;
	Tue, 29 Apr 2025 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745919874;
	bh=cMjWeWLk0YlayJX3cFhaPz5HshuNh9HtB4xyHn/IFAI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Vckq1zKv322HHH4JfTatFfYo4pM1G6NJgElBmnK5a0eFOgNDRTJm16U8F1RinAu5b
	 U60p7nKb+4u4l/p+fOHFIDE9pKAtuZaajM8dTW221an/xCEjnz5KHad0XIc7tnWB8q
	 QU9n148cmGq2Rv+lmy+VBvXgbFh/7vpXPsO+LSeGSSiZHO0BEgsS0bqFNUyt0C0MIo
	 0PAICJogLU8KwPTIr/t13IVyCE4mXmPjnPR4agGd48bMQS9L1oFza/byOa/hxbGroU
	 gr9myaoZNgYxkYbgA1LPMIBVVDr4H/2vR61LrlfWdpYTdrPkb7Mf4jk9OXDA++NNkh
	 +ZDTUvIUbWTtw==
Date: Tue, 29 Apr 2025 04:44:32 -0500
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
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Lee Jones <lee@kernel.org>, 
 kernel-team@android.com, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
 Will McVicker <willmcvicker@google.com>, Kees Cook <kees@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-1-72d72dc79a1f@linaro.org>
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
 <20250429-max77759-mfd-v8-1-72d72dc79a1f@linaro.org>
Message-Id: <174591987159.3132937.6854042840737177052.robh@kernel.org>
Subject: Re: [PATCH v8 1/6] dt-bindings: gpio: add max77759 binding


On Tue, 29 Apr 2025 09:21:37 +0100, André Draszik wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250429-max77759-mfd-v8-1-72d72dc79a1f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



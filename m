Return-Path: <linux-gpio+bounces-17960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 781DFA70178
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 14:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E721840769
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 13:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B839C265CAD;
	Tue, 25 Mar 2025 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUnUnYE0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6743325949A;
	Tue, 25 Mar 2025 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907309; cv=none; b=ek8s7OEe0TdKraFpD23vbhMVsC2062pHPe32fTGojoXS3BzRGbJKEhUKjOeIaRXLpCZEqT5VTUE/aCzfTWNlOyvqJAPTgynZuqDGPD+oSV4Hw/reusjdDLvaQVEQd0uS3XEwjNx6QqNCzNuLkBhK7W6M6VHSc1ZB+eIRQU+ARHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907309; c=relaxed/simple;
	bh=ckzAE8HF0ZWj4AwxiTL55C67VRklHv8GEBJ1a65+i08=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qTbzQlu8krhvQcPWIvHH1TpmoL/jVRPY3df1rSkSzH2aFsd3IEh/HLqyXmB9SXOnkAPiw7g+Uu/QalwpIZoXgpMftN/t2/5tkZnLLzolk7SIsfjvZZw3PYgfIaDN9IsJwRi5Fiw7p+9lel1H1CzB+pphw1QSc4k11FhW+ZEN9+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUnUnYE0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4914C4CEE9;
	Tue, 25 Mar 2025 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742907308;
	bh=ckzAE8HF0ZWj4AwxiTL55C67VRklHv8GEBJ1a65+i08=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YUnUnYE0RhBK5Mu+AjpF6eKDDaJ1g4syNkA6COLKkt2ADNEGcpvmXd7ySB5t1R1sN
	 maP3AB2QucK+3iRnUQejjs3hnwJ24lUitJdN12DHlLFet8BO+DCdjWW6qiethDe0Dd
	 0wVeP+XZ6XQgt4JbylIV/Kw4fPpKznSkAPSsYopk66NfjTFzwlAw0SFHtGpKMfxKMK
	 ld7t0NnM0ggqgVZnysdgY5bsxUi326TvlLQjgHXyBbnLLtsQQ2bS0EZsrNrHQmGJvR
	 1l29MBk3uAJzGtChOs8Hyg1zdAhFLqB+ySX11z0pG4xHMgHrwhMdipYv/bur3TEprN
	 BaU37JYllKICg==
Date: Tue, 25 Mar 2025 07:55:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel-team@android.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-gpio@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
 Will McVicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v6-1-c0870ca662ba@linaro.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
 <20250325-max77759-mfd-v6-1-c0870ca662ba@linaro.org>
Message-Id: <174290730586.1654929.1967433750081044561.robh@kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: gpio: add max77759 binding


On Tue, 25 Mar 2025 08:27:02 +0000, André Draszik wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250325-max77759-mfd-v6-1-c0870ca662ba@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



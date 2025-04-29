Return-Path: <linux-gpio+bounces-19450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D19AA079C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 11:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E6E3A87BD
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 09:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC542BE0FC;
	Tue, 29 Apr 2025 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqq0LuxO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477D2BE0E1;
	Tue, 29 Apr 2025 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919876; cv=none; b=nC33pclWjGj7OAvuMgvi5X1YA9b01RaTlhsl1jfF0/e1iIlUEs7kggP6vgSS9NeXjnHjpqREzSc0kuvpAzKwcPgNk2hs6MCUhmdI6HZTdSKfsv+6MK7Tveiz6qa1hR2afKooHNJ+AfB/N6C3YPNxM1jYqaI++w0veWNliZI7jzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919876; c=relaxed/simple;
	bh=tjyIOBp2pVvC/RTZRsqbz2Va8h4MtD0qw3IcJi/tjuw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jKDEuCFWu+Y2OhIYX8N9wNmasG29odIOrNZDT2u6tmc4QlUccQX46FSQA+qLgqIQf26fLT6CEzvVAt6TwfhupH7SmLBREbTFNDlzzc5/c/MAYU3GwZkd8yRcEka153Ieuxhpm2w2pTtk+AxkqiWuRxizxeuNg/rpr671xwqETFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqq0LuxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDD6C4CEE3;
	Tue, 29 Apr 2025 09:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745919875;
	bh=tjyIOBp2pVvC/RTZRsqbz2Va8h4MtD0qw3IcJi/tjuw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qqq0LuxOtnslY2NsfByYMNGgwEYpTe4O1FH0Z7jRLLw/83sBZQXvK2AtBce4Rp4Vh
	 RRrtZvgAm0KTtAM0dRR8FFZgHbOD74cY1fwp0+m1BStKwH9OMAJ1tbqqIR7WGEvUdy
	 Huyn7q3PO4Mv0wgzElunEnlSH92XNipiFYAiNmwm+IgYpOMXVtNpPKws8k1uLWotFd
	 bLzen+59z9PDBxxLRsVdAJi0M12GVCctM+AfbOEhsog6AmtYp83tU9BbOND/6NJ39Z
	 SmgGYl/arNHXgMI/+FwQQhyjYWUUy6Pc/LQYLIt0QdAnK+H5mCgCkdkTfMANoEpT74
	 1X0lz/It9jpaA==
Date: Tue, 29 Apr 2025 04:44:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Will McVicker <willmcvicker@google.com>, linux-hardening@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-2-72d72dc79a1f@linaro.org>
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
 <20250429-max77759-mfd-v8-2-72d72dc79a1f@linaro.org>
Message-Id: <174591987220.3132987.2369994359468543666.robh@kernel.org>
Subject: Re: [PATCH v8 2/6] dt-bindings: nvmem: add max77759 binding


On Tue, 29 Apr 2025 09:21:38 +0100, André Draszik wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250429-max77759-mfd-v8-2-72d72dc79a1f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



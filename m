Return-Path: <linux-gpio+bounces-19427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240FA9F54B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 18:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDE657A2A33
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 16:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2927927CB04;
	Mon, 28 Apr 2025 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ8tIJEe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432027C84B;
	Mon, 28 Apr 2025 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856762; cv=none; b=GCJ49cn8cm6EgH08/Sxb3W31dqj7KVFJ8X5kTen88IA+KpbknYoEhDJj5oNcRyN4eVugLQgEEzShG65oUgRYOdg8iDO6GUA4DsjP9E1kRsi6gTVL8snJemOFZacbnIDB3j4MfUzAIbGCx3dEuTAakbUfSz45G9Hoz+pjSZB52hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856762; c=relaxed/simple;
	bh=yiCRaee8FX2LDAbX+fus9qyRk0pMCdRufq5L3SK61KU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=S4lw4FTz0R57m4fRVcfMeujkmJM38XciQGRPQFDxXUeC8RgeFysjZ4DCHTcb6ggEwYaxMtjfPar4P5P83HC05cK/Wl0vHLkq2uhSWfg01eyWTVZnHAIgjtkvNwsFo0mzEjm/ouNlSawKpLrCuc4tggCpWUTSPvMQc3lNwuxqj2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ8tIJEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6B0C4CEED;
	Mon, 28 Apr 2025 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745856762;
	bh=yiCRaee8FX2LDAbX+fus9qyRk0pMCdRufq5L3SK61KU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GJ8tIJEeTIKkIGmKncWrEzAWvWUeOcsGCBA+MF2e8HNhncc2aU8TOSZM/TqPJxxGC
	 C4uV4cSR+9azvNNR1Qa7u+OQvzNigM+FnofUOtGJle+ajSgvZ2Mp/MPwLTfNEELyrX
	 itNhfUesGTQS2AKFfHgPdmDXc5fnkjXPmdE7hwfbAbeRPYwt7kiaQqnlE+QDoDfXaj
	 HvH8/GtG4PcG0eQS8sVAdU7hH3yimKZC/geB0WHNsHuVCX57qpszK6YRqZIl9yxQOD
	 qdwowLRqyl5TX1QxCLpzthyfWuOOEhLzDgCeGfDzK5HE2WRrpPPDb2BdGHOZwFEVN/
	 MCv/hgcS5m0fg==
Date: Mon, 28 Apr 2025 11:12:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kees Cook <kees@kernel.org>, kernel-team@android.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Lee Jones <lee@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-2-edfe40c16fe8@linaro.org>
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
 <20250428-max77759-mfd-v7-2-edfe40c16fe8@linaro.org>
Message-Id: <174585675830.1413131.4645964380167733182.robh@kernel.org>
Subject: Re: [PATCH v7 2/6] dt-bindings: nvmem: add max77759 binding


On Mon, 28 Apr 2025 12:36:05 +0100, André Draszik wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250428-max77759-mfd-v7-2-edfe40c16fe8@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



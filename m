Return-Path: <linux-gpio+bounces-19502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF94AA493B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 12:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21D33B5044
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 10:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE53B248F7F;
	Wed, 30 Apr 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RILbBchy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69897248F44;
	Wed, 30 Apr 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010253; cv=none; b=pMqLkiEnf3ViwVAboSK7wN5WTaKFjrXpmRDfX3MCajfebBl0xJnzw1LtFJAh1jEs8c/gXLuFBEpdLSSaZSi8nZOTTgT9D7u2DutB9LnUsjVWUtXjHlmi+wINpMxro5GhGB5oj3gqBOvSnByyJfjUB9sq5BOZCsnlxhRPEIXkh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010253; c=relaxed/simple;
	bh=6iWYXwGYWrjJDe+xaBj14luG52vIwhKIf5dDzGKkTT8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Efhy2lXjwySb/1p/+xovuHlATIafYBUixBqd4PWE1IQT7ywE8e9BdHQgh2Ch1WImlOm54C1u1ozPbVLlzu43Dq51xfzntE3NxWv3XyP+5Q8KM5CqT541Ho5pd5iFH+yh5LYMCP/wfgiRHatiXfKQ6K0ShUiJkQWOYT1VydjlP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RILbBchy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42F2C4CEE9;
	Wed, 30 Apr 2025 10:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746010252;
	bh=6iWYXwGYWrjJDe+xaBj14luG52vIwhKIf5dDzGKkTT8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RILbBchyucKQH3pNbP37uAZc2S6eK/dQuR53EV+qHgbnHCiHJlxNwOaPNkhboGFcm
	 onWUqhy6Z0WlIndV4FQQWxxsMgcQaVio14hgf9q0ll/4r9pVZaPm6TyAs5YmD2zwjN
	 IyCYPwvTdT8n4SqmAG/utya5bxTyXTBLuvigsbVO4X9UcPq7pGD59oRuN39o1/G8S5
	 pdfcNDXAQEr8h55dBDucox5T3xzDOiY0jhu+FOVhgt2Fu2lcJDlwWQH+/XF/e9iaCc
	 El2FzfX5tdntjJ4aCs/QKZR6GVdUjFX4c3THzahq6OLEDhvjlFv+M4QEy4uJie4koi
	 tKLNXRPMyjlHQ==
Date: Wed, 30 Apr 2025 05:50:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Will McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, kernel-team@android.com, 
 linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250430-max77759-mfd-v9-2-639763e23598@linaro.org>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
 <20250430-max77759-mfd-v9-2-639763e23598@linaro.org>
Message-Id: <174601024882.2105610.6356593597567790268.robh@kernel.org>
Subject: Re: [PATCH v9 2/6] dt-bindings: nvmem: add max77759 binding


On Wed, 30 Apr 2025 10:03:09 +0100, André Draszik wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250430-max77759-mfd-v9-2-639763e23598@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



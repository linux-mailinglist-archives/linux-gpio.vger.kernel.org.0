Return-Path: <linux-gpio+bounces-19501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9357FAA4936
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 12:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31C301885BE5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E0423A9BF;
	Wed, 30 Apr 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvcXM+1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA384E1C;
	Wed, 30 Apr 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010251; cv=none; b=P6bw0DeDfZy5SR5gzc+xiNsGMu9MC6mue3vGYNuBzlvAGgdM3Tnojgl/EK9onvd01+5/b9qu1ZhmaHTL4xHnulNHAOikcKxk5GeYuXufpMdMihGM3KCplqvNcYjyypWcq0H1Vc+WMKDIWbCIIGB3rP7R6qSZgwLa1M+e/wLFdWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010251; c=relaxed/simple;
	bh=INKJ+Nfbqs/vSc3MazRag5DIAAj/BLo7J5OVwkkp9xA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iO59xJjG0kxdBqIDwDEt7meZJsJi0AXCwv4hP02pQb9nCj5Ect4Yau4JsM5GQ8LDejeXjgjT7wx4ICHwJhUR02/vNip4bTt3q4NwjG2C52Q4I9sUHvmtykhq3pKFbRiRyu6X7JXYYTs0e+x0EVNNbAppTQg8L3JnevIj/0Y8olI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvcXM+1U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D10C4CEE9;
	Wed, 30 Apr 2025 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746010251;
	bh=INKJ+Nfbqs/vSc3MazRag5DIAAj/BLo7J5OVwkkp9xA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bvcXM+1U9ot9l0fZn5JRkuvDohP12W2gCuCPpQ2S6Xpbl8i+NRN3/QElnd9g9vi6D
	 XfULt8Lw1uat44LZXzes4iLK+zUX9Z6oAqREr8NIjaSTtgRZuvY2OXt5bxJlb01Buv
	 YVqISMWUaFiTLG8edvZPNm9PZT4UKOijydJTYb7SuHTNLk45EOPnj2B/NisK0QrTQ9
	 ff7FqSZ2jgJLzFjz4dRrXgTjCncH/ZWuqFVsQamC9VTGYXn0+d3dCOsZgkzx9EM4tF
	 q5MQnY52C0SVHm4lsU5xDCS3NaIsQEFSEIF297D+w5IvcUmdEM0DJLRjnvVoSp3Odp
	 vjkahGPEGbBpQ==
Date: Wed, 30 Apr 2025 05:50:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel-team@android.com, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 devicetree@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Will McVicker <willmcvicker@google.com>, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kees Cook <kees@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250430-max77759-mfd-v9-1-639763e23598@linaro.org>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
 <20250430-max77759-mfd-v9-1-639763e23598@linaro.org>
Message-Id: <174601024825.2105562.13844234885733284839.robh@kernel.org>
Subject: Re: [PATCH v9 1/6] dt-bindings: gpio: add max77759 binding


On Wed, 30 Apr 2025 10:03:08 +0100, André Draszik wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250430-max77759-mfd-v9-1-639763e23598@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



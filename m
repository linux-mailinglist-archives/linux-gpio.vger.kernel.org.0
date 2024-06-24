Return-Path: <linux-gpio+bounces-7646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DEA914890
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 13:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DAFFB25CF1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 11:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7298213B5B6;
	Mon, 24 Jun 2024 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHr3nDiD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0CA13B59C;
	Mon, 24 Jun 2024 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228272; cv=none; b=MKOee3T8X/rO430dQhudHKHlPTIRohE8rWEleldSpcHK32VaGACfc+jKU57rCNflLANFwdJVhtr9eu7jkg0DPgdh/R++D9VIvo5CNr6POEWr7s46Vwd0ckaEhyGWq1Wys3tG/8FWdyPYGkP/7ax31M1Bfpv+K8qHgqEDfm/iyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228272; c=relaxed/simple;
	bh=VZYpS8Qko/tJCe+83RS2/zT1QgITqLuMJJGSXP7WR9s=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=c0bEsPvelCK3cn4TNtvSRb1LzxJh05vriKv36QNlLwwOiJFE3GufzjUAuHtYJ1lKHLNRkGMUNHgzjDC5f7ih4aaXPbUHgRg0LvGciK552XJpDZTbIv6r2OF6t0C4CWhbu2RLfueSoxAqr2Px+0NPlFQc9BLVgw8ETfkblOID+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHr3nDiD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3EDC32781;
	Mon, 24 Jun 2024 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719228271;
	bh=VZYpS8Qko/tJCe+83RS2/zT1QgITqLuMJJGSXP7WR9s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=VHr3nDiDsuB9x0eQfc6/Y+A+I0kKeE1dYpqo2+E0ysvuvmodvqQMxf0hERYop/CqR
	 vwbSqzw3N4GWZJt9Ez5Rq3sNOVhcAoTGL9L5lieGUUb0uGIA2qiVZpNcP4rfi4HbhG
	 ezlfm/9sJ/BI0wVJ2yBaphyUtn7JoHePkWcs7pl+d5lk0NywrXGpLFH6nVzPeqrPft
	 p/T+xnU4MKXCvoGbFdrzo5+fyeWJJBprBefTFfyY5Q2WuHHDe0wb9xXlXqJONvyhCL
	 tZ8VtgtDGPRSuexGKUP9o4GyY0ZIXohsPHFCsqctX6NIwjf3XQ5R/a6zXLxmSEMzr3
	 K6U238iCPDKCw==
Date: Mon, 24 Jun 2024 05:24:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Balamanikandan.Gunasundar@microchip.com, conor+dt@kernel.org, 
 alexandre.belloni@bootlin.com, Charan.Pedumuru@microchip.com, 
 devicetree@vger.kernel.org, linus.walleij@linaro.org, 
 Dharma.B@microchip.com, arnd@arndb.de, Varshini.Rajendran@microchip.com, 
 krzk+dt@kernel.org, Balakrishnan.S@microchip.com, 
 durai.manickamkr@microchip.com, nicolas.ferre@microchip.com, 
 claudiu.beznea@tuxon.dev, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Durai.ManickamKR@microchip.com, 
 Nayabbasha.Sayed@microchip.com, Hari.PrasathGE@microchip.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240624100431.191172-6-manikandan.m@microchip.com>
References: <20240624100431.191172-1-manikandan.m@microchip.com>
 <20240624100431.191172-6-manikandan.m@microchip.com>
Message-Id: <171922826737.2823150.8347884175806280966.robh@kernel.org>
Subject: Re: [PATCH 5/5] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl
 to json-schema


On Mon, 24 Jun 2024 15:34:31 +0530, Manikandan Muralidharan wrote:
> Convert Atmel PIO3 pinctrl binding document to DT schema format
> json-schema.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../bindings/pinctrl/atmel,at91-pinctrl.txt   | 178 ----------------
>  .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 194 ++++++++++++++++++
>  2 files changed, 194 insertions(+), 178 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml:145:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.example.dtb: pinctrl@fffff400: gpio@fffff400:compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,at91rm9200-gpio'] is too short
	'atmel,at91rm9200-gpio' is not one of ['atmel,at91sam9x5-gpio', 'microchip,sam9x60-gpio']
	'atmel,at91rm9200-gpio' is not one of ['microchip,sam9x7-gpio']
	from schema $id: http://devicetree.org/schemas/pinctrl/atmel,at91rm9200-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.example.dtb: pinctrl@fffff400: gpio@fffff400: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/atmel,at91rm9200-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.example.dtb: gpio@fffff400: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,at91rm9200-gpio'] is too short
	'atmel,at91rm9200-gpio' is not one of ['atmel,at91sam9x5-gpio', 'microchip,sam9x60-gpio']
	'atmel,at91rm9200-gpio' is not one of ['microchip,sam9x7-gpio']
	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240624100431.191172-6-manikandan.m@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



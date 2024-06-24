Return-Path: <linux-gpio+bounces-7645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B791488D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 13:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB6F1F2416A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 11:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC2613A27E;
	Mon, 24 Jun 2024 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVXxOfgh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F20139D03;
	Mon, 24 Jun 2024 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228270; cv=none; b=GgKWP/PTMKKl9ZVHpZae8sS/a8QIly85r+4nMd5zA/OmmPfSASNWAxlwRSZmh+UcTzeSNLSy8NMyzGhVDOUhEGFvrWKvLeHOpZ/aceUj9tdfOYS1PJwjHwcT81stCA/Q8BkH8xO1R0pi2k6xJsjwObudAFN6cTQnI2jl7kC3kAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228270; c=relaxed/simple;
	bh=z/Tf+iJzR92wuc4wsoe5ft4QIVPOG7fv+ZrPyXjJDP4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=aEkQ6WlQoeomD0AvG41wnntDP8vUoKrA1R8b+nOJ+iWfPDjgA1FnHUms7JRzXjg+Qr4a63PF0lrdbJCb2PhqfWgUGbpS9ORfZt3fnINamZXWUmoRCaL4dWg73xTtxiqkMjfZathY/ixzDajF4yAjU9FDElC5KI7QKIUNRamNwQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVXxOfgh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC403C2BBFC;
	Mon, 24 Jun 2024 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719228270;
	bh=z/Tf+iJzR92wuc4wsoe5ft4QIVPOG7fv+ZrPyXjJDP4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TVXxOfgh/csHYifQM74xBQI3eOlJemd/i8Gcj7MDQi5u2xB8Kqd7M1brrpgZ8Lq6T
	 p4Yk4PN1NZ7+ctm8HbuZLA6KnZhJxE4XdXpiuVra6EuEHPkkdX9WhmsX8cg4c2UHYs
	 rm9DU50Ve1A/so8EqhuabFddtPAeKUeQNp4jLXUG/6IuFtY0+i23yDn3GSuxkJzIcc
	 HWWDTuuysJYiiP3EkJceV19gBOekBbhQ/XhqAPT9oFrkEPqZ+0YoieoAfk59URxANz
	 bVYSQgo0myLSS271DMbrpG/DaHauaa8wjMnM38JkjrO9uhYCYZUT//xxtf6dfaZ6BQ
	 Wcs1UkUCKuTKw==
Date: Mon, 24 Jun 2024 05:24:28 -0600
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
Cc: linux-kernel@vger.kernel.org, Balakrishnan.S@microchip.com, 
 claudiu.beznea@tuxon.dev, durai.manickamkr@microchip.com, 
 conor+dt@kernel.org, Balamanikandan.Gunasundar@microchip.com, 
 Durai.ManickamKR@microchip.com, Hari.PrasathGE@microchip.com, brgl@bgdev.pl, 
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
 arnd@arndb.de, alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org, 
 nicolas.ferre@microchip.com, Varshini.Rajendran@microchip.com, 
 Charan.Pedumuru@microchip.com, Nayabbasha.Sayed@microchip.com, 
 krzk+dt@kernel.org, Dharma.B@microchip.com, devicetree@vger.kernel.org
In-Reply-To: <20240624100431.191172-5-manikandan.m@microchip.com>
References: <20240624100431.191172-1-manikandan.m@microchip.com>
 <20240624100431.191172-5-manikandan.m@microchip.com>
Message-Id: <171922826608.2823095.16579055566825356768.robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema


On Mon, 24 Jun 2024 15:34:30 +0530, Manikandan Muralidharan wrote:
> Convert the Atmel GPIO controller binding document to DT schema format
> using json-schema.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 78 +++++++++++++++++++
>  .../devicetree/bindings/gpio/gpio_atmel.txt   | 31 --------
>  2 files changed, 78 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.example.dtb: gpio@fffff400: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,at91rm9200-gpio'] is too short
	'atmel,at91rm9200-gpio' is not one of ['atmel,at91sam9x5-gpio', 'microchip,sam9x60-gpio']
	'atmel,at91rm9200-gpio' is not one of ['microchip,sam9x7-gpio']
	from schema $id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240624100431.191172-5-manikandan.m@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



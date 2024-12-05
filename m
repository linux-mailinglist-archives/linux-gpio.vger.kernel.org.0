Return-Path: <linux-gpio+bounces-13564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 939209E5ED3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 20:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D363F1885953
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 19:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470D122D4C2;
	Thu,  5 Dec 2024 19:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sy6YFUjQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F270F229B15;
	Thu,  5 Dec 2024 19:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427320; cv=none; b=ccBji+bq277UMFcA6TRzOoRyoH4ELe4eXXtB6gnBENDOZDwzJIs73bomTBzTyfkDCDUrCeDxpRSIuhAXWMDXAcX3HOVmz8ncT8RAM2IOnDCJgBeqTR2BQnpNwS2NUZpX9Jc09Tge6fWGwpcuu4j3wsk5/Y5nyPfoeZpUa4KUSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427320; c=relaxed/simple;
	bh=wvZ+T0O0lFqfZfbfMii8L1xobGNqmrkZWb/SsJ7xQ/8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Gozdl6qCFlVGpmOxT/fY8slTEwq/6sksPOkyLA1mg0+YPoCbAb61tm0ruT91T0mdu11jWhs6EXEh6WGihNz2ip86nusEJxAxtvQT5F4RXIIceYAx3AJkuTjZMe89WkjN/eXw8lYkyFkEZzJjbf04ImHs3UR1BL+tVqBojOV4ALw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sy6YFUjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C421C4CED1;
	Thu,  5 Dec 2024 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733427319;
	bh=wvZ+T0O0lFqfZfbfMii8L1xobGNqmrkZWb/SsJ7xQ/8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sy6YFUjQWEC8T7g3Rr4PN0gi8Osy4IrF+/zps1ivgKMEp/yzfiKYDxsdKbt+21BRr
	 OiEcidJXWpfVrbYwi7NKJFCIcpUhOFhJtqemNvSPICeJdr7CVsRZOd0AltU74I/vLx
	 hbDZr75qXtlXjxdiR4Mrq9QQ3KnRsdTm+jaR/ZH6lD3n6JgTV94c7s8vexNgWjeTuy
	 dvRciU1JIaoPr74XyB53+F8G/Z/v5lXpxVmQ9pdAlkz4V7Ynmi/70QCjL4IY5z8Upa
	 nTsi6v+QJRMNIy0Dy5IO3+fSrsDUr2S+TDjsowFjm60ow59TZeufk8ndA6X+XBD4YW
	 JmDytJsiZdGHw==
Date: Thu, 05 Dec 2024 13:35:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Biju Das <biju.das.au@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 linux-gpio@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
In-Reply-To: <20241205180924.154715-2-biju.das.jz@bp.renesas.com>
References: <20241205180924.154715-1-biju.das.jz@bp.renesas.com>
 <20241205180924.154715-2-biju.das.jz@bp.renesas.com>
Message-Id: <173342731796.360031.5918405535281995613.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC


On Thu, 05 Dec 2024 18:09:17 +0000, Biju Das wrote:
> Add documentation for the pin controller found on the Renesas RZ/G3E
> (R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has more
> pins(P00-PS3). The port number is alpha-numeric compared to the number on
> the other SoCs. So add macros for alpha-numeric to number conversion.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  4 ++-
>  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   | 25 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml:147:13: [error] duplication of key "const" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml:147:13: found duplicate key "const" with value "renesas,r9a09g057-pinctrl" (original value: "renesas,r9a09g047-pinctrl")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dts'
Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml:147:13: found duplicate key "const" with value "renesas,r9a09g057-pinctrl" (original value: "renesas,r9a09g047-pinctrl")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241205180924.154715-2-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



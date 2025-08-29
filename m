Return-Path: <linux-gpio+bounces-25201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDEB3BD9E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 16:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8043BB9D3
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 14:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE073203A0;
	Fri, 29 Aug 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+B/wrzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C95321427;
	Fri, 29 Aug 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756477654; cv=none; b=e5aw5glnyqSZXW//eG0wGM1nO36R/ISKTeFmTSqdBuusB7DjQ+ZG4xMViH9MJ43gXO3JBcDhbrta2LNA7XvCUxoy/r1zsMC2M/fA0yxO4eY+MVjghMCX14oA7VhSF8uNIfuWfMVHjIP5XTuF+mdyiQNr3dQvHa8OHXmZrrDyyHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756477654; c=relaxed/simple;
	bh=hju7Q0uxuSGvDaWgdSvbm9C1hLSofXR34ZTyBAn5zHc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=B+Cu/rIT/jQTWfsfkluNACRxT1O/dsEwMk1oDkKKAYXulBIQhcM4CDZh1w+0+g0bTfmsz6O4jsIzqxQIpkjas8vuwdAUmN1DYaJ8C00xvDQosrCG5MaB1KDTasNsYhZGBoWKUByAXtyU/94u9zOOHjwu5N2788KouB5s19ksgh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+B/wrzq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B4C4CEF0;
	Fri, 29 Aug 2025 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756477654;
	bh=hju7Q0uxuSGvDaWgdSvbm9C1hLSofXR34ZTyBAn5zHc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c+B/wrzqg00WSFdgQYwmioWH/awpZYdcKINrzUkM/vSlrIMkqlSffg8EnKt+oIOLa
	 H6JiI5jirYb/y2E9/+iLGYC/8LdhEaV0SJw0drk/w79xnIJ1F52vHY6lnfUOliwBPM
	 K1fCTWwkwIWkEECKJsGbbagXLefBDhlzAQT8hh34ZXyPmbjQO+OAr1++EB3KXNE/SV
	 KYjx+MjcFnZKDqgUz/j0XHmGN8YKfv3bUNKsV1q+NSyrPI1lEvCKxxrZVfjipj7MYY
	 qjeaLNx9XZCjUd5Jw2VKUuQk2zqhFTjX7YxTe8WUsSfXDECNuaoP/Eg9zok9MxrWdc
	 5E07BZmYt91Wg==
Date: Fri, 29 Aug 2025 09:27:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
 krzk+dt@kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linus.walleij@linaro.org, BMC-SW@aspeedtech.com
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
Message-Id: <175647746429.734506.7183662123343858780.robh@kernel.org>
Subject: Re: [PATCH v1 0/4] Add pinctrl support for AST2700 SoC


On Fri, 29 Aug 2025 15:30:26 +0800, Billy Tsai wrote:
> Document and add the pinctrl driver for AST2700 SoC.
> 
> Billy Tsai (4):
>   dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
>   dt-bindings: pinctrl: aspeed: Add support for AST27xx
>   pinctrl: aspeed: Add AST2700 pinmux support
>   arm64: dts: add AST27xx pinctrl configuration nodes
> 
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    2 +
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  |  135 +
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  452 +++
>  .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++
>  drivers/pinctrl/aspeed/Kconfig                |    8 +
>  drivers/pinctrl/aspeed/Makefile               |    1 +
>  .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
>  .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
>  drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
>  11 files changed, 5071 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/aspeed/' for 20250829073030.2749482-1-billy_tsai@aspeedtech.com:

Traceback (most recent call last):
  File "/home/rob/.local/bin/dt-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/rob/proj/dt-schema/dtschema/dtb_validate.py", line 139, in main
    sg = schema_group(args.preparse)
  File "/home/rob/proj/dt-schema/dtschema/dtb_validate.py", line 24, in __init__
    self.validator = dtschema.DTValidator([schema_file])
                     ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^
  File "/home/rob/proj/dt-schema/dtschema/validator.py", line 376, in __init__
    if '$id' in schema_cache:
       ^^^^^^^^^^^^^^^^^^^^^
TypeError: argument of type 'NoneType' is not iterable







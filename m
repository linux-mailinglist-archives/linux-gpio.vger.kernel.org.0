Return-Path: <linux-gpio+bounces-26567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6AB9D65A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 06:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333A13AACDB
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 04:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAA92E763A;
	Thu, 25 Sep 2025 04:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiJ4X85v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4016E34BA52;
	Thu, 25 Sep 2025 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758775154; cv=none; b=nFR8MdBsgw/AC+jWLI/2/B+V+XFbqGHE1a1SKdGhEv4mXwgsPcQQZgMPKfQfSH7Cst/ct6iK/e3yIBdbm8EvMhpv6FGPnuoMExL/TVNy8lN/NgImqQcHzJppYAOjvKx9N/1XR070ax55rDEAUB7y0XTJHhEkjyCrS4kQp+P0m+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758775154; c=relaxed/simple;
	bh=MskErj/iV6NFqzIAYLsjAGPJeQZV2e3AJUYOlJVD+N0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fNn0pzaYiKCq2y+h/n3lcMiunc6rnF+Oe1gCgBArQ7r+QXYGgeOZBteSLbeqmGXv5RTzQER7Ve6nsYvAlr+1QvWI4/X2yV4YtiHxBkJvgyXhjEtMtGZj9WjYKtSMvqAppt2cspzxaDFQrULp4Q2jPA0O6HDqvnV725HCJoMRVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiJ4X85v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB2AC4CEF0;
	Thu, 25 Sep 2025 04:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758775153;
	bh=MskErj/iV6NFqzIAYLsjAGPJeQZV2e3AJUYOlJVD+N0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NiJ4X85v3DCyQ0fYwmdSwIS38NeAQGNX5z2rlzosOZ+368oFTjmOlhWlYnEgyDZul
	 lhnSIj4vxX0n3K5cZHraJdmmh6hBClfyuJHskgjnCZNWfpNh71Yss6k31sVuFxewRa
	 wCmRAWlhtTcYb6lCWw+QuMXabJl4VWU1RqjNDWEmKUcDgzKkioqHZ4OWPuU3qyFS3r
	 ordbxuqYl7+HdIV4/AOG3uwuepQpvdxuXkAGQCIefXk0//S6DETcDzWHZ9RiH0RJyj
	 D2fpRvbiu87Hkk39DMMfuwdTF3kY2ZgC2SyQ+N4yTytFWzduwEeCGuesjUu8ny/Hsy
	 oCLhx5HzNJTvg==
Date: Wed, 24 Sep 2025 23:39:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
 linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Stephen Boyd <sboyd@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250924223528.2956771-1-robh@kernel.org>
References: <20250924223528.2956771-1-robh@kernel.org>
Message-Id: <175877514894.3628735.640919946657107925.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert
 marvell,armada-3710-(sb|nb)-pinctrl to DT schema


On Wed, 24 Sep 2025 17:35:24 -0500, Rob Herring (Arm) wrote:
> Convert the marvell,armada3710-(sb|nb)-pinctrl binding to DT schema
> format. The binding includes the "marvell,armada-3700-xtal-clock"
> subnode which is simple enough to include here.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/armada3700-xtal-clock.txt  |  29 ---
>  .../marvell,armada-3710-xb-pinctrl.yaml       | 122 +++++++++++
>  .../pinctrl/marvell,armada-37xx-pinctrl.txt   | 195 ------------------
>  3 files changed, 122 insertions(+), 224 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.example.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): gpio: '#interrupt-cells' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-3710-xb-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.example.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): gpio: 'interrupt-controller' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-3710-xb-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.example.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250924223528.2956771-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



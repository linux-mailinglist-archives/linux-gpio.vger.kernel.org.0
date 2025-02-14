Return-Path: <linux-gpio+bounces-15983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEFA3539C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 02:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7233ABF3C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 01:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E707E42A9E;
	Fri, 14 Feb 2025 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiSQLD90"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802E1E502;
	Fri, 14 Feb 2025 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739495990; cv=none; b=iZ80SGXW7/XLzglsN2pntSyLt79VVYbQR/ZGccf5ENrcdg/Gx48IkeRSelZA7tAQ0npR7gZ/I9A+UliauutuJW988aIMoiYBJkHDTAgFtXmE5VpuvM51qBSrjIGW/dmA6HgmjPyLEP+/DdLCcUNwFlzp+zcxckgxx+8YyDY4ScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739495990; c=relaxed/simple;
	bh=sfaPPZ9gP5kgndwhB/ECTbbp0IEu/QeHTgJVNdmuwy0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HrvzebVQyobWBI9CpPxD6XJA7tTQEpgXwa7j7uf5n56YVZKusq8lromVXrMztNbVGvezmYKdFKb730SMeQviLc/tnVhpIFQ7wrQBtMghW1393kYyKxMegfyQoxMGu+/jELVB3GYTIMaJNHxNFH+esjmcoAH1PleeyN1wS65Q39Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiSQLD90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC4EC4CED1;
	Fri, 14 Feb 2025 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739495990;
	bh=sfaPPZ9gP5kgndwhB/ECTbbp0IEu/QeHTgJVNdmuwy0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XiSQLD906pcu2WDC2EPROMCXXWeS6auijB21WC1/0APPV98P5nxNnepP2GpHUYEqM
	 nLtVUv3yqX9KjfSqpqyPfGJcmj4/pvaUMw4yj6uO4rS7pdtXBc2Uau8q14OTtrshAa
	 12MV0IwP/2ZdGYhbdIpHSiIIeQuv24gd2B8FKNklG97FBHf84pIvHRBhvFN6BLH6Ap
	 fsdeaHGb7rDR1qhVMoOwHbqH7IAZ84OtOlqUKaDlC8hDCJuV/64GnZvKhrGtFyPCUO
	 p88qN0HJ69LTcXjyAw9xvVP6lbdTLQGR5ZsHlo1N8bcuoKiuNkBrEBlZsl0x6SFD0E
	 UxlOKeUATTtHQ==
Date: Thu, 13 Feb 2025 19:19:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Samuel Holland <samuel@sholland.org>
To: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-7-andre.przywara@arm.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-7-andre.przywara@arm.com>
Message-Id: <173949598874.895319.6861900349653451498.robh@kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: add compatible for
 Allwinner A523/T527


On Fri, 14 Feb 2025 00:37:32 +0000, Andre Przywara wrote:
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> With this SoC we introduce a new style of binding, where the pinmux values
> for each pin group are stored in the new "allwinner,pinmux" property in
> the DT node, instead of requiring every driver to store a mapping between
> the function names and the required pinmux.
> 
> Add a new binding file, since all the different variants of the old
> binding are making the file a bit unwieldy to handle already, and the new
> property would make the situation worse.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../allwinner,sun55i-a523-pinctrl.yaml        | 177 ++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dts:24:18: fatal error: dt-bindings/clock/sun55i-a523-r-ccu.h: No such file or directory
   24 |         #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250214003734.14944-7-andre.przywara@arm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



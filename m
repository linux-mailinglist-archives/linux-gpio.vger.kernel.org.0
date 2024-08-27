Return-Path: <linux-gpio+bounces-9199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD795FFB4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 05:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28FE41C21A9F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 03:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29A02556F;
	Tue, 27 Aug 2024 03:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2RLt6uN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E21BDDF;
	Tue, 27 Aug 2024 03:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724728955; cv=none; b=iGAb4Wk2CEUQwMnAYsNbMFBtXPsd4vXdgQ8KGE/OfTUqdyv2UTfc8X59PhoijXk5dYS2E9qx2/kBYCFKpzLjGf4kuE8cea10sA91KJ/r0ZSUigkUunDz4pBpmHLyjYhCG3z/tu45k8rZkoDZ1JhQwUXB6KIgdJ3qPCSiY1WXY4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724728955; c=relaxed/simple;
	bh=7Z9U0t0Y1rsapv+eorjIA6eyAZO0pGjgnJ4s7LP9ZQQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=kLKkCMjlAR/3MJa8FTVgEx296gKKKv1yIbW+cJ8lO6WyjJI+Wbv15RIR80YT2krcE5b+oiQ/AzJbikbx928HxEHhCAV1BjMDSfoEMNVr2oHJLuk10mZo7mYpwdgZgVjKnXWe3FE2a+X/uJ+Z4IUyba5yNci+UKYNkQqGu3KlTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2RLt6uN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECAFC8B7A5;
	Tue, 27 Aug 2024 03:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724728955;
	bh=7Z9U0t0Y1rsapv+eorjIA6eyAZO0pGjgnJ4s7LP9ZQQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=u2RLt6uNzRUdVsXuT197qPrty/u1Ey8nRfNl5fAsKhnFE2KvQ7QGoAuVMXk6OMr2q
	 R+4dJAfmUyuM+2+QMV3uZThzXeo6VGP27Bgm+X+rSjhd91JNSN1USp9yj1Z2JfxoqN
	 OKKkgtOiGIyl9AvAlYLvpFntVB5ANhmDa1dbPWas235+EShcKkdTwwONiDyGEVGA9e
	 V1dYbmkOnM6aUo54ORsAJaCTV7lskzyoUgU1M5DjMq36RozSsMCjHHxp+iTzxPxopL
	 5+g5doDRKkKQoMNikFtjtkFGsppBtBS9BSi3DDdDLV942Pp/rRL1JMcQSQdZclepQ8
	 svPpMNK7YqUfw==
Date: Mon, 26 Aug 2024 22:22:33 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Leonard <David.Leonard@digi.com>
Cc: Shawn Guo <shawnguo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Dong Aisheng <aisheng.dong@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
In-Reply-To: <b17a0414-8503-950e-a133-e5a1b1cab8c4@digi.com>
References: <b17a0414-8503-950e-a133-e5a1b1cab8c4@digi.com>
Message-Id: <172472895083.2520688.17158215509587084131.robh@kernel.org>
Subject: Re: [PATCH 6/6] dt-bindings: pinctrl: Add fsl,ls1046a-pinctrl yaml
 file


On Tue, 27 Aug 2024 12:15:08 +1000, David Leonard wrote:
> 
> Add a binding schema and examples for the LS1046A's pinctrl function.
> 
> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---
>   .../bindings/pinctrl/fsl,ls1046a-pinctrl.yaml | 74 +++++++++++++++++++
>   1 file changed, 74 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.example.dtb: pinmux@157040c: pinctrl-i2c3-gpio: {'groups': ['M3', 'N3'], 'function': ['gpio']} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/b17a0414-8503-950e-a133-e5a1b1cab8c4@digi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



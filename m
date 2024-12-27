Return-Path: <linux-gpio+bounces-14304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E048F9FD4D0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 14:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9471716148F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 13:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE281F2C56;
	Fri, 27 Dec 2024 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8P2gXOn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C8628691;
	Fri, 27 Dec 2024 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305408; cv=none; b=PlgxlF9o4OP8UpLV5OKWu82TvWaARadk63jDbvh7AH66pFwPMoOkH2tayM4pzr8PvFk5gLBkCUEEM7Y4kJdPDiNdcqVE4HrXbderVXnpHNetmbSMfcC0kSnbmzKszDKOWW//xHnPUiMAtkhPXBXtb3ZM9WzRr9rWspH6014pIlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305408; c=relaxed/simple;
	bh=Z7yi+afmx/uhCK7HF/9WlkjMbcxfvg7Jvqse7KgInuc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=vGX/PUG5rv4Ls6tD2Sgou/Q0YnaazLM069CHueKT8unne3ljOb/42FVIthfRiKIq4Dq7lhjhzzde2ES7BWVgk5yKrpFhQkK47m1efyr0JqsOOxbyENIUe4m9CeonLSGTE3GaRaDLlydOoMUK0x4dMFgsi6fXb44aEsAAZD7Dm1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8P2gXOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A3BC4CEDD;
	Fri, 27 Dec 2024 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735305407;
	bh=Z7yi+afmx/uhCK7HF/9WlkjMbcxfvg7Jvqse7KgInuc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y8P2gXOnGvjWSR7pppbIn9+uiy3Y9Z0vluLjkcnTQQIn84OguGqJjddlR0L88yLuL
	 6V421rGIxpejqKE1L75webWki/DzFlCQVYLG2EEYZUu5aMg7m/bqDDZBCa+9e0gYRc
	 GQvakfM4lr1cf5OTDgZLfuizLhngqWC04+vFgSChXzU7C2wkSRI+1Y6TOZu5bddOva
	 HpnmhmiemPafHX9z1Btzexlk1nP9OWD4z8Am666h9i+Xn7O6XfbI8llWno+XkcbsLg
	 ufOCrrp0ZZ6Vo/+/3GmhHKoAhS02PuJ3f8CVCDc+tmhHOxbt6Qx7e2+DPzz9eMQkOs
	 OKmBdYqFoXs3w==
Date: Fri, 27 Dec 2024 07:16:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, Joerg Roedel <joro@8bytes.org>, 
 linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 iommu@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 linux-clk@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com>
Message-Id: <173530540581.3097883.7476966654699325435.robh@kernel.org>
Subject: Re: [PATCH 03/22] dt-bindings: clock: sun8i de2 clock: Add PLL com
 clock


On Fri, 27 Dec 2024 16:37:50 +0530, Parthiban Nallathambi wrote:
> Some platforms like A100/A133 also uses pll-com clock as additional
> clock source for the display clock. This is not documents both in
> user manual and DE 2.0 specification. These changes are mainly from
> vendor BSP.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.example.dtb: clock@1000000: clocks: [[4294967295, 48], [4294967295, 101]] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.example.dtb: clock@1000000: clock-names: ['bus', 'mod'] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: clock@0: clocks: [[4294967295, 52], [4294967295, 99]] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: clock@0: clock-names: ['bus', 'mod'] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



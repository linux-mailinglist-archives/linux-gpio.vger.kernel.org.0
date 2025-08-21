Return-Path: <linux-gpio+bounces-24708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CDB2EE95
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9D1B7AE131
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 06:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DD92E9EBB;
	Thu, 21 Aug 2025 06:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqcqPhjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FA62E9737;
	Thu, 21 Aug 2025 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758866; cv=none; b=Yqx95v6oBKzIEKIo0P5wxQkEljTD4g2WQQGquBBUd8sm9TVl0T34PWKMKVspS81PCNGLdAZ1iW4X0PW70+yOTWzqfgWnGJLCV8aQQhfigiJ+N3pgToFoMpj6IeG2HbAt0QiXg41oYhIxEZOIDS/hlUoT38kkCq7dyTcZWGgRy4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758866; c=relaxed/simple;
	bh=EgAT92RP54AVFDysaOd0tnqQ0Olfa0hsk+q5u3ZXcIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwSIAsrVX9mQajR+iR+TjPgUohSn4df4MUp3tSINuVGpP/NO3Hiy3xsJZf4xZ33CsDAjjBQ2/FdIR/OJYAWmJx1vXJcMwlDhickFdWwlR4q4XcqB1VXvGVffDkdQRqG4Ua4SZqXwR09i3Gf8SGgg1yoDLxigb/aB2dPs7NeI9NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqcqPhjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A86CC4CEED;
	Thu, 21 Aug 2025 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755758866;
	bh=EgAT92RP54AVFDysaOd0tnqQ0Olfa0hsk+q5u3ZXcIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqcqPhjBCH3w3+IQwS0SA20txlfmzkg6a/TxfrTGgl/ynO4VpKzEFt7sQXN7d/3ON
	 m7322CvkaqBwGtYP/p+8/1apRnMXxAnfGiwjmsxLYmhEFREU8sXYpJa5Fiz5venMd2
	 qh7xz0Sfth3pqIEvb3tIsCjdiER9Ok9oh9lbAOFs888RcZzz78ZX91fliLIdCk/gkX
	 hY/JA809J+Qz1PHKvdtx6B5bJrfzy5KKyK0s6Nq2nSW1MnKz2cCa6IeL4Qe+pHUkUT
	 fKQYfgXQ0jKDIH1tNyJM40B6JAZui3GS7k6S5tDV621OZMIpvyCqCHWsUJ9+c2M4o+
	 zjvGNfCxO9YYw==
Date: Thu, 21 Aug 2025 08:47:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 02/14] media: dt-bindings: Convert MediaTek mt8173-vpu
 bindings to YAML
Message-ID: <20250821-piquant-rapid-bear-8cedc0@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-3-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-3-ariel.dalessandro@collabora.com>

On Wed, Aug 20, 2025 at 02:12:50PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 Video Processor
> Unit to a YAML schema.

DT schema, not YAML. Don't say YAML at all, neither here nor in subject.

Also looks not wrapped...

> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-vpu.yaml   | 76 +++++++++++++++++++
>  .../bindings/media/mediatek-vpu.txt           | 31 --------
>  2 files changed, 76 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
> new file mode 100644
> index 0000000000000..44f5d7cc44042
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8173 Video Processor Unit
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Video Processor Unit is a HW video controller. It controls HW Codec including
> +  H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  However don't wrap blindly (see Kernel coding style).

> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8173-vpu
> +
> +  reg:
> +    minItems: 2

No, from where do you get such syntax?

> +
> +  reg-names:
> +    items:
> +      - const: tcm
> +      - const: cfg_reg
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: main
> +
> +  memory-region:
> +    description:
> +      phandle to a node describing reserved memory used by VPU
> +      (see bindings/reserved-memory/reserved-memory.txt)

Drop, redundant description.

Best regards,
Krzysztof



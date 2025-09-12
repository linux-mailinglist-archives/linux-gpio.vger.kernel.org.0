Return-Path: <linux-gpio+bounces-25991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFECB5426B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68FFA065B6
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 06:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5173A27C854;
	Fri, 12 Sep 2025 06:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJFK7rGz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA84846F;
	Fri, 12 Sep 2025 06:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657203; cv=none; b=W8v5OPYq6FBfSW01OMJDfRrEfAlJlQ34K9Yp3OJo+OBdwVsVI2mnkDbzVPJUbwl4BAU675MOT5qhYTlfKE1w0LgwWdFxLge5fTgBqSYZlEy64MlwLsMyyXzRccLaF0r2zYkccKWRUmIIc5tXPwZEwyPgNy+yovWXURqcQywv+Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657203; c=relaxed/simple;
	bh=nF4lItlwYcOfTnssRbtSp09OmwNC56e9ezNLiwIkcKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxb7JaAQrci9HEsthWWGFgHnNP/GfBGwEquiTeCymwgFUhjHW/r2BvKaa9OqEofh6A9iciC+dW2C3aQ6QZ3ZfcRG2PG1eRZP6dm6ZdScAQR0xjoezyyain7Q3rk3xdtTTLeGGOjuMBXVihWpxKblY6BCwH902YNvTB8+hCylf4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJFK7rGz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2BBC4CEF4;
	Fri, 12 Sep 2025 06:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757657202;
	bh=nF4lItlwYcOfTnssRbtSp09OmwNC56e9ezNLiwIkcKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJFK7rGzhfob+IekXtskHBj9H3/tlwfA5r6OsrA5/XqgADcxCkFG+wxRo3MQJ6Hj+
	 e/nziZ9YO9zrEXEVmQwbi4lLgZH+TF9EK7O+x4jucMkwIMQWkaCZ8HpJy4f2jGu+dx
	 GS7rYRGpg1nUATgMZlpUSlxYRolA2Gy41lBuh64hjod/AW9zpbR5J+RHwbCpLg3UOi
	 6osILbswgGibrPTlCzKfqtVQlaQkt2/YHx8TWlkhdpizWmi89w9OMb3VSD4DxrVVZK
	 ptWCx0Yw3lHjI8ztpwlRCRfDvNiunmUZCKtdQrmz0KV+KNxpim8XEq3dgfzQ8jSwrM
	 1klI6eVNRA0gA==
Date: Fri, 12 Sep 2025 08:06:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, heiko@sntech.de, 
	houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, 
	kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, maarten.lankhorst@linux.intel.com, 
	marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
Message-ID: <20250912-alluring-turaco-of-conversion-dca193@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-2-ariel.dalessandro@collabora.com>

On Thu, Sep 11, 2025 at 12:09:50PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  95 ----------
>  2 files changed, 169 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> new file mode 100644
> index 0000000000000..8ca33a733c478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8173 Media Data Path
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Media Data Path is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8173-mdp-rdma
> +          - mediatek,mt8173-mdp-rsz
> +          - mediatek,mt8173-mdp-wdma
> +          - mediatek,mt8173-mdp-wrot

Why there is no mediatek,mt8173-mdp here? What does this compatible
represent?

> +      - items:
> +          - const: mediatek,mt8173-mdp-rdma

Still suspicious. Device cannot be simulatanously: compatible and not
compatible. This is not a well known cat that has superposition of two
states, whenenver you look the other way.

Maybe the old binding was incorrect, maybe the in-tree DTS is incorrect.
Whichever the reason, this must be investigated and documented, because
by standard rules this is wrong. Each wrong code needs very clear
explanations (and "someone did it" is not a good enough explanation).

> +          - const: mediatek,mt8173-mdp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  mediatek,vpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
> +      image processing.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp-rdma
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Mutex clock
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +    then:
> +      required:
> +        - iommus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp
> +    then:
> +      required:
> +        - mediatek,vpu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mdp_rdma0: rdma@14001000 {
> +            compatible = "mediatek,mt8173-mdp-rdma",
> +                         "mediatek,mt8173-mdp";
> +            reg = <0 0x14001000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +            mediatek,vpu = <&vpu>;
> +        };
> +
> +        mdp_rdma1: rdma@14002000 {
> +            compatible = "mediatek,mt8173-mdp-rdma";
> +            reg = <0 0x14002000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
> +        };

My previous comment applies.

Keep one or two examples.

Best regards,
Krzysztof



Return-Path: <linux-gpio+bounces-29657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2645CC5A6C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 01:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5172300B922
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 00:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B83B2264B0;
	Wed, 17 Dec 2025 00:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uanko9eP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16F224244;
	Wed, 17 Dec 2025 00:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765933081; cv=none; b=KGV2izLfVKWpZ2hzr0H2todF9vfy+5Infy2zVkohbUhFVkQZCk4L5xORI+aL/dGHehEQ3vN6MJK/546uJff20W4Y1S61YZgEyyHLo1Nsvsjc4fNz67l8xajpntQ4PQLn6/QHfRinhogfSwUiro/+ev3+Q3jKZyxhnf+Q9Q3nnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765933081; c=relaxed/simple;
	bh=ge5M9dXkRVBvU1InmOXnDkbI+F3eJwMWHPZtLxTMIXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaOBvkll2fMOptSEDgH8weklYS1BIXBridx0xl9yDQ6jTannJ0nhihXqtY7y3O0W1pN97ZqGVbPEFWKKLXj76btS8py7zpylulNye04jzhhF3uowHjDrUdbbXznJq3ZEZmWPIrRbeNzAdNQ/hMYKtTwtL2Cq85Z2DaEGagEqgBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uanko9eP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929E2C4CEF1;
	Wed, 17 Dec 2025 00:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765933080;
	bh=ge5M9dXkRVBvU1InmOXnDkbI+F3eJwMWHPZtLxTMIXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uanko9ePj9E4OUmrNqv5kvF3VaANSVX3Cw84s8Gy3MK3u8iC6aSmyD5qenIzayqMj
	 4FTsJbk2C/eFMuSK0JzuE/JwU6S0FztzkScVllh8sLAqpwp0bL8QdqTaBrWIlzSXh3
	 PWHANg36DB9SKco/lWdIfjaMOkkaAcS3rBAtbQP2j06mhtv36rJtjO5yqe8osKtcHy
	 YcX0OQKyo7AKxcfC03LZatIjLRk7kzOiM+Hf2PAo/yDsHDkmJT4bhSYy97BQabQKN5
	 tE3Bm7nohTtlMrOF6EEWuVG/hwgcSWG4E4s1CQ3kVJdQxZB38P/yC84LX0R32RyiEW
	 zAt6EBLCJYltw==
Date: Tue, 16 Dec 2025 18:57:58 -0600
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20251217005758.GA3452672-robh@kernel.org>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212194341.966387-2-shenwei.wang@nxp.com>

On Fri, Dec 12, 2025 at 01:43:37PM -0600, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. 

Which channel does that happen on?

> These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> Each subnode within "rpmsg" represents an individual RPMSG channel. The
> name of each subnode corresponds to the channel name as defined by the
> remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 49 +++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 54 +++++++++++++++++++
>  2 files changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..b3e1a5dbf731
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic GPIO driver over RPMSG

The driver doesn't go over RPMSG. It's a GPIO provider or protocol.

> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol.

Got a reference to where any of this is defined?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    maxItems: 1

I still don't understand how 'reg' is determined. You may have explained 
it previously, but *this* patch needs to make me understand.

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - "#interrupt-cells"
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..fd8e5a61a459 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,33 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Present a group of RPMSG channel devices.
> +
> +    properties:
> +      rpmsg-io-channel:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>  
> @@ -146,5 +173,32 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {

What's the purpose of this node? Is it going to contain things other 
than "rpmsg io channels"?

> +        rpmsg-io-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpioa>;
> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpiob>;
> +          };
> +        };
> +      };
>      };
>  ...
> -- 
> 2.43.0
> 


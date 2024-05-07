Return-Path: <linux-gpio+bounces-6214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437D8BEC5D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 21:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39E2B288A02
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 19:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1631616DEAA;
	Tue,  7 May 2024 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uj6LsvUP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1416D9A0;
	Tue,  7 May 2024 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715109095; cv=none; b=TMUPR4FX89ZY2wQhiz6PifPvUP3niocbv54+xAGx6JhcSt38FTxzOzCpZCp1jZ6MlrawvKiTcfEoXi4S1abqwoN0cDGRnG9S3St+8HM6FqU4kR0iYbFIxujPpJhJEktfyaH1nIuFz2mdWO5MeSNPHN/vk/SkgGL6fXdRmXS741M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715109095; c=relaxed/simple;
	bh=0QWF8zaj0qi8QUphv7YChHYzkRCmy97vi1jsbdB5UkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSvjp0HxZ4tVGv3I+jO1FX7D6OL0nFH9P/9Aq99YA8NV1k9EqsgQAoFmiMpA9SPXTRDDFPYwdyPu36dVzjxqkRIGwwn+xgJYgXzMt8mbTgymTX3fpkUXC2dC/ZL3gx+U6wfKYajKFlVLtb4+VLYe+OgXgweJcDPzrXoJo3I/vZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uj6LsvUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F6EC2BBFC;
	Tue,  7 May 2024 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715109095;
	bh=0QWF8zaj0qi8QUphv7YChHYzkRCmy97vi1jsbdB5UkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uj6LsvUParyf07o2w6RO/eH3ICzXHMjmesw+8sHjWhcxLq3uBKJnDHMd8qAL6Fu7p
	 F4t214j2bobOmaiBd05h7lIEUz3MDEzwXTUVphAqov6KEY94Sq54M2HJKLcua82r1D
	 FGteBlJu3uDLGTiSNtX/8d77s+DzWR1HjabFZH1DcS49usYPdUnZYHJqtVq6RFZmUW
	 qTNuPmJCkHsis4m4er16i0OH5kMxu+Es25aqJQO4nCcI9Y7txdBv/5BHjl427fVBS3
	 g32z5tKj6Lo2WyClZvekeaewOIixgWHlr6ei3CalHj4kijMaFoV47VBtmh8SSPKT/1
	 2SzjSuOfruJtA==
Date: Tue, 7 May 2024 14:11:33 -0500
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: firmware: arm,scmi: Add properties
 for i.MX95 Pinctrl OEM extensions
Message-ID: <20240507191133.GA904879-robh@kernel.org>
References: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
 <20240505-pinctrl-scmi-oem-v3-v4-1-7c99f989e9ba@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505-pinctrl-scmi-oem-v3-v4-1-7c99f989e9ba@nxp.com>

On Sun, May 05, 2024 at 11:47:17AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 Pinctrl is managed by System Control Management Interface(SCMI)
> firmware using OEM extensions. No functions, no groups are provided by
> the firmware. To reuse generic properties, add the binding to enable
> pinmux, slew-rate, bias-pull-up and etc, under a subnode of '-pins'.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml     |  9 ++++--
>  .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  | 37 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 7de2c29606e5..bd4dfd7a85cd 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -262,9 +262,12 @@ properties:
>      patternProperties:
>        '-pins$':
>          type: object
> -        allOf:
> -          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> -          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +        anyOf:
> +          - $ref: /schemas/firmware/nxp,imx95-scmi-pinctrl.yaml
> +          - allOf:
> +              - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +              - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
>          unevaluatedProperties: false
>  
>          description:
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
> new file mode 100644
> index 000000000000..1a694881f193
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX System Control and Management Interface (SCMI) Pinctrl Protocol
> +
> +maintainers:
> +  - Peng Fan <peng.fan@nxp.com>
> +
> +patternProperties:
> +  'grp[0-9a-f]$':
> +    type: object
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pinmux:
> +        description: |
> +          An integer array for representing pinmux configurations of
> +          a device. Each integer has the format, pinid[31:21], mux[20:16],
> +          daisy_value[15:12], daisy_valid[11:11], daisy_id[10:0].

I would format this with one field per line. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +      drive-strength:
> +        enum: [ 0, 1, 3, 7, 15, 31, 63 ]
> +
> +      slew-rate:
> +        enum: [2, 3]
> +
> +      input-schmitt-enable: true
> +      drive-open-drain: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +additionalProperties: true
> 
> -- 
> 2.37.1
> 


Return-Path: <linux-gpio+bounces-17455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9E3A5CEED
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9FEC7A9DC4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF3726461D;
	Tue, 11 Mar 2025 19:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJXIgoUP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201332641E1;
	Tue, 11 Mar 2025 19:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720033; cv=none; b=fIM7v6y0W0ZqZFo6YK94bBp/8jkUY49TH1+Y4omHopKUZu2sGBelVnSylbcV8Iumy/mTpcXnhhN6KUIQXvuxC+JA3e9z0NE/n+mDecEdA2tVZT1VTcMYiYTwHVkKRZK5+sXPaojuY8GxJ4AWF6cizuT5X0WlQlFPeKS9zfehkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720033; c=relaxed/simple;
	bh=vfXaMojQxXrOenb7DcUF+z+2Fku7SdE8waa4ob1RDZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7eyJ72sU5d5l9n32VHT8rcp4JzF25LVJZ8h9/pmQkHDSwxAUC+/W2JMPykBG/iQwW/xn6TethmX/lsBDqc/jGAhHdJ2LIEi0P/0VS97rpua7oMnhu834JO5i2maPsimxI87vbPXwsKrhjNroGtrZdog4Zhd0t5NEJt98qXxjFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJXIgoUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E155C4CEE9;
	Tue, 11 Mar 2025 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741720032;
	bh=vfXaMojQxXrOenb7DcUF+z+2Fku7SdE8waa4ob1RDZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJXIgoUPIQRAUHjcFUTDyIfqwQ2eFlwFY7LHUDwA5KlmDGsolin4xNlDw2FKmB+r0
	 z5FTMUZKCOi+wXYZKb322bhqgH1aJFMmJk28VCdJ1y86Cd1H3nWGmJLeOgyzcRTXGE
	 dwpJwnx26Eer6M+lqIxvqL/PAqQGxKGAa32IHHtDdxDmoYHp+nl3iEry727gNG7rmA
	 oHh06bYfYuIU0E2gxniR7NJr+nxluemY9byk/h2tIOtoNYz3OIl7jTXpTbXvNMFgd0
	 tdeMsjKdHzeKJf7MRD5bqjKWOIy4xxeRNtdlHfZdj2ClIJNig2AySCQ824bLiYwbu/
	 uI95kmEn6Pp7w==
Date: Tue, 11 Mar 2025 14:07:11 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 11/16] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Message-ID: <20250311190711.GA3985355-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-12-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-12-demonsingur@gmail.com>

On Sun, Mar 09, 2025 at 10:48:03AM +0200, Cosmin Tanislav wrote:
> The MAX9296A deserializer converts single or dual serial inputs to MIPI
> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
> in the forward direction and 187.5Mbps in the reverse direction.
> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
> GMSL1 links. The serial inputs operate independently, allowing videos
> with different timings and resolutions to be received on each input.
> 
> MAX96716A supports both tunnel and pixel mode.
> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max9296a.yaml    | 281 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 287 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 000000000000..97731549d161
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> @@ -0,0 +1,281 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Collabora Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/maxim,max9296a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX9296A GMSL2 to CSI-2 Deserializer
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
> +
> +description:

Needs '>' token as you have paragraphs.

> +  The MAX9296A deserializer converts single or dual serial inputs to
> +  MIPI CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps
> +  or 6Gbps in the forward direction and 187.5Mbps in the reverse
> +  direction. In GMSL1 mode, each serial link can be paired with 3.12Gbps
> +  or 1.5Gbps GMSL1 serializers or operate up to 4.5Gbps with GMSL2
> +  serializers with GMSL1 backward compatibility. The MAX9296A supports
> +  mixed GMSL2 and GMSL1 links. The serial inputs operate independently,
> +  allowing videos with different timings and resolutions to be received
> +  on each input.
> +
> +  MAX96716A supports both tunnel and pixel mode.
> +  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max9296a
> +      - maxim,max96716a
> +      - maxim,max96792a
> +
> +  reg:
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Specifier for the GPIO connected to the PWDNB pin.
> +
> +  port0-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 0
> +
> +  port1-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 1
> +
> +  i2c-mux:
> +    $ref: /schemas/i2c/i2c-mux.yaml#
> +    unevaluatedProperties: false
> +    patternProperties:
> +      '^i2c@[0-1]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^i2c@[0-1]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@[0-1]$':
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description: GMSL Input
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

What properties are you using from here?

None actually because /schemas/graph.yaml#/properties/port won't allow 
any.


> +            unevaluatedProperties: false
> +            description: Endpoint for GMSL2-Link port.
> +
> +      '^port@[2-3]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              lane-polarities:
> +                minItems: 1
> +                maxItems: 5
> +
> +              link-frequencies:
> +                maxItems: 1
> +
> +            required:
> +              - data-lanes
> +
> +    anyOf:
> +      - required:
> +          - port@2
> +      - required:
> +          - port@3
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max9296a
> +              - maxim,max96792a
> +    then:
> +      not:
> +        required: [i2c-mux]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max96716a
> +    then:
> +      not:
> +        required: [i2c-atr]
> +
> +dependentRequired:
> +  i2c-atr: [i2c-alias-pool]
> +  i2c-alias-pool: [i2c-atr]
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        deserializer@28 {
> +            compatible = "maxim,max9296a";
> +            reg = <0x28>;
> +            powerdown-gpios = <&main_gpio0 37 GPIO_ACTIVE_LOW>;
> +
> +            i2c-alias-pool = <0x40 0x41>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    des_gmsl_in_0: endpoint {
> +                        remote-endpoint = <&ser_0_gmsl_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    des_gmsl_in_1: endpoint {
> +                        remote-endpoint = <&ser_1_gmsl_out>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    des_csi_out: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        link-frequencies = /bits/ 64 <400000000>;
> +                        remote-endpoint = <&csi_in>;
> +                    };
> +                };
> +            };
> +
> +            i2c-atr {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                i2c@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
> +
> +                    serializer@40 {
> +                        compatible = "maxim,max96717";
> +                        reg = <0x40>;
> +                        gpio-controller;
> +                        #gpio-cells = <2>;
> +                        #clock-cells = <0>;
> +
> +                        ports {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            port@0 {
> +                                reg = <0>;
> +                                ser_0_csi_in: endpoint {
> +                                    data-lanes = <1 2>;
> +                                    remote-endpoint = <&sensor_0_out>;
> +                                };
> +                            };
> +
> +                            port@1 {
> +                                reg = <1>;
> +                                ser_0_gmsl_out: endpoint {
> +                                    remote-endpoint = <&des_gmsl_in_0>;
> +                                };
> +                            };
> +                        };
> +                    };
> +                };
> +
> +                i2c@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +
> +                    serializer@40 {
> +                        compatible = "maxim,max96717";
> +                        reg = <0x40>;
> +                        gpio-controller;
> +                        #gpio-cells = <2>;
> +                        #clock-cells = <0>;
> +
> +                        ports {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            port@0 {
> +                                reg = <0>;
> +                                ser_1_csi_in: endpoint {
> +                                    data-lanes = <1 2>;
> +                                    remote-endpoint = <&sensor_1_out>;
> +                                };
> +                            };
> +
> +                            port@1 {
> +                                reg = <1>;
> +                                ser_1_gmsl_out: endpoint {
> +                                    remote-endpoint = <&des_gmsl_in_1>;
> +                                };
> +                            };
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index abf3afc95fc9..c1e01668e81a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14220,6 +14220,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
>  F:	drivers/iio/proximity/mb1232.c
>  
> +MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> +
>  MAXIM MAX11205 DRIVER
>  M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
>  L:	linux-iio@vger.kernel.org
> -- 
> 2.48.1
> 


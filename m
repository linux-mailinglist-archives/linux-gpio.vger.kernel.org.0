Return-Path: <linux-gpio+bounces-8467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE03941A6C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 18:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8BA8282132
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 16:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A458318801A;
	Tue, 30 Jul 2024 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKI6qJkX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56540154C18;
	Tue, 30 Jul 2024 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722357814; cv=none; b=Wb69Fti2GZLZEA+QOGohWvmn1aMMRPvAVrpvDDnFK/sySi2jjHeDIDNIg0bHD+KDpBwLul4iJI4uephEoVo8La+SIS9lL5+qic7b3ngA72VsFmXoywujQXwqKexKG9gfKTMyGkPDj5g9OJan7+bSJAQGjbFtxWFTJtM98SKB/a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722357814; c=relaxed/simple;
	bh=rM6iSBoLqvdC9i7j/uLVUpFr+05gFmWXkBFCh8kha7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lwpen/MxQVAnsc8YmGm79kqNz2OccPjzxqUUR+juikCf2x9ERnVkI5D6TC/c3AdV+60oTO+r+BCiXvvN3QQqADLeJPBR9qqSn9lTmMGFE93fgSKz4U8reJCRPiEkcjqf1s3w4QwIpxhmRGLvnIM0eyMyn/3iEFSZ7ux2yd6lZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rKI6qJkX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A552AC32782;
	Tue, 30 Jul 2024 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722357813;
	bh=rM6iSBoLqvdC9i7j/uLVUpFr+05gFmWXkBFCh8kha7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKI6qJkX/lXCuCu2TSLnOMaoIDsXR54jK5DEM2wqQHohfBFcM59fY263xIPMMgX0d
	 dvIVbeO/bxqe6CWTqpAY2u0Z7h42JMpWSuHEJCL3Hf3b6YeJgqfzHOA+/AoBWpzm1L
	 S8FV3PKtG07d5q5ETsBWUb4DcDKqxx7kzsMX7hJk7vy2tpaZ1T9/V44Y5lY5T/Qmyp
	 x09v7iuXPIzyCIPkX/5XmIEkpaJ8M2/1dzysGN2hrIYcvlmU1Sq1WMnMb2J+Nofcar
	 EX8z3McX6hbJwuDHjnqtNaVVUZRqUSFpHNcwQPlKdE0vD57u2gNAndJM4WDBoS1FxB
	 3RScm4quK+J+Q==
Date: Tue, 30 Jul 2024 10:43:32 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID: <20240730164332.GA1501290-robh@kernel.org>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953C9FF856D6076FB1F8641BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953C9FF856D6076FB1F8641BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>

On Mon, Jul 29, 2024 at 09:02:27AM +0800, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 535 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> new file mode 100644
> index 000000000000..a94ff6fb785e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/sophgo,cv1800-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 Pin Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-pinctrl
> +      - sophgo,cv1812h-pinctrl
> +      - sophgo,sg2000-pinctrl
> +      - sophgo,sg2002-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pinctrl for system domain
> +      - description: pinctrl for rtc domain
> +
> +  reg-names:
> +    items:
> +      - const: sys
> +      - const: rtc
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    description:
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias, input
> +          enable/disable, input schmitt trigger, slew-rate, drive strength
> +          and bus hold state. In addition, all pins in the same subnode
> +          should have the same power domain. For configuration detail,
> +          refer to https://github.com/sophgo/sophgo-doc/.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              macro.
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength-microamp:
> +            description: typical current when output high level.
> +
> +          input-schmitt-microvolt:
> +            description: typical threshold for schmitt trigger.
> +
> +          power-source:
> +            description: power supplies at X mV.
> +            enum: [ 1800, 3300 ]
> +
> +          slew-rate:
> +            description: slew rate for output buffer (0 is fast, 1 is slow)
> +            enum: [ 0, 1 ]
> +
> +          bias-bus-hold:
> +            type: boolean

Drop 'type'. It already has one defined.

> +
> +        required:
> +          - pinmux
> +          - power-source
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> +
> +    pinctrl@3001000 {
> +        compatible = "sophgo,cv1800b-pinctrl";
> +        reg = <0x03001000 0x1000>,
> +              <0x05027000 0x1000>;
> +        reg-names = "sys", "rtc";
> +
> +        uart0_cfg: uart0-cfg {
> +            uart0-pins {
> +                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +                         <PINMUX(PIN_UART0_RX, 0)>;
> +                bias-pull-up;
> +          			drive-strength-microamp = <10800>;

Mixed spaces and tabs.

With those fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +                input-schmitt-microvolt = <0>;
> +                power-source = <3300>;
> +                slew-rate = <0>;
> +            };
> +        };
> +    };
> +
> +...


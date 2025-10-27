Return-Path: <linux-gpio+bounces-27682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42747C0E1A3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3015407308
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916F2239573;
	Mon, 27 Oct 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBSv5mTm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC91DDC1B;
	Mon, 27 Oct 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571981; cv=none; b=RtIo0TJxUz9JxJ4wqEZeIohgHcSK5kf/Z+E+ZRVFVVz7xyunNeUG4sEnVZnabamIXcTwBU/Frshp3ul17ZDSsU90SYtf8Vfxj58xYQbDj4tFeTKeb5KgxFNOrkZAqIQCcAIYsMCpxbsVXfDuUeXLWrSAeYI7T0vm8u0eSD/f3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571981; c=relaxed/simple;
	bh=P4DbulHAwkzTyBkjJrEUk1RWxytjAEbeIn35F+Fbh8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lazbQGb57YMG5IcJYqckmxRH+z8Ngza5QxgOuz7u1lTaPhkCvhZwT95lQ/wD5zYuFm0373J2R/uvS+12+nYVjlSEAkjggfKQfz8qKI/IIGJ9Q9fikpoLI+890aczS0bfDA1Pq4FUgSMK0XV6bhlQ/9TRPpd2QU4qML0IDu19lY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBSv5mTm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEF8C4CEF1;
	Mon, 27 Oct 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761571980;
	bh=P4DbulHAwkzTyBkjJrEUk1RWxytjAEbeIn35F+Fbh8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBSv5mTmA07fr8PMlqRQYefyLcuv7Ws/eHkezh4VGS3bIvOprYg1JpVqlCkrhsU2J
	 5Sf85zdO/WtyfbudC37SNP/sbeJJrBXpRUxCuN9yvhoCnUBr08DIF6AhpNrlo1BHMR
	 jSm+FfbzAv1vWD0h1e37XCXgzMFdhJFsx4iBerQOn4iAIPMdHTVGrCaN5247cD12V4
	 q+pgpofGNxd3EK4BpkvaTWoNas4L+kO9zx/wXLBGfeHOi70XeI4xs0PKkDVbdesxoT
	 cS7RoAqlZt1PQ3xxHLdGmKlR+WVXBVX1f7qn+kwooTt9pJhhiHXFbFaFOwOhdKWmxV
	 Nihf2o0vZftjw==
Date: Mon, 27 Oct 2025 08:32:58 -0500
From: Rob Herring <robh@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-line-mux controller
Message-ID: <20251027133258.GA112219-robh@kernel.org>
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-2-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026231754.2368904-2-jelonek.jonas@gmail.com>

On Sun, Oct 26, 2025 at 11:17:53PM +0000, Jonas Jelonek wrote:
> Add dt-schema for a gpio-line-mux controller which exposes virtual
> GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.
> 
> The gpio-line-mux controller is a gpio-controller, thus has mostly the
> same semantics. However, it requires a mux-control to be specified upon
> which it will operate.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  .../bindings/gpio/gpio-line-mux.yaml          | 108 ++++++++++++++++++
>  .../devicetree/bindings/mux/gpio-mux.yaml     |  30 +++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> new file mode 100644
> index 000000000000..4c907a35eb4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO line mux
> +
> +maintainers:
> +  - Jonas Jelonek <jelonek.jonas@gmail.com>
> +
> +description:

You need '>' or '|' to preserve formatting here.

> +  A GPIO controller to provide virtual GPIOs for a 1-to-many mapping backed by
> +  a single shared GPIO and a multiplexer. A simple illustrated example is
> +
> +            +----- A
> +    IN/OUT /
> +    <-----o------- B
> +        / |\
> +        | | +----- C
> +        | |  \
> +        | |   +--- D
> +        | |
> +       M1 M0
> +
> +    MUX CONTROL
> +
> +     M1 M0   IN/OUT
> +      0  0   A
> +      0  1   B
> +      1  0   C
> +      1  1   D
> +
> +  This can be used in case a real GPIO is connected to multiple inputs/outputs
> +  and controlled by a multiplexer, and another subsystem/driver does not work
> +  directly with the multiplexer subsystem.
> +
> +properties:
> +  compatible:
> +    const: gpio-line-mux
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-mux-states:
> +    description: Mux states corresponding to the virtual GPIOs.
> +    minItems: 1
> +    items:
> +      type: string
> +
> +  gpio-line-names: true
> +
> +  mux-controls:
> +    maxItems: 1
> +    $ref: /schemas/mux/mux-controller.yaml#
> +    description:
> +      Phandle to the multiplexer to control access to the GPIOs.
> +
> +  ngpios: false
> +
> +  shared-gpio:

'-gpio' is deprecated. Use '-gpios'.

> +    description:
> +      GPIO which is the '1' in 1-to-many and is shared by the virtual GPIOs
> +      and controlled via the mux.
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - gpio-line-mux-states
> +  - mux-controls
> +  - shared-gpio
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/mux/mux.h>
> +
> +    sfp_gpio_mux: gpio-mux {
> +        compatible = "gpio-mux";
> +        mux-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>,
> +                    <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +        #mux-control-cells = <0>;
> +        idle-state = <MUX_IDLE_AS_IS>;
> +    };
> +
> +    sfp1_gpio: sfp-gpio-1 {
> +        compatible = "gpio-line-mux";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        mux-controls = <&sfp_gpio_mux>;
> +        shared-gpio = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +
> +        gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "SFP1_TX_FAULT";
> +        gpio-line-mux-states = <0>, <1>, <3>;
> +    };
> +
> +    sfp1: sfp-p1 {
> +        compatible = "sff,sfp";
> +
> +        los-gpios = <&sfp1_gpio 0 GPIO_ACTIVE_HIGH>;
> +        mod-def0-gpios = <&sfp1_gpio 1 GPIO_ACTIVE_LOW>;
> +        tx-fault-gpios = <&sfp1_gpio 2 GPIO_ACTIVE_HIGH>;
> +    };
> diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
> index ef7e33ec85d4..57eb1e9ef4cf 100644
> --- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
> +++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
> @@ -100,4 +100,34 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    sfp_mux: mux-controller {
> +        compatible = "gpio-mux";
> +        #mux-control-cells = <0>;
> +
> +        mux-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>,
> +                    <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    sfp_gpio: sfp-gpio-1 {
> +        compatible = "gpio-line-mux";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        mux-controls = <&sfp_mux>;
> +        shared-gpio = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +
> +        gpio-line-names = "SFP_LOS", "SFP_MOD_ABS", "SFP_TX_F";
> +        gpio-line-mux-states = <0>, <1>, <2>;
> +    };
> +
> +    sfp0: sfp-p0 {
> +        compatible = "sff,sfp";
> +
> +        los-gpios = <&sfp_gpio 0 GPIO_ACTIVE_HIGH>;
> +        mod-def0-gpios = <&sfp_gpio 1 GPIO_ACTIVE_LOW>;
> +        tx-fault-gpios = <&sfp_gpio 2 GPIO_ACTIVE_HIGH>;

Drop. We don't need the same example twice.

Rob



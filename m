Return-Path: <linux-gpio+bounces-28356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4627C4E00E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 14:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCF318973E4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 12:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C95719067C;
	Tue, 11 Nov 2025 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyO5VqE5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F783AA190;
	Tue, 11 Nov 2025 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762865839; cv=none; b=VJhl10ftvuRKApCdtuMssw7RLkkEx5HT8kqKiXuqGEADbfjywO4gSby4iKZPf2FiwP8mKFC/tsyjWRt2Ck9B5tYzQg+RCT29b5Ovv6lahzHCgvhqSaSVtoECTRfl5/1fqk7p6xptqhO3oOeOfzT6lDTQPykvWbW5Y6e+P+SF6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762865839; c=relaxed/simple;
	bh=MjH9p/+LiZ+r7NEuBOPrqSJjE3YW0uIHvCW2oADt5lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKMI6FoQ8DyQBAJR0tgw2UnYphgGo5dahiC/Dhs4Tnr/VpX7xiF0hVEwLctLKKkJHw+94uhrd5JX2aNWyQIMlCtiNuz29wikbwYvxQXYJZUqmI/RRLp7XW7bz5f5RA9TFty/LuZB6CT+Q/NSYZ4j6dA2jNtv3ZtSJBVofuUi+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyO5VqE5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48115C4CEF7;
	Tue, 11 Nov 2025 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762865838;
	bh=MjH9p/+LiZ+r7NEuBOPrqSJjE3YW0uIHvCW2oADt5lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyO5VqE55DxGU9ycLNHGF0eZ/oY4Rm8O8YckXm94ZVwTfkv0ezSP8fBTsK1tPGp9R
	 TFChE+UjyhNtFTRyHxm/EHpvHeHh4Z9XCgdBX0HuJhH9uiEMxEjDvNBbio0Kgs14X0
	 iuQqZmisDC0Zg2oBpaHKqQnwBDZygj9C2wIZMBhqLlqmYOxCm52hJGJbOXQlgRi/EB
	 FvbyeekYUT3bDEYa9J8YZniSpa3uRvkZibdN7fgyPB3nxzs1fKj5lKY5+TXBPeJsgg
	 sW1ob78VeS6mHGuisfWX4UzemODQBDdrrpPK4gevs1Dn3yt9LBo2fHUZNEwKWdE0fY
	 SWnlH9SvmkBcg==
Date: Tue, 11 Nov 2025 06:57:16 -0600
From: Rob Herring <robh@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: gpio: add gpio-line-mux controller
Message-ID: <20251111125716.GA2560355-robh@kernel.org>
References: <20251111092705.196465-1-jelonek.jonas@gmail.com>
 <20251111092705.196465-2-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111092705.196465-2-jelonek.jonas@gmail.com>

On Tue, Nov 11, 2025 at 09:27:03AM +0000, Jonas Jelonek wrote:
> Add dt-schema for a gpio-line-mux controller which exposes virtual
> GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.
> 
> The gpio-line-mux controller is a gpio-controller, thus has mostly the
> same semantics. However, it requires a mux-control to be specified upon
> which it will operate.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/gpio/gpio-line-mux.yaml          | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> new file mode 100644
> index 000000000000..0228e9915b92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> @@ -0,0 +1,109 @@
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
> +description: |
> +  A GPIO controller to provide virtual GPIOs for a 1-to-many input-only mapping
> +  backed by a single shared GPIO and a multiplexer. A simple illustrated
> +  example is

colon on the end.

> +
> +            +----- A
> +    IN     /
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
> +     M1 M0   IN
> +      0  0   A
> +      0  1   B
> +      1  0   C
> +      1  1   D
> +
> +  This can be used in case a real GPIO is connected to multiple inputs and
> +  controlled by a multiplexer, and another subsystem/driver does not work
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
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  gpio-line-names: true
> +
> +  mux-controls:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type. Drop the ref.

> +    maxItems: 1
> +    description:
> +      Phandle to the multiplexer to control access to the GPIOs.
> +
> +  ngpios: false

No need for this.

> +
> +  muxed-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO which is the '1' in 1-to-many and is shared by the virtual GPIOs
> +      and controlled via the mux.
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - gpio-line-mux-states
> +  - mux-controls
> +  - muxed-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/mux/mux.h>
> +
> +    sfp_gpio_mux: mux-controller-1 {
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
> +        muxed-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +
> +        gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "SFP1_TX_FAULT";
> +        gpio-line-mux-states = <0>, <1>, <3>;

gpio-line-names is defined to have an entry for all lines. So 
gpio-line-mux-states is not necessary. You can just do:

gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "", "SFP1_TX_FAULT";

Rob


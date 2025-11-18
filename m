Return-Path: <linux-gpio+bounces-28702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F5C6BB70
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D269C4E4E42
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 21:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C06E30E0E4;
	Tue, 18 Nov 2025 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjCFYyZL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE21B2F6562
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501345; cv=none; b=LOTfiA5oaK2To7KiYeZRY+nkGuKfhAH037NWtoXgYgP/S7fIlAqONjJHR+/ZT5G5gsk5xWDi5y/VYprsWGhGfiJrY18Bbg9y/fRcyoDxabiIHwbEsOgJDibn1jggySdG8gVAOnJnVSO/ZE4t5wqAN30Te32XSAsehZg4Agw5BwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501345; c=relaxed/simple;
	bh=GNoKisffTpUEcCPwrPPD4dJrLny5D6Exi4zyYRBvzRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPP84ibJEEfbnNwSJPYNf64lKtNW5MCT8Fb8ueAlMxICSKbes0vTlhb68b8UJHM9r6EGFfTOqqo1DkdzJzD2CcGw4Qnpb7g5cGyABtNApw2KHRPrTDc9IAlN52Exzrc7yPtaJnW4BMrrkDWS3O0xLJ4nfv42mAEVgcE7hq5unrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjCFYyZL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0039EC2BCB1
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 21:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763501345;
	bh=GNoKisffTpUEcCPwrPPD4dJrLny5D6Exi4zyYRBvzRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GjCFYyZLd78n/InWtJkCoj2EwLL1e7e0UyscKagUzP8Nkj7jYMHsQk6qnfoDsgjUQ
	 BSUKFInyAaiGlnTw8SQafZNOenJhq5DpL+7V03x3G9oZrIn5GGeZTVD1+AZCHs++rW
	 73Dp3ww+ED+5iq/CU4FijqBIXDixvGkq/IGeDDhEDUJq1L9aIv0O/ym19b5Y7bZOJC
	 MypvCdKJpv9/fSIQEfvuRBwacBfUhgBwDrUa0bobz/w2SKjW+zz+gGX4U6IsBeGVk0
	 brSXeq7PK6rh/cOsyQGF3HX1aNqePhiCGTFT8uW1oHoXpRHr/E0H5sAgUmA/OO1mad
	 gw9a/jFrHmJKw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so9041260a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 13:29:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv5bSpELxKwYaOoa0+DxQOVw3NQ1FDmliQN2VEM/OTVcF5GfY9GEAia3Rk9LcwKwej/y2vTSpvuCUS@vger.kernel.org
X-Gm-Message-State: AOJu0YwwM9MJagbg5hhutNOFZRC+0ppoAJa38q62P5PbWtplGUc+iJiM
	baqQXhQEShKkfbIkfzTLmPGa3SkixLK2SzReKYVOlTdyq9R56oMZTDnrtlsAnRXl4sdQz3NBfQ5
	hsZ8DjJKZmAxNErasICiu8lFYTdQdSQ==
X-Google-Smtp-Source: AGHT+IHtRwgXROKBS+oF/+IGEgIxtcLKJqwbarAqUZ9rrZJTttBSgtKJapVOciXgYSV1BcHH9XU8T5txwdNNAlhp/mQ=
X-Received: by 2002:a17:906:6a24:b0:b73:4006:1877 with SMTP id
 a640c23a62f3a-b7367b6dfd1mr1799281366b.55.1763501342939; Tue, 18 Nov 2025
 13:29:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117215138.4353-1-sander@svanheule.net> <20251117215138.4353-3-sander@svanheule.net>
In-Reply-To: <20251117215138.4353-3-sander@svanheule.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Nov 2025 15:28:51 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Mzj+3d4q+xQLq_GEYzRJA6E+CEJ9M8FQH6kL9eBZhVg@mail.gmail.com>
X-Gm-Features: AWmQ_bnBm7UsULiiueDdmMMcYwviPIb5dLON1efdQxh8_gI21BniIyuDRZhj7D8
Message-ID: <CAL_Jsq+Mzj+3d4q+xQLq_GEYzRJA6E+CEJ9M8FQH6kL9eBZhVg@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] dt-bindings: mfd: Binding for RTL8231
To: Sander Vanheule <sander@svanheule.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 3:52=E2=80=AFPM Sander Vanheule <sander@svanheule.n=
et> wrote:
>
> Add a binding description for the Realtek RTL8231, a GPIO and LED
> expander chip commonly used in ethernet switches based on a Realtek
> switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
> as a plain 36-bit shift register.
>
> This binding only describes the feature set provided by the MDIO/SMI
> configuration, and covers the GPIO, PWM, and pin control properties. The
> LED properties are defined in a separate binding.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> Changes since v6:
> - Relax description formatting
> - Use absolute paths for schema references
> - Add pinctrl properties to led-controller node in example
> ---
>  .../bindings/mfd/realtek,rtl8231.yaml         | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231=
.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml b=
/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
> new file mode 100644
> index 000000000000..5669dd58654e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
> @@ -0,0 +1,193 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/realtek,rtl8231.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL8231 GPIO and LED expander.
> +
> +maintainers:
> +  - Sander Vanheule <sander@svanheule.net>
> +
> +description: |
> +  The RTL8231 is a GPIO and LED expander chip, providing up to 37 GPIOs,=
 up to
> +  88 LEDs, and up to one PWM output. This device is frequently used alon=
gside
> +  Realtek switch SoCs, to provide additional I/O capabilities.
> +
> +  To manage the RTL8231's features, its strapping pins can be used to co=
nfigure
> +  it in one of three modes: shift register, MDIO device, or SMI device. =
The
> +  shift register mode does not need special support. In MDIO or SMI mode=
, most
> +  pins can be configured as a GPIO output or LED matrix scan line/column=
. One
> +  pin can be used as PWM output.
> +
> +  The GPIO, PWM, and pin control are part of the main node. LED support =
is
> +  configured as a sub-node.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtl8231
> +
> +  reg:
> +    description: MDIO or SMI device address.
> +    maxItems: 1
> +
> +  # GPIO support
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      The first cell is the pin number and the second cell is used to sp=
ecify
> +      the GPIO active state.
> +
> +  gpio-ranges:
> +    description:
> +      Must reference itself, and provide a zero-based mapping for 37 pin=
s.
> +    maxItems: 1
> +
> +  # Pin muxing and configuration
> +  drive-strength:
> +    description:
> +      Common drive strength used for all GPIO output pins, must be 4mA o=
r 8mA.
> +      On reset, this value will default to 8mA.
> +    enum: [4, 8]
> +
> +  # LED scanning matrix
> +  led-controller:
> +    $ref: /schemas/leds/realtek,rtl8231-leds.yaml#
> +
> +  # PWM output
> +  "#pwm-cells":
> +    description:
> +      Twos cells with PWM index (must be 0) and PWM frequency in Hz. To =
use
> +      the PWM output, gpio35 must be muxed to its "pwm" function. Valid
> +      frequency values for consumers are 1200, 1600, 2000, 2400, 2800, 3=
200,
> +      4000, and 4800.
> +    const: 2
> +
> +patternProperties:
> +  "-pins$":
> +    type: object
> +    $ref: /schemas/pinctrl/pinmux-node.yaml#

         additionalProperties: false

> +
> +    properties:
> +      pins:
> +        items:
> +          enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
> +                 gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14, g=
pio15,
> +                 gpio16, gpio17, gpio18, gpio19, gpio20, gpio21, gpio22,=
 gpio23,
> +                 gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30,=
 gpio31,
> +                 gpio32, gpio33, gpio34, gpio35, gpio36]
> +        minItems: 1
> +        maxItems: 37
> +
> +      function:
> +        description:
> +          Select which function to use. "gpio" is supported for all pins=
, "led" is supported
> +          for pins 0-34, "pwm" is supported for pin 35.
> +        enum: [gpio, led, pwm]
> +
> +    required:
> +      - pins
> +      - function
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Minimal example
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        expander0: expander@0 {
> +            compatible =3D "realtek,rtl8231";
> +            reg =3D <0>;
> +
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +            gpio-ranges =3D <&expander0 0 0 37>;
> +        };
> +    };
> +  - |
> +    // All bells and whistles included
> +    #include <dt-bindings/leds/common.h>
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        expander1: expander@1 {
> +            compatible =3D "realtek,rtl8231";
> +            reg =3D <1>;
> +
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +            gpio-ranges =3D <&expander1 0 0 37>;
> +
> +            #pwm-cells =3D <2>;
> +
> +            drive-strength =3D <4>;
> +
> +            button-pins {
> +                pins =3D "gpio36";
> +                function =3D "gpio";
> +                input-debounce =3D <100000>;
> +            };
> +
> +            pwm-pins {
> +                pins =3D "gpio35";
> +                function =3D "pwm";
> +            };
> +
> +            led_matrix: led-pins {
> +                pins =3D "gpio0", "gpio1", "gpio3", "gpio4";
> +                function =3D "led";
> +            };
> +
> +            led-controller {
> +                compatible =3D "realtek,rtl8231-leds";
> +                #address-cells =3D <2>;
> +                #size-cells =3D <0>;
> +
> +                pinctrl-names =3D "default";
> +                pinctrl-0 =3D <&led_matrix>;
> +
> +                realtek,led-scan-mode =3D "single-color";
> +
> +                led@0,0 {
> +                    reg =3D <0 0>;
> +                    color =3D <LED_COLOR_ID_GREEN>;
> +                    function =3D LED_FUNCTION_LAN;
> +                    function-enumerator =3D <0>;
> +                };
> +
> +                led@0,1 {
> +                    reg =3D <0 1>;
> +                    color =3D <LED_COLOR_ID_AMBER>;
> +                    function =3D LED_FUNCTION_LAN;
> +                    function-enumerator =3D <0>;
> +                };
> +
> +                led@1,0 {
> +                    reg =3D <1 0>;
> +                    color =3D <LED_COLOR_ID_GREEN>;
> +                    function =3D LED_FUNCTION_LAN;
> +                    function-enumerator =3D <1>;
> +                };
> +
> +                led@1,1 {
> +                    reg =3D <1 1>;
> +                    color =3D <LED_COLOR_ID_AMBER>;
> +                    function =3D LED_FUNCTION_LAN;
> +                    function-enumerator =3D <1>;
> +                };
> +            };
> +        };
> +    };
> --
> 2.51.1
>
>


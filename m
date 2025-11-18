Return-Path: <linux-gpio+bounces-28670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E077DC6A294
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 15:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 23F352B1A8
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 14:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C305C361DCA;
	Tue, 18 Nov 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4hoHohy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A7633C50B;
	Tue, 18 Nov 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477887; cv=none; b=uzPS91+1rYc9w6BsYsn7iRtQBFu+T7WRIigbqsBn8Jd4GMxF7+h3kbs8LsH66e/YhpKdGhdesMXARGMroYRk3/tVNjm5gX55SdGBD3GsSZGtkQjiuGKteeZXqyZAvQZhvzaipN4et03H2OzHPb0Nb9X09+9eJYP8iF4EAPJDPvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477887; c=relaxed/simple;
	bh=e+z6XUwzhyDWTjtbWxr0qeGlqE4RlAw1sbQqNFwxbVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYbtzNxlsUPg8iMCGrRphrPfWJhVfEJytFWEYpK3CeaCMpf+cOg632CvrOihh7Cyd/rPu3kMQukHhbX1+3ZIqU29yd1oCRrI3sZTtneaBZwj8tRYCH5YypKujqOurDp4h5dBoyWiOn6gvOQceRZ8U5tWQ9rp1EGhm8Uy4u+4VWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4hoHohy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14243C19421;
	Tue, 18 Nov 2025 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477887;
	bh=e+z6XUwzhyDWTjtbWxr0qeGlqE4RlAw1sbQqNFwxbVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4hoHohy7t59TIidJFhYEX7KnjIPC20/DcH2gQEYhqWV6N2BUykUssMLkBTbLo7gP
	 ICMqOBFNYVC3dmOvgpZgWPdIPdkXYtGFUQW4jKMYsn8IaAf0Oz2wDPmq05ALYRZSid
	 WFvLpR5bSUiSTD1ZHNqVhpZtz9rkKzN+/GeTnuw+d/hnoXWte1xy6cNQhqzt76vLqZ
	 c0EBrjRvISNoLyS1M/9TZX4V6q/zhpgUnwjgs8DFjGk0ttDEUpTZLIL/kWvx7An4ZC
	 iG9zG41uxWFEPGluEw2Lj0bHxBXJnqSwwoHLz8opO/IehzgzxncnBNvCqIUiydpMUq
	 +D5bndO90hMKw==
Date: Tue, 18 Nov 2025 08:58:05 -0600
From: Rob Herring <robh@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: Binding for RTL8231 scan matrix
Message-ID: <20251118145805.GA3231100-robh@kernel.org>
References: <20251117215138.4353-1-sander@svanheule.net>
 <20251117215138.4353-2-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117215138.4353-2-sander@svanheule.net>

On Mon, Nov 17, 2025 at 10:51:31PM +0100, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231's LED support, which
> consists of up to 88 LEDs arranged in a number of scanning matrices.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> Changes since v6:
> - Relax description formatting
> - Enforce address format for led node names
> - Use absolute paths for schema references
> ---
>  .../bindings/leds/realtek,rtl8231-leds.yaml   | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> new file mode 100644
> index 000000000000..222cd08914da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/realtek,rtl8231-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL8231 LED scan matrix.
> +
> +maintainers:
> +  - Sander Vanheule <sander@svanheule.net>
> +
> +description: |
> +  The RTL8231 has support for driving a number of LED matrices, by scanning
> +  over the LEDs pins, alternatingly lighting different columns and/or rows.
> +
> +  This functionality is available on an RTL8231, when it is configured for use
> +  as an MDIO device, or SMI device.
> +
> +  In single color scan mode, 88 LEDs are supported. These are grouped into
> +  three output matrices:
> +    - Group A of 6×6 single color LEDs. Rows and columns are driven by GPIO
> +      pins 0-11.
> +               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
> +                |        |        |        |        |        |
> +       P0/P6  --<--------<--------<--------<--------<--------< (3)
> +                |        |        |        |        |        |
> +       P1/P7  --<--------<--------<--------<--------<--------< (4)
> +                |        |        |        |        |        |
> +       P2/P8  --<--------<--------<--------<--------<--------< (5)
> +                |        |        |        |        |        |
> +       P3/P9  --<--------<--------<--------<--------<--------< (6)
> +                |        |        |        |        |        |
> +       P4/P10 --<--------<--------<--------<--------<--------< (7)
> +                |        |        |        |        |        |
> +       P5/P11 --<--------<--------<--------<--------<--------< (8)
> +               (0)      (1)      (2)      (9)     (10)     (11)
> +    - Group B of 6×6 single color LEDs. Rows and columns are driven by GPIO
> +      pins 12-23.
> +               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
> +                |        |        |        |        |        |
> +      P12/P18 --<--------<--------<--------<--------<--------< (15)
> +                |        |        |        |        |        |
> +      P13/P19 --<--------<--------<--------<--------<--------< (16)
> +                |        |        |        |        |        |
> +      P14/P20 --<--------<--------<--------<--------<--------< (17)
> +                |        |        |        |        |        |
> +      P15/P21 --<--------<--------<--------<--------<--------< (18)
> +                |        |        |        |        |        |
> +      P16/P22 --<--------<--------<--------<--------<--------< (19)
> +                |        |        |        |        |        |
> +      P17/P23 --<--------<--------<--------<--------<--------< (20)
> +              (12)     (13)     (14)    (21)      (22)     (23)
> +    - Group C of 8 pairs of anti-parallel (or bi-color) LEDs. LED selection is
> +      provided by GPIO pins 24-27 and 29-32, polarity selection by GPIO 28.
> +               P24     P25  ...  P30     P31
> +                |       |         |       |
> +      LED POL --X-------X---/\/---X-------X (28)
> +              (24)    (25)  ... (31)    (32)
> +
> +  In bi-color scan mode, 72 LEDs are supported. These are grouped into four
> +  output matrices:
> +    - Group A of 12 pairs of anti-parallel LEDs. LED selection is provided
> +      by GPIO pins 0-11, polarity selection by GPIO 12.
> +    - Group B of 6 pairs of anti-parallel LEDs. LED selection is provided
> +      by GPIO pins 23-28, polarity selection by GPIO 21.
> +    - Group C of 6 pairs of anti-parallel LEDs. LED selection is provided
> +      by GPIO pins 29-34, polarity selection by GPIO 22.
> +    - Group of 4×6 single color LEDs. Rows are driven by GPIO pins 15-20,
> +      columns by GPIO pins 13-14 and 21-22 (shared with groups B and C).
> +           L2[n]    L2[n+6]   L2[n+12]  L2[n+18]
> +            |        |         |         |
> +       +0 --<--------<---------<---------< (15)
> +            |        |         |         |
> +       +1 --<--------<---------<---------< (16)
> +            |        |         |         |
> +       +2 --<--------<---------<---------< (17)
> +            |        |         |         |
> +       +3 --<--------<---------<---------< (18)
> +            |        |         |         |
> +       +4 --<--------<---------<---------< (19)
> +            |        |         |         |
> +       +6 --<--------<---------<---------< (20)
> +          (13)     (14)      (21)      (22)
> +
> +  This node must always be a child of a 'realtek,rtl8231' node.
> +
> +properties:
> +  $nodename:
> +    const: led-controller
> +
> +  compatible:
> +    const: realtek,rtl8231-leds
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +  realtek,led-scan-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Specify the scanning mode the chip should run in. See general description
> +      for how the scanning matrices are wired up.
> +    enum: [single-color, bi-color]
> +
> +patternProperties:
> +  "^led@([1-2]?[0-9]|3[0-1]),[0-2]":
> +    description:
> +      LEDs are addressed by their port index and led index. Ports 0-23 always
> +      support three LEDs. Additionally, but only when used in single color scan
> +      mode, ports 24-31 support two LEDs.
> +    type: object
> +
> +    properties:
> +      reg:
> +        items:
> +          - items:
> +              - description: port index
> +                maximum: 31
> +              - description: led index
> +                maximum: 2
> +
> +    allOf:
> +      - $ref: /schemas/leds/common.yaml#
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - realtek,led-scan-mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    led-controller {

Also, drop the example here. It just duplicates what is in the mfd 
schema and we want 1 complete example, not piecemeal examples.

> +        compatible = "realtek,rtl8231-leds";
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        realtek,led-scan-mode = "single-color";
> +
> +        led@0,0 {
> +            reg = <0 0>;
> +            color = <LED_COLOR_ID_GREEN>;
> +            function = LED_FUNCTION_LAN;
> +            function-enumerator = <0>;
> +        };
> +
> +        led@0,1 {
> +            reg = <0 1>;
> +            color = <LED_COLOR_ID_AMBER>;
> +            function = LED_FUNCTION_LAN;
> +            function-enumerator = <0>;
> +        };
> +
> +        led@0,2 {
> +            reg = <0 2>;
> +            color = <LED_COLOR_ID_GREEN>;
> +            function = LED_FUNCTION_STATUS;
> +        };
> +    };
> -- 
> 2.51.1
> 


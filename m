Return-Path: <linux-gpio+bounces-27615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E3053C0B4F1
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 23:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 60B3A3498A9
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 22:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3902D2FE588;
	Sun, 26 Oct 2025 22:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0JaNj7N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8042FDC5D;
	Sun, 26 Oct 2025 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516002; cv=none; b=C/Jfh5kMSigFTrozARrxptOlnohF8Ewql2NfYSTyGeRkKgaU4XemGNrv5fod9kLafuxAAi83VGGbIHMjXYk1VIpB3Hft/1oUZeNKuth+eFCQ2H3bH3WgOQ2N4jcL8rPhkvrV1HsC4Tvy6+Y6xtdTFH+6TXpZXK6wisNEUwrKzQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516002; c=relaxed/simple;
	bh=vJkVDeZF7RolxmRN4HJJ3iYzuISnKCvYF5W3dfnXOnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akcSJ8+kplVKv2l/uU80pEiAP3s6pRrTf+MSkv7oYrOtptFMxCYcRmv79VutpbNsRixyyakI992/eaQNTdgNC6m6n4xqkgiUoSnrpOme6PZTnikon4vOf3zGgTGIu1hQbX7Op+suR+QKM2GiJRbKMefw1OlqtD6w79vYv2A5x2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0JaNj7N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE005C4CEE7;
	Sun, 26 Oct 2025 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516001;
	bh=vJkVDeZF7RolxmRN4HJJ3iYzuISnKCvYF5W3dfnXOnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0JaNj7NtjytkM9S9fomr5WQj2mfA+m4L+wUeOf3pVBBKtlgfgMMmRK/w1mwaZPn4
	 bGeBvxuyiQiOgGVo5b4B7zoqGEsGE0JjSRv8IYe/Pk3QsjH0QlYUI73UOaM6dU4Dco
	 MdswJxB4OiZNI/KUBHnEJFRfJSwTqHHaE3wGL/VGQ2OhBM1nMVFCzFYsMVssos2LBp
	 GH/s7FRIt2QKXAZ7LfCVnr1ycWbrSL6pjmNFgJZYsTp3xtaYgJ5kZ+bx10Raj1PcyN
	 //usOOsDuLv+pnMs7rFJOcWFyiNFleWirUpNg7yfZuSTgVGcBCDk7QdeBp/Wr408Th
	 4KMGtGFN0nEKw==
Date: Sun, 26 Oct 2025 16:59:57 -0500
From: Rob Herring <robh@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/8] dt-bindings: leds: Binding for RTL8231 scan matrix
Message-ID: <20251026215957.GA2994223-robh@kernel.org>
References: <20251021142407.307753-1-sander@svanheule.net>
 <20251021142407.307753-4-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021142407.307753-4-sander@svanheule.net>

On Tue, Oct 21, 2025 at 04:23:58PM +0200, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231's LED support, which
> consists of up to 88 LEDs arranged in a number of scanning matrices.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  .../bindings/leds/realtek,rtl8231-leds.yaml   | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> new file mode 100644
> index 000000000000..54e8593f8c06
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
> +    description: |

You don't need '|' if there is no formatting to preserve.

> +      Specify the scanning mode the chip should run in. See general description
> +      for how the scanning matrices are wired up.
> +    enum: [single-color, bi-color]

Wouldn't 'single' and 'bi' be sufficient?

> +
> +patternProperties:
> +  "^led@":

You need to define the unit-address format:

"^led@([1-2]?[0-9]|3[0-1]),[0-2]$"

> +    description: |
> +      LEDs are addressed by their port index and led index. Ports 0-23 always
> +      support three LEDs. Additionally, but only when used in single color scan
> +      mode, ports 24-31 support two LEDs.
> +    type: object


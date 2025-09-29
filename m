Return-Path: <linux-gpio+bounces-26664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2769BA9D27
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 17:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E551753E2
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 15:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4428E30BF68;
	Mon, 29 Sep 2025 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FCR94bK2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A130BB88
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759160593; cv=none; b=ZqU7uOtIiwkoRNwaIRyHvWb4+pnZ9uPZI9XIfjHm+nq0zAoeoBqbqkkq6ecsVwxhjSjap6iXnAQLeqMME3KD1+zJnxEReuGInI+/xyYUYssEZu0/NrTDqX2u/rO7lT+s8+MDo3CuqBf/AU7M0pWj8sbS9Y5odrHPmvo/7rqpXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759160593; c=relaxed/simple;
	bh=5q8LLF4ag2MVwttfhWyI7ecDLzD9/dPboJQ0VHDhT3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=obHtX7hg+ilaLgLCtZvD52phHFAaSx6nA6LY546BESu8htOkL6Onc5MsLQmoEa4yBksFqfKLdtzABWCY6wXP6MLtmaeV4bu7jKRV9M3VQLOMHQLoyXh2CeOgbtkH9XRQya3rPE6ZAvn/OuxeNum8z1AT86Vwv6OAhG5DNiILkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FCR94bK2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 66F2E1A103B;
	Mon, 29 Sep 2025 15:43:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B17B606AE;
	Mon, 29 Sep 2025 15:43:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E9D3102F1A0C;
	Mon, 29 Sep 2025 17:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759160588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S1PdaIvO7vK9SB7Z0ERMuEoy98E+U47D3nVJtH+4Aqk=;
	b=FCR94bK24e1NoOiyF+A/RbIyOW+tTMUG3y4g3og4gWZyyXJaS00FXRsl39dlwRgRIZ/k3J
	AK+mywa0BxPUY+nCP8IMpGuJ95/GUwJs+cTfjUrCT054gC1lsqpsr4VR9ARrrcD8fX2MaS
	rbc1p1yzzUEDmIx25+WiAWcBf9q7i3oorfLutoPa3rGXJdTqJRA+1DplYKRG2MRKmzc4/b
	St12Emjl4h3HuzabkOq9MNbLCJ19bjikzYM0ykLd7aoWBe3I3bFacn4PYd5Cb2wI3ydGg/
	9fUqOIui11YZn1Aa2IoZiu+Qm638BxPUI/njFLpoL2j73b04aDsJUWBfMkpEbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Linus Walleij <linus.walleij@linaro.org>,
  Richard Cochran <richardcochran@gmail.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  Marek =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org,
  netdev@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert
 marvell,armada-3710-(sb|nb)-pinctrl to DT schema
In-Reply-To: <20250924223528.2956771-1-robh@kernel.org> (Rob Herring's message
	of "Wed, 24 Sep 2025 17:35:24 -0500")
References: <20250924223528.2956771-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Sep 2025 17:43:04 +0200
Message-ID: <87ms6di7sn.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 24/09/2025 at 17:35:24 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the marvell,armada3710-(sb|nb)-pinctrl binding to DT schema
> format. The binding includes the "marvell,armada-3700-xtal-clock"
> subnode which is simple enough to include here.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/armada3700-xtal-clock.txt  |  29 ---
>  .../marvell,armada-3710-xb-pinctrl.yaml       | 122 +++++++++++
>  .../pinctrl/marvell,armada-37xx-pinctrl.txt   | 195 ------------------
>  3 files changed, 122 insertions(+), 224 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/armada3700-xt=
al-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,arm=
ada-3710-xb-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,arm=
ada-37xx-pinctrl.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/armada3700-xtal-cloc=
k.txt b/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
> deleted file mode 100644
> index 4c0807f28cfa..000000000000
> --- a/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -* Xtal Clock bindings for Marvell Armada 37xx SoCs
> -
> -Marvell Armada 37xx SoCs allow to determine the xtal clock frequencies by
> -reading the gpio latch register.
> -
> -This node must be a subnode of the node exposing the register address
> -of the GPIO block where the gpio latch is located.
> -See Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctr=
l.txt
> -
> -Required properties:
> -- compatible : shall be one of the following:
> -	"marvell,armada-3700-xtal-clock"
> -- #clock-cells : from common clock binding; shall be set to 0
> -
> -Optional properties:
> -- clock-output-names : from common clock binding; allows overwrite defau=
lt clock
> -	output names ("xtal")
> -
> -Example:
> -pinctrl_nb: pinctrl-nb@13800 {
> -	compatible =3D "armada3710-nb-pinctrl", "syscon", "simple-mfd";
> -	reg =3D <0x13800 0x100>, <0x13C00 0x20>;
> -
> -	xtalclk: xtal-clk {
> -		compatible =3D "marvell,armada-3700-xtal-clock";
> -		clock-output-names =3D "xtal";
> -		#clock-cells =3D <0>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada-371=
0-xb-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,armad=
a-3710-xb-pinctrl.yaml
> new file mode 100644
> index 000000000000..c4d09d8720bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pi=
nctrl.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/marvell,armada-3710-xb-pinctr=
l.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Armada 37xx SoC pin and gpio controller
> +
> +maintainers:
> +  - Gregory CLEMENT <gregory.clement@bootlin.com>
> +  - Marek Beh=C3=BAn <kabel@kernel.org>
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +description: >
> +  Each Armada 37xx SoC come with two pin and gpio controller one for the=
 south
> +  bridge and the other for the north bridge.

As I think you'll send a v2 because of the robot complaint, maybe you
could rephrase a bit to ease the reading:

"...two pin/gpio controllers, one for..."

> +
> +  Inside this set of register the gpio latch allows exposing some config=
uration
> +  of the SoC and especially the clock frequency of the xtal. Hence, this=
 node is
> +  a represent as syscon allowing sharing the register between multiple h=
ardware

represented as a?

> +  block.

blocks?


The rest looks fine, so:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l


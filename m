Return-Path: <linux-gpio+bounces-27469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 018F9BFC67B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 16:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 80ADC34FAA3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 14:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C3A34B677;
	Wed, 22 Oct 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PlCr3ESS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B861494A8;
	Wed, 22 Oct 2025 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142318; cv=none; b=hSBuuupMpoyZOFEtrWuxMMiwt4ADsJVUZosiGHcbjmHRzbnn0Bcb3/NuPgFAGKNAxnphPn6KNCHkGqYQleaxnrmoMZhgmsD0H8NLz4kiBxojZLAtF215ytVjyrdxBTT6Yu41ldb08e5aZ33xxzZq/XnT0aqOmwYQQgXACcZ6FXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142318; c=relaxed/simple;
	bh=RwoJkus1WViVNJS0q2DbQhutmAlsR2CiQVXjHxAD0bY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pETX3k0hN5QdEZ1WZ8saNnqPFAlovrCzV7KWPzk2uobtjQIWYl+N1FcOtQV7+lZ+6YANJgo2NSDlrbT8Y/wq+dBTKtLKDW2QVT82CiLOMw9OYW8QggreGBnlB98vlgErSVEOPvdSSwVeAfzcBF2C3X+RYNKtCtmA6j0bV4ZiTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PlCr3ESS; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E6332C0AFFB;
	Wed, 22 Oct 2025 14:11:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A568C606DC;
	Wed, 22 Oct 2025 14:11:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F9E6102F243C;
	Wed, 22 Oct 2025 16:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761142312; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O1wkwa2sbgbrgVXmpX6aURjXnmTYmvjQpNTyuKJo+Jg=;
	b=PlCr3ESSO1Lz6NgyqsmCsc1gCdHzwwzaG3F97GJRmw4UNWoV2zZ7Ztz+vBarrcv14hkeb8
	ZLPyeJOQdJJxqxldUujAfOpz33WY+OHATCTElWRKckQ/Ao6vOezLXmeOxFjsgz8Ib59lKc
	KOBnSv4diphrnuyCutb1P4DEV6thLTLIDScVZTqXqHAXxApOGGUkZyKzkHQfaJ5DMdHlIR
	UcoROB9m1xZ6RUPIQK45ACSpJdTwH8G7+HERmtTQdCAu98NXgRY+WY8lMt9LedzckEgQhl
	R52xwpALs7xqwSF7Kihb4yMXFpVU2h4Q5re8uyNBZYkMBuKNSFr+syWzkkktWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Linus Walleij <linus.walleij@linaro.org>,  Richard Cochran
 <richardcochran@gmail.com>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  linux-gpio@vger.kernel.org,
  netdev@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
In-Reply-To: <20251014153021.3783485-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 14 Oct 2025 10:30:19 -0500")
References: <20251014153021.3783485-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 16:11:48 +0200
Message-ID: <87ldl3rpp7.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

Thanks for the conversion!

On 14/10/2025 at 10:30:19 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the Marvell CP110 System Controller binding to DT schema
> format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

...

> -Those clocks can be referenced by other Device Tree nodes using two
> -cells:
> - - The first cell must be 0 or 1. 0 for the core clocks and 1 for the
> -   gateable clocks.
> - - The second cell identifies the particular core clock or gateable
> -   clocks.
> -
> -The following clocks are available:
> - - Core clocks
> -   - 0 0	APLL
> -   - 0 1	PPv2 core
> -   - 0 2	EIP
> -   - 0 3	Core
> -   - 0 4	NAND core
> -   - 0 5	SDIO core
> - - Gateable clocks
> -   - 1 0	Audio
> -   - 1 1	Comm Unit
> -   - 1 2	NAND
> -   - 1 3	PPv2
> -   - 1 4	SDIO
...

Why do you want to drop this information? Telling

    #clock-cells =3D <2>

is not enough IMO, we must tell people what is expected in these
cells. At the very least the cell values can be constrained to [0-1] for th=
e first
one and [0-5] or [0-26] respectively for the second one.

But giving their meaning I think makes sense. I agree, these should have be=
en
defined inside a shared header, that would have been a better way to
keep track of their meaning, but if we don't have that, I would propose
to keep the information here?

[...]

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada-7k-pinctrl=
.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Armada 7K/8K pin controller

...

> +        enum: [
> +          au, dev, ge, ge0, ge1, gpio, i2c0, i2c1, io, led, link,
> mii,

I don't think "io" has ever been a valid value, it probably comes from a
typo while sorting out all the possibilities ;-) (probably a left over
of a gpio, mdio or sdio string).

> +          mss_gpio0, mss_gpio1, mss_gpio2, mss_gpio3, mss_gpio4, mss_gpi=
o5,
> +          mss_gpio6, mss_gpio7, mss_i2c, mss_spi, mss_uart, nf, pcie, pc=
ie0,
> +          pcie1, pcie2, ptp, rei, sata0, sata1, sdio, sdio_cd, sdio_wp, =
sei,
> +          spi0, spi1, synce1, synce2, tdm, uart0, uart1, uart2, uart3, w=
akeup,
> +          xg

Rest LGTM otherwise.

Thanks,
Miqu=C3=A8l


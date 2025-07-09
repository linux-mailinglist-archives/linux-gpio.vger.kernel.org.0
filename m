Return-Path: <linux-gpio+bounces-22998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 376B3AFE8A4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D071B18994DE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 12:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486552D9484;
	Wed,  9 Jul 2025 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jx4RxIt7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2417290092;
	Wed,  9 Jul 2025 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063294; cv=none; b=E8jhWe0byJ7CX+cqJ6Wluw9EtI5DJ3BCMeuGJO/SN5XsHgg62ZnkbQp/8wbgI5ereLP1c1m4ry+6sKIrL6DBD9n91bpSHeX3a36e083OOA2pzdMZuW6ab2X4KzbmgbFsvElydQZOnioKNP7gI7JFLa2g2ApslvISrisKZkp+0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063294; c=relaxed/simple;
	bh=C0jnHX5ZIYrcjGrLWg1TUWOzEzr/PZY5bj2b/zzE6EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5lk8gDYAu0wJqeP9qDfBjfzzg6b12kWJTDKBt1mcoj9ZYTwUSTItLOer72/rhD9lh6rZVC7gWqjzX3IEXIkgWUscZQi1Y++CQ76WPquO0NFNPeNWDk2VSgIEEniGjIc1RFTVb/3ileNxWQFg8Q2okpbFdG6EdU2omkx+OrWRNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jx4RxIt7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A8EC4CEEF;
	Wed,  9 Jul 2025 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752063293;
	bh=C0jnHX5ZIYrcjGrLWg1TUWOzEzr/PZY5bj2b/zzE6EQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jx4RxIt7wS9R3IZNmxH0o8Tama+FOuHmqTgXjLmBn1XDG1wGmOgqRJqaL0NlUp8MV
	 M5YXs8fWFXBIo7EpXsIW4U70lA4Pikt8fqfpxzJTKaMySGZ2G3ymt2bVvlvOnbbdJB
	 1Vc327UnVCreNS7QdRAAw+keWq+r4RSZdiitqpbrwRMUDrgivtKDmmOwKOeKEz/6WY
	 LppQGavosioDwHroRTAn4wvXQOh5ORfJ3N5aL0G3XfBT8yDxOIXtXqtNedY6ViciQC
	 wTsvj/cIxQb5KPf+EJ9beURjN28tiHRWp5H/FXqvvzTDOnDMqetjagjOHJQpNKJ1Ti
	 3e7QJpfBmbwNQ==
Message-ID: <9aff4894-a8aa-47d2-8800-62959e064254@kernel.org>
Date: Wed, 9 Jul 2025 14:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: gpio: add bindings for the QIXIS FPGA
 based GPIO controller
To: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-2-ioana.ciornei@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250709112658.1987608-2-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/07/2025 13:26, Ioana Ciornei wrote:
> Add a device tree binding for the QIXIS FPGA based GPIO controller.
> Depending on the board, the QIXIS FPGA exposes registers which act as a
> GPIO controller, each with 8 GPIO lines of fixed direction.
> 
> Since each QIXIS FPGA layout has its particularities, add a separate
> compatible string for each board/GPIO register combination supported.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Your changelog explains patches, which is kind of redundant - we see
that - but does not explain the dependency you have here between patches.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> ---
>  .../bindings/gpio/fsl,fpga-gpio.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> new file mode 100644
> index 000000000000..dc7b6c0d9b40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,fpga-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO controller embedded in the NXP QIXIS FPGA
> +
> +maintainers:
> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> +
> +description: |
> +  This module is part of the QIXIS FPGA found on some Layerscape boards such as
> +  LX2160ARDB and LS1046AQDS. For more details see
> +  ../board/fsl,fpga-qixis-i2c.yaml.

There are no "board" bindings, so this does not feel like correct path.

> +
> +  Each controller supports a maximum of 8 GPIO lines and each line has a fixed
> +  direction which cannot be changed using a direction register.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,lx2160ardb-fpga-gpio-sfp2
> +      - fsl,lx2160ardb-fpga-gpio-sfp3

What is the difference between these?

> +      - fsl,ls1046aqds-fpga-gpio-stat-pres2

Keep list sorted.


Best regards,
Krzysztof


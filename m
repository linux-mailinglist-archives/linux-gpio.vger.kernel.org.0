Return-Path: <linux-gpio+bounces-32072-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGHpIfmfnGnqJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32072-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:44:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD5E17BABC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1047D30E5654
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFAC36828B;
	Mon, 23 Feb 2026 18:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5T9CLQI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F53368279;
	Mon, 23 Feb 2026 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872173; cv=none; b=thTqU/XsnG8I2nezMqk0bxeLx/Nhaie8MpruGR5tl8ZAPQHUrBaAodOFJKFUeD13+mHom4omuW1B9j9umoMZumyBBStwh70tGpJyxIXylTU+WEX2442lvhr2K5jWD+E1gcNmnjWkb9ixBR1++OwcO1NYMm8LAoAHPw1KfViaF84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872173; c=relaxed/simple;
	bh=cT3H/BWva655wpPwCwjSPUa7i99cwIZsZq5v7UNpNiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICZ3tLa4uMZ3MJ0iCwiSG37y1RP1DLzWtwYJeSliT8SGACaENNiyJBCJvAet+DMjcpOcPIgo0arD/R852M5/c96cOMEbLSvbCiawprU+4lfBT0sK4IFAZ4gh+cKajZ+pAEgdZkqpuP60yuFkevbgmphAk1vV+wdkaGwp8swf5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5T9CLQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A51C116D0;
	Mon, 23 Feb 2026 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872173;
	bh=cT3H/BWva655wpPwCwjSPUa7i99cwIZsZq5v7UNpNiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5T9CLQIi4r6hjxZV/gWPZoUAq+M2qHc2cQ30X6BEjIQJ32c5mIYOsAY5cuZil7Mo
	 M7dMeymlrDMI1HefKWJQqkm5rMng83DMY1FxzER0jiUMNsBVc6B5DoDQFDL6YmZIa3
	 hkdZhvsJ6H9hbFhKvcwFYqHUqPKfONQAxYLmc6Fz8ZMtGd4fpw/lZ1hmWJGZdXyIUW
	 tWWssGb9LG5WYJOcApICbz5LOP6lSgc1Tm2CrJOOSjl6bZ9kABrpE8cDS+3QsX0SF0
	 Bv4uBEz0VpF6rDwar1v/Erda7b1Fb3Mv16yc9hbaP48im+EpH3AHMYPvEqdzIuzJ4p
	 QnOdV5X1bfTNw==
Date: Mon, 23 Feb 2026 12:42:52 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Message-ID: <20260223184252.GA132202-robh@kernel.org>
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
 <20260219-pinctrl-mux-v1-2-678d21637788@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219-pinctrl-mux-v1-2-678d21637788@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32072-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,nxp.com:email]
X-Rspamd-Queue-Id: DFD5E17BABC
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 05:23:42PM -0500, Frank Li wrote:
> Add a generic pinctrl binding for board-level pinmux chips that are
> controlled through the multiplexer subsystem.
> 
> On some boards, especially development boards, external mux chips are used
> to switch SoC signals between different peripherals (e.g. MMC and UART).
> The mux select lines are often driven by a GPIO expander over I2C,
> as illustrated below:
> 
> 	┌──────┐      ┌─────┐
> 	│ SOC  │      │     │    ┌───────┐
> 	│      │      │     │───►│ MMC   │
> 	│      │      │ MUX │    └───────┘
> 	│      ├─────►│     │    ┌───────┐
> 	│      │      │     │───►│ UART  │
> 	│      │      └─────┘    └───────┘
> 	│      │         ▲
> 	│      │    ┌────┴──────────────┐
> 	│ I2C  ├───►│ GPIO Expander     │
> 	└──────┘    └───────────────────┘
> 
> Traditionally, gpio-hog is used to configure the onboard mux at boot.
> However, the GPIO expander may probe later than consumer devices such as
> MMC. As a result, the MUX might not be configured when the peripheral
> driver probes, leading to initialization failures or data transfer errors.
> 
> Introduce a generic pinctrl binding that models the board-level MUX as a
> pin control provider and builds proper device links between the MUX, its
> GPIO controller, and peripheral devices. This ensures correct probe
> ordering and reliable mux configuration.
> 
> The implementation leverages the standard multiplexer subsystem, which
> provides broad support for onboard mux controllers and avoids the need for
> per-driver custom MUX handling.

Seems reasonable to me.

> 
> Allow pinctrl-* pattern as node name because this pinctrl device have not
> reg property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 54 ++++++++++++++++++++++
>  .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..31efffb3167cba724b1afe0d403a0dcae65582ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Pin Control Driver for Board-Level Mux Chips
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  This binding describes a generic pinctrl driver that controls on-board

Bindings don't describe drivers.

> +  pinmux chips using the multiplexer subsystem.
> +
> +properties:
> +  compatible:
> +    const: pinctrl-multiplexer
> +
> +patternProperties:
> +  '-grp$':
> +    type: object

       additionalProperties: false

The tools should have caught this, I'll have to check why not...

> +    properties:
> +      mux-states:
> +        maxItems: 1
> +
> +    required:
> +      - mux-states
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pinctrl-mux {
> +        compatible = "pinctrl-multiplexer";
> +
> +        uart-grp {
> +            mux-states = <&mux 0>;
> +        };
> +
> +        spi-grp {
> +            mux-states = <&mux 1>;
> +        };
> +
> +        i2c-grp {
> +            mux-states = <&mux 2>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> @@ -27,7 +27,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
> +    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
>  
>    "#pinctrl-cells":
>      description: >
> 
> -- 
> 2.43.0
> 


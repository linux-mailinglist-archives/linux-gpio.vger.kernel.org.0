Return-Path: <linux-gpio+bounces-32201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHljCWIBoGlrfQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:16:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA71A2608
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C42BD300A651
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 08:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665F027AC57;
	Thu, 26 Feb 2026 08:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQJadT6l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281801367;
	Thu, 26 Feb 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772093789; cv=none; b=sqCQCKE84cpLKj6ive209B/S8u7PCpecsGC/g3hmP9DeMHXNHgIjQzeUipTpY06GwH5IQcIxqHMSWdsH69hsoqzsZ7I4EGv770gLTe2HsW24krD2LbLCGoKyBwiSc+RjB+qbqQS8CLL9d4C++OQZGu/W4pqWZbirLcF30K0Ypow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772093789; c=relaxed/simple;
	bh=7lkCRjUihvMTeIFebPNy8QDZdgVd0C6rMpH6RZZ8QVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmcPkuZQkInd6zGPPU8jArmUSCAsVLwb05vlyslGFuUoL90HSVqgpTQua6ICB7mPnWI/cjBRpOrqgYHXDTCzEnbUbLWnXFZDtPrEAxzZecbZZQmR9c3sdoSBx4O7R6muR2Q5cnh6pyZGG8Yi/MTa+lmxgWA4WhkKc+gAUsZ2aJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQJadT6l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71915C19422;
	Thu, 26 Feb 2026 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772093788;
	bh=7lkCRjUihvMTeIFebPNy8QDZdgVd0C6rMpH6RZZ8QVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQJadT6lQJXKJG2V5IAYYiaGfUc4Epr+OrUZcyHro3isAQYVMhKf+gVtZWB3mcAR2
	 j5I3iCRC7lt6x6xq+Cz/wN97yv6iHE1QPKr2BtYpJNqEaYMxbBRpXJ6IzP3oztQ4Gq
	 +PalpQWtzCLL2IWTx40MO07omYfv33U+z58j9jMDlyL9BmWVdMWL33zYoU/0f+Yzb6
	 BoPRX2zPzWqMtRYKetV3/za+uueX234zuDSFeOAgQH/JIzqstIQoEC2A8TfyHRubuv
	 18lkKtHdZEs2YF8OR1j4T1se2S1h1hZJ46q/RB37kHI3km81db6ab77Zm2CyHPNafE
	 DsKmWkKpIi5lw==
Date: Thu, 26 Feb 2026 09:16:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v1 1/8] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260226-belligerent-aardwolf-from-venus-866d8e@quoll>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-2-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225171545.1980385-2-o.rempel@pengutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32201-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,devicetree.org:url]
X-Rspamd-Queue-Id: 3EEA71A2608
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:15:34PM +0100, Oleksij Rempel wrote:
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,mc33978.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Multiple Switch Detection Interface
> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The MC33978 and MC34978 are Multiple Switch Detection Interface (MSDI)
> +  devices with 22 switch inputs, integrated fault detection, and analog
> +  multiplexer (AMUX) for voltage/temperature monitoring.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,mc33978
> +      - nxp,mc34978
> +
> +  reg:
> +    maxItems: 1
> +    description: SPI chip select number
> +
> +  spi-max-frequency:
> +    maximum: 8000000
> +    description: Maximum SPI clock frequency (up to 8 MHz)
> +
> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      INT_B pin interrupt. Active-low, indicates pin state changes or
> +      fault conditions.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description: |
> +      First cell is the IRQ number (0-21 for pins, 22 for faults).
> +      Second cell is the trigger type (IRQ_TYPE_* from interrupt-controller.h).
> +
> +  vddq-supply:
> +    description: Digital supply voltage
> +
> +  vbatp-supply:
> +    description: Battery/power supply

This is incomplete. I see several other patches changing the file -
please post complete binding in one patch, not half-baked solutions.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'

Supplies should be required, unless datasheet tells otherwise.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        msdi: mc33978@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof



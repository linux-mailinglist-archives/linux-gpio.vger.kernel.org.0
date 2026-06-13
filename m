Return-Path: <linux-gpio+bounces-38407-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VzZtDpenLWouiQQAu9opvQ
	(envelope-from <linux-gpio+bounces-38407-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 20:55:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900467F5E0
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 20:55:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZsvjLy2P;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38407-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38407-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C1B73036EF1
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 18:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CCB372ED7;
	Sat, 13 Jun 2026 18:54:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50519992C;
	Sat, 13 Jun 2026 18:54:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781376895; cv=none; b=KLhBo5Qo4QPK0XpWeexiLV3kjP650SQUVfx4N5IAtqOkFr9juqE2gl2BwYBeOh+cWWKEe8cjzVPNWCCJsP7BfE2yBJKEJD53UXtJ3O/rtHGTLcOX7t6VT+2crIhEFtuErjpF6BB1GCG43xC3N9m41fGz8jwQX1bdQvCQqIWyDHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781376895; c=relaxed/simple;
	bh=jJ8rBGiy2dxWpalW8Igex5kuuAOnmPEKi3aJno92Np0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnjddLFO4vkMxgIfCpsgweE4cwsMOjGeHL8fYUwzxyUa6eqg1kyImos6ZJxAgSWYNDrkXEshgWXMWeAdfW3hi7qBxByUh+doVjaPLgjAg8n8TzJJxKCWVlF4bETposku1DPE+R2CAVZT/7Kkq+Qm2I+Qxu0gbiu8nVExh4fafZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsvjLy2P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FE91F000E9;
	Sat, 13 Jun 2026 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781376894;
	bh=9aRCDqgGSH3iD0ZnGIWR6w5F4sdtrQYSDqoyBQWRMJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZsvjLy2PpWDpdPKRgfJzopHlrckWK4SqIsQkBitrTw5KOzdvpzBIkCYRTwIc31E/L
	 PVDy2FK+fKoqeV6cUoPpsFt1gLJd+ySD9ciHLXmjHMObSfI7ZqHoWHJNXXAVjno/Cg
	 HJhzOrE0R7CmvGaTgImH8ybUiQGbOnZXHX0fc/Y2CoKyqXH/iEhxXTX+qvrBmekY58
	 4EorCWj9M3yj7p256c7hugcC39sKtG9q/lshgs6BXGLuZAIWJTXt/lKclibqMEISHh
	 HWLvwPUiHaWPgkZmpaq7H9WxnUdJ9YJcYspFcI+Yrz9gHKoXPtqVrgDtUrEb0Nzpiz
	 pLLnyye8yNsSA==
Date: Sat, 13 Jun 2026 20:54:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: Add TI ADS126x ADC family
Message-ID: <20260613-loyal-azure-goldfish-cf6d54@quoll>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38407-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8900467F5E0

On Fri, Jun 12, 2026 at 05:46:19PM -0500, Kurt Borja wrote:
> +  ti,neg-refmux:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Selects the negative voltage reference input:
> +      0: Internal 2.5 V reference
> +      1: AIN1 pin
> +      2: AIN3 pin
> +      3: AIN5 pin
> +      4: AVSS pin
> +    minimum: 0
> +    maximum: 4
> +    default: 0
> +
> +  ti,vbias:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Enables the level-shift voltage on the AINCOM pin.
> +    default: false

There is no such syntax, drop.

> +
> +  ti,idac1-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Selects the analog input pin to connect IDAC1:
> +      0: AIN0
> +      1: AIN1
> +      2: AIN2
> +      3: AIN3
> +      4: AIN4
> +      5: AIN5
> +      6: AIN6
> +      7: AIN7
> +      8: AIN8
> +      9: AIN9
> +      10: AINCOM
> +      11: No Connection
> +    minimum: 0
> +    maximum: 11
> +    default: 11
> +
> +  ti,idac1-microamp:
> +    description: Selects the current values of IDAC1.
> +    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
> +    default: 0
> +
> +  ti,idac2-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Selects the analog input pin to connect IDAC2:
> +      0: AIN0
> +      1: AIN1
> +      2: AIN2
> +      3: AIN3
> +      4: AIN4
> +      5: AIN5
> +      6: AIN6
> +      7: AIN7
> +      8: AIN8
> +      9: AIN9
> +      10: AINCOM
> +      11: No Connection
> +    minimum: 0
> +    maximum: 11
> +    default: 11
> +
> +  ti,idac2-microamp:
> +    description: Selects the current values of IDAC2.
> +    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
> +    default: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#io-channel-cells':
> +    const: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  adc:
> +    $ref: /schemas/iio/adc/ti,ads1263-adc2.yaml#

Not a separate device node. Fold into the parent... or explain in
commit msg. You have entire commit msg to explain odd things.

In that binding description you call it "independent", so it should have
its own SPI chip select? Why "independent" and part of this binding?
Maybe not independent, so basically part of this device?

> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - dvdd-supply
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +patternProperties:

patternProps always follow properties. Please open example-schema for
template.

> +  "^channel@[0-9]+$":
> +    $ref: /schemas/iio/adc/adc.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      diff-channels:
> +        description: |
> +          Selects the analog input configuration for this channel. The first
> +          value is the positive input and the second is the negative input.
> +          The following values are available:
> +          0: AIN0 pin
> +          1: AIN1 pin
> +          2: AIN2 pin
> +          3: AIN3 pin
> +          4: AIN4 pin
> +          5: AIN5 pin
> +          6: AIN6 pin
> +          7: AIN7 pin
> +          8: AIN8 pin
> +          9: AIN9 pin
> +          10: AINCOM pin
> +          11: Temperature sensor monitor
> +          12: Analog power supply monitor
> +          13: Digital power supply monitor
> +          14: TDAC test signal
> +          15: Float (open connection)
> +        items:
> +          minimum: 0
> +          maximum: 15
> +
> +      ti,chop-mode:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          When enabled, the ADC performs two internal conversions to cancel the
> +          input offset voltage. The first conversion is taken with normal input
> +          polarity. The ADC reverses the internal input polarity for the second
> +          conversion. The difference of the two conversions is computed to yield
> +          the final corrected result with the offset voltage removed.
> +        default: false
> +
> +      ti,idac-rotation-mode:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The rotation mode automatically swaps the IDAC1 and IDAC2 connections
> +          of alternate conversions. The ADC averages the alternate conversions
> +          to eliminate IDAC mismatch.
> +        default: false
> +
> +      ti,pga-bypass:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Bypass the Programmable Gain Amplifier (PGA).
> +        default: false
> +
> +      ti,rev-vref-pol:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The reference polarity can be negative, but the ADC requires a
> +          positive voltage reference. In this case, the reference
> +          polarity-reversal switch changes the reference polarity from negative
> +          to positive.
> +        default: false
> +
> +      ti,sbias-connection:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Selects the sensor bias current source connection:
> +          0: Sensor bias connected to ADC1 mux out
> +          1: Sensor bias connected to ADC2 mux out

Use string enum.

> +        minimum: 0
> +        maximum: 1
> +        default: 0
> +
> +      ti,sbias-polarity:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Selects the sensor bias current source polarity:
> +          0: Sensor bias pull-up
> +          1: Sensor bias pull-down
> +        minimum: 0
> +        maximum: 1
> +        default: 0

Use string enum.

> +
> +      ti,sbias-magnitude:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Selects the sensor bias magnitude:
> +          0: No sensor bias current or resistor
> +          1: 0.5-uA sensor bias current
> +          2: 2-uA sensor bias current
> +          3: 10-uA sensor bias current
> +          4: 50-uA sensor bias current
> +          5: 200-uA sensor bias current
> +          6: 10-Mohm resistor
> +        minimum: 0
> +        maximum: 6
> +        default: 0
> +
> +    required:
> +      - reg
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@0 {
> +            compatible = "ti,ads1263";
> +            reg = <0>;
> +            spi-max-frequency = <8000000>;
> +            spi-cpha;
> +            avdd-supply = <&avdd>;
> +            dvdd-supply = <&dvdd>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            reset-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
> +
> +            /* AINP: 0 - AINN: AINCOM */
> +            channel@0 {
> +                reg = <0>;
> +                diff-channels = <0x0 0xA>;
> +            };
> +
> +            /* Temperature sensor monitor */
> +            channel@1 {
> +                reg = <1>;
> +                diff-channels = <0xB 0xB>;
> +            };
> +
> +            adc {
> +                compatible = "ti,ads1263-adc2";

Heavily incomplete... Drop the sub node.

Best regards,
Krzysztof



Return-Path: <linux-gpio+bounces-33426-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAILFdw0tWl3xgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33426-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:13:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1390F28C9F6
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27C9630312DC
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 10:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDD7350A18;
	Sat, 14 Mar 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrKCwnPo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B121883E;
	Sat, 14 Mar 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773483222; cv=none; b=V32wG0ydQ3mPu71jKMFptYjAFbiQdy9uRq2ZflIxBc+28/rvxZdcWy3UGEJPysiJLY5yCmayOBcSmj2c1EOpviSol07C4QEQAcc0Ic9/RHbEw32FtFa+nuX8K/Ox/Po/EDLmmKBDnoUtICT96POmZ0ME6t5FI9sFCFItMwRii+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773483222; c=relaxed/simple;
	bh=/C33RI0RUQ0f/pDZa3F7x6OmYNV8FxATuTEla5fQvPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvtGYz8t9IYUvdmZfhQd3NLcvqgjw5l6iUrqjiJI/cvgK1QMHisMB12kYdXOXsFL1lTIfLGXNg4nigKumbXoES77XrrusjaWvSG0tCqQjI9wXWb+hydTPGvVazD0m9ADaRdqcHus23T6v7Mn26k/bjUjzvyqGj+htUNayKYtEWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrKCwnPo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384AAC116C6;
	Sat, 14 Mar 2026 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773483222;
	bh=/C33RI0RUQ0f/pDZa3F7x6OmYNV8FxATuTEla5fQvPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jrKCwnPoZDUyBBMLi2Xl7O8FYTNBB1rbXUoPSfNq4fi7/A24GEcshscUJZvF5mzlE
	 7YP/eca6yKYSsgBoKqMGqCHulaIaB1L4Oo8DnW9gi43t+EYaEddGzAcvdpbYyws72+
	 P3YVBFnxSedcm6Q8WL9Hmu4ZGhz0pKPD62eJjt4cGvCAnP33xhJc9A4wDKRw39wI2o
	 FWV4VbFwArZ5KYDIY9TLlStqfWid+8VY9KZziO7AdDJnhgMbThFRlOGe0hDdLq76Li
	 ARlX9jmuqCAU2odaGLBKgyFQKKqbZJXg5JsaXO8orASTHpAARgIIzvPkHIa8DJXQ0W
	 Ec1YOkfM5cA/A==
Message-ID: <2e7ddc36-25ed-4f76-9966-00d818ed3503@kernel.org>
Date: Sat, 14 Mar 2026 11:13:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] dt-bindings: mfd: Add bindings for TI TAC5x1x MFD
 core
To: Niranjan H Y <niranjan.hy@ti.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: lee@kernel.org, linusw@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nb@tipi-net.de, navada@ti.com,
 v-hampiholi@ti.com, sandeepk@ti.com, baojun.xu@ti.com, shenghao-ding@ti.com
References: <20260312184833.263-1-niranjan.hy@ti.com>
 <20260312184833.263-2-niranjan.hy@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260312184833.263-2-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33426-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,tipi-net.de,ti.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 1390F28C9F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 19:48, Niranjan H Y wrote:
> Add device tree bindings for the Texas Instruments TAC5x1x family of
> audio codecs with integrated GPIO controller, describing the MFD core
> device interface, power supplies, and clock configuration.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,tac5x1x.yaml   | 247 ++++++++++++++++++
>  1 file changed, 247 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml b/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
> new file mode 100644
> index 000000000000..3d7943c0411f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
> @@ -0,0 +1,247 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tac5x1x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAC5x1x Multi-Function Audio Device
> +
> +maintainers:
> +  - Niranjan H Y <niranjan.hy@ti.com>
> +
> +description: |
> +  TAC5x1x family of low-power, high-performance audio codecs with integrated
> +  GPIO controller and diagnostic capabilities.
> +
> +  This is the parent binding. Child nodes are bound by these bindings:
> +  - Pin controller: Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
> +  - Audio codec: Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
> +
> +  Hardware features:
> +  - Audio ADC/DAC with configurable impedance and voltage references
> +  - 4-pin GPIO controller with alternate functions (PDM, IRQ)
> +  - Analog voltage and current monitoring circuits
> +  - Diagnostic fault detection with interrupt generation
> +
> +  Device datasheets can be found at:
> +    TAA5212:    https://www.ti.com/lit/ds/symlink/taa5212.pdf
> +    TAA5412-Q1: https://www.ti.com/lit/ds/symlink/taa5412-q1.pdf
> +    TAC5111:    https://www.ti.com/lit/ds/symlink/tac5111.pdf
> +    TAC5112:    https://www.ti.com/lit/ds/symlink/tac5112.pdf
> +    TAC5211:    https://www.ti.com/lit/ds/symlink/tac5211.pdf
> +    TAC5212:    https://www.ti.com/lit/ds/symlink/tac5212.pdf
> +    TAC5301:    https://www.ti.com/lit/ds/symlink/tac5301-q1.pdf
> +    TAC5311-Q1: https://www.ti.com/lit/ds/symlink/tac5311-q1.pdf
> +    TAC5312-Q1: https://www.ti.com/lit/ds/symlink/tac5312-q1.pdf
> +    TAC5411-Q1: https://www.ti.com/lit/ds/symlink/tac5411-q1.pdf
> +    TAC5412-Q1: https://www.ti.com/lit/ds/symlink/tac5412-q1.pdf
> +    TAD5112:    https://www.ti.com/lit/ds/symlink/tad5112.pdf
> +    TAD5212:    https://www.ti.com/lit/ds/symlink/tad5212.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,taa5212
> +      - ti,taa5412
> +      - ti,tac5111
> +      - ti,tac5112
> +      - ti,tac5211
> +      - ti,tac5212
> +      - ti,tac5301
> +      - ti,tac5311
> +      - ti,tac5312
> +      - ti,tac5411
> +      - ti,tac5412
> +      - ti,tad5112
> +      - ti,tad5212
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Hardware reset control pin (active low)
> +
> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      Interrupt from device diagnostic circuits to host processor.
> +      Generated on voltage/current fault conditions and other diagnostic events.
> +
> +  clocks:
> +    maxItems: 1
> +    description: Master clock input (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  avdd-supply:
> +    description: |
> +      Analog supply voltage input (AVDD pin).
> +      Typical voltages: 1.8V, 3.0V, 3.3V, 5.0V
> +
> +  iovdd-supply:
> +    description: |
> +      Digital I/O supply voltage input (IOVDD pin).
> +      Typical voltages: 1.8V, 3.3V
> +
> +  ti,vref-voltage:

NAK

This was repeated multiple times, was mentioned in my
talks/presentations, is explicitly documented in kernel docs.

This posting has poor quality. First go via internal review because I do
not believe such code was reviewed earlier.

...


> +    default: [2600, 18000]
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - iovdd-supply
> +
> +unevaluatedProperties: false

You never tested this binding. You cannot have one without example.

Best regards,
Krzysztof


Return-Path: <linux-gpio+bounces-38319-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zu1wHfKBKmqLrQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38319-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:37:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C98670761
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:37:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cT+XRqbN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38319-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38319-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AB91322A49B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396AB3BCD16;
	Thu, 11 Jun 2026 09:34:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AEE3A3822;
	Thu, 11 Jun 2026 09:34:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170462; cv=none; b=MuoMT4nqgX8ET6uf9+gc4aXgnORJDuk1j8877UHZ0iY6gAdYTrDQ9F3c+4FfUIsD0XjkyQ/i+Zo8Cy08x3026bq+h/XbFWh/IRCyoLsEHK68Bd+k6at9kRFEBtIIGzSebzAykZyLsp0S9u+DNk0CU0Lq+UQh7mZ7d0N0we74DnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170462; c=relaxed/simple;
	bh=Vqwlo43bVLgUB8f7B4RoMUMMkIB/znkq0rsByvipKek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy2Dfg7a5LnqDkwcp8eS+fAGm4ZOoqwDRQb6qITp0OFOKw6iLuqViHmUdykYnK4hz8V6hEmfZVZ2V0CavyUhoPXQ64gjwxGO6hKvA7M8ukm/YD13oSgxU+0PUN2UfUdJPfff9tj7vQnLW1mIwvffqzkOpsOpNmrSnvAnEFdp9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cT+XRqbN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21521F00893;
	Thu, 11 Jun 2026 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781170460;
	bh=4CE+B5X87C4B+lcYhCceZRzgV1so3jPdEvEN6nolt7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cT+XRqbN+FRsGAYF7zyhydCwdA1+FVZrjIxCw9k5QqP55DrFhJweTKJwU8aW3lEEH
	 WCEbXzTF0Wc59BMqRkX46PYhGvRvodJq40IA36JbRNKJVi9IMMi2U9xWosqKnxP40I
	 GEdig7RJa6lQdUPGFgnkQzLeULgYzXeRUVaS+M4Z7NLNAbOpTdIjTXiG1r2Uy4LEcd
	 1geXGJ/eVZoN1LTVIpIXAnCie28UWQrxf1lNaR2naP3a4HB2Ka8majO5xWOgDBYIJs
	 +DjERFUC9KUHdBpoXKKt4fMYic5RKw93gABhuxbQvM42y2LfCxgfnFzZuAGE8iX662
	 5H8/EITDcDxpQ==
Date: Thu, 11 Jun 2026 11:34:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
Message-ID: <20260611-debonair-barnacle-of-action-ee9d22@quoll>
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38319-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1C98670761

On Wed, Jun 10, 2026 at 09:27:07PM +0530, Prasad Kumpatla wrote:
> Document the Qualcomm WSA885X I2C smart amplifier binding.
> 
> Describe the required supplies, powerdown and interrupt GPIOs, the
> optional battery configuration, and the optional init-table property
> used to program the device during codec initialization.
> 
> This matches the driver programming model and documents the DT data

Binding matches hardware, not driver. Please describe the hardware.

> needed to use the codec on platforms with Audio IF playback.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,wsa885x-i2c.yaml      | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> new file mode 100644
> index 000000000..1069f470d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml

There is no I2C in device name.

> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WSA885x I2C smart speaker amplifier
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  WSA885x is a Qualcomm Aqstic smart speaker amplifier with an I2C control
> +  interface and a digital audio interface exposed through ASoC DAI callbacks.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,wsa885x-i2c

Same here

Also, incorrect usage of wildcard. Look at other bindings how this is
written, so you will not repeat the same comments:
https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/

Read writing bindings before posting next version.

I also cannot find traces of internal review of this. Did it happen? Did
you receive toolset comments?

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  powerdown-gpios:
> +    description: GPIO controlling the SD_N powerdown pin.
> +    maxItems: 1
> +
> +  interrupt-gpios:

No, interrupts are never written as GPIOs.

Where is this binding coming from?

> +    description: GPIO used for the codec interrupt output.
> +    maxItems: 1
> +
> +  vdd-1p8-supply: true
> +
> +  vdd-io-supply: true
> +
> +  qcom,battery-config:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Speaker battery configuration, 1 for 1S and 2 for 2S.

Use string

> +    default: 1
> +    enum: [1, 2]
> +
> +  qcom,wsa885x-init-table:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 256
> +    description: |
> +      Sequence of register/value pairs applied during codec hardware

No, we don't store register values usually.

> +      initialization. Entries are encoded as alternating register address and
> +      register value cells. The number of entries must be even (register/value
> +      pairs); maxItems is 256 (128 pairs).
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'
> +  - powerdown-gpios
> +  - interrupt-gpios
> +  - vdd-1p8-supply
> +  - vdd-io-supply
> +
> +additionalProperties: false

unevaluated instead. Again, OPEN other existing bindings. Why doing
something completely different? Is there any WSA88xx binding with
additionalProperties? No.

Best regards,
Krzysztof



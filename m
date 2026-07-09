Return-Path: <linux-gpio+bounces-39751-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0+8LujBT2q8nwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39751-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 17:44:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B77330F1
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 17:44:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=gEYXdEq9;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39751-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39751-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B172E305108D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 15:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FA940F8F8;
	Thu,  9 Jul 2026 15:43:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9740B37A
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 15:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611813; cv=none; b=Klde+4D4aDlwT56xb1KYZB+aRAJLk9lndtF2TjJNVzmdfLd/xzXlvXAfUYsepD99OEpmRSQMEWc6o1Ynz3+SN3nbOWl4lJ8ZeEY0FOccjQnxFM/7TYx2co+e4q1CInJvG7Gjt3Zk17srXkjEytJQXDxEljjL2xwG8j3gcQ2BQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611813; c=relaxed/simple;
	bh=46Vxt43agJazPbO88O2vqw7lt9h7u00qTiJXc2dgbv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap0+mVXL+kIk+oLwuVpFuHdnVu+Mzhrs2gCnvzrpa2Rdq7ky9HJkpTGShc5NXglQEfZY24V2mwDHp6TT23zGFrlNJCZbmXt9CT+uBKkx933Je3B/XBGAX4EQunQS8aR6j3DqY4+TSUBERA3PstFkMfa1+pgmmNyXqWQ7vI8dt/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gEYXdEq9; arc=none smtp.client-ip=209.85.210.45
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb5a9f02e8so10923a34.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783611809; x=1784216609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K71vA2rRxJHnRmY4YuInHn+JTOnkMM3kjsWFyARkKU4=;
        b=gEYXdEq9nRZbXdd/wrFq1do5TqiYjXSW94459W5MmhV5Xeyaf/hcrvCvUVGE448PMK
         TQNNjHq9f7FqqO7N46i7+rAJmwaQmOoza3zqAz6hqFi5qWRpKW0LCGUCMHcrmFcr9Ihw
         7gIGBpwxuSlCQiffMs5I0nTRgqeKS0Z4ZR7I6Ip/RpA1/JdIznKiV2cUcHhkjAOFDOy7
         Vxzc7D8/gAlXaCfBsRtO1cI9Y2+3KcdmuMrD54Gj+I/x6H5W2FvLl5eVu+7RQHvVgy6Z
         ylQGXLubndBym826n7XPXDijePHj7mCAZP+HlKbLfMkKQUjFIjw2C6hgPz4saxTVPMi+
         up5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611809; x=1784216609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K71vA2rRxJHnRmY4YuInHn+JTOnkMM3kjsWFyARkKU4=;
        b=ltOcpnN0roafBFpOPaoM4YIJsqfL/d4JWfIn+ijh2VOC/cB5FcOYYzvulp64Zr6uLL
         Mj8HkcoJ5CWBs4JT+D2T/3TO264QNiE731D//lfw7VHCcc6Xx/Xf7QHFr1IcNDXqkta0
         IVMNgI3oqf4xD4/jJSEznphC9l+0jWlmP6VXhOf6J1/FqDclhG8V6TE5NQw+o1Wqsn74
         rvzXosWM5sydnGE1ACXRT3g6orUSfYUYRcKF2KK34JN3hIe3bmK7NBPcA2kHdy1Z/D3s
         e7a8BptuMSh27JO+og0CBahkq4snMnIpRBH72UD257A708hZ7nSP6fzu7uUeq3wcwlgc
         ggyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/T3Jm2c0cSj/bxYDb5ALVOSUIqlg8T5Gx62wCF86e0XNpTYCTftTzduIR1pcOCO58TC8CHXI993/JR@vger.kernel.org
X-Gm-Message-State: AOJu0YwszHrzc4oO3LRFhvzcXYedtJ0nK/5PEEemylHqqPk4akAsDY/e
	bbkygfhqIetC+IPIir5gyXJJKJ4TixMBvj9+ybxDtAFzP8cOmRxeWDYz2qrOKsRiTz0=
X-Gm-Gg: AfdE7ckqwxf6IbVs/qcuVL1eoHRoR5K30nHhuyFkeLTw5iPz8RCqK5JvDiY2ekFFRbQ
	oyqjssBUokwY5rpO6AsPPou4L+V706eDT8qCvo0CymiYlSmMP9Otz4W+rbg4Bq9Z9+oU8RjVzNb
	wbIlV2/eNqvv5THc0s2weeOC3bSBjcAzjD9J7B0q+1uVOUUrNDejMWENMa/dKX5GCmPiSWqTSJD
	zMXK4Sqxz/xZF6r+Y88hj6oP3RfmzXoLXL9GlYIWw+AuzFfvP9jPo4Vx789FbJDGICxb0/BpsKU
	8y3Piz2nRWGGYFouwYj7iwGWTvFabCpsw9zL4xzCBgCXrALyiK65HZ4C81sqBJcPHNf5f3h2qPM
	FjqpgPIB5GdH6yc52KS+1oRfizcKMC2N55bq+j0e9evPNfcKKR4CM3oTq/62K9jyh/M18e6qoyw
	S9OBXMGx+C0ALwA2yUU5et+CBZnPyqkCw/hZZHjwiJX8a0eVcTRwqWMlnlptvvEnw=
X-Received: by 2002:a05:6830:82bb:b0:7dc:cdea:7d9 with SMTP id 46e09a7af769-7ebcff82b2dmr5550730a34.22.1783611808795;
        Thu, 09 Jul 2026 08:43:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:2a8b:8d9e:f359:9a35? ([2600:8803:e7e4:500:2a8b:8d9e:f359:9a35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f27besm4343356a34.25.2026.07.09.08.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:43:28 -0700 (PDT)
Message-ID: <36df7c4f-82ea-4ed5-a4f9-3a29c75dc99a@baylibre.com>
Date: Thu, 9 Jul 2026 10:43:27 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39751-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:dkim,baylibre.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 605B77330F1

On 7/9/26 3:50 AM, Janani Sunil wrote:
> Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
> simultaneous sampling ADC
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  .../devicetree/bindings/iio/adc/adi,ad7768.yaml    | 285 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 292 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
> new file mode 100644
> index 000000000000..b74fe6aef01c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
> @@ -0,0 +1,285 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/adi,ad7768.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7768 and AD7768-4 ADC
> +
> +maintainers:
> +  - Janani Sunil <janani.sunil@analog.com>
> +
> +description: |
> +  The AD7768 is a 8-channel, 24-bit simultaneous sampling ADC with configurable
> +  power and performance modes. The AD7768-4 is a 4-channel version.

Probably worth mentioning that this binding is for SPI mode, not for pin control
mode.

And that the io-backend is for the data output interface, so consumes the DOUTx,
DCLK, DRDY. Maybe also START? And SYNC_{IN,OUT}?

> +
> +  Datasheet at:
> +    https://www.analog.com/media/en/technical-documentation/data-sheets/ad7768.pdf

A link to the example HDL project for the io-backend would be helpful too.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7768
> +      - adi,ad7768-4
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: Master clock (MCLK)

Could also be XTAL{1,2}.

> +
> +  avdd-supply:
> +    description: Analog power supply AVDD1 (4.5V to 5.5V)
> +
> +  avss-supply:
> +    description: Analog ground/negative supply AVSS (0V to -2.75V)
> +

What about AV{DD,SS}{1,2}{A,B} supplies?

> +  dvdd-supply:
> +    description: Analog power supply AVDD2 (2.0V to 5.5V)
> +
> +  iovdd-supply:
> +    description: Digital I/O power supply (1.8V or 2.25V to 3.6V)
> +
> +  vref-supply:
> +    description: ADC reference voltage supply

There is more that one reference voltage input. so ref1-supply, ref2-supply.

vref is the name of an internal signal, so doesn't make sense here.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to the active-low RESET pin
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  adi,data-lines-number:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8]
> +    description:
> +      Number of data output lines used for serial interface.

This could be made a bit more clear that this is a secondary data
output interface, not the SPI lines.

> +      AD7768 supports 1, 2, or 8 lines. AD7768-4 supports 1 or 4 lines.
> +
> +  adi,common-mode-output:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - avdd-avss-half
> +      - 1.65V
> +      - 2.5V
> +      - 2.14V
> +    description:
> +      Common mode voltage output selection.

Why not using standard regulator provider bindings for this?

> +
> +  adi,vcm-power-down:
> +    type: boolean
> +    description: Power down the common mode output buffer

Is the buffer separate from the output? In that case I would expect
buffer to be in the property name, otherwise this should just be
part of the enum options above (and the default one at that).

> +
> +  adi,power-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - low
> +      - median
> +      - fast
> +    description:
> +      Power mode selection.

Unless there are pins that control this, it seems like it should be
left up to the driver to decide how to set this.

In this case, it looks like the power mode also influences sample rate
which is normally something controlled at runtime.

> +
> +  io-backends:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^channel@[0-7]$":
> +    type: object
> +    description: |
> +      Represents the external channels which are connected to the device.
> +      AD7768 supports channels 0-7, AD7768-4 supports channels 0-3.
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +        description: The channel number
> +
> +      adi,ch-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 1
> +        description: |
> +          Channel mode selection. The AD7768 supports two independent
> +          configuration profiles (Mode A and Mode B) for filter and
> +          decimation settings. Each channel can be assigned to either mode:
> +            0 - Channel uses Mode A filter and decimation settings
> +            1 - Channel uses Mode B filter and decimation settings

This could probably be handled in the driver. E.g. allow per-channel settings
that just get stored in a data structure. Then when starting a buffered read
check that all enabled channels have at most 2 different groups of settings.
Then do all of the required register config at that time.

> +
> +      adi,prebuf-pos-en:
> +        type: boolean
> +        description: Enable positive input precharge buffer
> +
> +      adi,prebuf-neg-en:
> +        type: boolean
> +        description: Enable negative input precharge buffer
> +
> +      adi,refbuf-pos-en:
> +        type: boolean
> +        description: Enable positive reference buffer
> +
> +      adi,refbuf-neg-en:
> +        type: boolean
> +        description: Enable negative reference buffer
> +
> +    required:
> +      - reg
> +      - adi,ch-mode
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - avss-supply
> +  - dvdd-supply
> +  - iovdd-supply
> +  - vref-supply

> +  - adi,data-lines-number

Suggest making the highest number of lines the default instead
of making this property required.


> +  - adi,common-mode-output

Should probably default to disabled, unless it is always used?
Changing it to a regulator provider makes this not relevant.

> +  - io-backends
> +


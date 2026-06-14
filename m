Return-Path: <linux-gpio+bounces-38419-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfelIMQUL2r67gQAu9opvQ
	(envelope-from <linux-gpio+bounces-38419-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:53:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF62682381
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pxnSti5g;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38419-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38419-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76AFB3007AC8
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 20:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C164F32B136;
	Sun, 14 Jun 2026 20:53:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E8320A00
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 20:53:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781470398; cv=none; b=lbyPu33Iu3jdop1muM/njF3YJl3v76CMUzHvGBUjVxym3tM8moCuc9Y/jSaKwBZmkEDXZ2AhLm2CE+g4uKEHcLj4RZJyUOMnjbV8cw9NQeRdwHTAy214D3frOj/LZfkvLpQL76631AnTXGlUzCIZColEtV1oyKLCahKU3EE5VI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781470398; c=relaxed/simple;
	bh=nSDzCXKT3jQnRAcphUHmXusud9gWL+o/NpnAWujBRdg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Xy/j0VgEVI6G6sDKjaVHQKpeuWvwljgNTxkjyIGA/aE71TMu5sNL7lKhLQoniAGok3pCD5BFUhodk2ZoZyLCHU3PJQdUHJRkKt0y69OFf3WKWO43hw3HMqQ4n6PlE1quM8hvxPZ4TWwhuu8rj56Xr1kc7taPsYP9sjR4y4KPBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxnSti5g; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ab02fb64b0so1428506e0c.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 13:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781470396; x=1782075196; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhzWVFBovbUbRqI9wqfpVReAjsX1CU4k99CUksmW2lE=;
        b=pxnSti5gBAr0tPxM+BI89Ue/9l3vE08b2Fatruwe3xCaUxC3vdGVpx4aB/w/lvUNqT
         bvTO+qPRv+btYkYv97KO7+NmspEZgAXaakHWlsV7u89Oipj/RRJW4CCtMz9LRzq+cKOX
         NxWuaMkiyY6UJHcQ3UILaVjwU8hil8BcVaUJMq11Gukjpc5Zzif1m/Zyhf7rpQd0/JTG
         RPhrh9n/gJbODdyr+/xu7bvjUGxqQK2C6szJOi366waMVeFuUaPQx1gY/ZtaFh77DlMM
         l2Ggf26wgpjdulNOtOTMEIOX70yJvrBfLa24y2jbomD79xMSKTpgrhB4GQe3Q3yInS+l
         euog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781470396; x=1782075196;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhzWVFBovbUbRqI9wqfpVReAjsX1CU4k99CUksmW2lE=;
        b=HU2nAyCU8941uKuhXj0tdUPseN9cw9TryqS9g1dmpOCwsUyjWfjPMN/EoM/SJwUQK7
         C23QH7O6KIQLc4l0ynFlgvvrFYcjITpLt7JR9RKWUqZFjd5FYvH1FfY6Mku+JgLWCcdS
         GtyBGVNWZ1QekJ2xjNeKzMTT6OzF7+m+qC0QnntITYUeAwe2nM3lTOxEqRCcieoRGaor
         BBooo4NR5L0VMbYa6CMkpCyjvlEIwzhefJrdc9LNApZPTeUPeZSlSQp/DuVuT4psXmMN
         fKn29uZcceG3zNlyFudzukKdm/Se7HsPUEE58bGu2lnNZQyGC7j5tGebihfuzlorcRjb
         E8/w==
X-Forwarded-Encrypted: i=1; AFNElJ/vPCTFTRy5bPVLv4XkqWYZiPiZ8Wn8ZuVxa0iUbTZhdTAs5+9Avq/DL8aFFf7s1etYDL6h8T43D7SC@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTZelEztaUOvGemIOBT4Cm/rIkmnOuKOH7IgTudPp9pxq56Gw
	1Y0ZhOXLBHIClbh1lW0ZjHHOgbHKB7b9ZoFGDolN7BkxO1JHfTNXBjCC
X-Gm-Gg: Acq92OHMNA5JvnIrdKiCD11uOt2M8ku50YAnqEZOzhEiYG49+boCYnM0gTXOf2zFVvr
	VGvznsS6I+QRiL8wbgzCfthAN3AYhNyU4oEWDcNc1GvuwGwRhYcHAEoD46SO2SKJcHm2NknA52P
	nKHbQirOoTYArmlscjYcqKt9X7/NWIHTMtEo/Wv7EJTYOx8EzWAXI+2NPnu244DA+9F4er4+Axf
	5tsQANFuRifbYucZP9z0Mf2OeWbo8fN+YCt6TfjD3lLIjxsVWfcAB6Ki9aF+wa3PR1/yw8M4Qrn
	RB3iU9Kn97uSDcar97KT7G6YkeT7hxnNFeQungIcW5sWGYDOn6uWi2Z3/HJdlBXsrN1gJte68hB
	ZXWFC8HzH4mtjUVkBAxOR+4qy5qIVP64cl7tDZ+7H/qE5l8M28L22BeJa1H394Kj+S6q+nUmxDC
	sq6dzQyCBXPWo8AQ==
X-Received: by 2002:a05:6122:3c53:b0:5a2:9154:2792 with SMTP id 71dfb90a1353d-5bb6c058399mr6140865e0c.7.1781470396353;
        Sun, 14 Jun 2026 13:53:16 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb900138e8sm2216269e0c.6.2026.06.14.13.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 13:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 15:53:14 -0500
Message-Id: <DJ92JT0CPSXJ.1113K3KLSRHH4@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: Add TI ADS126x ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
 <20260613-loyal-azure-goldfish-cf6d54@quoll>
In-Reply-To: <20260613-loyal-azure-goldfish-cf6d54@quoll>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38419-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:kuurtb@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAF62682381

Hi Krzysztof,

On Sat Jun 13, 2026 at 1:54 PM -05, Krzysztof Kozlowski wrote:
> On Fri, Jun 12, 2026 at 05:46:19PM -0500, Kurt Borja wrote:
>> +  ti,neg-refmux:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Selects the negative voltage reference input:
>> +      0: Internal 2.5 V reference
>> +      1: AIN1 pin
>> +      2: AIN3 pin
>> +      3: AIN5 pin
>> +      4: AVSS pin
>> +    minimum: 0
>> +    maximum: 4
>> +    default: 0
>> +
>> +  ti,vbias:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: Enables the level-shift voltage on the AINCOM pin.
>> +    default: false
>
> There is no such syntax, drop.

The "default: false" syntax? Sure I'll drop.

>
>> +
>> +  ti,idac1-pin:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Selects the analog input pin to connect IDAC1:
>> +      0: AIN0
>> +      1: AIN1
>> +      2: AIN2
>> +      3: AIN3
>> +      4: AIN4
>> +      5: AIN5
>> +      6: AIN6
>> +      7: AIN7
>> +      8: AIN8
>> +      9: AIN9
>> +      10: AINCOM
>> +      11: No Connection
>> +    minimum: 0
>> +    maximum: 11
>> +    default: 11
>> +
>> +  ti,idac1-microamp:
>> +    description: Selects the current values of IDAC1.
>> +    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
>> +    default: 0
>> +
>> +  ti,idac2-pin:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Selects the analog input pin to connect IDAC2:
>> +      0: AIN0
>> +      1: AIN1
>> +      2: AIN2
>> +      3: AIN3
>> +      4: AIN4
>> +      5: AIN5
>> +      6: AIN6
>> +      7: AIN7
>> +      8: AIN8
>> +      9: AIN9
>> +      10: AINCOM
>> +      11: No Connection
>> +    minimum: 0
>> +    maximum: 11
>> +    default: 11
>> +
>> +  ti,idac2-microamp:
>> +    description: Selects the current values of IDAC2.
>> +    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
>> +    default: 0
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  '#io-channel-cells':
>> +    const: 1
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>> +  adc:
>> +    $ref: /schemas/iio/adc/ti,ads1263-adc2.yaml#
>
> Not a separate device node. Fold into the parent... or explain in
> commit msg. You have entire commit msg to explain odd things.
>
> In that binding description you call it "independent", so it should have
> its own SPI chip select? Why "independent" and part of this binding?
> Maybe not independent, so basically part of this device?

It's independent in the sense that it is a proper subdevice on the same
chip. It shares the serial interface but operates completely in
parallel.

I decided to add a subnode because other devices might request their
io-channels and most importantly a different voltage reference might be
connected to it.

I'll clarify this in the commmit message on the next version. Although
after seeing this submitted bindings [1], I wonder if it's a better
approach to do something like

	spi@0 {
		mydevice@0 {
			...
			adc@0 { ... };
			adc@1 { ... };
		};
	};

Any thoughts?

> Best regards,
> Krzysztof

Ack to the rest of comments.

[1] https://lore.kernel.org/linux-iio/20260519-ad5529r-driver-v3-1-267c0731=
aa68@analog.com/

--=20
Thanks,
 ~ Kurt


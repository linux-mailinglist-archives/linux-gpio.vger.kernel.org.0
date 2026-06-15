Return-Path: <linux-gpio+bounces-38432-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rEHvH0uCL2rVBgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38432-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:40:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE95683502
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LSq7aa6D;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38432-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38432-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5260A3008896
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 04:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB57305693;
	Mon, 15 Jun 2026 04:40:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DCF30566D
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 04:40:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781498435; cv=none; b=EuXF9D/BtL1Hf56HL1EGxLdcB8QZ7WLWTo5x92Ay5NeX9p082/mjKsDrZv9kZx+rLQ7ob2leT2+YinQ6m2iBwbxMQ9SaE69p6apgwGg/GZxylgWx9Mn1VpZT/Ou/RrIWhEu20ExFEHpJcqv5h/T/zdUBAW+qRwmXfz+TKLhxNYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781498435; c=relaxed/simple;
	bh=7duavQ222Pjg3G2ZNfIGpmYS3Gzto3uKYx0OaVsfd2U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=U1dPrs176yFc1/z4+DXmnbjamHiw0QEaHrwX+xABsksAGy3bP6E/+CNcFZpItDHuY2HMSxxl36RGzM3Y8krq76G/MPUo22ToNiJsZch7ncdVr9rUj+U/A6eiFNv4N2BACOxBSUb806+a0MP+eIxrQSwbGdfUt3bhqBrByhWU/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSq7aa6D; arc=none smtp.client-ip=209.85.222.52
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966aa0f3df4so328796241.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 21:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781498433; x=1782103233; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGB285QQfzjMEZKVcQE1jA6+Ydb7tIVKdW6CKVeUVnE=;
        b=LSq7aa6Dh2KBSg+dICMeTnDHu0bQLvd3xq9k1Qymi6uAThcYmwaRZ0f+QdYUcA8SzJ
         qoFdXyEB3k+unvb549Z+OaP+6B1xf/Xdhjl5kggib3Wrt+tmbic5RdHX42Uad/ZXmA3D
         4IrGO+wSRNziabpHgLdmoj2qZ5HJRFEXtlc39zp0tgHK0cNDS2G0fKEeH7sjthumrxpr
         WNvA/GiT3RMUgI5/35X1R1/SjSFca9yN1uTG0wOiijJq1TOSeyjAKz6+PQbBx97tXKS3
         qZZXizJ6ejUAC+f8OSTRLpBcwzKK7u0dmOQbkerNfcZ5A6EZJ+e54W/I5bAT4HGU0vsk
         3ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781498433; x=1782103233;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGB285QQfzjMEZKVcQE1jA6+Ydb7tIVKdW6CKVeUVnE=;
        b=gU65ekI1jRa8WXknJ0qqvFjlv922LiZrOdeiFtYU/1KTlRLIyV0xWPQ9J1DSyRkjXf
         /y2YTO7WMyYqih1HNS56Dvs+04fLdePr6Df5ltBG6R+7bNZPrBk5UBr7ENfPr1/N+LXT
         oaOcILtu49raDFns5SsxT5OcTCaiqd0394GJr/emDbhFCLwhhvlOfxgTu9Nm0D/mF57m
         6T1Saa6H8do8mjGeNyTYuS+xRmVE4GpPE/rgXHSVnhQCa7QnTjFOsiD4I/0LJfDAN5bd
         TnH/i7OJqWaVbFSX4Vq52OQS7ZqIua8YxgO6MkbLSGy5DOe/0avLB2iMc85GjctBkqRb
         QyYw==
X-Forwarded-Encrypted: i=1; AFNElJ+fRqpTTA9y2b7o8UgLzJX5Ks1rJPjEhyM8svwztrCWQfhBQzwcaAkOR+JqUq2EoVOt4UnN4ql4RYP4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2onzjZNyMl37qmyTVOcvRE5Zaf5gq0SM7f3l5+eeoyLdf8zQ1
	h6kHzMWfZGkBuRYqWJWxrGcsBtHbRVbeu25uwgu3ix3GHq+NTcLsKQc0
X-Gm-Gg: Acq92OF2fFkW31CVUyRBciFNl5JtRn/V9+TXhk9N1CTNk60wbuMkXxrhMcZCMfHOP6H
	04+Sx+BZKn5TJLUICHNQtG3EDg8RhRIbUz8R0uzv3hTSp58s74/h1yLEJL2wM1C7oUYErAQl5M/
	+mTEWn7NkjnnZcAcfMyJiyJvc3ZFtDt9VzcdoH+41yEMNcLx4gRstT6GGbLwI8aimNpivRHIHfF
	WUjprZxTSHDcYGzaAcX5bYFUoAG/m/qg0VnFx29osnPHTmLznYoWWWyCglgC+us5PLI2dTrh7QO
	feCIi9ZPHbif633BOZdFvTEnJiQL6RUAWNItei7Zj456WWV8sB6JymchhDQVvSPU4QOzHjUEoem
	7yNl4iEzLhp3h6fOJHbP7Q6biOB70UlRRkgD5YWvlLsWDPQ/j2VXXFKlW+C8fpvWWkvrLEqYlUv
	Zm5QqZusjytgKEnw==
X-Received: by 2002:a05:6102:4243:b0:633:d7ec:153c with SMTP id ada2fe7eead31-71f5e0f9832mr4264466137.3.1781498432649;
        Sun, 14 Jun 2026 21:40:32 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7208788587esm1915399137.10.2026.06.14.21.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 21:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 23:40:25 -0500
Message-Id: <DJ9CHIBMQDFE.19RJYS0VV5N6A@gmail.com>
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
 <DJ92JT0CPSXJ.1113K3KLSRHH4@gmail.com>
 <73d85fad-d39a-4c34-90c2-819998656f7a@kernel.org>
In-Reply-To: <73d85fad-d39a-4c34-90c2-819998656f7a@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38432-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAE95683502

On Sun Jun 14, 2026 at 11:34 PM -05, Krzysztof Kozlowski wrote:
> On 14/06/2026 22:53, Kurt Borja wrote:
>> Hi Krzysztof,
>>=20
>> On Sat Jun 13, 2026 at 1:54 PM -05, Krzysztof Kozlowski wrote:
>>> On Fri, Jun 12, 2026 at 05:46:19PM -0500, Kurt Borja wrote:
>>>> +  ti,neg-refmux:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: |
>>>> +      Selects the negative voltage reference input:
>>>> +      0: Internal 2.5 V reference
>>>> +      1: AIN1 pin
>>>> +      2: AIN3 pin
>>>> +      3: AIN5 pin
>>>> +      4: AVSS pin
>>>> +    minimum: 0
>>>> +    maximum: 4
>>>> +    default: 0
>>>> +
>>>> +  ti,vbias:
>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>> +    description: Enables the level-shift voltage on the AINCOM pin.
>>>> +    default: false
>>>
>>> There is no such syntax, drop.
>>=20
>> The "default: false" syntax? Sure I'll drop.
>>=20
>>>
>>>> +
>>>> +  ti,idac1-pin:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: |
>>>> +      Selects the analog input pin to connect IDAC1:
>>>> +      0: AIN0
>>>> +      1: AIN1
>>>> +      2: AIN2
>>>> +      3: AIN3
>>>> +      4: AIN4
>>>> +      5: AIN5
>>>> +      6: AIN6
>>>> +      7: AIN7
>>>> +      8: AIN8
>>>> +      9: AIN9
>>>> +      10: AINCOM
>>>> +      11: No Connection
>>>> +    minimum: 0
>>>> +    maximum: 11
>>>> +    default: 11
>>>> +
>>>> +  ti,idac1-microamp:
>>>> +    description: Selects the current values of IDAC1.
>>>> +    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
>>>> +    default: 0
>>>> +
>>>> +  ti,idac2-pin:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: |
>>>> +      Selects the analog input pin to connect IDAC2:
>>>> +      0: AIN0
>>>> +      1: AIN1
>>>> +      2: AIN2
>>>> +      3: AIN3
>>>> +      4: AIN4
>>>> +      5: AIN5
>>>> +      6: AIN6
>>>> +      7: AIN7
>>>> +      8: AIN8
>>>> +      9: AIN9
>>>> +      10: AINCOM
>>>> +      11: No Connection
>>>> +    minimum: 0
>>>> +    maximum: 11
>>>> +    default: 11
>>>> +
>>>> +  ti,idac2-microamp:
>>>> +    description: Selects the current values of IDAC2.
>>>> +    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
>>>> +    default: 0
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  '#io-channel-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#gpio-cells':
>>>> +    const: 2
>>>> +
>>>> +  gpio-controller: true
>>>> +
>>>> +  adc:
>>>> +    $ref: /schemas/iio/adc/ti,ads1263-adc2.yaml#
>>>
>>> Not a separate device node. Fold into the parent... or explain in
>>> commit msg. You have entire commit msg to explain odd things.
>>>
>>> In that binding description you call it "independent", so it should hav=
e
>>> its own SPI chip select? Why "independent" and part of this binding?
>>> Maybe not independent, so basically part of this device?
>>=20
>> It's independent in the sense that it is a proper subdevice on the same
>
> You cannot use DT syntax as argument why you use DT syntax like that.

I'm not saying subdevice in the DT sense, I'm saying subdevice in the
actual secondary ADC inside the chip sense.

>
>
>> chip. It shares the serial interface but operates completely in
>> parallel.
>
> How completely in parallel? If the interface is the same, then it does
> not operate in parallel. It's impossible.

It does conversions in parallel, communication is of course still
serial.

>
>>=20
>> I decided to add a subnode because other devices might request their
>> io-channels and most importantly a different voltage reference might be
>> connected to it.
>>=20
>> I'll clarify this in the commmit message on the next version. Although
>> after seeing this submitted bindings [1], I wonder if it's a better
>> approach to do something like
>>=20
>> 	spi@0 {
>> 		mydevice@0 {
>> 			...
>> 			adc@0 { ... };
>> 			adc@1 { ... };
>> 		};
>> 	};
>>=20
>> Any thoughts?
>
> Does not look like separate subnode. You still did not provide arguments
> why this is independent.

Well, there's not more arguments than this [1].

Anyway, I'll go for David's #io-channels-cells =3D <2> approach and drop
the subnode.

>
> Best regards,
> Krzysztof

[1] https://lore.kernel.org/linux-iio/DJ93WSYC3HTT.3NXQW390CLQ82@gmail.com/

--=20
Thanks,
 ~ Kurt


Return-Path: <linux-gpio+bounces-34033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HJ0AodgwWmaSgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 16:47:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F92F6E85
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 16:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52D2134C63E2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23143C1999;
	Mon, 23 Mar 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVkBF4Ok"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FE03C2762
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279012; cv=none; b=rvfX2yXKm81WgFlqSlJKeyZD+WAYzGs8v7Fdi7gU5wEgr/iOIyY+CA4g2wh5hC0gQi8x4qCbh4gHrzcOtvb2WFh4u6P19OjMTKW4B0INrdQyAmp5FceziZ6OJeJXFUFJgFAilrm2B5AClQrh1tdTXIDjtQPhTbXCexjKgWO3HUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279012; c=relaxed/simple;
	bh=YSmf7SfS+dyoKK/ONc677DunC4obvmMT1f04tsDKnmw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dLioEevRcAA0EI2UbDXSRLLJVSEo3el/XYzf7/OU2vyUICqjouMmjXhhbDDAcFNziIX7LBbwnzQ5t/rvYgSlmN6hV93ij7PAY4fcwskuryw8e+/4QMN/UgyaDPpBmZhDjvKn999QmhSmE3QgIiMFeHU2/MooQJxMc2ewHGijkyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVkBF4Ok; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b45bb7548so3124047f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774279010; x=1774883810; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JNANK6Rws1vPjepUbdhCzlW9rrYItMAN/Gh+hzvMyN8=;
        b=SVkBF4OkFL0iko6YQO829KDX4ElyXVFFl8ngecxNpqqLQx9TeBYWjct80wb1y04X8s
         lL6o3MV42WBJryML8GJnPdO2bmc8wGuBZDrxP0SK9PYMnerL6M7VD799eag/8UGbQ/9l
         PmELcO9s9YCQQoTlSi3QgruFV7YWaVFZefooz20sdIyalIkY5qfP00SjbsxKQqqI+poc
         bC7Jk7mYTqefgMKfJjdnvTfnC+mKjbdx8V3bHMEPkKuh2dosTDJjVljKZGxNGTh2BM6y
         EVVUUcGd+dgXu1e5xxVpcrykrIYFbl++MBeENhPa82qVdBI4WpGgRKI03cpSgEqwppiy
         EOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279010; x=1774883810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNANK6Rws1vPjepUbdhCzlW9rrYItMAN/Gh+hzvMyN8=;
        b=JRwa/qR/4i9i3w8xBKjPPBmtGUhRvbWNLuCZ3XtnsLU0EVt3y1PQb1RafujnwbERhk
         2wRsas03bxHtpuB+i9E1Lhwv7cTTZ1jxYnE1OhOtH5JQYCWwXzZBqiOW6x9KvQUpUXyo
         IhbeGwKYtTdjXwH4lqfqEu7b5ko0SBojZzhm5PJc3QfmbJ4MSCYZ16iM/NB7qoFvmVP1
         ne6w7Id7lR4BqIV8WSIF5zXo+XRGCJrXCgWAcZYy7lf1Zv3sJPyE0rv4rX8/Y/9wB8Va
         M7aChIpf5MaeKnzZvNSKCjigKxke2Gm7h7zT1rjQzK8c4snF5D+9+PYdGjAW0k2onBb4
         hTMQ==
X-Gm-Message-State: AOJu0Yyl2G7Qlg10ng/GnyOT7xDnDysd1wecJ2tqd9rLKqE2ByjfjUp+
	JknOiV8lfdiTMTU8Rv0lpqjB/rPVzyE9Y1p4Szr1ENaEdaAC9VFV1BiV
X-Gm-Gg: ATEYQzxw73XrBOLIw8FwRSY9cqykVemLgE3Mi+8QHVcJJf+CAKNwMT0Dt0ZKdCT28F0
	I6tOCTOm1/velFDAyMbqQQoJBJUfnu/6BkQVj3kVJ/AGGTtTc1sdYhbUKwhDpT3v2zxvJlbmXCf
	4wm6O/fQz1kv1Z9ZSsI2QAt5+UABYcI3L4ocCPuG6B9rkGsz9gGoxlEhSxlq//FwjnvHxYfPei0
	X6V7yzy07qVq/YAaJ8KqPKrXX66zqY2AyPw+LKzEmUkR66Fb/+qyUCZtzvF9llcscR45wntYoHn
	fmLDHbEru1idrRRdgkz/LXvTYOGJ/BhC4KYZof9/Cly8EcnM1p0VpjVYF1vqWCNy2LpNcK5MPf4
	NEclNVR0ybuqR64qxf0RiaJbnEIgNzbLdR0X4sek4QLtlemuqB8sDggcGEs4nsVdwXQiUr7cRXZ
	so2XSunwmfdBtwLo90sj380CmzBQveaPRmEnqNZHQWuA==
X-Received: by 2002:a05:6000:250f:b0:43b:4dd4:684f with SMTP id ffacd0b85a97d-43b6428b52amr20099451f8f.47.1774279009482;
        Mon, 23 Mar 2026 08:16:49 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm31561116f8f.17.2026.03.23.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:16:48 -0700 (PDT)
Message-ID: <63baaa6ea6ce7a8534046fea3d9f14fdb26f87a3.camel@gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	 <skhan@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 15:17:34 +0000
In-Reply-To: <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
	 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
	 <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
	 <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
	 <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34033-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B7F92F6E85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-03-23 at 07:33 -0700, Guenter Roeck wrote:
> [ ...]
> > > > +=C2=A0 adi,pgio1-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O1 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpio]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > +
> > > > +=C2=A0 adi,pgio2-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O2 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpio, a=
ctive_current_limiting]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > +
> > > > +=C2=A0 adi,pgio3-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O3 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good_input, power_good_in=
put, gpio]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good_input
> > > > +
> > > > +=C2=A0 adi,pgio4-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O4 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_external_fault, external_fault,=
 gpio]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_external_fault
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio1:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO1 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio2:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO2 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio3:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO3 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio4:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO4 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > >=20
> > > Does this dependency block force a redundant specification of adi,pgi=
o4-func?
> > > The default for adi,pgio4-func is inverted_external_fault, which mean=
s the
> > > default hardware state already supports external fault features.
> > > If a device tree legitimately omits adi,pgio4-func to rely on that de=
fault,
> > > will it fail schema validation here since the dependencies keyword st=
rictly
> > > checks for the literal presence of properties without injecting defau=
lts?
> >=20
> > Fair point. I guess it will fail but the alternative is to not have any=
 constrain at all so
> > maybe worth it to be explicit in here?
> >=20
>=20
> I don't claim to understand how to define devicetree properties, but
>=20
> adi,pgio4-func =3D <"gpio">
>=20
> and
>=20
> adi,gpio-on-adio4;
>=20
> seem to be equivalent to me, and omitting the first property (because

Not exactly. ADIO4 and PGIO4 are different pins and can be both configured
as GPIOs. ADIO is a boolean because they are either monitored by the ADC (d=
efault)
or configured as GPIOs. PGIOs can have additional configurations and hence =
the
enum.

- Nuno S=C3=A1

> it defaults to inverted_external_fault) would cause the second to fail.
> So either both would be necessary or none. If that is correct, what is
> the point of having the adi,gpio-on-adio4 property in the first place ?
>=20
> In other words, what is the difference between
> 	adi,pgio4-func =3D <"gpio">;
> 	adi,gpio-on-adio4;
>=20
> and
> 	adi,pgio4-func =3D <"gpio">;
> (with no boolean property) ?

>=20
> Thanks,
> Guenter


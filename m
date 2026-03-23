Return-Path: <linux-gpio+bounces-34039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOYaAP10wWkQTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:14:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0C2F99EC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54AE53581C43
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 16:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79803AD539;
	Mon, 23 Mar 2026 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkHyyJVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48791253932
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281990; cv=none; b=GIKW5wasXLMYSm16SY4kefULqmSh8Z1wFK8F8XzG3YWJXKKqj4rwKdIP0kWBVqSOepGATki2NCl9Ul5xGwiYjz574Z22yyIgD/7rZYsvJ/2RH1Cofh/Z4LHjiDu8w4A6wIlKhQaED0kJO/Yf8Iri5KFwCFhLgbBDQ+WCA2AVJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281990; c=relaxed/simple;
	bh=Z/LmWnslyMEA8KuS1V4Xy1sI8gOsop003nSeTpsLEAs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VW90ObsGTzZGlhSKyrgNVAQselUi88BlCj3ofEV+Ctmpr2/KUeJXC0cfEJGl1Hh57QAfQS2OjzbQAD3KYexnsmYVd0ZpyMp3AjFhOsN/4VUJpBhQTPYU/xQQty9HSAa6PdjyIJXQmq/6C/5jfWGryTTiR0EZqJjGbgf57Nlf1iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkHyyJVk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so36956025e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774281985; x=1774886785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iZ+8+0X30kHk32CK+85EMrU3OFRM220+pzBDKFOaV7I=;
        b=UkHyyJVkpURCccfu4FgMmG+38Vo9SZf7KCxtdSbAfvboG4SzQAkCPb9dr3PrYINV1o
         zFH256SA8yYsZ6lD+Pq/nOCsvETvekJq3/WonN68fHaQYjomZ931ZwibpWlh4kPMy0uZ
         WTPVULbC2/mX8IsumKPD90dQchmq+LIWFnX7W4y30/HHKwKLsKUJcIDqX8BiCDilhbWA
         k7Tmtp22BeQ1CI05HR8D3sG/4VDQKAcVo+BpgLKDunJSn5cjAicCnBItOQOJPxzfPJHS
         c7Rrk761SDhBKouRNpRHWoWIjhuSZ/nm28Cq/Hel5RvsY57oy1lvRgq0C72drLLAuDD0
         seow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281985; x=1774886785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ+8+0X30kHk32CK+85EMrU3OFRM220+pzBDKFOaV7I=;
        b=MYoueSL2HuYzvMfaiwlzgXEYydr0o/igyy49pjYukuqvTuCY6iu1W4341k5wm0YSzl
         zV/qdIl53eM4t5I7Y6aSeUVZuIsmXDSvCxRqDQmcHkI6X/7TTJKVsUMrfiezq0oA9TWp
         HxYUnKbGCShsf39YENcsRRi6rztFWjJHCzHbe2xA748c4ghCj/nfU6XaMiXPO+XdLjr/
         PGum+tBBnfyVqvwYbWATXzumOrGAuJhua8dwdJo0ZXBP4kCVo6ujckYsdIxrfNbXfb6v
         u6ubfqv/VaIpPr4y1xxrbOJdWLvEigh203F1gR46+7LicNvw7zMUlylCdLE72PdF6DkE
         KOyw==
X-Gm-Message-State: AOJu0Yy+XPgSEu+duqtvAD+R4tPBW1PlRVTHfgznW6LDgk6lT/clCSA4
	jzgYFl4kvhzkotGKVafjB5ZlvC8gpukIYv3EYMYM2mvqUgr6NiYv2ykw
X-Gm-Gg: ATEYQzwmN0vqeJdRpBeMvOCLL3dNja2bZMVoCATEAIqA3oR9DVGyBMO5sZUyFB7//Ly
	FR4g5I+FF4CYpzIvcd10pktYJpp+ri6q5NfGYp+yco04tKpuWtMMXzgVWaWLk+tJ2dZ8ADXSB+z
	ong1i/y91hyT2QWo6dX4bF9CRU7RLA2f+BBYs5AnE+bAWrczqW1fd9pr5RbLtcC2i5ODLSkhk0q
	pNB95x1GUXPeUmPgHO46kji0RaKqJn7BViP85bOXynEueHcmY/R2Kg/HJlJWsmKBILCDeeMvfGZ
	nmaNVIGHqeYzaSL9ZhiNdZEerai5HCn97bPmk2RrejEU76lOXGqfSmahvG1HTZLRhZ7Pz8gEdVS
	k8CEOnuvpqIIHAzXx5YVinLZu9Qb+192mQIFgZ/AuWSXsJKpuJlvvJUIbloF6KwKWGStiamzzOy
	7HtfqLfUevacOvDr10axq7e3Pr0CKs8pbfCaef1XwatQ==
X-Received: by 2002:a05:600c:6096:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4870f1fc5e2mr1845745e9.8.1774281985360;
        Mon, 23 Mar 2026 09:06:25 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm469841175e9.1.2026.03.23.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:06:25 -0700 (PDT)
Message-ID: <ff6a81b9fdefa6b6156f1af39943312d6a445145.camel@gmail.com>
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
Date: Mon, 23 Mar 2026 16:07:11 +0000
In-Reply-To: <821aafb4-d1a8-4611-addc-5bff4f1e187e@roeck-us.net>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
	 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
	 <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
	 <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
	 <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
	 <63baaa6ea6ce7a8534046fea3d9f14fdb26f87a3.camel@gmail.com>
	 <821aafb4-d1a8-4611-addc-5bff4f1e187e@roeck-us.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34039-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 43A0C2F99EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-03-23 at 08:27 -0700, Guenter Roeck wrote:
> On 3/23/26 08:17, Nuno S=C3=A1 wrote:
> > On Mon, 2026-03-23 at 07:33 -0700, Guenter Roeck wrote:
> > > [ ...]
> > > > > > +=C2=A0 adi,pgio1-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO1 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpi=
o]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > > > +
> > > > > > +=C2=A0 adi,pgio2-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO2 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpi=
o, active_current_limiting]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > > > +
> > > > > > +=C2=A0 adi,pgio3-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO3 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good_input, power_goo=
d_input, gpio]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good_input
> > > > > > +
> > > > > > +=C2=A0 adi,pgio4-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO4 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_external_fault, external_fa=
ult, gpio]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_external_fault
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio1:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO1 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio2:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO2 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio3:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO3 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio4:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO4 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > >=20
> > > > > Does this dependency block force a redundant specification of adi=
,pgio4-func?
> > > > > The default for adi,pgio4-func is inverted_external_fault, which =
means the
> > > > > default hardware state already supports external fault features.
> > > > > If a device tree legitimately omits adi,pgio4-func to rely on tha=
t default,
> > > > > will it fail schema validation here since the dependencies keywor=
d strictly
> > > > > checks for the literal presence of properties without injecting d=
efaults?
> > > >=20
> > > > Fair point. I guess it will fail but the alternative is to not have=
 any constrain at all so
> > > > maybe worth it to be explicit in here?
> > > >=20
> > >=20
> > > I don't claim to understand how to define devicetree properties, but
> > >=20
> > > adi,pgio4-func =3D <"gpio">
> > >=20
> > > and
> > >=20
> > > adi,gpio-on-adio4;
> > >=20
> > > seem to be equivalent to me, and omitting the first property (because
> >=20
> > Not exactly. ADIO4 and PGIO4 are different pins and can be both configu=
red
> > as GPIOs. ADIO is a boolean because they are either monitored by the AD=
C (default)
> > or configured as GPIOs. PGIOs can have additional configurations and he=
nce the
> > enum.
> >=20
>=20
> Ah, I didn't realize the small "A" vs. "G" difference (and apparently
> I don't understand what the AI is complaining about ;-). Sorry for the no=
ise.
>=20

My understanding about the AI complain is the below dependencies:

+  adi,external-fault-retry-enable:
+    - adi,pgio4-func
+  adi,external-fault-fet-off-enable:
+    - adi,pgio4-func

The default value (omitting the property) is a valid case to use any of the=
 above two
flags but with the above, omitting the property and adding the flag should =
result in
an error when validating the binding (because of the dependency). That is w=
hy I replied
with

"Fair point. I guess it will fail but the alternative is to not have any co=
nstrain at all so
maybe worth it to be explicit in here?"


- Nuno S=C3=A1



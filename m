Return-Path: <linux-gpio+bounces-34011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ElqHboXwWmcQgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:36:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290D2F03A2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 264FD306986F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91B9339705;
	Mon, 23 Mar 2026 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjj71JNm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F6136B047
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261860; cv=none; b=RLqUkkaprr5zyKbquF/QHJ3Anksx6i0EIpT/HA/C9YjJ6LsvQqbDfQc3MZ7g7PLcj8ASyNF5zX0NzeUe5RTAXoDSCu3RBeEItDGswr4v3QXkW/6ozgpBwZLxQQQHvX3+zCIusdXxJ5jGwnhyVc16RBxAtzmwyZAoDGQeJzHT+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261860; c=relaxed/simple;
	bh=9BTalxwlh1Mh2scj8wMZQq0AwVPesNF38J9Sd1pnlqg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PE1SbjzqMuyEAYxHzw3tGug7SZq9OoFq6ZG2Hk4Y8bRfYJdcL4eWxMWACyYg7wgn7RTZmh+moraiJbLtzoRbUNecEylfF73hl9yzxMqodn/RqmyHEfJqN2GBETdn/poj2YO18RAOpEe1eZwoiYZNLfYe1fncXGpyluNmW4zmVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjj71JNm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso2014021f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261857; x=1774866657; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FAUC7EMC761kM0AB4QTI5/vhwcsmLlwu3yojYOSJN0E=;
        b=Yjj71JNmxi4eJ88Tuv2R58gSrZpe8jl4ICrYgz3NAmse+MNKpirWzEgeYabhCpMxpT
         /qmsk3RZVsyFTdwFRE1QSeG+yIHZHzIIKR1Y7C5f3pvcqecXSBNW6W90e6LE9jHRdc8G
         nlI0UVc0k7RDcj8nl8LsyBQq89vtYGOxl6HaSM+wGfXp8raYLM/MmjY3hO/iQJr0vi3u
         Rs7tRcKy9SEnEQG7O//nr51AC5fv0A/mTut0bH003ralcroYJ5s5G7tKVtGM9aGVT0sR
         E1CswvIbVeuACp0oTVZTApIEiJ7CsDZR4Gmu8NPBAe7T5/uSvJFhGSAyZRwRqWOMUI+T
         xtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261857; x=1774866657;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAUC7EMC761kM0AB4QTI5/vhwcsmLlwu3yojYOSJN0E=;
        b=mWpIRQd81CN4Tlo0rNJHJvThMGo4iH1RXWeNwypQHvvivL+53sOV2TLxPqx9PfsSHt
         0ZWio3Dtch49V52hCsYx5EfspYV9oVIBPNxeECApmBqoG1mQe9eKsJrG5dtmvAHOblGk
         9WwpiilEPuA4P+BmM1ZNxLqxngQklYLY+iCPXyB9M/BGPBlh8SsXENOVBrhDcU0crn7E
         +0mygmciXhjwOTL92/yaoi4ZpMhBgBYiR+kKpgdzAN4CqjaSORPSZctWcp+D2VxmWV48
         ++zcyfMwZKxBDJB6PF0rKN22lFvgf4wdvhSb+9nGlctuKHhj3elXQxLtoFbscdX/Nj0w
         nWgA==
X-Gm-Message-State: AOJu0YzAeG24CsP8/vS6UFKW39Urexa81sSqOmREgQTEw3VOIdJ62j5+
	7unkqsec9FBe4gxX8QkfMgMgb+Miybqg0JZowHKOdiUqUpiU8x2Mu7Fz
X-Gm-Gg: ATEYQzzEz0MDRbdBENrkM5UZAR242iivixqKq08EfBraIL+1s+U6OMjsmdiIazA2r2D
	Uh4DECHbUp4JcxOQ4/I0S1qOo2kPhr4ETcOiC6FfCy1E6nv16sHMnb0PEz/3zXcmQvr9mdPPe1X
	mw7CMhrdAIkDHTgmJ/ICx0GwdIL5WB3cgMhQmNFGRYvCfDZVnpgO43HNX+TXkz78FDB11C6KfC+
	kj205mPs3ToK39ukriDl2klE5QpffaIsv1vk4M3FTcJ0Fc928VC5QZRGGDrm5KB0okrN10LQUiQ
	nbv+ramy4biTMR/Z+BbCI24a2dwImKl9Z0D+nJPByOqmxPeGB/SBujOqQo8L32OziNrm5CmSgg9
	K1fT9qZ+dkXIIQbY3JMY6u7kCdDyQ8PYUJVtqVO3lSDbRvZGf6bmAFZOzffi/teFHGYjiTFVv9g
	j4ffligEKOgfT2Rcpiht2+Czp/4n6+/cE=
X-Received: by 2002:a05:6000:2601:b0:43b:4352:1bd9 with SMTP id ffacd0b85a97d-43b64290e38mr17288556f8f.48.1774261856543;
        Mon, 23 Mar 2026 03:30:56 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd0dcsm27324936f8f.11.2026.03.23.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:30:56 -0700 (PDT)
Message-ID: <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
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
Date: Mon, 23 Mar 2026 10:31:42 +0000
In-Reply-To: <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
	 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
	 <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34011-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wiwynn.com:email,analog.com:email,analog.com:url,0.0.0.15:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3290D2F03A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-03-16 at 08:59 -0700, Guenter Roeck wrote:
> On Sat, Mar 14, 2026 at 10:52:19AM +0000, Nuno S=C3=A1 via B4 Relay wrote=
:
> > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > The LTC4283 is a negative voltage hot swap controller that drives an
> > external N-channel MOSFET to allow a board to be safely inserted and
> > removed from a live backplane.
> >=20
> > Special note for the "adi,vpower-drns-enable" property. It allows to ch=
oose
> > between the attenuated MOSFET drain voltage or the attenuated input
> > voltage at the RTNS pin (effectively choosing between input or output
> > power). This is a system level decision not really intended to change a=
t
> > runtime and hence is being added as a Firmware property.
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> Some AI review feedback inline. Feel free to ignore if wrong, but please =
let me know
> to help improve it.
>=20
> Thanks,
> Guenter
>=20
> > ---
> > =C2=A0.../devicetree/bindings/hwmon/adi,ltc4283.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 | 272 +++++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> > =C2=A02 files changed, 278 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> > b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..f82fff1ec7e4407ed63d00f=
8b1281db459d7221b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> > @@ -0,0 +1,272 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/adi,ltc4283.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LTC4283 Negative Voltage Hot Swap Controller
> > +
> > +maintainers:
> > +=C2=A0 - Nuno S=C3=A1 <nuno.sa@analog.com>
> > +
> > +description: |
> > +=C2=A0 The LTC4283 negative voltage hot swap controller drives an exte=
rnal N-channel
> > +=C2=A0 MOSFET to allow a board to be safely inserted and removed from =
a live
> > +=C2=A0 backplane.
> > +
> > +=C2=A0 https://www.analog.com/media/en/technical-documentation/data-sh=
eets/ltc4283.pdf
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,ltc4283
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 adi,rsense-nano-ohms:
> > +=C2=A0=C2=A0=C2=A0 description: Value of the sense resistor.
> > +
> > +=C2=A0 adi,current-limit-sense-microvolt:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The current limit sense voltage of the =
chip is adjustable between
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15mV and 30mV in 1mV steps. This effect=
ively limits the current
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on the load.
> > +=C2=A0=C2=A0=C2=A0 minimum: 15000
> > +=C2=A0=C2=A0=C2=A0 maximum: 30000
> > +=C2=A0=C2=A0=C2=A0 default: 15000
> > +
> > +=C2=A0 adi,current-limit-foldback-factor:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the foldback factor for the c=
urrent limit. The current limit
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can be reduced (folded back) to one of =
four preset levels. The value
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 represents the percentage of the curren=
t limit sense voltage to use
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 during foldback. A value of 100 means n=
o foldback.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0 enum: [10, 20, 50, 100]
> > +=C2=A0=C2=A0=C2=A0 default: 100
> > +
> > +=C2=A0 adi,cooling-delay-ms:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cooling time to apply after an overcurr=
ent fault, FET bad or
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 external fault.
> > +=C2=A0=C2=A0=C2=A0 enum: [512, 1002, 2005, 4100, 8190, 16400, 32800, 6=
5600]
> > +=C2=A0=C2=A0=C2=A0 default: 512
> > +
> > +=C2=A0 adi,fet-bad-timer-delay-ms:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FET bad timer delay. After a FET bad st=
atus condition is detected,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this timer is started. If the condition=
 persists for the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specified time, the FET is turned off a=
nd a fault is logged.
> > +=C2=A0=C2=A0=C2=A0 enum: [256, 512, 1002, 2005]
> > +=C2=A0=C2=A0=C2=A0 default: 256
> > +
> > +=C2=A0 adi,power-good-reset-on-fet:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If set, resets the power good status wh=
en the MOSFET is turned off.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Otherwise, it resets when a low output =
voltage is detected.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,fet-turn-off-disable:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If set, the MOSFET is turned off immedi=
ately when a FET fault is detected.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
>=20
> Is there a logic inversion between the property name and its description?
> The property name uses a -disable suffix, but the description says "If se=
t,
> the MOSFET is turned off immediately", which sounds like it is enabling t=
he
> behavior rather than disabling it.

Yes. Misleading description. This has -disable because the default is the -=
enable case which
indeed is the case when the FET is turned off. Will update the description =
so that is not
confusing.

> > +
> > +=C2=A0 adi,tmr-pull-down-disable:
> > +=C2=A0=C2=A0=C2=A0 description: Disables 2uA pull-down current on the =
TMR pin.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,dvdt-inrush-control-disable:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enables dV/dt inrush control during sta=
rtup. In dV/dt mode, the inrush
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current is limited by controlling a con=
stant output voltage ramp rate.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If not set, the inrush control mechanis=
m is active current limiting.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
>=20
> Does this description contradict the property name?
> The -disable suffix implies the property turns off the dV/dt inrush contr=
ol,
> but the description states that setting the property enables it.
>=20
> [ Non-AI note: It seems to me that the description contradicts itself.=
=20
> =C2=A0 It first says "_Enables_ ...", then it says "If _not_ set, the inr=
ush control
> =C2=A0 mechanism is active current limiting" ]

Yeah same thing as above. I will update this one just by s/Enables/Disables=
/

>=20
> > +
> > +=C2=A0 adi,fault-log-enable:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If set, enables logging fault registers=
 and ADC data into EEPROM upon a
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fault.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,vpower-drns-enable:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If set, enables the attenuated MOSFET d=
rain voltage to be monitored. This
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 effectively means that the MOSFET power=
 is monitored. If not set, the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 attenuated input voltage (and hence inp=
ut power) is monitored.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,external-fault-fet-off-enable:
> > +=C2=A0=C2=A0=C2=A0 description: Turns MOSFET off following an external=
 fault.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,undervoltage-retry-disable:
> > +=C2=A0=C2=A0=C2=A0 description: Do not retry to turn on the MOSFET aft=
er an undervoltage fault.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,overvoltage-retry-disable:
> > +=C2=A0=C2=A0=C2=A0 description: Do not retry to turn on the MOSFET aft=
er an overvoltage fault.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,external-fault-retry-enable:
> > +=C2=A0=C2=A0=C2=A0 description: Retry to turn on the MOSFET retry afte=
r an external fault.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
>=20
> This isn't a bug, but there's a typo in the description where the word
> "retry" is repeated.

ack.

>=20
> > +
> > +=C2=A0 adi,overcurrent-retries:
> > +=C2=A0=C2=A0=C2=A0 description: Configures auto-retry following an Ove=
rcurrent fault.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [latch-off, "1", "7", unlimited]
> > +=C2=A0=C2=A0=C2=A0 default: latch-off
> > +
> > +=C2=A0 adi,fet-bad-retries:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Configures auto-retry following a FET b=
ad fault and a consequent MOSFET
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 turn off.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [latch-off, "1", "7", unlimited]
> > +=C2=A0=C2=A0=C2=A0 default: latch-off
> > +
> > +=C2=A0 adi,pgio1-func:
> > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGIO1 p=
in.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpio]
> > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > +
> > +=C2=A0 adi,pgio2-func:
> > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGIO2 p=
in.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpio, activ=
e_current_limiting]
> > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > +
> > +=C2=A0 adi,pgio3-func:
> > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGIO3 p=
in.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good_input, power_good_input,=
 gpio]
> > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good_input
> > +
> > +=C2=A0 adi,pgio4-func:
> > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGIO4 p=
in.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [inverted_external_fault, external_fault, gpi=
o]
> > +=C2=A0=C2=A0=C2=A0 default: inverted_external_fault
> > +
> > +=C2=A0 adi,gpio-on-adio1:
> > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO1 pin is used as a GPI=
O.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,gpio-on-adio2:
> > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO2 pin is used as a GPI=
O.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,gpio-on-adio3:
> > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO3 pin is used as a GPI=
O.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,gpio-on-adio4:
> > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO4 pin is used as a GPI=
O.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
>=20
> Does this dependency block force a redundant specification of adi,pgio4-f=
unc?
> The default for adi,pgio4-func is inverted_external_fault, which means th=
e
> default hardware state already supports external fault features.
> If a device tree legitimately omits adi,pgio4-func to rely on that defaul=
t,
> will it fail schema validation here since the dependencies keyword strict=
ly
> checks for the literal presence of properties without injecting defaults?

Fair point. I guess it will fail but the alternative is to not have any con=
strain at all so
maybe worth it to be explicit in here?

- Nuno S=C3=A1

>=20
> > +
> > +=C2=A0 gpio-controller: true
> > +
> > +=C2=A0 '#gpio-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +dependencies:
> > +=C2=A0 adi,gpio-on-adio1:
> > +=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +=C2=A0 adi,gpio-on-adio2:
> > +=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +=C2=A0 adi,gpio-on-adio3:
> > +=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +=C2=A0 adi,gpio-on-adio4:
> > +=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +=C2=A0 adi,external-fault-retry-enable:
> > +=C2=A0=C2=A0=C2=A0 - adi,pgio4-func
> > +=C2=A0 adi,external-fault-fet-off-enable:
> > +=C2=A0=C2=A0=C2=A0 - adi,pgio4-func
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +=C2=A0 - adi,rsense-nano-ohms
> > +
> > +allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi,pgio1-func:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: gpio
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,pgio1-func
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi,pgio2-func:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: gpio
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,pgio2-func
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi,pgio3-func:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: gpio
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,pgio3-func
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi,pgio4-func:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: gpio
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,pgio4-func
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi,external-fault-retry-en=
able: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi,external-fault-fet-off-=
enable: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - gpio-controller
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - '#gpio-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 i2c {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swap-controller@15 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "adi,ltc4283";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x15>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,rsense-nano-ohms =3D <500>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,current-limit-sense-microvolt =3D <25000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,current-limit-foldback-factor =3D <10>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,cooling-delay-ms =3D <8190>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,fet-bad-timer-delay-ms =3D <512>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,external-fault-fet-off-enable;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,pgio4-func =3D "external_fault";
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,gpio-on-adio1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi=
,pgio1-func =3D "gpio";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpi=
o-controller;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #gp=
io-cells =3D <2>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0 };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 830c6f076b0029f0ff1abee148ad0e1905a60e82..13ae2f3db449e5fd3a7d0fb=
ac92aabdc01734ba9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15141,6 +15141,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi=
,ltc4282.yaml
> > =C2=A0F:	Documentation/hwmon/ltc4282.rst
> > =C2=A0F:	drivers/hwmon/ltc4282.c
> > =C2=A0
> > +LTC4283 HARDWARE MONITOR AND GPIO DRIVER
> > +M:	Nuno S=C3=A1 <nuno.sa@analog.com>
> > +L:	linux-hwmon@vger.kernel.org
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> > +
> > =C2=A0LTC4286 HARDWARE MONITOR DRIVER
> > =C2=A0M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > =C2=A0L:	linux-hwmon@vger.kernel.org
> >=20
> > --=20
> > 2.51.0
> >=20
> >=20
> >=20


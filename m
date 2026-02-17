Return-Path: <linux-gpio+bounces-31757-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCKfLnhvlGk0DwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31757-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:39:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 654CF14CAF0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9338E3010B54
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEC236AB7C;
	Tue, 17 Feb 2026 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZI6QteZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1142E32FA2D
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335542; cv=none; b=HFlPoE1CxIoMBfebpDwSMC6HBM+6N97dygiK9McFYcJmDukYBZyY69efbBrx4bSqGbZ99WQGtpbGKmooEPxiVAzv2WwNA7HZON9X3P4LCDcVJlw0M1VIu1uBKKLTh8iFo2x1SBCPEgJ/UpCfWfWnluxMdVCz+mDh1Q/bR+Jk+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335542; c=relaxed/simple;
	bh=Y0LzAqFzQUi2i67EjcX1opPvpHEPT9peUMvypNvEKzo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qwlh1lsn1I1FfbnIGh0Al0UCnC1jup4sK3jjqe0CD1RJLOkDPSinCaDP+o5gP09C5lERUFH8lVZDczIOxMWYTrjlF3Yh+JvVZ0XimWO0yMtgr302qxLToGTT9R//PjPG+ipAKki/Mj2AoyIGgiL4SGNqpd6FP54q3lqpEWoUZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZI6QteZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806bf39419so44903685e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771335539; x=1771940339; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y0LzAqFzQUi2i67EjcX1opPvpHEPT9peUMvypNvEKzo=;
        b=WZI6QteZt0KNkQj0bahiBgNfht7XTEJia8MSAgBvmjiLoNF+OlK2EIMEHKcdMIQh1i
         Tid313EfmeAubjoOQpWcNNwDf3ufU6xuCqwbgX71sPcnSRraXTaw2fwgR7B4e/SCDQIZ
         MjXd5B8lE6ZlCV8bVz/S6woZu0X24pRzP6HZm/x8LvNBa+wqRlBKCZkvWqt8xCKajXKt
         bdDRhPIzp03lqhJEKhNZ/bb3KOCLVm1d2dwD69lO6zt2DAnKns2OuQjGikEFwDnIC53Z
         vWd2CIvz4HUVOfpwfPxmboweA0RzcHHg6/5qBTgdkjYhEKV85kEyZ9i4gyf0cggFZ8bA
         rsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335539; x=1771940339;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0LzAqFzQUi2i67EjcX1opPvpHEPT9peUMvypNvEKzo=;
        b=Gt97ss/3sdbFv+/+3GTXHa0TTqhvSDAXD9lGF1BkiqNV0mF0s4KBoideDpxmO8GKBh
         3Q6KJqE+UZDLIGJyrCeCJU7BRcLNUTXjIs3PZNzEQCDDJrHy3lNyzWqXJh0skHVtnzqy
         tg9U81gYl2Pm1YHH9jqyOADw94/Mva1hK204CAiik7n/wX1vQF7pddU0Kw5ycRGrVU1f
         z0ywAo4tPNXOQvZKL/53kGDxm0tT9l7hLvHC5GlZ9vu4vLKFaY8bBmVcF5aTpEAWDPSa
         zD++5wh/ivRyFK9X/7k8O1Cd7S8iEcJKbT59dQPyx7b5f3KhNI/YKLU4l/CN/sBdWHKw
         crnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPFlWuOscVIEsAlq20oLn+q1D9p1kML5Xq8omntOzmj04fVHxJ7GCpiJQn1VkBhUi4JaSWtioPOb3k@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgacQlBa0WwXTEonPwlwJmi9eKjA7ChbUxOpnu9pz7Ax9NXfo
	l2J3we+Nc7izVGyTACdfPo04I1qjH3S+N2990FEsKVgYQTmDhWPZZ06G
X-Gm-Gg: AZuq6aJWB/2RJ5aP+XjacCjk92vGz67CtMRd3CLVPfiG15Y3Ug0CA2bBoAm5HO174mi
	9c3obij36ob3agOIrnGLZsmlhpNncp0D0r3UT8/n13v4uKToNTrCdDBRsj7ZH6JSatPCoryHjZz
	OOclBN7ARaCHFzJy7XHrt5P4ntgr5k9QTwWbdCKQNZDoKGbGNnLiufgd3bcTic7TNvh2s243i0A
	ocZ4FkV0j6pjMpjNsBpcHEfU3xMyfEnQ6idZZjTWgTV1WXO+dneZ6sLWtyafj31xMpH7VxvVHyL
	Pb2Ds/HvzBJBZ1gROm8yTtbryfgI1k/IqGDOTzQth82ZQpfWyomn4M3Xt5lhfIkyitHpSFDGkad
	wc0PvIuzasigdJ96GlVa2QRrY9pkCC0rOqn3OXfrqny5hSjzPm59vIwilb48Agx7E0fGI38Usfs
	gOlSBEJfvSqw3EcWKQLXgNBAH3aVzP1IQ=
X-Received: by 2002:a05:600c:4e8e:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-48378d62cbdmr212671725e9.6.1771335539392;
        Tue, 17 Feb 2026 05:38:59 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b07fsm33883088f8f.2.2026.02.17.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:38:59 -0800 (PST)
Message-ID: <4a9ecd101d502515d25a7f27a8043b6b592f510c.camel@gmail.com>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Feb 2026 13:39:42 +0000
In-Reply-To: <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31757-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 654CF14CAF0
X-Rspamd-Action: no action

On Sat, 2026-01-17 at 16:27 -0800, Guenter Roeck wrote:
> Hi Nuno,
>=20
> On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > This is v3 for the LTC4283 how swap controller. Main change is that I'm
> > now using the auxiliary bus for adding the GPIO device (done depending
> > on FW properties).
> >=20
> > Similar to the LTC4282 device, we're clearing some fault logs in the
> > reset_history attributes.
> >=20
> > Guenter, in [1] you can find some replies for some questions you had in
> > v2 that likely you don't remember anymore. Regarding the regmap story I
> > ended up adding a secong regmap for the 16 bit wide registers which
> > seems like a clean solution (if I'm not missing nothing).
> >=20
>=20
> Sorry for the long delay.
>=20
> Actually I prefer the solution used in the lm75 driver: Map all registers
> to 16-bit registers using a regmap bus. Would that be possible ?

Hi Guenter,

I intend to send the next iteration by the end of the week (finally!) but t=
here's something
I wanted to know if you have any strong opinion on.

So, the above is a bit annoying because of the energy reading which is 6 by=
tes long (so, 6 regmap
reads). Given that our custom bus will now have val_bits =3D 16 that won't =
work out of the box. So:

1. Either I directly use the i2c block API to get the 6 bytes.
2. Or I use regmap_bulk_read() with val_count of 3.

I don't like much of mixing regmap with "plain" bus calls but given it's on=
ly in one place, might
not be that bad. OTOH, to use regmap I do need to account for it (and yet a=
nother corner case) in
the read callback (so I do not use the i2c swapped version for the energy r=
eading).

I do not have any strong opinion but I'm more tempted in going with 1.

- Nuno S=C3=A1
>=20


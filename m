Return-Path: <linux-gpio+bounces-32646-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ABuMh2Uqml0TQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32646-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 09:45:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3823321D467
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 09:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9EA23025D21
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F12E37A498;
	Fri,  6 Mar 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="HXX1rf/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EC83793D9
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786659; cv=none; b=PE+6g/6hj0d/dGnh8I1BQsV3t56kTWExK+/xq+iYirjMgEceC+mdAkhX8I62ZZ7PzQqGfgn6UYOPvKycMosMP4VDfxxcPSrz1Dqb+S+KGJDyPpnsNdMnn0mQGeH8Lhbgxco1owRYvAOts1uOnlEU4Z04gedKHxsbJLIq4x68E2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786659; c=relaxed/simple;
	bh=D6F0UJ2ZkvqTPyGd9m4PkTYYRFrED8lZB9Mn0Ev+ROU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VB8DU4LsJ8PZDwWkKKaEGQndCa1bONzd3N4SZAxPguGibdw4e3LNkypB5B1h4K++RYUnRiUFr+4VkbZLstDQ8dyFXNDpHBaW4m4vQNx+fyaYtk3ajAPbDPQq3nDsAb8myeZtX/hCy3s+xbYh08tgpfs7mUAPhYiNA2n0WmzpJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=HXX1rf/2; arc=none smtp.client-ip=94.124.121.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=tAcuA+a1KykKeZ1RijPONIr+jxmrxZBNuPK76HmvjIs=;
	b=HXX1rf/24Zgl1mtZxcRUn2OX63+U873JJnduIY9pDgl3eIAHHpph0LV6CYUFvfR+wm7qMZD2OpxdE
	 P9zxqm0HkuuT2ZWsTk2GcJeMX0aeDj+C/r5IrD/tM2mSpB31az8OZhJY7pDC2861BykSYEM+QjimK8
	 eP6dJT707TCRoFjjfCwpjkXJlp1G5NKXh33oGOD7KCVPbw2woH9ExbNhyijyjJoIxiffOS0Vf7Ylhx
	 aS0bO+2uEwIRU+MWAw8qEeIrY9cIBFp2xrUaLfK84+qDRGdLSSeUF+mGW95pPW+mJHNE+YHuy8C3gk
	 R+XsGW6BWFDW9KKkmUq8Gkz1X9zT3xQ==
X-MSG-ID: a304989c-1938-11f1-9155-005056817704
Date: Fri, 6 Mar 2026 09:44:06 +0100
From: David Jander <david@protonic.nl>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, "Rob Herring (Arm)" <robh@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260306094406.6cafaeea@erd003.prtnl>
In-Reply-To: <CAD++jL=Gaaq0_20wDjjPkYwpyL6HWx7bmKqBmy_tieYu4scB6Q@mail.gmail.com>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
	<20260303133947.1123575-2-o.rempel@pengutronix.de>
	<177254885509.3251575.14819823286886805862.robh@kernel.org>
	<aacH7NmkOzZued0Y@pengutronix.de>
	<20260304-graceful-sweet-bittern-98efdb@quoll>
	<20260304100642.44d00b99@erd003.prtnl>
	<4d4c6ebc-698b-44c2-9a91-607381d6ece1@kernel.org>
	<20260304112500.4766f21b@erd003.prtnl>
	<98debf2d-cc29-42dc-bb93-ee97439683fd@kernel.org>
	<20260304131731.4d54f051@erd003.prtnl>
	<CAD++jLkK5od7cODqQ2BsEKE7tvp8vVAsv6erLu1dEzcn35F8QA@mail.gmail.com>
	<20260305161019.09b67af2@erd003.prtnl>
	<CAD++jL=Gaaq0_20wDjjPkYwpyL6HWx7bmKqBmy_tieYu4scB6Q@mail.gmail.com>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3823321D467
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[protonic.nl:s=202111];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[protonic.nl];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-32646-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@protonic.nl,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[protonic.nl:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonic.nl:dkim,protonic.nl:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 6 Mar 2026 00:40:16 +0100
Linus Walleij <linusw@kernel.org> wrote:

> On Thu, Mar 5, 2026 at 4:10=E2=80=AFPM David Jander <david@protonic.nl> w=
rote:
>=20
> > I am tempted to think that hardware developers that use this chip might=
 expect
> > the GPIO driver to report the state as it is read from the register. Bu=
t I
> > suspect that the Linux kernel GPIO framework might enforce strictly the
> > logical state to be equal to the voltage at the pin (i.e. logic 0 =3D=
=3D zero volt,
> > and logic 1 =3D=3D positive non-zero voltage), but is this true? =20
>=20
> GPIO assumes all values are expressing the (raw) voltage on the pin
> clamped to [0,1] logic level.

This sounds like a good, usable definition. I like it, but I can't find it =
in
the documentation. To make it more complete, I'd add one more clarification=
 in
case we deal with negative voltage levels (0 and -5V for example), but it is
usable for this case. Where can I find it? Or.. should we add it to the
documentation if it isn't documented this way yet?

> It can further invert the meaning of this using GPIO_ACTIVE_LOW,
> ACTIVE LOW means the same as  "overstrike"  or #VAL in schematic
> so if a signal is active low and low voltage on the board it is
> presented as active (1) to the consumers in the kernel or
> userspace.
>=20
> If it represents anything else than the raw logic voltage on the line,
> the semantics of GPIO_ACTIVE_LOW would be completely
> confusing.
>=20
> To represent switch states, I think using drivers or userspace code
> should interpret this.
>=20
> You can also add a custom debugfs file to your driver to help
> users by providing the actual switch state and more.

Thanks for clarifying. This makes sense taking into account the above
definition of raw logic-level =3D=3D raw voltage on pin clamped to [0,1].
But for the future users of this driver I would need this officially defined
somewhere, so I can point there to avoid confusion.

Best regards,

--=20
David Jander


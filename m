Return-Path: <linux-gpio+bounces-37745-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iALJGkAnHWoTWAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37745-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 08:31:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC861A326
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 08:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DD633009F1A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 06:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A820352010;
	Mon,  1 Jun 2026 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lgC7B6TW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CCA351C11;
	Mon,  1 Jun 2026 06:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295486; cv=none; b=ZQpqomZAy9w83G9xE81oI0VcATZhGJpShAb58mIVrC27Fqj1fCpfJjXEMzNUj1a2tFffltG6gkgHVy7S595UCruBh1sCi/b5IuI3dJl2POH7n+hCqISpKTBLj97Mv6aAfR3b5qo2DQUlqF2UhDC2hga9WzSQYpQKqgZsYY/vdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295486; c=relaxed/simple;
	bh=I8KXjAyuNXeuuMsloXYajtR75GKbIc3oHuSDObx7qKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MWaIqrArGOsDh1TflWZpz8fencfmL0n6ZwIfoAOdE20kS3fdrTBNM4GG7VE0Ts7HiDaqICljO2K/0UI20FBMC/TMbSRntoV3kxveVnHCg6iQ1/ut9MaoncxuFRTYa1+/Pt1qiUQBlIoxGYRE2yDW+0U4YUrcax2m3/oLhr1GR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lgC7B6TW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 72D15266E7;
	Mon,  1 Jun 2026 08:31:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iL1MgKcrMD30; Mon,  1 Jun 2026 08:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780295480; bh=I8KXjAyuNXeuuMsloXYajtR75GKbIc3oHuSDObx7qKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lgC7B6TWJd2sXWVyuQrstI7ck5FfXY8mj8aADixZ2f9Tks/mWh0CEQB3p/bc6CJMO
	 U+v1T3NFYaRKWAoTwBZPo57rcu/6y5/x5uDWWvBkuiIBi1CLb7Q2xSXLAh4VO9ULHx
	 nEl300vLBT/AFU3k8lWhrSp8JhepXRXTDv7HII7AbmoppugwgAk0qm6YtNVfqwtFo7
	 AIOB84/VqQy+HplSsetkNaooI1htsSS2xp1zrfyE9Dyv+vCx0Xeu7yUKppaahbPScX
	 lKxsfSjpoGKNu4GTC7tT4L51wg8md9hP2mWVvqfh4MTR1hIlk62UWJsswXeznI59D4
	 sAmQJVfnwMclA==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] gpiolib: acpi: prevent address truncation in OperationRegion
 handler
Date: Mon, 01 Jun 2026 08:31:07 +0200
Message-ID: <E-mMsrTwTb25-dMfwNVoOg@disroot.org>
In-Reply-To: <20260601050238.GM3102@black.igk.intel.com>
References:
 <20260530094012.184276-1-scardracs@disroot.org>
 <20260530094012.184276-2-scardracs@disroot.org>
 <20260601050238.GM3102@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37745-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Queue-Id: 1CCC861A326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In data luned=C3=AC 1 giugno 2026 07:02:38 Ora legale dell=E2=80=99Europa c=
entrale, Mika=20
Westerberg ha scritto:
> Hi,
>=20
> On Sat, May 30, 2026 at 11:40:11AM +0200, Marco Scardovi wrote:
> > The ACPI address space handler for GPIO OperationRegions receives the
> > pin offset as a 64-bit acpi_physical_address. However, the handler
> > truncates this address to a u16 pin_index before validating it.
> >=20
> > If an ACPI table attempts to access a pin offset greater than 65535,
> > the truncation wraps the index around. This may result in accesses to
> > unintended GPIO pins.
>=20
> If you look at the ACPI spec:
>=20
> https://uefi.org/specs/ACPI/6.5/06_Device_Configuration.html#connection-d=
esc
> riptors
>=20
> the pin number is 2 bytes and 0xffff is defined as no connection. So the
> firmware cannot really think that it can access GPIO outside of that rang=
e.
>=20
Hi Mika,

You are right that GPIO connection descriptors define pin indices as 16-bit
values and that 0xffff is reserved as "no connection".

My concern is that `address` is provided by ACPICA as a 64-bit
`acpi_physical_address`, while the GPIO driver immediately narrows it:

```
u16 pin_index =3D address;
```

At this point, the value is converted to the target type before any
validation against the GPIO resource is performed in the driver.

The intention of the change is to ensure that the GPIO layer validates the
value against its 16-bit domain before narrowing it, so that validation is
performed on the original value received from ACPICA rather than on a
truncated representation.

This keeps the type boundary explicit at the GPIO driver level, where the
semantic meaning of the value (GPIO pin index) is actually enforced.
>
> > Fix this by adding an explicit check to verify that the 64-bit address
> > is less than agpio->pin_table_length before assigning it to the u16
> > pin_index, returning AE_BAD_PARAMETER if it is out of bounds.
> > Additionally, make the length calculation overflow-safe and change the
> > types of length and loop counter to unsigned.
> >=20
> > Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> > ---
> >=20
> >  drivers/gpio/gpiolib-acpi-core.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpiolib-acpi-core.c
> > b/drivers/gpio/gpiolib-acpi-core.c index eb8a40cfb7a9..049e4cbc14ed
> > 100644
> > --- a/drivers/gpio/gpiolib-acpi-core.c
> > +++ b/drivers/gpio/gpiolib-acpi-core.c
> > @@ -1087,10 +1087,10 @@ acpi_gpio_adr_space_handler(u32 function,
> > acpi_physical_address address,>=20
> >  	struct gpio_chip *chip =3D achip->chip;
> >  	struct acpi_resource_gpio *agpio;
> >  	struct acpi_resource *ares;
> >=20
> > -	u16 pin_index =3D address;
> > +	unsigned int length;
> >=20
> >  	acpi_status status;
> >=20
> > -	int length;
> > -	int i;
> > +	unsigned int i;
> > +	u16 pin_index;
> >=20
> >  	status =3D acpi_buffer_to_resource(achip->conn_info.connection,
> >  =09
> >  					 achip-
>conn_info.length, &ares);
> >=20
> > @@ -1110,7 +1110,16 @@ acpi_gpio_adr_space_handler(u32 function,
> > acpi_physical_address address,>=20
> >  		return AE_BAD_PARAMETER;
> >  =09
> >  	}
> >=20
> > -	length =3D min(agpio->pin_table_length, pin_index + bits);
> > +	if (address >=3D agpio->pin_table_length) {
> > +		ACPI_FREE(ares);
> > +		return AE_BAD_PARAMETER;
> > +	}
> > +
> > +	pin_index =3D address;
> > +	if (bits > agpio->pin_table_length - pin_index)
> > +		length =3D agpio->pin_table_length;
> > +	else
> > +		length =3D pin_index + bits;
> >=20
> >  	for (i =3D pin_index; i < length; ++i) {
> >  =09
> >  		unsigned int pin =3D agpio->pin_table[i];
> >  		struct acpi_gpio_connection *conn;






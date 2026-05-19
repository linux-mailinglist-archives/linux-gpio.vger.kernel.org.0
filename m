Return-Path: <linux-gpio+bounces-37159-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBOFLZuIDGo1iwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37159-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 17:58:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E85581D87
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 17:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF3A93061DD7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 15:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5647633BBAD;
	Tue, 19 May 2026 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gclc7VPX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0861D340401
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206047; cv=none; b=S2ycxYYgGc4Of6rCX9sJ/GXDkcShek3zACtfH5BXTmygavmxl42/ijhngK5WQsFIuqW6LghowZhP18PGBtAUSeEkD1pHoQUBUOqh14id+f40HokcihppBJSL9TtW9gE06A+Aj1/ieRZduG/kXFCEosz4d7X/40iiN7+ns+R2+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206047; c=relaxed/simple;
	bh=OVioMqoIu+9ktI4bVQpNMxvUoCyEeEFsFhAP4FJ5Edw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm2D/yuNnDAo3a3M42Xz2Ou7DI1EL+qG2g0bCKQC2ckAShQrrC2t2LDoQ27zsNxK+qrY2gnm+T6YllqA/fRIaVqGQuYHz5mc9YJJ/6Mio/eekxm7CP2As+o1kmENgxSsRYcHjoEgCzPB0CwlJU5WcVwI9vpn8NqtpSawoF7sJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gclc7VPX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48fde648a71so27653735e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779206043; x=1779810843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPI0LbBQbs0i1qcRKAFHdtQON78QLzqTLAB/hEHcKJE=;
        b=gclc7VPXiXvpNRYY8VYWNpkknf4Z7ldYX/HJ5uiurHCiPvBYUW8CJtiSrLbgHsG52L
         ke3BPhkr1vXyZMt78Zj/zbmzcw7YfaJDKGvazDjc15vGZTGpUWPL/7mMevHsa8+TVxKG
         ciOckXcxXvtUZW7HIfbZefO6FkV5F6PVpx5oGU1ktMZDY6Kbvp4ZfP4xbx/wCGUmF6fc
         v1U9+bcqApzn1aLls1YsRpXG7O+c+by4MLNzbDkFY/+vymlSG+KQ/pGxMfGXF3nx5z9v
         nMLt4yQSTMGhqrqVj2nT8c0zNs53CL66k4kj4ZxTo9X84rH2Bh7T9/wioXR8YG7+5UTz
         kfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206043; x=1779810843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPI0LbBQbs0i1qcRKAFHdtQON78QLzqTLAB/hEHcKJE=;
        b=fun4DSmYQqYjpaFuYgCVA00cawHn8f8evFBpeDXr+l2IE5rkY9bmn+bFMikRXTMTMF
         a3wOR8lzGhqhQnn66USwy27SAyy2sMuVZzRplilrftS6rPRfBo9iQI0kKkjekbgkrsPE
         wTp603jDvpOXmq4Xgm4VTqzopmb3R2OUmgIcCn6qZG56+WmC2PN2ko0A6ydm5WXRHFn5
         LVxSgYYZZsnG6bocDZWlu0h9bntinylVj5x3wj5UNyZGBFY8oMxNOZBa2EyqZ9ucBrik
         zRVCtO47qusijrJQ1E6GLxWoLpMlujKEnYigLvbmtuOctYP8O+dQ5pe1i9KzLnwRqxkv
         JQzg==
X-Forwarded-Encrypted: i=1; AFNElJ9RQKg8N46M9SWoNl96dgqdUVM+sKRx9qQxDsjqU5MglynehVm0dzkT391yxMhq0Nrk5YiqGf9JOnRh@vger.kernel.org
X-Gm-Message-State: AOJu0Yznngk5tyZ28ltr26f/26EnqkvKXccenfKNSKWmC1NyWqfIM8pc
	ObtxS9ckAXy6TPz4/inKPZDVhikzzNDgsi/ijXVppblh4zrFHJk4Rxm7eVgrWfmNyQE=
X-Gm-Gg: Acq92OHWOr0rC8M70fKV9Z3JiAI8T8p9TrMHUN7bzAcYRRh7r3wYBpzNedgrrlo8Twe
	2PExOiD1V1gNsJ0akCUqcSlXty0WsQrRHxSlIo57J+Wr2HTPRUAJVQhbCCl0TDrESnrxBZ4o4EO
	NibNtaW6RaJad+AehxZDPCoEW30Se4ZDJvnSrVVn5Jv0DW9kcCIlevk3pTOvxH85o723CsF9CkB
	2dIb1wluWqxnWDTx4JVwXAbjvKYSzqJilDGiXlJY2f21SNvJ53iN6NB6Uw/EIEkLTtpFejr+Fmo
	mgbDq5StZpQtZX58vcfCklasGMhxWnZwpd5BXxe1FgodN1e17BBPvX9kog3mYW6GjFeBOACrsoi
	x8dR6CXSu/uVjLnb+GaKJPglAQ46tpuNXU2ZVdn7lcqjGxqC7FtmaXSDNU4g9KwjbYFo6qLqgGi
	4QNIXXqwD3+669EQqU6P+ZVQdcE4nmJf9jp0dZyUKjxFGUZeW5JkRXlD9Gbx+jSNjGzhMm0GqiV
	rIuUTcEsKavVSzMWM7q4CSQ5A==
X-Received: by 2002:a05:600c:3493:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48fe4cae12dmr311374705e9.1.1779206043209;
        Tue, 19 May 2026 08:54:03 -0700 (PDT)
Received: from localhost (p200300f65f47db048a8dfcf61053817f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8a8d:fcf6:1053:817f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe57944c1sm366642375e9.7.2026.05.19.08.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:54:02 -0700 (PDT)
Date: Tue, 19 May 2026 17:54:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Initialize i2c_device_id arrays using member names
Message-ID: <agyF1NA5TKv7WD6P@monoceros>
References: <20260512152125.924433-2-u.kleine-koenig@baylibre.com>
 <177909044656.4685.10308837875925010657.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6qtykroarc34juu2"
Content-Disposition: inline
In-Reply-To: <177909044656.4685.10308837875925010657.b4-ty@oss.qualcomm.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37159-lists,linux-gpio=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 35E85581D87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--6qtykroarc34juu2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpio: Initialize i2c_device_id arrays using member names
MIME-Version: 1.0

Hello Bartosz,

On Mon, May 18, 2026 at 09:47:45AM +0200, Bartosz Golaszewski wrote:
>=20
> On Tue, 12 May 2026 17:21:25 +0200, Uwe Kleine-K=F6nig (The Capable Hub) =
wrote:
> > While being less compact, using named initializers allows to more easily
> > see which members of the structs are assigned which value without having
> > to lookup the declaration of the struct. And it's also more robust
> > against changes to the struct definition.
> >=20
> > The mentioned robustness is relevant for a planned change to struct
> > i2c_device_id that replaces .driver_data by an anonymous union.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] gpio: Initialize i2c_device_id arrays using member names
>       https://git.kernel.org/brgl/c/553e26a45e0e66698c1e0043b705933102ac3=
edc

in the meantime I improved my workflow to also adapt i2c_device_id
arrays that don't make use of .driver_data. For drivers/gpio that would
be:

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index e5ac2d211013..27a80d1143a1 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -499,8 +499,8 @@ static int adnp_i2c_probe(struct i2c_client *client)
 }
=20
 static const struct i2c_device_id adnp_i2c_id[] =3D {
-	{ "gpio-adnp" },
-	{ },
+	{ .name =3D "gpio-adnp" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adnp_i2c_id);
=20
diff --git a/drivers/gpio/gpio-ds4520.c b/drivers/gpio/gpio-ds4520.c
index f52ecae382a4..5add662a7ef5 100644
--- a/drivers/gpio/gpio-ds4520.c
+++ b/drivers/gpio/gpio-ds4520.c
@@ -54,7 +54,7 @@ static const struct of_device_id ds4520_gpio_of_match_tab=
le[] =3D {
 MODULE_DEVICE_TABLE(of, ds4520_gpio_of_match_table);
=20
 static const struct i2c_device_id ds4520_gpio_id_table[] =3D {
-	{ "ds4520-gpio" },
+	{ .name =3D "ds4520-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds4520_gpio_id_table);
diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index afc1b8461dab..45b02d36e66f 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -150,7 +150,7 @@ static const __maybe_unused struct of_device_id fxl6408=
_dt_ids[] =3D {
 MODULE_DEVICE_TABLE(of, fxl6408_dt_ids);
=20
 static const struct i2c_device_id fxl6408_id[] =3D {
-	{ "fxl6408" },
+	{ .name =3D "fxl6408" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fxl6408_id);
diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index 2e5d97b7363f..bf1f91c3c4a8 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -109,7 +109,7 @@ static int gw_pld_probe(struct i2c_client *client)
 }
=20
 static const struct i2c_device_id gw_pld_id[] =3D {
-	{ "gw-pld", },
+	{ .name =3D "gw-pld" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, gw_pld_id);
diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
index 621d609ece90..62f2434c0d79 100644
--- a/drivers/gpio/gpio-max7300.c
+++ b/drivers/gpio/gpio-max7300.c
@@ -53,7 +53,7 @@ static void max7300_remove(struct i2c_client *client)
 }
=20
 static const struct i2c_device_id max7300_id[] =3D {
-	{ "max7300" },
+	{ .name =3D "max7300" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max7300_id);
diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index 866ff2d436d5..c38538653e99 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -112,7 +112,7 @@ static int tpic2810_probe(struct i2c_client *client)
 }
=20
 static const struct i2c_device_id tpic2810_id_table[] =3D {
-	{ "tpic2810", },
+	{ .name =3D "tpic2810" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, tpic2810_id_table);
diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index d9ee8fc77ccd..b46b48e56c56 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -175,7 +175,7 @@ static int ts4900_gpio_probe(struct i2c_client *client)
 }
=20
 static const struct i2c_device_id ts4900_gpio_id_table[] =3D {
-	{ "ts4900-gpio", },
+	{ .name =3D "ts4900-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ts4900_gpio_id_table);

These changes would fit to be squashed into the patch you merged. Would
you prefer to do that, or should I put these changes into a separate
patch?

Best regards
Uwe

--6qtykroarc34juu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoMh5YACgkQj4D7WH0S
/k5HRAgAolkiR9L95K14sbCkovNCj73B9FMS8CDt8TEjwT0W0wq5b08NGyV25qw2
vc0EthjicU8EaAoJq3Il6PhmfH3acJPjptOlYLKGpcgE10VwpWnPXC4oMbpueqQ2
Pfo/Bzb1cq/KeXMtBA0zUWP8gGl+dmJxuEwjNGerxPcWDTyT7JUlaYm3LNpW5St0
ShkX1CG872yCm8H8V+gZHXoUHcCczRzqlEzF2UhxLw2KfILC1lUv6zi2gxV2Y0cU
ca1ls4bpgtVYnMO7jmyl47Kst31d4RxU5D7Y2IL5FKVG3YNLHXS+2udhLzmb0kxU
UFz5YPjCkiUUgARC6AmfFuwcL51W0w==
=zNAv
-----END PGP SIGNATURE-----

--6qtykroarc34juu2--


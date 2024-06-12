Return-Path: <linux-gpio+bounces-7389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B073904FF9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 12:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF53280EEF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 10:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A0316E869;
	Wed, 12 Jun 2024 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Lx2HAkYr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E7D16DEB6
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186625; cv=none; b=Q7HfKfHUhg4t3kwHLkopUzWS+NnpOYkVZJA0PBLpgy9Dm5hejHvzv2Urh4wTO+fTAUW/rs3rtTfSD0TGvcFwZRKVPta7qyWFb7pq4xupM15JtJv/yQHPIhUzFnJUnaagT1vW+mt5X3dmY0Nqay5L7Xv5nue43wsAt0b1bYRN3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186625; c=relaxed/simple;
	bh=+55Nvekl/FD1qqRLwZ3qbL7Jw6AMS+/quMVjAN//7LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVKw9IpAY70WG9N1ur8kQr45uWqzPQvznXOl2YWpEFtAm4KMnSeV+QPu4xKTZ+JoGfvhbP3tDMd+2UuJkm8w3Yp54LrqUnP5J5Do680tlVO66NTd8nPEbfI7fGxb9yqysffKTjKwF7GfGiSZC92ZXjzKdb5aecUqW47rsDldTQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Lx2HAkYr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ux2s
	acGbdN9mSTkUplQzXMjSYbFp3+/ou8CtQwUKLbE=; b=Lx2HAkYrSnEfCoMjoCjQ
	zQxmIuwqCwpMOZaX+ieXSmIgC+2XmUdSwWMLp2XTS+uBcxjKPE5xYtgsyXq8xTst
	eSGGJhZ+5qSoPptJLhGUlrW0MUopqGP83hTDdOpEha+Qs11PGeOTHuGDrXOouuRt
	3YtTe2RHcPXPysDAGcqpjLdvgKEc+De9j7VdWfWpZoCDRo2qmpN/aX7Va4iVNZoa
	Fndvmsdtb15GHINoCmIPLkAuNkzn8nOPSPDwi8aNJF1EUfOdP1nPp4ja247Q7OVn
	90ATZM+ji77oZETfPhkAbInCvPu+j7Og5cqLLoLBvBHI2eHfqJ5st37pQLCIAEpj
	wA==
Received: (qmail 757851 invoked from network); 12 Jun 2024 12:03:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2024 12:03:32 +0200
X-UD-Smtp-Session: l3s3148p1@oUuyfq4aUDltKPDc
Date: Wed, 12 Jun 2024 12:03:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <wdvnbt2vpobukz3s6pxkowoizvsxjeycnb3rmfsmfbx5zsgvrp@mog64h2ogftv>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <ZmcN6lJAGVxY3Ok2@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wj5fobjlv4oflgqg"
Content-Disposition: inline
In-Reply-To: <ZmcN6lJAGVxY3Ok2@surfacebook.localdomain>


--wj5fobjlv4oflgqg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,


> > +#include <linux/delay.h>
>=20
> + device.h
> + err.h

OK about the includes.

> > +	mutex_lock(&priv->blob_lock);
>=20
> guard() (from cleanup.h)?

If you insist. I doesn't save an exit path, so I don't think this will
improve readability of the code. But I don't mind...

> > +static const struct file_operations fops_trigger =3D {
> > +	.owner =3D THIS_MODULE,
> > +	.open =3D trigger_open,
> > +	.write =3D trigger_write,
> > +	.llseek =3D no_llseek,
> > +	.release =3D single_release,
> > +};
>=20
> Wondering if you can use DEFINE_SHOW_STORE_ATTRIBUTE(), or if it makes se=
nse.
> It might be that it requires to use DEFINE_SHOW_ATTRIBUTE() for the sake =
of
> consistency, but I don't remember if there is a difference WRT debugfs us=
age.

Well, then we can just leave it for now and change it later, if desired.

> > +	mutex_init(&priv->blob_lock);
>=20
> devm_mutex_init()

OK.

> > +		new_meta =3D devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL=
);
>=20
> Can it be rewritten to use devm_krealloc_array()?

'meta' is not an array?

> > +	dev_info(dev, "initialized");
>=20
> Do we need this? Existence of folder in debugfs is enough indication of
> success, no?

Since the script can now list instances easily, this can be argued.
Still, I don't think this matters much for a debug-only device.

> > +static const struct of_device_id gpio_la_poll_of_match[] =3D {
> > +	{ .compatible =3D GPIO_LA_NAME, },
>=20
> Redundant inner comma.

Yes.

> > +late_initcall(gpio_la_poll_init);
>=20
> Why? Can we add a comment?

Sure.

> Btw, have you tried `shellcheck` against your script?

We did this in one of the 8 previous iterations.

All the best,

   Wolfram


--wj5fobjlv4oflgqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZpcm8ACgkQFA3kzBSg
KbZG+Q/8DO5hqL7b1XR0sD1SMJviOoyciDYILbF19jHtnENPh96Sexa7fj5HdsfE
k8oyoeTUPX4LPLgFOTmr5SRHmiWjEb5s6oTgtNxJZqNFeFtglEK1QWUM5tANwQoy
L4S7bTO8J91J3WwdNChdvDQkfSLbAVGUTBvbm4iZcDihOCtGdScZCm+hGF1LqTxK
LE/2/8mwKfFymnGSbH/siPsb+CmtXMHuJNOhJlaI0KvNLIfHINkYJpBSPwMP3flV
v/VIqwt39AIm+5TbTPazDcrOY4NciJ9nRIjLfqHxTSnIbCZaMUfqPK/CYgLWTmD4
oFVvFZFP77yaVpPWjdkECDJJtfI9kkCMH+DgH7p6+6YoRhb2xDFWetS1JS25xJYR
vFodZggVj0wEsjqPb2GiaZRM+A+D6GEtjNszeDj3zlCInV6luHTcRuJ4NoNDLVNZ
XsFdHefQWoRv0/Kv5FY79tijNUNbGcwemt5d4wi4VFqfGZti5IFCbcb+/G+h18Hw
+EDb3KWhybHNENl3QPn0hYVCqDOAQrKInUcqVR0Ph0uYTzxMmfTLdk2wIX9I3+Li
fF7tI/JGxDHXZaT8KiQtFv9PEXgYheqLt7EdzSkTBrbydR9rcLg5l1cSy5Np8F7u
d+zalrnyfGKSxIxMGX16RQkMIya4Xd2R620+e64o6eTV7gV36O8=
=EuJ1
-----END PGP SIGNATURE-----

--wj5fobjlv4oflgqg--


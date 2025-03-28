Return-Path: <linux-gpio+bounces-18085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1DFA74750
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 11:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00E511B61CCA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 10:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4A9217651;
	Fri, 28 Mar 2025 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="TOhabFhh";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="A2ptIQhN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D81AA1EC;
	Fri, 28 Mar 2025 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156407; cv=fail; b=K52Z6+wdBHj5iFvUsAJSNjFsqwHRCs3UPYFc5kQODL9ohurZsjP8sIW3Mk6C2kriILvLABZAaNT/FIo1D2M4V/9Yyi5vjmAIIgDFUc3ap3OHGOtsMLlHSfFbRoo2Wf8bRG6HWqi7moyF7bQOSqrsrgnjsavc17DajrkoU9COiUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156407; c=relaxed/simple;
	bh=p23qkZkuG5kHW5k3P8Y5dgx3VdHcisSbwoYBC6bwWqU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBf4xAnD8ADML2lKrZPWHf1z05RXkKbuSDfDvVg8cdEVxX45Zr5peevxcZqZb5UwNqhFvIC+YeOB/vttj0L7zpYNMSeqkfeHNGvMCWzZSdkO3eX7aqevpkgC1crs3IkdpicPoedq2ogk7vELA3PIl7/Eb6HiTEJW70Ya19KIqTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=TOhabFhh; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=A2ptIQhN; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 2DB25480A54;
	Fri, 28 Mar 2025 06:00:18 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1743156018;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=fLaSVaGRSzrR9L+/Wsk8D9Ek1dAN1SYYhQQFP98Wewo=;
 b=TOhabFhhPSz+g5J7VIztDOn9uzYRxZlhhiQYQm11qSDPCO1XEztp3EnDIPpHRzFYlJgr6
 OmhZPfLv5ZLeNj6CA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1743156018;
	cv=none; b=uG2NXlSMN7d8PM8lD7YNHAdI2WdvUeJ06bVunsIsRegNF+zjJNtQcAYP8e79FNBb8mThOYV8on4wr2mYkh+Wh+GcPBIx/mzD6GY9id4qkkjNy7RwGM8xWktnGjXEzhF4Y0dl4lnaw2jS54sX3+L4itlxW0CGTRNh612GlGbcyMeHU5LBavDXbAYmBWP5ffnzEUpOSX3+jTSTPzHQGQ9fugXjHm+AWDyR3kpOSTXVwCl4Uf1lR3nIuXkzjditLh58kJUfJUws6Xk90nTZYcA8CuqTaxVodl68kvN49NXdf3xd6lTo+kbU01Qo8VFE+cvsdN7ylf1eyix2xmxvcPsx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1743156018; c=relaxed/simple;
	bh=p23qkZkuG5kHW5k3P8Y5dgx3VdHcisSbwoYBC6bwWqU=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=UzPxSkbgQFxmKqWbDT//FKv6Swc7MrpqpBHENCPCqj/IQwF3E9NB7xJT/HZbG2jEIqcEt/IKIJwDDRk9jH+gID2Y4mZ4N6kR3dUNgDFP/LBLoEpZXv8TEp2o1YT9GpZqie3uhBW5H8qqcQE40gc7k22v+m30GEKlkDyLLvoikzaMHDzA8nRtdJCN511pY+IcGI7Jm4HRhvDBaedkH79FlFEZoC7Yn3zPv+nalwWo4p2QDfuBkq9KJ+1l23wBWfkL8EcSZz44bNoWa51QPxacXk1EcqbFKyN7NkmwKbA/fQQVuRyDsI0X/npoTD2C1OcmVyMqX5fl1kDoMUg8WnMPQg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1743156018;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=fLaSVaGRSzrR9L+/Wsk8D9Ek1dAN1SYYhQQFP98Wewo=;
 b=A2ptIQhNBE6xKQc1/czbV7V9i9wMbhUIxeZswrGk4R4XRVpMOV6D6JOWYVKekeqOaDn48
 O5Flm1+mkGXBd3o5ugJX4WToGyCnZJ/GmFrVM4Lq7sz7Z1ARM4nFD7bKw6BRAc8GdCZeuiz
 wbKkdk8VbCI5oC+lj5YDXU0o+bjVpmgBmym4NHhBDbnXaKlr8+bLvK5DoXlbJ98yE4GaVIT
 ErXYCcrmzZZWl/g8YSv276iU+t6DfYb/GhECznpJv7ii8wFTK4+gsqr2roFxtVdGtDzaO5j
 FiYxsoEE7Aeb2pqixVKMq9hj3XB+FPIwE/vj7cXF5fBShUfv4ZPKgWYF6JZQ==
Received: by srv8.prv.sapience.com (Postfix) id E9A892801DA;
	Fri, 28 Mar 2025 06:00:17 -0400 (EDT)
Message-ID: <81b162e821747d807816673f89a171fbd0a0bba5.camel@sapience.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed -> missing pinctrl patch
From: Genes Lists <lists@sapience.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Mar 2025 06:00:17 -0400
In-Reply-To: <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com>
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
		 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
		 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
	 <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-+kRvFnljQR7bmyrjtiXd"
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-+kRvFnljQR7bmyrjtiXd
Content-Type: multipart/alternative; boundary="=-9CDVEwvVGa3EEGZipMsV"

--=-9CDVEwvVGa3EEGZipMsV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2025-03-16 at 08:48 -0400, Genes Lists wrote:
> On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golaszewski wrote:
> > On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists
> > <lists@sapience.com> said:
> > > On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
> > > > ......
>=20
> >=20
> > There are two problems here. The issue you're seeing is fixed in
> > next but
> > not in mainline due to my omission. I will send a patch for that.
> >=20
> > On the other hand, the pinctrl driver in question should be fixed
> > too.
> > Can you try the following change:
> >=20
> > diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> > b/drivers/pinctrl/intel/pinctrl-intel.c
> > index d889c7c878e2..0c6925b53d9f 100644
> > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > @@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct
> > gpio_chip *chip, unsigned int offset)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin =3D intel_gpio_to_pin(pc=
trl, offset, NULL, NULL);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pin < 0)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * For pins configured to functions other than
> > GPIO, default
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * to the safe INPUT value.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return GPIO_LINE_DIRECTION_IN;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D intel_get_padcfg(pct=
rl, pin, PADCFG0);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!reg)
> >=20
> > ?
> >=20
> > FYI: This was uncovered by commit 9d846b1aebbe ("gpiolib: check the
> > return value of gpio_chip::get_direction()").
> >=20
> > Bart
>=20
> Hi Bart - I don't see this pincntrl patch in mainline yet - =C2=A0what's
> your thinking on this?
>=20
> thanks!
>=20
>=20

Following up - same question - this patch is not in mainline as of
today. =C2=A0

Can you share your thoughts/plans on this one?

thanks.


--=20
Gene

--=-9CDVEwvVGa3EEGZipMsV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Sun, 2025-03-16 at 08:48 -0400, Genes Lists wr=
ote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex"><div>On Tue, 2025-03-11 at 10:40 -0700=
, Bartosz Golaszewski wrote:</div><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>On Tue, 1=
1 Mar 2025 15:03:59 +0100, Genes Lists &lt;<a href=3D"mailto:lists@sapience=
.com">lists@sapience.com</a>&gt; said:<br></div><blockquote type=3D"cite" s=
tyle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">=
<div>On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:<br></div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><div>......<br></div></blockquote></blockquote></blockq=
uote><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; b=
order-left:2px #729fcf solid;padding-left:1ex"><div><br></div><div>There ar=
e two problems here. The issue you're seeing is fixed in next but<br></div>=
<div>not in mainline due to my omission. I will send a patch for that.<br><=
/div><div><br></div><div>On the other hand, the pinctrl driver in question =
should be fixed too.<br></div><div>Can you try the following change:<br></d=
iv><div><br></div><div>diff --git a/drivers/pinctrl/intel/pinctrl-intel.c<b=
r></div><div>b/drivers/pinctrl/intel/pinctrl-intel.c<br></div><div>index d8=
89c7c878e2..0c6925b53d9f 100644<br></div><div>--- a/drivers/pinctrl/intel/p=
inctrl-intel.c<br></div><div>+++ b/drivers/pinctrl/intel/pinctrl-intel.c<br=
></div><div>@@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(stru=
ct<br></div><div>gpio_chip *chip, unsigned int offset)<br></div><div><br></=
div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pin =3D intel_gpio_to_p=
in(pctrl, offset, NULL, NULL);<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (pin &lt; 0)<br></div><div>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br></=
div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /*<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * For pins configured=
 to functions other than GPIO, default<br></div><div>+&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to =
the safe INPUT value.<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br></div><div>+&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return GPIO_LINE_DIRECTION_IN;<br></div><div><br></div><div>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D intel_get_padcfg(pctrl, pin, PADC=
FG0);<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!reg)<br=
></div><div><br></div><div>?<br></div><div><br></div><div>FYI: This was unc=
overed by commit 9d846b1aebbe ("gpiolib: check the<br></div><div>return val=
ue of gpio_chip::get_direction()").<br></div><div><br></div><div>Bart</div>=
</blockquote><div><br></div><div>Hi Bart - I don't see this pincntrl patch =
in mainline yet - &nbsp;what's your thinking on this?</div><div><br></div><=
div>thanks!</div><div><br></div><div><br></div><div><span><pre></pre></span=
></div></blockquote><div><br></div><div>Following up - same question - this=
 patch is not in mainline as of today. &nbsp;</div><div><br></div><div>Can =
you share your thoughts/plans on this one?</div><div><br></div><div>thanks.=
</div><div><br></div><div><br></div><div><span><pre>-- <br></pre><div><span=
 style=3D"background-color: inherit;">Gene</span></div><div><br></div></spa=
n></div></body></html>

--=-9CDVEwvVGa3EEGZipMsV--

--=-+kRvFnljQR7bmyrjtiXd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ+ZzMQAKCRA5BdB0L6Ze
2wJuAP9uub2yOGrvh+9LN5V2kRdG4RdTgqPjFiHcX/GgM/nblwEAtusqJk/k9x9G
Un35Mv8F9YHoYdzd4IwIIThr01Jk9As=
=Cs/3
-----END PGP SIGNATURE-----

--=-+kRvFnljQR7bmyrjtiXd--


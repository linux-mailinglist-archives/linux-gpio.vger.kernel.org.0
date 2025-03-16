Return-Path: <linux-gpio+bounces-17656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE275A635A7
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Mar 2025 13:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3CB13AB719
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Mar 2025 12:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B8719AD86;
	Sun, 16 Mar 2025 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="73JS9hj4";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="IBtYtlkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4383139B;
	Sun, 16 Mar 2025 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742129343; cv=fail; b=eQceoa+SsM46QYoaW5b2j27J+pRCruqTMfXelwGhihOIfgBnqfJfjkfnmzAPfTd+eDxJBu/bs14yV8Ylyr1aZgeUHPJGUuMA+7/tVHGVpQb3uakXY7mGWk3qUkOJKIMCUafMw0ADeKn0+vpmeNWG1HVpMgsVWTahdh5vXwU1W9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742129343; c=relaxed/simple;
	bh=vi91Pt6QOlfTXCKzKhBDCHcsLTlHmjFi2TZT8TbnHl0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HFMksBzy5I15fORP3H10mFHLlAKXXhQtsJFVyUcOTwb2wrcwF0K4oYUppzboU/fC69XBTP3fvQ5HqCr2Sq2z0gqw70GAo29yeIrKeWvheFEvJLMzDcdnxPWj3EddmpZzzmvDasm9fG077r87p0C2ZJ8P0Ig2fh7rAXmJx7hdEps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=73JS9hj4; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=IBtYtlkx; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 3AE25480AAB;
	Sun, 16 Mar 2025 08:48:55 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1742129335;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=6JIvjo9kK9/oJ+fTBwgiA9gSpZyKTHfI7J4Jg/hitwE=;
 b=73JS9hj4mXsProHbP9DbtOORksf1Im1JzcmXMy8RVNgq1ON+W4gROeYXokqyGgCtKzqfx
 dd60Zk3lPvz/6SzBw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1742129335;
	cv=none; b=b4F5mEWMqVXoDMfUa71c9qs8BHFFmVVeiHpj5s1eRsb78aFHQWrwucoB4iTKsNsdmsW7sfzImWmklQ3QAKCS1keKxqFm+L5wyW+q3ezYd3foa50u01VU8Z3RJ2gD8P63ZsAnkLqjzXdJWdYYDC30abFUDSw/87lk916I1RiYQHC8OV+hRvL6azLUhprUSJlYU5BrxZpBh6O/NOqz/D4D11BrGBm4Fo03THeZY75RkQYDPl+kqE6E4TSxa3/cO6+732rDm0OcSaotbsrmvx0WSALQru1ybaSgaWgDOcNCfe2wJXgrEqIDXBH522CJCiAc5XcvKTRio1W0z/owLK8WuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1742129335; c=relaxed/simple;
	bh=vi91Pt6QOlfTXCKzKhBDCHcsLTlHmjFi2TZT8TbnHl0=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=OQeEYNrocHh0UGzhClux2+PZwjtLTGJiDwQF1AP6XfeSkav95y2RsPpSZUY603PSD2Qp2V5MNE3/RSY403TBvz5A8kfcd2wfEyymfeLWtXER5qXzSGHribk5gKjFejvPbz8mDIXkj9zKn48VZr4Y183BbL8SLoLRpuNkUDKfENZ+f5Pwe/R9U3Sx74l/GTF/Nb4C7BphC79Swe3dakH4CgPKOYLxwkhA2DQzuNelGoaDko1qo2C4KQLHBSnFeYOr4RjXdeI6f3y24kkl1dcoTb/MXvywgEmdZyIryUHQg9XgfhA9C+JGN82msKcgGft40Zp7AEtiZzpSDxyArjKudw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1742129335;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=6JIvjo9kK9/oJ+fTBwgiA9gSpZyKTHfI7J4Jg/hitwE=;
 b=IBtYtlkxXiTGa30nX7uqsrgKJZAJY3PQPwV3CRAyVBfUAShOjOpffKYu+0CSRTnW6l45+
 sSmdb8J5is27Kv0y4uVxufCOi9SvTKRZtWp2oox2BY09hSme4Po5cj0O4nS0jtiY+VCbSI+
 KBSwDa2udM6vFAozwa3oCCYIJNlM08eSfT2FPwQZyojfnkF9SKZygQy+WHLsd9/lZOLjnde
 mWx97icbCzil+hMcPNig38cQB+gONmG/BRTGnfafwhmwPirod9svB+JKdFHnxg9PgOzBaNA
 H8k2nmEp4JVTSgRxUB9GCAOAmsxKiPgaEKrhK6F7C3Q/ziZifV5OvxsCUjwg==
Received: by srv8.prv.sapience.com (Postfix) id 082E428001B;
	Sun, 16 Mar 2025 08:48:55 -0400 (EDT)
Message-ID: <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed
From: Genes Lists <lists@sapience.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 16 Mar 2025 08:48:47 -0400
In-Reply-To: <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
	 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
	 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-qGmPose2pqDUpsQBP6jG"
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qGmPose2pqDUpsQBP6jG
Content-Type: multipart/alternative; boundary="=-CDzcXSjZE21TrESpJjPk"

--=-CDzcXSjZE21TrESpJjPk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golaszewski wrote:
> On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists <lists@sapience.com>
> said:
> > On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
> > > ......

> >=20
>=20
> There are two problems here. The issue you're seeing is fixed in next
> but
> not in mainline due to my omission. I will send a patch for that.
>=20
> On the other hand, the pinctrl driver in question should be fixed
> too.
> Can you try the following change:
>=20
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> b/drivers/pinctrl/intel/pinctrl-intel.c
> index d889c7c878e2..0c6925b53d9f 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct
> gpio_chip *chip, unsigned int offset)
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin =3D intel_gpio_to_pin(pctr=
l, offset, NULL, NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pin < 0)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * For pins configured to functions other than GPIO,
> default
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * to the safe INPUT value.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return GPIO_LINE_DIRECTION_IN;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D intel_get_padcfg(pctrl=
, pin, PADCFG0);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!reg)
>=20
> ?
>=20
> FYI: This was uncovered by commit 9d846b1aebbe ("gpiolib: check the
> return value of gpio_chip::get_direction()").
>=20
> Bart

Hi Bart - I don't see this pincntrl patch in mainline yet - =C2=A0what's
your thinking on this?

thanks!


--=20
Gene


--=-CDzcXSjZE21TrESpJjPk
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
</style></head><body><div>On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golasz=
ewski wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><div>On Tue, 11 Mar 2025 15:03=
:59 +0100, Genes Lists &lt;<a href=3D"mailto:lists@sapience.com">lists@sapi=
ence.com</a>&gt; said:<br></div><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>On Sat, 202=
5-03-08 at 15:45 -0500, Genes Lists wrote:<br></div><blockquote type=3D"cit=
e" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1=
ex"><div>......<br></div></blockquote></blockquote></blockquote><div><br></=
div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 =
0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"></blockquote></blockquote><div><br></div><div>There are two prob=
lems here. The issue you're seeing is fixed in next but<br></div><div>not i=
n mainline due to my omission. I will send a patch for that.<br></div><div>=
<br></div><div>On the other hand, the pinctrl driver in question should be =
fixed too.<br></div><div>Can you try the following change:<br></div><div><b=
r></div><div>diff --git a/drivers/pinctrl/intel/pinctrl-intel.c<br></div><d=
iv>b/drivers/pinctrl/intel/pinctrl-intel.c<br></div><div>index d889c7c878e2=
..0c6925b53d9f 100644<br></div><div>--- a/drivers/pinctrl/intel/pinctrl-int=
el.c<br></div><div>+++ b/drivers/pinctrl/intel/pinctrl-intel.c<br></div><di=
v>@@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct<br></di=
v><div>gpio_chip *chip, unsigned int offset)<br></div><div><br></div><div>&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pin =3D intel_gpio_to_pin(pctrl, =
offset, NULL, NULL);<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if (pin &lt; 0)<br></div><div>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br></div><div>+=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; /*<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * For pins configured to functi=
ons other than GPIO, default<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to the safe I=
NPUT value.<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br></div><div>+&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retu=
rn GPIO_LINE_DIRECTION_IN;<br></div><div><br></div><div>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D intel_get_padcfg(pctrl, pin, PADCFG0);<br><=
/div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!reg)<br></div><di=
v><br></div><div>?<br></div><div><br></div><div>FYI: This was uncovered by =
commit 9d846b1aebbe ("gpiolib: check the<br></div><div>return value of gpio=
_chip::get_direction()").<br></div><div><br></div><div>Bart</div></blockquo=
te><div><br></div><div>Hi Bart - I don't see this pincntrl patch in mainlin=
e yet - &nbsp;what's your thinking on this?</div><div><br></div><div>thanks=
!</div><div><br></div><div><br></div><div><span><pre>-- <br></pre><div><spa=
n style=3D"background-color: inherit;">Gene</span></div><div><br></div></sp=
an></div></body></html>

--=-CDzcXSjZE21TrESpJjPk--

--=-qGmPose2pqDUpsQBP6jG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ9bIrwAKCRA5BdB0L6Ze
21NwAQCarHY4VslF4jX67Wf+kfjL45aw+eXxg6zNdxv1KToe5QEAtcwhE9IEPalm
t7K+9zTEffx5ap73NWj19IqYOZd9xwk=
=9Ya9
-----END PGP SIGNATURE-----

--=-qGmPose2pqDUpsQBP6jG--


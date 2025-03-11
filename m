Return-Path: <linux-gpio+bounces-17466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2BA5D139
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 21:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944DB175B1C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA419264A7C;
	Tue, 11 Mar 2025 20:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="tF7TPhAq";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="RuT8iof5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13A1EEA42;
	Tue, 11 Mar 2025 20:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726441; cv=fail; b=NkoN5QQqTRDK5KkNJuWZZQSdNzkzWPEUHpdcmDkd71kMdXGAiViKJ3HeiT2RCm0xgP/P/QBgOoU4UdOZJzWseYxI32kShsfJUbfV7fZzK79ShChPKVGazvB3BaZLIgGc9p50HZqhUXskM1SsG+ZbFlpiPpYOz+8q1orGh4UKG1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726441; c=relaxed/simple;
	bh=TPWpuef0EG4u3Vdq8j6BwC5hml7mYMOWwVufvUVEIHA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mvg6BbpF+PQzm7CSfrnCAI4i5vxXV3U+WG7mCojYj2mSQDq/QYkk3VDkTGpOJiQBppqn1ziNx3+D4nO7u1Ig6AdvArGNcDBLGIkY+AUPtxu9HrRTvZmQGG1W2hCs1RivmIx1AoblJGPoSoh8QTzLj8dZ2ygljAG6qhziR20bVJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=tF7TPhAq; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=RuT8iof5; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 33B53480990;
	Tue, 11 Mar 2025 16:53:59 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1741726439;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=D6lqLWR8gDz85I/HqOq1pFfYG+1urGATcKP9X8D47k8=;
 b=tF7TPhAqfrftGmgAhsyjGdaSRtkFPFFDUr6GQy6Hss4BbOVwxw4NRRldAmtx5DwJq1JiO
 EHyj4p109FicofyAw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1741726439;
	cv=none; b=NGIcFcPi2ZErw63y5h0YgQTmX1U7DG+C8C1hAI4G49RvqmG/Mg0psS3Y5jJyYZxrMMl5EhJdSxg8bf44jhk3waW2FdGDPR9twd5XE1e/k/zmuCsWW6QExFfg/kK64xT4dkCWe/woJbIY9rFfznqgYhpFjneK0POyMiau5peXvMJvpFRXH0mtQxpppEkERRu0oLBQVd/7PPP0u7CI0KjOW1ymYSW5FlTZA4qUV1+IkiQAJDleMP7GNs44ABKry6bih8oMNzRexTToQBCmxpbWA+LtanhI0YVSjZSxKYOdWb1fiIDYncNx+shR43vt5h+B3f14xroQ2QSaRNS6Ke3M/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1741726439; c=relaxed/simple;
	bh=TPWpuef0EG4u3Vdq8j6BwC5hml7mYMOWwVufvUVEIHA=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=BqH4VjJ7VKaMP0GkVPwQLtqQGFDVKYlF/ijhRXufZcqBAs6yfbnC3IksVJcn88YdG+fLspozW6ySGgV9RphMm9T7Z6IxQHNgS4YLGovPIawvmUhUHIf+oYPYn+SvRU8Z2GcLh19auah14V+pdtY7IHTFHm5ldtqE2K3kkCaXbI2NOvL5H6OuaWLScmVweoHWXO2NgpcYD5ElJlXvTsiQ1CipUeW1nvVhHke3ssMGD/MFvd72R+2EFgKuGTFuiefrr9gZOpMvkEuQRaVYCX/16VO+ZGcsTIzf9p2y2Kuia55Kbkern5MR4hwzjouvpVrqaIoejqkk+2GuXdLkIW11cA==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1741726439;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=D6lqLWR8gDz85I/HqOq1pFfYG+1urGATcKP9X8D47k8=;
 b=RuT8iof5G8bDFzCvkPESbta0daNXEwDWl2V/NqXqRDM3tAWXERX3OXnx0FuGP9mw/KSCw
 ZPl8jCofnAQznx5fsYXWcasTk5OHTsQO58ddEORx8BTbeXeONX2rpnxxzKxPYn/jNE2iZV7
 bn6Bp7PAtfl2NGZlWF50LitOXFK7TIpP4ZMNwhacUF8J+TO1pJka2T7iFND1iXEQIJo3QBc
 lPPbEt80sSeiWV+zV8zrf+sxkYsLTL3BtJ6pIzIqHg8oI8Kamw/6FCRtUjFVx3llmyTUUnp
 YaFYM2HoFyK0h2Sn26TSXhe27ttCHNJQWIaJiu6BGq+HLAEqdyWgqNQhGiQQ==
Received: by srv8.prv.sapience.com (Postfix) id 08DA628003C;
	Tue, 11 Mar 2025 16:53:59 -0400 (EDT)
Message-ID: <c8de6f9053cf9907e2d0ccf5d06cd9a7062865b4.camel@sapience.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed
From: Genes Lists <lists@sapience.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 11 Mar 2025 16:53:58 -0400
In-Reply-To: <CAMRc=McPdfMM85GMgMChUzZSJzrpELNZZFMiOrBkM_Hy0ovHFg@mail.gmail.com>
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
	 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
	 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
	 <962ff60ebdb9207354560f938de8f23e4d02f30a.camel@sapience.com>
	 <CAMRc=McPdfMM85GMgMChUzZSJzrpELNZZFMiOrBkM_Hy0ovHFg@mail.gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-R9WKVfO+lEgz5oXCbrGs"
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-R9WKVfO+lEgz5oXCbrGs
Content-Type: multipart/alternative; boundary="=-UdPzM/w2092EcnM0z1qA"

--=-UdPzM/w2092EcnM0z1qA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-03-11 at 20:50 +0100, Bartosz Golaszewski wrote:
> >=20
>=20
> No, they are independent. The other one should fix your issue. Could
> you please test it[1] and leave your Tested-by under it on the list?
>=20
> Bartosz
>=20
> [1] https://lore.kernel.org/all/20250311175631.83779-1-brgl@bgdev.pl/

Done and confirm works fine.

Thank you!


--=20
Gene


--=-UdPzM/w2092EcnM0z1qA
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
</style></head><body><div>On Tue, 2025-03-11 at 20:50 +0100, Bartosz Golasz=
ewski wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" styl=
e=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><di=
v><br></div></blockquote><div><br></div><div>No, they are independent. The =
other one should fix your issue. Could<br></div><div>you please test it[1] =
and leave your Tested-by under it on the list?<br></div><div><br></div><div=
>Bartosz<br></div><div><br></div><div>[1] <a href=3D"https://lore.kernel.or=
g/all/20250311175631.83779-1-brgl@bgdev.pl/">https://lore.kernel.org/all/20=
250311175631.83779-1-brgl@bgdev.pl/</a><br></div></blockquote><div><br></di=
v><div>Done and confirm works fine.</div><div><br></div><div>Thank you!</di=
v><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"></blockquote><div><br></div><div><span><pre>--=
 <br></pre><div><span style=3D"background-color: inherit;">Gene</span></div=
><div><br></div></span></div></body></html>

--=-UdPzM/w2092EcnM0z1qA--

--=-R9WKVfO+lEgz5oXCbrGs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ9Ci5gAKCRA5BdB0L6Ze
24u3AQDRDPSPQidzc0sFOLtvgPvG8G8DS0MSU1NWxOMsghRywwD9FWnZQQuC5nEw
IK/AkfjCGXh4BkAW3owgPa2zM95vVwc=
=/Tiv
-----END PGP SIGNATURE-----

--=-R9WKVfO+lEgz5oXCbrGs--


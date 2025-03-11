Return-Path: <linux-gpio+bounces-17456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CA0A5CF6D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3589D189E2F2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871EA22155D;
	Tue, 11 Mar 2025 19:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="Kul9Zx6O";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="QKzGjUqK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C317591;
	Tue, 11 Mar 2025 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741721458; cv=fail; b=J7smuwjfVRUtGIlEpzEw7MQlr/os+Jf5PRLuwU8SKj08g8JkvN9W6okhvSNl8XBiyJSxlUty2aY5KZB5T/N+8iHZ5bcBdms/iCK4L3UfH1CJyS5OQU62GmxD7V4V3HU9ccr+687UyPW8Ap1RBqhd84sosdQkHyTigwAkFaUGp/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741721458; c=relaxed/simple;
	bh=FllIRNe5Qrt46Ubyn/6TdbCuxwPOTwEP54n6sJkQBrY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MS7KIFNZkNnJub5DzZakkNxqL8q5BiKgJ28Qxk62MLcTu3Z2jAJL9Yyg0SGx4RK4WddeuLHtH5d39WoyH9McJ5JOlV+kBL1gB/EFr8Emao2hk5c/tnszChUVMcpz4DBuZrFC4ZrVdWl9xnXjdEmnABDowoyt13wjUGVOXQ3Sem0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=Kul9Zx6O; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=QKzGjUqK; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 0AD03480A55;
	Tue, 11 Mar 2025 15:30:53 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1741721452;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=FllIRNe5Qrt46Ubyn/6TdbCuxwPOTwEP54n6sJkQBrY=;
 b=Kul9Zx6OvSxek502ArOhmL4GslTdYroFaJ3rKaoDjpc4KS4iWh04FeLcb567IhTDJXVrp
 xMl193+LegTq6IPAw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1741721452;
	cv=none; b=d/XZsngXbpt2lSh1WJVosdbGGXdPVCx5tiy5tIkJc+5m35h/S2ZuY5TDh6Y/dg/1LsfGaLrYMUaiDX9gtkVnGnAgwwrRBVkXInZrBdya6LF7kiLOKiX4u/EN9EJXsg1A9UXlRjxbwz1Y0SGqWrk7QIQgRJ3J4lHJ3bSakK3sEHXjR4g2Tv2Iv4+4Of9He9Rr28rByxpPnqj8zEWvwKnx7WaaNpX1bgrKZOKyn6/pYfRVWGKj5VP2zaM+EqCJlVeJu5SNbq4QkX0pFSqcSkgoB3TW19UafgB1c9z7wjFbgvUAlskmVEoj27GRRNvvf4tNeySDphRvUkrTPjH0TkDfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1741721452; c=relaxed/simple;
	bh=FllIRNe5Qrt46Ubyn/6TdbCuxwPOTwEP54n6sJkQBrY=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=UTaUdB4T1BNtV/9WkJ5P1SI0pi2g+iZF84/t7A2qn7FjX5l/6GLHbT7KNQn9RQPwn/0Q8Axf8ldxa0EL3qe5iKL1aQ3wfhk1yTJuaQKGXd+C78VB7ga81e9fabM0diZMd2LuPTAeb1npgqHXi/Rd9kgbxaJIaGcvLPZdgZBsT/TIHJ3vSdasQECVLt16mhvBb20HgSH6Ith5DBzmwaEABH649utG+AUp0bIzPd7tJ5OM5mjz1hMHAi5MCjvNk46xfiJUbsPbNizln7WTYu9zQc8KMjvjFGwHP3CRXDT90ptd//Da4v5C+uBXh3oG5CoQeLvWdmwFIk5yR5NfnAW8eg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1741721452;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=FllIRNe5Qrt46Ubyn/6TdbCuxwPOTwEP54n6sJkQBrY=;
 b=QKzGjUqKSY2npDjrcAxh0QX1GRUKStgithmuvDu30bEoWTMjDVlNA9xm6BJA+MQuYxBHG
 qG5UTmaZOHNnQmUjUw/cZkCYzFnqJRFetf4tfTPbZeSL0b3541CUTngcjeD8qZiUbuS5BTA
 FonA3sINjXnNo5zjfzzvM5YKy1SlwcQ5aqDP12uof6fPuCwHraGrCsYUyq8Qr386KakXex9
 JYHXlyRerZ7x1CnWfantW1XblOu/+Z/1z6woPLWTaiiPjaQfU7YtCVtk35gU/TaefnA1Jz/
 pyMX0J/8TpHDPVXO0v0DeUoEsX33NErcAOAld2O9dXVACLzcVXuLj1uoVZbw==
Received: by srv8.prv.sapience.com (Postfix) id CE76E28003C;
	Tue, 11 Mar 2025 15:30:52 -0400 (EDT)
Message-ID: <962ff60ebdb9207354560f938de8f23e4d02f30a.camel@sapience.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed
From: Genes Lists <lists@sapience.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 11 Mar 2025 15:30:52 -0400
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
	protocol="application/pgp-signature"; boundary="=-ZFJuvmi95ziffQJ8gL0L"
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ZFJuvmi95ziffQJ8gL0L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golaszewski wrote:
> On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists <lists@sapience.com>
> said:
> > On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
> > >=20
> > > =C2=A0gpio gpiochip0: gpiochip_add_data_with_key: get_direction
> > > failed: -
> > > 22
>=20
> Hi Gene!
>=20
> There are two problems here. The issue you're seeing is fixed in next
> but
> not in mainline due to my omission. I will send a patch for that.
>=20
> On the other hand, the pinctrl driver in question should be fixed
> too.
> Can you try the following change:
> ...

> Bart


Thank you Bart.

I tested your pinctl patch on mainline (on commit
0b46b049d6eccd947c361018439fcb596e741d7a) and the same messages are
logged. =C2=A0Presumably I also need the other patch from next as well.

I can wait till it gets to mainline or can pull from next - if so,
which commit(s) would I need to do that?

It's seems pretty minor, so happy to wait or can patch mainline and
test if you prefer.

thanks,

--=20
Gene


--=-ZFJuvmi95ziffQJ8gL0L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ9CPbAAKCRA5BdB0L6Ze
21roAP9MntAEQgDpHmZbfXm5UL3u9iw6VSP1OxZkfgq4i4n6qAD/eu5cvV33Aiqz
OhExm+zwnbEhzeJZF/7BQFD5Va259A8=
=SgG0
-----END PGP SIGNATURE-----

--=-ZFJuvmi95ziffQJ8gL0L--


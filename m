Return-Path: <linux-gpio+bounces-17457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8DA5CF72
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711091744D2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C3C2638B5;
	Tue, 11 Mar 2025 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="u1x9L7ey";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="fqOmzWlM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741BA25C6E9;
	Tue, 11 Mar 2025 19:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741721577; cv=fail; b=AOM0WZNzFT+rcPy4mJXllz4P5f4+EdScdfT1oWyllVq64x2uwUcaOEgD7vLgiZH7sp2YN8x50hTnf147P/mGuPpy+n6EI2u2Vv1uK4QWBtWG6stgoydCkpshLvUPw3JsK2wxqIgqPts+cVQNFZpLcIBk1QX0OkUyPGAvWPXcj90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741721577; c=relaxed/simple;
	bh=3npwjNufxhciOd0zlHArPhSA/VZY6Z/ta2Lvun4MYGI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m0cEUPh3eRdDx1DWxbqJhomQTf5aQB/QeU4wxk4b11cz2uYbFopziNmtrAzu//+NRP/VwUK5tWs84PHoNZvFb2d9445G2SXupG45yKl//FENeyPh733Mkg+aVA7Rqb72EQBY0h3NnnW06ncjut7d0YaDZQJuldu6WqtyjaCx+MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=u1x9L7ey; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=fqOmzWlM; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 6B993480A55;
	Tue, 11 Mar 2025 15:32:55 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1741721575;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=3npwjNufxhciOd0zlHArPhSA/VZY6Z/ta2Lvun4MYGI=;
 b=u1x9L7eyfhDDNBjHtzMNLaqMDFMyKZRD2nfztEb/9MisNOEqcbViC+p7xJEJbbXalkZIX
 ybj6VTdcmRL5h9BCg==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1741721575;
	cv=none; b=XxFPAuK6Knwt22rlC/01coV1a1TeKd5uUiU4oSOAmzFyf/xkehDy/MeMo7EyjRoPOP1gLr4gz4s3h1fFEnsEfsrXpOUNZ5gVLl/8IztovK8C2mRfhZCrnrT+3+PsscmN5Py5pYdoRshCpaQkRCP6TfGoOcjLyS3NWkBmjG++lyVisZylD5P4SmoC5VfIXgX2CCBQgDvfg5J+N+EtpEuCcMLUHNU0EGS+KxzOSeeX1d3WibH/IXFQLtiIHZS5vq/uMx+H54LwQm9g1VE+LVziurceS6jjjRzw9kFmizZ+e4Hv9g0vjBApVeY3jW/q9hTmMlPUTR0otsR4GvG2Oj1mpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1741721575; c=relaxed/simple;
	bh=3npwjNufxhciOd0zlHArPhSA/VZY6Z/ta2Lvun4MYGI=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=vBv6OSskje2UvHAPgNLoW9Sn/ODwrLiIUn4zjXyuhTkAWqi+fq0IhTO+jxKz+/M0mAapxMJBXhu+MNiKp5J+eDGero9Ac/pcIRgSmPloAnqB8cJYAWnZCe6f7nDdwod6LZb1GzKgVomJ0sWkM+Yo0rkx3+2ImZ0rP28Wpuj1nY2vP0QhhxP2oE3rz1ACF4fLyYrWgFSKgp0kEJAzyXGABb1J5AQBCcVix4HQFlrQb13Mi7/Uyfm7XToNERRC2ZR/l/EFETORVFqZdLzIMk8OcREiVc+Vc7UhKWgzvSrGwnUQqED44O2EaYWZPCjuEcg7CWErWzwzQ5CnEZQsT6QdYQ==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1741721575;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=3npwjNufxhciOd0zlHArPhSA/VZY6Z/ta2Lvun4MYGI=;
 b=fqOmzWlM6BJCSw3pwY6xfQA2DA4fjqdAsUhOfT07jzA3BvDF72xM6tBd8j01EL4uyh6JY
 SMF7m9ol+0lNGlRavQC8HB2ndh+kUgDcYsFVkkultyK4tEXLCFAyG9r6X+eentaq3RerVSl
 AnNmZSHr6opkiAceebMBTkhmihY2egP/lT6fDBMAQ0EzQOqGXejQftvqU32n7avy794quEv
 L7xFUWeiR0NbiRt7ZCcnCkquFkGVY0l5go8onn12NQXzQqzaPfMfV5a9gzvCjlWvufkaE82
 MTa2BxsQvU6pWXwaAOAs1IxKS4+Nc+Kdejj2L9h6eFQMjJm2Plzr+P6M/cAQ==
Received: by srv8.prv.sapience.com (Postfix) id 3F94E28003C;
	Tue, 11 Mar 2025 15:32:55 -0400 (EDT)
Message-ID: <aadd3bef2732a99cf611323aa1a3a39b655376fc.camel@sapience.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed
From: Genes Lists <lists@sapience.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 11 Mar 2025 15:32:55 -0400
In-Reply-To: <962ff60ebdb9207354560f938de8f23e4d02f30a.camel@sapience.com>
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
			 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
			 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
	 <962ff60ebdb9207354560f938de8f23e4d02f30a.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-krYBO8OLqVZriyabkDaA"
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-krYBO8OLqVZriyabkDaA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-03-11 at 15:30 -0400, Genes Lists wrote:
>=20
> Thank you Bart.
>=20
Sorry - I forgot to mention that the number of warnings with your
pinctl patch =C2=A0is down to 87 from 194.
=C2=A0

thanks
--=20
Gene


--=-krYBO8OLqVZriyabkDaA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ9CP5wAKCRA5BdB0L6Ze
2715AQC1UrvvteMiysF/cbWkAVWl+dGBmdsaVMzb31cn9qMl1gEAyxEBMbvhnnoj
e0IkzB8P2R3QHdDMbtQ9+rikcX30sgQ=
=QDp1
-----END PGP SIGNATURE-----

--=-krYBO8OLqVZriyabkDaA--


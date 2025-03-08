Return-Path: <linux-gpio+bounces-17319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6BCA57E49
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 21:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE2A216BBEF
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 20:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3481E832D;
	Sat,  8 Mar 2025 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="63VKNfmU";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="hTYUHsMO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA91ACED5;
	Sat,  8 Mar 2025 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741467322; cv=fail; b=TGJ+lHlW3WOhX+zhnVpBnVRTc93mnXeBWbyqVwxwhWI3WRfz3dPj4pl4WaUTd0H3os/c43xltDb8C+n7qYA5Y7wOLhrGDJDIAQsXWzRSzRKbB7WFo2jPdiymXvmJ8ryiSgKvprt3DV7muth7Cbur9RiPPj5QAJK3k3FTSebrcmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741467322; c=relaxed/simple;
	bh=HhuqrTQn+TtvoFQ3fsOiTP7sctsRq7AK07o0jVMaxYg=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=Jalf3q/Wz+nvjLvxz6HsL5N8HEqJjd3X6gz91uBcwbAN8xzmaSIs3KDWPCpK6udHN8G5EB544n+WCKonC+h6e41cZ7ZGiLjLsBb5/w1QJovxysdj/MHv3tr8xAjoHp44effnPZOi9tcCrpo6cC7WzMRsdTLfRiIbYTX9Xj53Fq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=63VKNfmU; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=hTYUHsMO; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id E340D480990;
	Sat, 08 Mar 2025 15:45:17 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1741466717;
 h=message-id : subject : from : to : date : content-type :
 mime-version : from; bh=oFv/GNF8I/MbO4QIQpbVr7UCA+CqmFZweV/XknZ4CT0=;
 b=63VKNfmUr4fDbuQpglK3bLgUi7zK4dhHyk1E7mt/MYN5I8NBqFRWXJWQjQkPme7umbzGO
 zl4GRr6iL87FBNdBg==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1741466717;
	cv=none; b=tVYq2lI208E0qtZls73Y/JLW9WyuuMQqh29tfs9M4zmgmxRAWUoKbwjZ+4k2xcBRC0a+I03/qCW1sR0yug/7EWUXTJVAKmU+TPm1NQfv/nRXIdZrUrR1QAcWSM/yMPhmXZi8mh4VP3ccSJkcxyHVQprh/jT6aWtUobjtP6Tx2NPhM/ARny7k42tvoOTTquUdB/+23QfFFRX9hFOfH1o9c7SiFJw6jyJ0SSsVIjIz1wvJMCqls7qrGMdyEtu94FciDFmwzl2wOcA7YFcW+ZlBmXTjunKs9MFpqVuHoWA+od/Cvw3GtKRZt7UsfoIso3JodjoORV+SIeCLxNmifrFXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1741466717; c=relaxed/simple;
	bh=HhuqrTQn+TtvoFQ3fsOiTP7sctsRq7AK07o0jVMaxYg=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 Autocrypt:Content-Type:User-Agent:MIME-Version; b=sqokkkbljQUdk7tvHthVh2QxQ6YBPYys/bU/COHhS6+aKFQkNvDQa5tHqpOxcVwZyeAgSTQWP/FMW8zZq0tu01gQFbotn0KwbUzWauL/VmZHXnR7oCyOF87te18S1/1ldq5Xjh8CG9LR89EqZJSLlW3FFuD38L2b1nkNjjySjn1L2JsDFrBABU46GxEhVIX0YCHW2hGvijmhs+cwP/7fsYTPGIDRJru7XuKL0I++LZO4bZAT5NCs5iCANyE5tYjYYPDDESZ4nZzSmBEGfI1znueG2RzayzKBzb/wFmNxY6U2NtfrSXUvOhnDiD86I2tOqgaQ0YEh0NwYn3bqgBgozg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1741466717;
 h=message-id : subject : from : to : date : content-type :
 mime-version : from; bh=oFv/GNF8I/MbO4QIQpbVr7UCA+CqmFZweV/XknZ4CT0=;
 b=hTYUHsMOpO/2Y26FJngeWAyoNtSlx04DFAj7anirmpDBtt6ZybbSTxzH43bi/G7G53LRg
 K22TYRMwqqKW7L+nZyKysnSa+XmF1dUimM5aaTCm7CYEjJHQrNjPknLvp9KSe2qSVilkkaK
 RyounZhU6UWR6rAyqPvlMUgrt0GzTBhr15UlkIUFyngtuKXSXPxIe0nxqiwE2v1QUUOahIP
 0qKojX7BOpj2YzM9+L0Gn49ZBIV8jRiO6vKEvu/UC9JsHUG1BfYg5Egjjcwj8jjnH1CcJFx
 zih5tsUFuhxxJoMHUWLZZtIZKqRgaC+Q7eLrVQ5nLkHIFcscm6HyOF0M9+1w==
Received: by srv8.prv.sapience.com (Postfix) id B0F50280015;
	Sat, 08 Mar 2025 15:45:17 -0500 (EST)
Message-ID: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
Subject: rc4 and later  log message:  gpiochip_add_data_with_key:
 get_direction failed
From: Genes Lists <lists@sapience.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 08 Mar 2025 15:45:16 -0500
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-vzrN2d26u93hK/5ZWTJL"
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-vzrN2d26u93hK/5ZWTJL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


mainline=C2=A0starting with rc4. Same with rc5 and commit

  b7c90e3e717abff6fe06445b98be306b732bbd2b

there are now 194 lines logged on boot with:
   =20
 gpio gpiochip0: gpiochip_add_data_with_key: get_direction failed: -22

Dont recall seeing these before.

# gpiodetect
gpiochip0 [INTC1055:00] (360 lines)
gpiochip1 [INTC100B:00] (64 lines)

Machine (dell xps 13 plus laptop) seems to be working normally.

Hoping someone will know how to quiet loggin down some without a bisect
but if its really needed I can.

thank you.

--=20
Gene


--=-vzrN2d26u93hK/5ZWTJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ8ysXAAKCRA5BdB0L6Ze
21jiAP4imfpiqmNU3gQrKzjnL+4ayPliTWOLgDLz8RugeTIwNwD/UabvNFk40GLb
VkFhVFfjS/RctbDVkvAZQSYx9/+CigI=
=bupz
-----END PGP SIGNATURE-----

--=-vzrN2d26u93hK/5ZWTJL--


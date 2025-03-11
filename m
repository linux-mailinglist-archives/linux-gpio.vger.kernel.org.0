Return-Path: <linux-gpio+bounces-17430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D7A5C332
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE4D1682E6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2E3254857;
	Tue, 11 Mar 2025 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="zftlI627";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="kIONNL+C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4017156C62;
	Tue, 11 Mar 2025 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741701849; cv=fail; b=UohutipeW5hMMVFuaeg9EVVV8RodONyonntnSu2m8xwJdFuBCq53vzKsqjbNLCSP8TwZFF+MkPBZJkd7O+ERlglBcq131rhqd68n1H6hWD6fusSNQ93OcSJOJCf7deQER8cE25Y9jpuj0jrtBYNQCPbuprMtOPlsmumriWLsHTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741701849; c=relaxed/simple;
	bh=6nHrDQ8cOrPo5pjs0rTrD6/mUY7oQ1PLh8so96EyNMg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LIMkmMHX7b8lX50ARNHogvo5fw4Eckyv0c9hskPNS+J2uymhOXyyWQvwvo19ku2ZLmWR1LWtZN5+kwaccxTFK8O9PQywAJHlKBSHQRzL8sRz5+YDcbTExRxHcyjN/BN8uc1GDPylMJGhtgiXcm0WtEQHJZ6M/hCyLRda857AX/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=zftlI627; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=kIONNL+C; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 25F03480A55;
	Tue, 11 Mar 2025 10:04:00 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1741701840;
 h=message-id : subject : from : to : date : in-reply-to : references :
 content-type : mime-version : from;
 bh=6nHrDQ8cOrPo5pjs0rTrD6/mUY7oQ1PLh8so96EyNMg=;
 b=zftlI627L73r95AFYNp807CYMsIaV6h+R2fSUXU/5Wavd/CmttrJoVrbS+KSuGBsrThPa
 4Tp5djCnTnj87eHCw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1741701840;
	cv=none; b=gxz8Zsj+HMxZQLCSi9rBr3fP669bjFSWMaPcL8JXoPMLj2YV/q6jmQRkm4D+5E4ak1dEWd/HHFvptiPz/twGvfh/2022tMyShe2vAtLASrIYaMCrnIVk5CRmeFsEtlxKUXrzSEl0py+Ucx0c/XVfRbc42pdfGSa3EqRZjjAGBOOjviFMv8yeTSlBkCnxnhHKg5qWkTXjnePYMO/zXd3nECnPdmWkw9ab4ST1QADBZnJPZTLKCeesmFaSmecu+/MjpzYF2pvZe90KFFmQiSzX0rWs8CdzoLtoBK0EyRVvLX2bKQs6r/UvTZQuovA2inE7dS2Vtpq2t3eEhIK8JF3gAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1741701840; c=relaxed/simple;
	bh=6nHrDQ8cOrPo5pjs0rTrD6/mUY7oQ1PLh8so96EyNMg=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=QZnx8Jb868Q21oaWSJJeTt7o6pNKWvCzROMpmCYoCExvjY4sAaa6MAOjpInoUIK9FMhKMUveryL9bxCLrfNjNdG8+HQGBuMW+qxl2bdqcbiruP8aOCyc3QpSov+D3jyEDmrd0DrlvhNW6cCNf0amjzYOJRPuJ8lGZnnpUs/ehYx/8MeiNjKhAHNiPrIccQPTyg3Cma04DEDv8YxPa6SBt+5z4fNQBemVXzPq2FeeacpamZeDjKJeeQi/T2cGvmUoHkTuGmACJbm7x9WZd3tAlC36+cgynp6d7yL9MsShaAc0yuKVSEYn6RAVnEoIkd9aybJznb6HV4SRUvS1aCJEZg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1741701840;
 h=message-id : subject : from : to : date : in-reply-to : references :
 content-type : mime-version : from;
 bh=6nHrDQ8cOrPo5pjs0rTrD6/mUY7oQ1PLh8so96EyNMg=;
 b=kIONNL+CDk+TCIuVvZvAH6VE4BVzkTCYzTRCIj43mvPA+BTWEKkK7th4wI2xSiU0+gA8D
 tMnOg+VdE5Ded2QomLURiUD/ShIxurQPMIRxPedfFjwg/LG2qKIvhu/2gByEOjRr+8ehw59
 a11NEHfkfUJZ64Dt0EPx6GmY+AWzX0UAqcxVm4d7uxJiajMOY73DRMXM0Q/YIa+pZ/vPCPo
 71J9bVUtupNpBxDb+iHjl2madGzl6JmrdtduZrgjdEO6tCwU175WC7arBO4I/0ez444yn43
 B8BY7NWfMao9FpBV+HvpjpfzsCW66EblwJ+IbqbuO8LbWSEwVf2SgVOh6Jhw==
Received: by srv8.prv.sapience.com (Postfix) id ED97428003C;
	Tue, 11 Mar 2025 10:03:59 -0400 (EDT)
Message-ID: <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
Subject: Re: rc4 and later  log message:  gpiochip_add_data_with_key:
 get_direction failed
From: Genes Lists <lists@sapience.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 11 Mar 2025 10:03:59 -0400
In-Reply-To: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-53Et8eAPGW0HeO1swSaM"
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-53Et8eAPGW0HeO1swSaM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
> ...
>=20
> there are now 194 lines logged on boot with:
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0gpio gpiochip0: gpiochip_add_data_with_key: get_direction failed: -
> 22
>=20


For completeness - same log noise with rc5 and through commit
4d872d51bc9d7b899c1f61534e3dbde72613f627.


--=20
Gene


--=-53Et8eAPGW0HeO1swSaM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ9BCzwAKCRA5BdB0L6Ze
2yD4AQC78vhEEx2EVj4M/Jy2vbWBo1bxnZ5yI3pGEDX53Bz2swEAmQe+4sVUSevx
6bSZ6+lMA36uj9Mvt9/dDD7dCP6VaQI=
=Md/g
-----END PGP SIGNATURE-----

--=-53Et8eAPGW0HeO1swSaM--


Return-Path: <linux-gpio+bounces-7469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC69909E4C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jun 2024 18:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748F328165B
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jun 2024 16:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3A1175B1;
	Sun, 16 Jun 2024 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ed3boJ8o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105815ACB
	for <linux-gpio@vger.kernel.org>; Sun, 16 Jun 2024 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718553875; cv=none; b=NNhRqlDFv0Bl9BuhBUJAKeOaPX6wxCDe/YBuORkJJfDJHAdmER6juhS6d42+kYD/8M12mR21ZrhNUkt2hNZNzScRIPdkvIA508mMF+CGOhOkdex8LTfH02jZVIPJfBhv/tiH/R9RIa0x5Mt82J0Xbov2lLYf63CyMb5fux+rGU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718553875; c=relaxed/simple;
	bh=KGBMb+hsV6f1/UzEToXa/ESKEIydm1zGzXT27qGRaAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYEZ6NlTGCZvvTARAaDXcjetAOpBsk0P6582Wwj/5DCaMkCEMZAAi4guL3M0aTfeCg0SYrJGyBZZFg/fiCeGxd9f//lJC4lEiqFac/EUMd9GjA3RDldQ5V6BMfsPiWO54YaOSUcMwI3ztLQBf5o8cpFGLMzdgkeJlnT+eWKBIAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ed3boJ8o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KGBM
	b+hsV6f1/UzEToXa/ESKEIydm1zGzXT27qGRaAU=; b=Ed3boJ8oyxjup0H1+s/c
	64zC+VA1ZLZL5c4dT2r8+7GL7Lj1CTtwS6Pfo61N8kncuvNsOIKLA1HCfSUgwhJ0
	wPOUGtxi7ya4nftwpvikNwgOAorszAoJjjmClHDDBwAwzzZDQtRy1zbvoDzqjEqF
	gZ2HO0xGyFNQpBxFuolLpvCulmL+zv94GsitCA1xPVMT2NqzW/D/hibGL+q/JsbH
	HHkEuiHwrwK5Adj9ZIeTofbNvm6ypi4I5UznCpfTnf9KAJdTZLgcDeCeHBKEJh2U
	X9SQpq0yqxMFNVtZlU7MPTWy2fJhbLQl3zU1D0iXgvyLH+f23fymJSHATsdBK/Xt
	oA==
Received: (qmail 2067608 invoked from network); 16 Jun 2024 18:04:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jun 2024 18:04:27 +0200
X-UD-Smtp-Session: l3s3148p1@B1bPAAQbhL9ehh9j
Date: Sun, 16 Jun 2024 18:04:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <qnjiwkrqnwyz65nieioq2lt2kaauj2xqvddq5ba7ajrkmk7rky@hik3pexv7er7>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
 <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
 <CAMRc=Mem6HN13FOA_Ru8zC-GqGGLTsQiktLWs5bN4JD1aM3gHQ@mail.gmail.com>
 <a7463c6e-2801-4d0e-b723-fc1cf77a04ed@app.fastmail.com>
 <slpwvai5q24qwymh7nktihvykmlhi5j3nhqjxruxb6yacruu47@27b7rhykw2f3>
 <3bb9b39c-c15f-49e3-987b-26cd47e05f3e@app.fastmail.com>
 <CACRpkdaC6i54qUfJ5H16m2wQhR89bXq26Pn0rZ-80m3a60-_mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogf6eemsskgkbba6"
Content-Disposition: inline
In-Reply-To: <CACRpkdaC6i54qUfJ5H16m2wQhR89bXq26Pn0rZ-80m3a60-_mw@mail.gmail.com>


--ogf6eemsskgkbba6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I second this opinion. The logic analyzer does in my mind
> classify as a GPIO debugging feature. Surely someone
> debugging anything connected to GPIO, such as a key or
> MMC card detect or whatever could use this feature to see
> what is going on on that line.

Okay, with that picture I can see where your argument is coming from.
However, making it a gpiolib debugging feature will surely raise
expectations. And it is not only the non-equi-distant sampling. The
script trying to isolate a CPU core tries really hard but is still hacky
IMO. It has to disable the RCU stall detector and will likely interfere
with your CPUSET configuration if you have one. As I always said, it is
last resort debugging.

As I write this, I start to wonder if this should be really upstream or
if I just keep it as a branch in my repo. Maybe it is just too hackish
to be supported mainline?


--ogf6eemsskgkbba6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZvDQcACgkQFA3kzBSg
Kbb7hw/8CrBKvnmbXNsocNTdodgY1tjLDiHpCUAlqOUzbYz1kPOVa1DTkE/rdqam
iRB/uiHUZU1RkwANATrrSo3ZAfN8e/ffWbOcCtInD/fLqQEC6p7dIz0biFHCfyuz
L9eXjWMlfFtijXnk7aPphKsZL4n21MqCFC0IN6RpIT8npNieSaY745npgGN2OIaQ
ViI9QdUy964rYRlzEG9ybJjW8Bh43V/aPKYW8x39T8sqPdOfzZ6BoEpPdjKg/7f2
3HAmS2WW/ZZK0grDrvmUcKSQOPEgaBuzH6b9qjd+dkcL/YOXCoYO0OmCDSUI9yPW
KERlFoqnRm30Jnsat1eNIpOv084QDB4EmCZwmxnQQfQ16Bwf4rbv+jzbSNMWCSqV
ge+aoDvreCzoBKNsnQtYiHbiH/RgR+N9gESuTYKr4jZys6NLI4QdVOmOvuQcOEKy
/c61N46fQd3wfAQbu8BgqypMRdAj9HAv76+veogZpbVY0Z2v8/XzFVwVqDvGYRGe
VcUi/pBcuo//OiKsJTkBLJR6WvDo07LfOAMFbYYPS8FYtGzC6eWtPEItvMy+6h2D
AG5Q4Cg9d9utCNsLPVuXNxLLSfwZJDmw7gPE6kW7y7zPOIKsQ0Vo/JExf6HsPvz+
7YRkDGxMhPmXfBF/cQq9bcHE1EOeS+oyUMmn/SybJyFB0OWPTVQ=
=nL8s
-----END PGP SIGNATURE-----

--ogf6eemsskgkbba6--


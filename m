Return-Path: <linux-gpio+bounces-26992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45354BCF54E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 14:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 243474E8D00
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 12:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E132797A4;
	Sat, 11 Oct 2025 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b="I1NSls5o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.bues.ch (bues.ch [116.203.120.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BE265609;
	Sat, 11 Oct 2025 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.120.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760185961; cv=none; b=gH6JixMKgCgesTbZxjiqOy35H6bf1l4bvj3bItkMLpKzNSKvLKp9CFzgOerUgziv71JV+jFd5fL0sVX+yeSeS8Qb9ZtY9isigWvro9HLg5H1lD6YtKXnZ7cKSPXmLLcZoD/JFzNrRBLDrO8wl4sp5OeHdEhQrowpa3cRsgfCcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760185961; c=relaxed/simple;
	bh=cCZ2p70/kuhMxhzeBgdAjjrySpX5QKPNMe6h3cPolwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cao+d6SlRiv+7nexhWA9Jdl/po35QbPAvTgI86nLYsN7HPO4kFLQmjuq4HLYgbR/5fA2SA48pR5pggrL6PzZ22qIHSyk4bf4s5ETzRRdqkcrHF+3jFfUzRGBglafp0BBBKEp/4lrWSdkBwFDcSePfRwkzSBfpEvSBUeMDCboY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch; spf=pass smtp.mailfrom=bues.ch; dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b=I1NSls5o; arc=none smtp.client-ip=116.203.120.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bues.ch
Date: Sat, 11 Oct 2025 14:31:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bues.ch; s=main;
	t=1760185954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCZ2p70/kuhMxhzeBgdAjjrySpX5QKPNMe6h3cPolwQ=;
	b=I1NSls5oM8nZzFMOyPmVXLTyGAjQIXXk2+7lU816eccn9OobZkkGMjpq8cGvollGMclCSJ
	1d+IjooZkemxjnqYH1rDdewUgoOR73OmulRQ6rHQFjD0V4Xw5VR2TgsFSLHQSf/DT7WhAL
	qMnkmhddqX4ybkcj3cEMwmokOUvt2R08islz39hmHJwcCa5HlJDwNVhYRjw+7yE+gYkXmv
	9R4P2Xasyo8nt50qgtDxhy9xk/4H1gsHPSN/zKPJor0K8u4HuHtM4f4uOfW3wOSBzwIKBI
	0ciyK/oX7jSI12b+5bTOKePq+tEHsQFr5G98LduVDVwLYCyopS2ii6BXgZokow==
From: Michael =?UTF-8?B?QsO8c2No?= <mb@bues.ch>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Bjorn
 Helgaas <helgaas@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <20251011143123.094043ed@barney>
In-Reply-To: <aOpAO7j0Uyo6FPcu@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W.N9qOOrmDnZC9J+c1/PHb=";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/W.N9qOOrmDnZC9J+c1/PHb=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Oct 2025 11:32:11 +0000
Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:

> > It looks like the
> > #ifdef CONFIG_PM
> > must be removed from struct bt8xxgpio definition.
> Ah yes, this macro somehow got overlooked by me. I will send a v2.
> Thanks for the review!


Also, the SIMPLE_DEV_PM_OPS macro seems to be deprecated in favour of DEFIN=
E_SIMPLE_DEV_PM_OPS.

And please do a compile test when submitting v2. Thanks :)

--=20
Michael B=C3=BCsch
https://bues.ch/

--Sig_/W.N9qOOrmDnZC9J+c1/PHb=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAmjqThsACgkQ9TK+HZCN
iw5Ljw/9HBplmVLY/YRlv5s5tOEBqGO8FdnzZ99Fhitq16jKo1lwpJA1HXPzSjBq
Ga3jD67cPBtI/YRmwpi2oQq8+4kV4UKdOKoXrnOvfXvYrRgqNNjIT0FAs74jOpAL
C4ggQKmV5Tit6VpqsQ23WTP0vF994PbVk/bE83WtZ2qpKpw645C+vNJJX89ir4ln
0ZSurc47ID10WJkDcMoitsakPKimr7CMLYk9OfFDRJpNPW59AOp8P0tT3QlJNejX
paUuponVs+/vhmhZoP1QLc+Ttl0w6FvcTahDYPbTMnkswRVT2DM467lm/0vIZBOu
1t2qYxlJaIThUV57gv7lMGPMCGLAYXUvyPoWuQI4FRRkPIN+UqCMwn61+CWLSK6c
hEQ7XQqKHA9BVHfReE1XghnK6OAZVMdhFABt7hhpfvRk68nSZkq1voSlQrBgNaGI
8yIa5cFmJR2GeKnBObzzTGol6E+usROKKyzspUTmK30HzYBQXHQTl5CmfpeWGVGM
dfBoBCG1k1XkG8vqF5Wn93KWN318y4j/cLRH6lh/sxAUOH+JHmdAOMXjTo9OPsYo
8bVkYcX8JdlYym0JVkOMLUTEBHfOx/znGAIC3EiOTHgHdAfkxsjguhzo749D+Sw1
cA8nF6yo3sJXJKL9mR7NR+w35sjT+kQwAcglNbpnoKJ9MDTWlEo=
=fNvI
-----END PGP SIGNATURE-----

--Sig_/W.N9qOOrmDnZC9J+c1/PHb=--


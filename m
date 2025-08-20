Return-Path: <linux-gpio+bounces-24675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93627B2E3D8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 445473ADDF4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8286833CE97;
	Wed, 20 Aug 2025 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b="mrPkyzU6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.bues.ch (bues.ch [116.203.120.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C833A004;
	Wed, 20 Aug 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.120.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710400; cv=none; b=dcMnNUdeqYrGOSj0WQE1jEfSggAhWZEh7avYs/DDR/aLZTI6aArouxcPQYNcv+e37hvFhTzM8sYn3iIq8c8fkJZsL3AOsfEfJ5HzrLqv16qjMAPYP/neO5IPM4XW8Qxsrq6nmoGDpEN6LHdMlvkZ5EAlaImWoStHFeIp0ul3FUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710400; c=relaxed/simple;
	bh=p174+Eh9XAmNMgbrKhEkVjmTUSlXzZKuRgobxcqkPrM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YB8xy9muhMMyhguOsa9WPbrpz8GxkLbUEqfYGaegQKTlagcW/QeaR3EK55cNq2g9w9MkOlxfgFGbytI0I1lVFoZ/wQDhSWz87hr9WQFAmEZZMLzd5cCDIzzrnTu3TIlG00+G1kFsZ8fyOgOgvD1qRm7r+1oFxX/PYVHQk0kakRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch; spf=pass smtp.mailfrom=bues.ch; dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b=mrPkyzU6; arc=none smtp.client-ip=116.203.120.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bues.ch
Date: Wed, 20 Aug 2025 19:10:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bues.ch; s=main;
	t=1755709872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p174+Eh9XAmNMgbrKhEkVjmTUSlXzZKuRgobxcqkPrM=;
	b=mrPkyzU62ByK8uGx1mNmesSR4xO/mcSPHp+Ec1VriviCTHS/wznJ/a/bV11/qGjRXBQuOU
	oOnH9rvX3kWmtZ6BNdyzUGy3egwRmAusoVZAVXi08/ozv69KG6awsERlmG3FT1w79mRNxL
	Uz7KHmrxvBWopIYFA3nXKp6MR5PnTG70ZBxxs6kCGRBk0kKBCMjQdmofo84DHWv2aSuk/g
	PmqzrvxzEEq92c2qNpr3vAHDjcaLs5nhyqONUIDbvTf/YttA2LDKWrmsuHpj/G23EUxvqG
	KngrJ0cICVWqvjyDjhYHZH7iYAaWmHycHAcRnZxkdF0JKrDAi8nu4XMBwjiA0w==
From: Michael =?UTF-8?B?QsO8c2No?= <mb@bues.ch>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael
 Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, Andy
 Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, Romain
 Perier <romain.perier@gmail.com>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin
 Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
Message-ID: <20250820191039.4f8af41e@barney>
In-Reply-To: <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pS1KmHMT0VTPklKxJ+M/HG5";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/pS1KmHMT0VTPklKxJ+M/HG5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Aug 2025 19:54:44 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > The dwapb_context structure is always embedded into struct
> > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > data overhead for !CONFIG_PM_SLEP. =20
>=20
> I don't think it's a good approach to add a lot of data for peanuts in
> case of PM_SLEEP=3Dn.

It wastes 36 bytes in case of PM=3Dn.

The driver currently allocates the struct with kzalloc and stores a pointer=
 to it
in case of PM=3Dy.
So this probably has an overhead in the same order of magnitude (pointer +
malloc overhead/alignment/fragmentation) in case of PM=3Dy now.

--=20
Michael B=C3=BCsch
https://bues.ch/

--Sig_/pS1KmHMT0VTPklKxJ+M/HG5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAmimAY8ACgkQ9TK+HZCN
iw5cNA/+NLyRCzoK1ETToeOTHdwwyQkiTbuBe6ELJDz1Fuk4Ao88nbQmFeISRwE5
M4E1ojqTn1YTeerWFS0t/IPH/6bJk23TeOMNYmweblgBCiLVQ96UmN6iw0PaRnj7
dJtLy/5/gKIHC6n5dw+Qo5cWsr+CvLJ3gwZF001XjGyEPBTjSLTQJmFgeJTb8mmg
M96uB22AtpG727LqVenvf5VgeSIL+E9Pau0TdBA/xhxwTEDZZQpIYVL8blqYTUxQ
FKcUOHINC2sPFIXTklyj/lkKMoveTjYXBMur3RSSm4k03jND2tQYBVGPFFFsi9A2
jSw8fEkkY0OMvLJesxiJWWvzrowG0IGR09Ii0vzTFSyRru5kYoXbKDFUzfn1ii4E
s6dd8RE/PrDEnI/vX8LrdxW3EzjcbBfu+6JrevevbI4ixLOQHA+usaUm15mQfDtH
V3iPr1DsMwR0dbryYcjn9AUlxLDuWZEm8d2z92OrPLZG/Ta+ypGRo2GC71hlpUGk
rxxsncdj+3drXfuVyX5n0WUVUMAY5qSr/qP8qHQPEdUwibkaOInrXIYf9SMvxdvD
zIT0fPrtfuqynuWHyWW+peELaoj9Y+dimLZUmVv5DXOrfNnYCCbIGpxGNfHVtZqn
oijZv6EsPyAZbHcR90Z2g9TxbrMT/lrn4JR5CZbBgZLQI+25TsA=
=Dkpw
-----END PGP SIGNATURE-----

--Sig_/pS1KmHMT0VTPklKxJ+M/HG5--


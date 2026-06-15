Return-Path: <linux-gpio+bounces-38482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cg8PNxXeL2qmIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 13:12:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BCE6859E0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 13:12:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=B1bDwx8F;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38482-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38482-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CDB8301F5BE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 11:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8A3E3153;
	Mon, 15 Jun 2026 11:11:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8E3E2AC8
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 11:11:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521902; cv=none; b=upogzXu/VHdltUmiMn+KyA2JndwVkTNH6B2Mew1Ed3cGqAwdF6ry8YQ8HQOwR9ZPIFE1v9bwq9PO0+tE1o/cru/cU4binnOqJYIfUXfy9EJ3CcH/iNT9RZYlp0Airvdp6nz1SQegheOENGcqpAJ8/WRPBZFQz/1JFoJKyHbxJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521902; c=relaxed/simple;
	bh=6FH+xx6Z7YPdj2RrLpbKFD4oGi7nrYVvErb7BKuKDds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEOQ35Rdyl8fFALXtUcHgdCDvqOiPzX1BelSW/KmHIeA+209NoclM0D2W6DDCh6jyKXrpLbmPMrqT1G7AXvfR4+7tu5tXJVLuekbD83CZFEGqG3d89bgwuAfekQoLx7DIhjB653H8lux8/I7MA5YkgpngHdQ7hqIOxPP9v2Z3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B1bDwx8F; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6FH+
	xx6Z7YPdj2RrLpbKFD4oGi7nrYVvErb7BKuKDds=; b=B1bDwx8FrlnximT1BR2Y
	TvJIHZBSYaCGeAcFmDWWO2c1ZGnupT1Bbijrz0APANzn0vhd8IOXGO5u7mO2C932
	Z6xxFGLbxwbapLSguCzmqlij5YCMAURyTufpn1xmJXOb2ZAEj0BkitWps2UsnAus
	2OFbtvk6lkGKBnVk6qGjYnHkoif5uf1NZqfObHIZodozZv0fz4iQp6wKwY6adCzl
	3HIc+VlV6LlYklY0hEwJl4/iRhBVxWT50RmmzAsotCFMgfmvwLgE9OA7RLhw1y4m
	SmxbYaP0W7xMeJfi9OHni4nyM37rPOYS+LuKdXGc8qs9jiyQ28P4ubiuLFgsCENz
	tg==
Received: (qmail 3514068 invoked from network); 15 Jun 2026 13:11:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jun 2026 13:11:29 +0200
X-UD-Smtp-Session: l3s3148p1@Wrxh40hUOLsujntF
Date: Mon, 15 Jun 2026 13:11:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hardik Prakash <hardikprakash.official@gmail.com>,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	wsa@kernel.org, mario.limonciello@amd.com, brgl@bgdev.pl,
	basavaraj.natikar@amd.com, linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH] Revert "i2c: designware: defer probe if child GpioInt
 controllers are not bound"
Message-ID: <ai_d4eIId8Ml9g7I@ninjato>
References: <20260610083701.18663-1-hardikprakash.official@gmail.com>
 <ai8jhK9hUGHpojB5@zenone.zhora.eu>
 <ai_PwNWnMZB01AYU@ashevche-desk.local>
 <ai_cAd41W3iX1ic-@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3wNYid5tlrNlIDZ"
Content-Disposition: inline
In-Reply-To: <ai_cAd41W3iX1ic-@zenone.zhora.eu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:andriy.shevchenko@intel.com,m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38482-lists,linux-gpio=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,kernel.org,amd.com,bgdev.pl];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48BCE6859E0


--t3wNYid5tlrNlIDZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > $ git tag --contains ef76a3a28c79b6288
> > next-20260601
> > next-20260602
> > next-20260603
> > next-20260604
> > next-20260605
> > next-20260608
> > next-20260609
> > next-20260610
> > next-20260611
>=20
> Yes, but I'm not finding out how it got there. I only see it in
> one of Wolfram's branches, but I don't think it came in that way.

IIRC I asked Linus Walleij to handle this via the GPIO tree because the
proper fix landed there and the I2C addition was a mere cleanup from a
previous attempt to fix the issue.


--t3wNYid5tlrNlIDZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmov3eEACgkQFA3kzBSg
KbbEUw/+KttoUvU/VSVAEAZrdXls61HpaewzkGZG5CK+qIAzDVeBHSzr5TlfOlbn
/cdqaWcFt9AkVvkT+Xg2yd3Cv+I5KOJePiMbNkFAeEfUJGCgpA1QUb5Pn9WYG6lm
pCedUZCTQ5GN55wOUW2vgpls9utrSAcmWvO+Db+XcNAlIOJkdpdye1Th0T475j1I
PXcUTpfFV0vzQFsoyTVxZ+LlC3c9JS6Pry+LkCMJV4jVjnWfGlJx4P+Vw4O6L3xH
14MA6pVRcoUA5v9VcPBtEBg8RmoCAmMKxon9Gue6z73D+LnaFhA+XtVywDtqa67k
F84zATe8STszZkyLnHV/Qkom6FLs8ARnMzOSwqA8Kc+loUIaBjYZRt3lypNob87N
LzHXDsS93RBstxmE5PEywE4vN88LY8e87+TL2sQhpTe64mVnypdVwOKsu6hl6IJV
kjn2O2OAs0BES8FxKDfd1kXiQl8VdUUEuhlsT2Mq/bAMaLMuC8Ax5H9pUc1riOwa
eA2O7kcB6pfETs95UN1OV/Cf5GDtV7SqpU+bUzfsl5SIaYk4feZc1CapbLi/FRZ2
4Xc1UCQav7laON1uIXT1Gf+ztCSHnxtfxzKKM90NdA2UBHwj/YDLqmqvrQrqAxxv
xAriVjCsE/U2MuTcl8mWY4cCiO0CHP4l39OOAz7n3CFJXedjgRs=
=L9NH
-----END PGP SIGNATURE-----

--t3wNYid5tlrNlIDZ--


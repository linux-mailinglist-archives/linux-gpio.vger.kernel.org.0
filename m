Return-Path: <linux-gpio+bounces-36583-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPWfDgL7AWrjmwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36583-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 17:51:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E5751192F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 17:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10AC23044A22
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC523406281;
	Mon, 11 May 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VudydDlp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB89402BA8
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514192; cv=none; b=LlB9UWlt82ME6Sew5OmjQxaRxkTUXzdqYbzXeXtNMz0IsdPbEtujbbXsOpxwg2I5VG+hsf4evTCoT67/qYGYMojq3ToXBmpsvSvJzxGI2DqWjrRiNsB8zAFKeoYaejCdvmCh0q2q9L+pZuspb15oYh+LzuxAKmY1odntpZfIeSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514192; c=relaxed/simple;
	bh=XWv4iooXM+kZV542ynD7PIkUs+GMb+r0XpgE3uv/HbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0I0ikuSTPf0YIcd88OrScAmUv02gXrMMoYofOcWU1VqvOeNShdJSRpKpAz0Kh85uO2TgVf/UASRm+NsLyAqiLXst4BonzlhMwTBCqEVWwSmf4nptYh8jlyPstZDizQzqkV7ybJ5twiyC/EnGQqqSc8jrwbXGO2KOtZ9sfAkUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VudydDlp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DPY+
	hoF/sOYbmyB24QB0NWidccjogborPML2UWBBho0=; b=VudydDlpEZts65HdQ+Rz
	451TuuxkgUR0VpmkBHN/yKWQpMkKdAGppi85NzeBaamhOTLRa2MEvTfKjlwlEPeS
	wTnSR5T3u4nUC2NQvYUDSQOWY+LDb0AlZQ0LBV/i5XxV5Gv30jnwgxH/82Aqhse5
	rDRVmHEKsEAssgDuC/YigvuaPkebRQC1PT6tHCv9TtSuPTwameV/w87lTIj1MKdz
	WOnf32wRkSIPVO6K8uZcJkziekGukGWDGVM2OlZ4abj+mmrbvJszxYLhU1Eza0PX
	G/eLyvrNVHLKr9eLLHL690gVV/4fz/Zk8aOyF3uaLigppbuuarDFFvT9wZHMSHoN
	hQ==
Received: (qmail 2643739 invoked from network); 11 May 2026 17:43:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 May 2026 17:43:02 +0200
X-UD-Smtp-Session: l3s3148p1@NEMSmoxResoujnue
Date: Mon, 11 May 2026 17:43:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Subject: Re: [GIT PULL] Immutable branch between the GPIO and I2C trees for
 v7.2-rc1
Message-ID: <agH5BU4-9Y0lgi-2@ninjato>
References: <20260511123042.64315-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m0j7MFLm2//8bEfW"
Content-Disposition: inline
In-Reply-To: <20260511123042.64315-1-bartosz.golaszewski@oss.qualcomm.com>
X-Rspamd-Queue-Id: E0E5751192F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-36583-lists,linux-gpio=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Action: no action


--m0j7MFLm2//8bEfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 02:30:42PM +0200, Bartosz Golaszewski wrote:
> Wolfram,

Forwarding it to Andi who will take over I2C maintainership from 7.2
onwards...

Andi, you will need to merge this branch, so you can then apply

https://patchwork.ozlabs.org/project/linux-i2c/patch/20260511113726.49041-3=
-jie.i.li@nokia.com/

on top of it.

>=20
> Please pull the following changes adding the gpiod_is_single_ended() help=
er
> for v7.2-rc1.
>=20
> Thanks,
> Bartosz
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/ib-gp=
io-add-gpiod-is-single-ended-for-v7.2
>=20
> for you to fetch changes up to b5fafa01bdaade5253bd39317f5455d13e6efc7d:
>=20
>   gpiolib: add gpiod_is_single_ended() helper (2026-05-11 14:25:25 +0200)
>=20
> ----------------------------------------------------------------
> Immutable branch betweeb the GPIO and I2C trees for v7.2-rc1
>=20
> - add the gpiod_is_single_ended() helper function
>=20
> ----------------------------------------------------------------
> Jie Li (1):
>       gpiolib: add gpiod_is_single_ended() helper
>=20
>  drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
>  include/linux/gpio/consumer.h |  5 +++++
>  2 files changed, 27 insertions(+)

--m0j7MFLm2//8bEfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoB+QUACgkQFA3kzBSg
KbajWg//aLttIzl1KTr0NYb2C8Bp16ii2jOHJI6jlJcrMpVCN7ybVXToTcGVGQI7
gn5WskFnrRwxkT/b40EVN56Fqj1Z5/djQINQwEwARsjTdcClSA8Wn3TxcyiOtI2z
vkKufIEuyDO2/whK3wutImI6nQnkCGIwqqowAmQsPKKQLXtV0N90vqYwKr20XJDN
wWaNA94qmH9V8o0MymdaNb0ub/N+k7dM6QkDsfK/E7BlnXL7oN4Qwf+RKsuxz1tz
E40k3zK/T8+Awye268dxYyt0SZU3hLhy9xoWNsJaivNRBcZrZWb3BGDXMNqZ3fo6
nH4iM+KZ8k5T/SQz8xokHupGhIHStG6ZN5xvamojf0Et26AadH8A7MCkmDtNG1ny
S7O7gtFVyCkwU2DO+otxLjD+U5RSnFBcPR/PVC6AnzrdzFOSRAu8Y+S8ua9TTZTe
N9Q/wCDa0mQEfQWol6XeRsjCoiHy8w81PCqJ1gy4A85Lq/aTar3YeuiFQvWzPSBZ
U+puaEcmoamQ5F9OIN5FbSPd6rpMxu76+m/UFG2soSqui4Fzp9bMTXz+OZwSB5TJ
uflu4p2WiSxLz5kS4/16z1UaVovuI9BWrcTETmXqDD+Do1nUY8pmEfs75BR+dKwu
4du59f+BPGqo6fCo6F5LEV9h6mi5NmQ9F5nSVlMcHkTLlRMEZI8=
=Dc3Q
-----END PGP SIGNATURE-----

--m0j7MFLm2//8bEfW--


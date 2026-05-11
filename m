Return-Path: <linux-gpio+bounces-36572-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKJILlXPAWryjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36572-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:45:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DCD50E1D0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1196730566D0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CA438E5ED;
	Mon, 11 May 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPVJ5TmI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC4D222565;
	Mon, 11 May 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503148; cv=none; b=lE0I9dXdpIuI6QRTbl0/1czTPpNZlmwP0I75hfLCdg6lRAqvlwvrEaY42OR1v8tDC5vX0jUD9Z+OGG/96safKv7Xm9ttlGopcPad61+8tdnwc5aqMI/otgVwC42uuBg4IYTZeeEkjJ0X2OJjknukeUvSrZakBmmbvOYiZx1Qdec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503148; c=relaxed/simple;
	bh=NSmA4ulYXV0V5iL19uS6TpQM1B+oaa+q4LvvczJyrj0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=tXUPTRO5lc5EbB4DogyCusZ3NrEe0CAHOjtGs54CXAJN3961UYq7yFU2fBHjr7DI9k6/G7NB8DOOT05cLtFHnNpFG8Y99iHkPzbeGKBZK0bkcTNUCBh6Gu1ckrnpodxjyxnTGVCSl044qgBOKQtrqakJ1/me/tspUjMdpdrKfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPVJ5TmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88938C2BCB0;
	Mon, 11 May 2026 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503147;
	bh=NSmA4ulYXV0V5iL19uS6TpQM1B+oaa+q4LvvczJyrj0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=HPVJ5TmI434E9bZdWwofDop41VEmE0P5oZNC3r0PMg8BCk4gqD4LVOQMBYLgfxwrR
	 zeF4MdxSyXiSuvLUDKvmmm7AaFMI9fz9/UmBNcYDojME4VdCpSMz+xl4pj4RO3P/VV
	 kMhtMZYpuhnoikhqToiT9UGA1ZKtziAhK9bqY56wv3O1zew34iVeq5UXtykdFAcR03
	 Ou/k5YvwByKkxSiLb4HJMeuANJ3cKsKVatKBsbfypG9ZhUooX1V3KKSCGMEZqv3t/C
	 2yJXBoRa8GbDd10p/Q37QR8HkI3sVslbSxAc5rFQnl0pubyYQz3UOASrL96ij5jR/w
	 Vj69lHaOTf4oA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=3f511c7d94a2b29203e5493aa4d3fe7b61340740c98acf3bb7307e426cca;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 11 May 2026 14:39:03 +0200
Message-Id: <DIFUQX289BWC.1BA30N8GASOKD@kernel.org>
Subject: Re: [PATCH v2 0/2] Improvement spotted during patch review.
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Alex
 Elder" <elder@riscstar.com>, "Sashiko" <sashiko-bot@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org> <177850274681.64672.5290926520944173270.b4-ty@oss.qualcomm.com>
In-Reply-To: <177850274681.64672.5290926520944173270.b4-ty@oss.qualcomm.com>
X-Rspamd-Queue-Id: 20DCD50E1D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36572-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

--3f511c7d94a2b29203e5493aa4d3fe7b61340740c98acf3bb7307e426cca
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon May 11, 2026 at 2:32 PM CEST, Bartosz Golaszewski wrote:
>
> On Fri, 08 May 2026 14:51:25 +0200, Linus Walleij wrote:
>> Support sparse unidirectional GPIO lines.
>>=20
>> To be used in a forthcoming submission.
>>=20
>>=20
>
> Applied, thanks!
>
> [1/2] gpio: regmap: Support sparsed fixed direction
>       https://git.kernel.org/brgl/c/ae99219270a3d85ec38eee9458829bd45c11a=
eec
> [2/2] gpio: regmap: Don't set a fixed direction line
>       https://git.kernel.org/brgl/c/c3566b4a08707587fd52342f53cda1d7ee260=
7ca
>

Mh, my review comment [1] made it through, didn't it?

-michael

[1] https://lore.kernel.org/linux-gpio/DIFNX8HLL7X3.JGSENU7W32X4@kernel.org=
/

--3f511c7d94a2b29203e5493aa4d3fe7b61340740c98acf3bb7307e426cca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCagHN6BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hY9wF+Nkumxd6O86GEzHJ7W+X/8gx0KSC+n/zL
Kd9DPCCjHbvhPC6KLf6UOWcbUKi2LrVzAYCaBB9Z3qf1oLqF05XTbycKd+iEfigX
R7q2m501nm+fj8RILx5ziU0TuYOSAQFuww8=
=TlrY
-----END PGP SIGNATURE-----

--3f511c7d94a2b29203e5493aa4d3fe7b61340740c98acf3bb7307e426cca--


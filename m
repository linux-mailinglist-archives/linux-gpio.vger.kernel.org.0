Return-Path: <linux-gpio+bounces-36486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LbUFRUI/2mv1QAAu9opvQ
	(envelope-from <linux-gpio+bounces-36486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 12:10:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D24FF1B8
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 12:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F53A3013A67
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2026 10:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E353A0B3B;
	Sat,  9 May 2026 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q4iRFV4L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89938F64F
	for <linux-gpio@vger.kernel.org>; Sat,  9 May 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321423; cv=none; b=SAYb8LMqwPwCpxmKZnKhIXv/SGq0DzlmVQSCXecCVu/fxS21DfLyFUBfOLMjjvCQFURgOPLuc5z1bIdEJNx3uY7KfU6fLrrSTRjQsTAdB49jHqwLULxyHXoy+uBBqw296BMOT1wfjrO6bkjVfakrFd7022EbMaPhrWA4ScRDrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321423; c=relaxed/simple;
	bh=3gfaW6z+27O2pq1WoI5WtBCb0KMJI/xVJJaRoAwfJ98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3JkvCAzs5izath6rF9QrFHEpzdhsCwiHkxdQukIX3lvTPfz1fbB4IWhusSIzTyOkVvGK2sI7/QL00Rt5xtbgDWMUQoXd44N0ExL6U06+a8ZncQ+BIy1B2k5IxcFJ1oZESKk3jtE104yshZN59KJuORePvTY3ok9+yXIl029ooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q4iRFV4L; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3gfa
	W6z+27O2pq1WoI5WtBCb0KMJI/xVJJaRoAwfJ98=; b=Q4iRFV4LpX3jUtadLEul
	kgAn73zyLMqw1HzyT2hZdglqCzrIAgZMWbzfc0Vsx9xOC/JpQbRvB75qZATC6RyX
	Dw7XyFgpHzcKvDflSYNLXGz2l7RXSA9cxTh+0qeiW1FR8gpWTRvcoAud85LStsAj
	ryS6dNrnAHklEQDt2zBiIIQ/QUYBGST5jhGT0bRl/aQM8IeecPSkLrmi+MdIzuao
	7wF7mftQzRGfFKWv2BrJXACKn0fdkoNCokumzvOFIkBWSW2s0cdaY4UxiN4VEar5
	tLTeva2WsBZqiJ4d9wlaybQQZLu8E5EvzAkMN8W7S9UJoj1bmV5qyZJ0hkfjqlc7
	vQ==
Received: (qmail 1850297 invoked from network); 9 May 2026 12:10:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 May 2026 12:10:16 +0200
X-UD-Smtp-Session: l3s3148p1@zApLuF9RcuoujnuR
Date: Sat, 9 May 2026 12:10:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jie Li <lj29312931@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Subject: Re: [PATCH v4 2/2] i2c: core: support recovery for single-ended GPIOs
Message-ID: <af8IB46ST70lXVsk@shikoro>
References: <afiNrr4Llm0LWw-5@ninjato>
 <20260509091208.18346-1-jie.i.li@nokia.com>
 <20260509091208.18346-3-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bTGURmmXIWhrNSvw"
Content-Disposition: inline
In-Reply-To: <20260509091208.18346-3-jie.i.li@nokia.com>
X-Rspamd-Queue-Id: EE1D24FF1B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-36486-lists,linux-gpio=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:email]
X-Rspamd-Action: no action


--bTGURmmXIWhrNSvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 11:12:08AM +0200, Jie Li wrote:
> Currently, i2c_init_recovery() only assigns the set_sda/set_scl
> hooks if gpiod_get_direction() returns GPIO_LINE_DIRECTION_OUT.
>=20
> This logic fails on certain SoC controllers where open-drain lines
> in a high-impedance state are physically reported as inputs. This
> leads to a "deadlock" where the I2C core refuses to assign the
> recovery hooks because it incorrectly assumes the pins are
> input-only, even though they are fully capable of driving the bus
> low for recovery.
>=20
> Update the recovery initialization to use the new
> gpiod_is_single_ended() helper. If a GPIO is configured as
> open-drain or open-source in the firmware, it is safe to assume
> it can be used for bus recovery, even if the current hardware
> direction is reported as input.
>=20
> Signed-off-by: Jie Li <jie.i.li@nokia.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I overlooked that the change with GPIO_LINE_DIRECTION_OUT I suggested
for this patch is at the same location as commit[1]. I already pushed
out said commit for -rc3 and it is, thus, already in -next, too. No big
harm, but there will be a little conflict when applying. Sorry, Linus!

[1] b47bc7c022dd ("i2c: Compare the return value of gpiod_get_direction aga=
inst GPIO_LINE_DIRECTION_OUT")


--bTGURmmXIWhrNSvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmn/CAMACgkQFA3kzBSg
KbZfmRAAkZrdO/RKmct/mhLX++dozRsfY62Jip2X4CHkUfSmC9KCWs0zj5CWZ686
CJfyJq8HXH/kDysoouxxnKybzdRNiVbP5XBrbCGt9x1LU16Tea6EHSFgRWfgrohx
Biaw/EUfsbOaz7S1gj0uU9+YxqPQ/EZRa2f7mVKanoCrccpnwaFLauQelv4ryygh
D3uV7NJkRTfmbXYLySauTujv5USY3twM/izWCq5zxRXw23vozU9/z1fhcnlO6gyV
/6lY4zGDthiU8soqigBzxhVzr4CCJfZ7rMYz2eXOuCA9qYnYl5KUZwfETOtY1soo
wK9s9dnt1FkBAFG4YG0+GA5sW5MP5k1M/T/7rdLzBd4pl1BSf2KtZpr9PK9ipHy9
9ui/LbSS5a1l1/TXN0V6sfwQFsnH+t40v0hBu65rqb8wL43K8AL89+N+GNaSng0m
RTtsJRkMmZxvb0K90A7w/hXcymQEole4/F3y/NwM3DXjtlG9lLEIdF6FPEHoygCY
4GQ0S9ySq8TKrCMYepBIepiITAaDVhjg0NvtYnm0tD9ZeTDJlPfsfrImr/YM08tG
Ich7tNpZd+s483egItHXfPbu6v/AIIaUx7ZQye/l+0V5S367XxN2Qj4RWVNLIDFB
HyCod8shaQez7K9wlaTF1q+QtdDK9SciCUvdt36//X7yYNq9FHA=
=QGMA
-----END PGP SIGNATURE-----

--bTGURmmXIWhrNSvw--


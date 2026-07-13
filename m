Return-Path: <linux-gpio+bounces-39982-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xj8HCH3mVGofgwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39982-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:22:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01474B81B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:22:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=e0yVE8Rz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39982-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39982-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D82C313F8DB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC56D420871;
	Mon, 13 Jul 2026 13:13:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0FA419303
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 13:13:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948423; cv=none; b=QZRUM/KGpfvlpwuTNXnTgs1jtvwVUx7d0b/TXyvOi7IY8WzuYkOv1bWHXoWRI8wWlAN6Gj5l1NdDa/qAz6SxPMnPjUrz44r2BJaHhOrAeCthmwge1GKsd7c10f0L/VJZikjMsG5R01z1Xh/URJ+nvO9IqWXqrM23CUV28Ns20Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948423; c=relaxed/simple;
	bh=KRL9D4/vGZvAPShqNWAbQI/QAL3cvWn2pUiV0A5RHq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b30buEmS8rUA1ty1DJkU8JDzG1molKzDK+H3EmtBXI8UQO/vOpWqc4qR1s23H36KfH2bdJ8//6QRZM5EbBL0YTacCEwdEudRDg1ORu5euKyf+gA8XOXgziaPmMxYLamK63eJAfuh072lKbhH8XJYwr0wcBkzPTcq2Itn+Ct4/6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e0yVE8Rz; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1lzz
	3nAOspqkNKIQ+a3rbaThIUYxupcBWSHONil0Xa8=; b=e0yVE8RzxCXvPmM8/4a8
	I8BGL8zIHsI+Gtv7+d79ivwNYMZq7kjdpAGE/wZM17vza3hL+ckZrcTaHnvCnjEw
	cPJ7sHL8ee9eEzGJOKX+hYHq6F6fot+uYZbOC3PCpUf5v+TYhRBcyroZO5jzW+Si
	2YsuDVF4Lan4LqX5I7NT3h+1BRV/kJSQJd+c6KNFj7yzcT+epbzJn+iC28iFZeZB
	hz2KlzEFYUVFPvubB5NI4qIuxhciQ5S3L4AglNHcsbMsG/4M7HGlkT436ssCOwsK
	LECu8eKrRr8Np9Ed1NLBdsWZuqKBW/kSdCxgQLbez+qAOQarwUApDCjp+wY36IVt
	eA==
Received: (qmail 2644192 invoked from network); 13 Jul 2026 15:13:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2026 15:13:39 +0200
X-UD-Smtp-Session: l3s3148p1@6vPP231WGooujntq
Date: Mon, 13 Jul 2026 15:13:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: andi.shyti@kernel.org, linusw@kernel.org, brgl@kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5] i2c: i2c-gpio: Enhance driver for buses with shared
 SCL
Message-ID: <alTkghp_ejexF9ss@shikoro>
References: <20260713062021.2995641-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5ePiEom0yRrG9wJ"
Content-Disposition: inline
In-Reply-To: <20260713062021.2995641-1-markus.stockhausen@gmx.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.stockhausen@gmx.de,m:andi.shyti@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sander@svanheule.net,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39982-lists,linux-gpio=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:dkim,shikoro:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F01474B81B


--i5ePiEom0yRrG9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Markus,

>   - Send to LKML for Sashiko review

So, the review is here[1] now and it is fortunately not complaining
much. About the first issue ('bit_test'), I could imagine we add another
bool to 'struct i2c_algo_bit_data' like 'disallow_bit_test' and bail out
early if it is set? I didn't dive into the second issue ('ENOENT')
because I guess this is just a little extra handling. And you are more
into the details anyhow.

Happy hacking,

   Wolfram

[1] https://sashiko.dev/#/patchset/20260713062021.2995641-1-markus.stockhausen%40gmx.de


--i5ePiEom0yRrG9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpU5H4ACgkQFA3kzBSg
KbZrpA//fhNtwsaJEVdOlrHJxNrtxPzRfyFON0TWXlhKH+kVYPyWBkyxkYsOQQV/
O8zIvdzd7ievrRCQO79efD5yGQ4TRptb9cENp1cpZXqH1863cFBvwidytIeDPzHJ
tOrzZJGvxX6aN7EAV+luno7U/90o7/T3toEbSZ14yWmsGeRyzB2WrodMsiLTLOZg
tijESQZoPGhmSetWLhetyB3/bxwmDez30u7nZV2X9SwggOp6/LUaHAoql9ocT24X
s1z3z11zJ8stJcv6+c6owd13vmrlKxVWb3grva+DwmKJMGiT43yhEd90TNY/qH3X
1uO1irnh+XiWzmK+RF6XNKB2wFdIjznIp2uSI+G55jlExefPXCjOshUV7k8evpi7
OPzNkYPdOlUdR1mf3dQ/fbdqWVQlGhpwj6bmrnM4E8ZfxS4skyoaIx/5aThn31O5
E2mfV6I+rnsT+medIfi9cIUXXw+ARLDN7QItfIpkxauHNwI7ycGRRMW7WLXly51V
neZWaXYgRkO1815nQldqI7ln2tnCs0KF0Bj+woNBdnM6435HqTdz7cAooS+uceHj
vSZYv3bSNHdNCfUdeyqceiuA9iDgzMHM1O1I0J0OSLiJAb/y4oOP1LhSW9CuPhWf
G0QBMCEXWsahkAWY77o10HHBb2j3J3JoEoRjoX3jnKVDgvq654k=
=vpML
-----END PGP SIGNATURE-----

--i5ePiEom0yRrG9wJ--


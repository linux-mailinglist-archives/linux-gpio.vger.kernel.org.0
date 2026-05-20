Return-Path: <linux-gpio+bounces-37205-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO9PNVTHDWr93AUAu9opvQ
	(envelope-from <linux-gpio+bounces-37205-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:38:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1B58FC1F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E323300F969
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329573E8C5B;
	Wed, 20 May 2026 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LAFd1jj7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59E3E7BCB
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286670; cv=none; b=Rzu/KtAYymVD0G8yrfSmFr2kFOYqDt0D21hbwUZrOKDfvTczu+HF00GAR/VupNITCiCGLLAKWFrU7dVHiBHVtqGafgjNiL8e6UvHGgWmYHdtlzLyVD01VWOgfa64YF+Sr4trvncvmmLui1gwhAsU9xoKxE2BzVaD7oHL3Le8sXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286670; c=relaxed/simple;
	bh=Hfw/AFjC3kG8kqhs6xkmMZZyxsxOrl5KKNoqXah7gzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIWFzcSMDglqo3KhlJQZh4rsWPH4hun6WbNX79+PplgC2jpfHdhEEQYbC8yJEHl2AWzpfjn3vlkPRlijSNHgaz7X2jfVSBb2Mkowv/gymfd5nJm8Bbawo1YRrbQDZ339r1Mc4pibSsRTv0vvItBibnvH49ooTsHRubNXZeCFU+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LAFd1jj7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Hfw/
	AFjC3kG8kqhs6xkmMZZyxsxOrl5KKNoqXah7gzk=; b=LAFd1jj7NTZ6/3DQrf7Y
	wXIjs07DZyjAun5Op8D9KTZ5O5zCnHiiiSC5GnN1B1e6CetYO7Ruw0l0RlCGKrmN
	Cpvy6AuOXETQ1PPIFtQN71zYIkRJHkeztqGp6Vv1haHmcobPfWI5K7dOBaNKMht3
	x7+p1Q25Nxf5n33Kh1ylW59goTG9KwrkCc1tu369djs1syja88cimvMSHEx9rdZh
	bDkSJc+olNgmb3g+G+YO3/IQdLXAz9ZiBTmPsy3h02FiSSZJbX2rKKGBUSX4Nyrk
	wcAF65cBBmpZ3SU0yNKZ9kUKeWXD7seKy3mmNcXv1zFVXA6FKFZVf7c+8It2TS2S
	7w==
Received: (qmail 695898 invoked from network); 20 May 2026 16:17:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2026 16:17:36 +0200
X-UD-Smtp-Session: l3s3148p1@lbMadUBS+1BtKXOp
Date: Wed, 20 May 2026 16:17:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas Lin <thomas_lin@lecomputing.com>
Cc: rafael@kernel.org, lenb@kernel.org, hoan@os.amperecomputing.com,
	linusw@kernel.org, brgl@kernel.org, mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, broonie@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com, jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com, lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com, braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com, will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com, ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com
Subject: Re: [PATCH v4 3/3] i2c: designware: Add ACPI ID LECA0003 for LECARC
 SoCs
Message-ID: <ag3CfjgXzwFSCsdg@shikoro>
References: <20260520081140.637637-1-thomas_lin@lecomputing.com>
 <20260520081140.637637-4-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qplaqrBUnUFBPBuF"
Content-Disposition: inline
In-Reply-To: <20260520081140.637637-4-thomas_lin@lecomputing.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-37205-lists,linux-gpio=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,sang-engineering.com:email,sang-engineering.com:dkim,lecomputing.com:email]
X-Rspamd-Queue-Id: 49C1B58FC1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qplaqrBUnUFBPBuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 04:11:36PM +0800, Thomas Lin wrote:
> Add ACPI ID "LECA0003" for LECARC SoCs that integrate
> the DesignWare I2C controller.
> Also add corresponding ACPI description in acpi_apd.c.
>=20
> Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Because of the dependency, it should probably go in via GPIO or SPI,
right? So:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--qplaqrBUnUFBPBuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoNwnoACgkQFA3kzBSg
KbbIchAAiq7AwlvxqMOYgteUmqjMnZ2oNxEXRW2bDk3Cj0NVy8QrgQ+MD8CJJRxF
fq6NPSOoTCoRA+3D46v7KnjV/23KwwkZRbMJP05e5rq4JrMqFFDqF++SFR2kgEs7
ykWMNAaERSdis0iFrhSJTZuEhfME3yuE7xu4yRFWGGrl4VuxdnTVknHUVJH+liin
eCvqdx1TMrXfzDapSVshLt2VnKQJxn7X6UpzmAbbNDLblGQ2nYelwMCdQyDkHaPr
Pp0HtoJAvTa1815T1t06npUw5LQBiSUIE17bTxilRi9krJKRestMec3E3h3W4L1j
hT6SRROTFsMEOc613g+OKaH9C1N91oEtZjGppUZcO44cwiaLEhtIrXEajJhDZGQ2
sMB9wisdnE9Ciujel3u81MQDIkUgt8y+SZuKkCkxA6jWqf3YKCT4yh20+9za+hV2
cvaETvn/XfqY7YNlkv2fkf/FpbTb5xPCOlWcwRWNspd2LIesH4c9SZEfr/eE30/j
wtBqDgmEcWpNBy1EHTx7pm4q/0alMVnbvpoBnWNTpQWON6kVE5DRteHaFaiK+77M
VPTPqxRwCo565eVtdF2JRPDVSHnYghhVJDtQEs5lnaoU/jrQRJVD9SDiOoSMWboi
DCLfXY67fIG99g3tWtMHdNlQoyiHUfDy5mdRclyLtfvsnnLRbDk=
=dNF9
-----END PGP SIGNATURE-----

--qplaqrBUnUFBPBuF--


Return-Path: <linux-gpio+bounces-38175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LlutHSkKKGoU7wIAu9opvQ
	(envelope-from <linux-gpio+bounces-38175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:42:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EE16601D7
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:42:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=X4KzwdBL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38175-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38175-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 195353048DE5
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 12:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63039416D18;
	Tue,  9 Jun 2026 12:37:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA4413D86
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 12:37:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008669; cv=none; b=iEoN4IBqembpsKDTI3Hs2Uo/SHiTH3ac0Rl0ucmvNflVEsNaMg5EhnoR60j3CWkuJ4/cqf0TFBZb7IISVi5kQXbUtYWFQhjR0XE3yY8sZ46h1tU+AYElO5mmXoZwmbv5MnzW5fMsvUmIRdXqOfgoY6qaAGuekyKsfB0NPVv56VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008669; c=relaxed/simple;
	bh=OjjYSMPomOhwWFqEFMXz14LrPJYiz9EwEP/lmnYTl0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT0ALNw8OMta3TsKaCU1EoDhW9V2XmZc7P19Lp6aI43Q7OZvuDvzP73ZQ+WL/OWXnPWDDXhuIGvV3AjTz42EmrhFqWIrliuph0raEnXNXkqQpWaRVMAt1ZtE7MJxl0WO76JHvReVZoRc/y/QfMCu00u1qH6dbzD54fGPwjDvCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=X4KzwdBL; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OjjY
	SMPomOhwWFqEFMXz14LrPJYiz9EwEP/lmnYTl0Q=; b=X4KzwdBLdIf7wzZ/1YyW
	1aS+7NAQ0pKiYSXa5b4WxAtci+008jSKtGLyBhUOqDunqemK1tOy0PYbfSMeaCPg
	CuR2acJyL9SkRBcJCWCOokMsCwn1nDTdDDCcfGV4nvMahac+OHillaEpLuCdEopw
	9mRmsw4RWcKpYLSyA331jVYP3hmeFZBr6MKQEei51CZN5+4zC5GuaaXKYDV48ciV
	8lH2coWVP+0Pv4LcovFz7hJVT8Vfwe7VIEl2aOqSW6j8hYs9sOe3bXNcX+pUQQCw
	8xpmYgUyOKO93QMH5R4hfxCoIuIdZGLXq1nV8yQwHZpSaT3AXsaHs35he39cZHmX
	8g==
Received: (qmail 1274062 invoked from network); 9 Jun 2026 14:37:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jun 2026 14:37:43 +0200
X-UD-Smtp-Session: l3s3148p1@fFq1ZNFTXLMujnvA
Date: Tue, 9 Jun 2026 14:37:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	wsa@kernel.org, andriy.shevchenko@intel.com,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	kernel test robot <lkp@intel.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	ravitejax.veesam@intel.com
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <aigJF6hd1EjRiGc-@ninjato>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <90656be5-eca0-4a09-9b19-0c6e85f1d455@intel.com>
 <CANTFpSV7N=5U9yuXcU-D=PDpwj=kD__JU89UGL1HQOYiaL77qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oHvNJz1Mkf1rfBzj"
Content-Disposition: inline
In-Reply-To: <CANTFpSV7N=5U9yuXcU-D=PDpwj=kD__JU89UGL1HQOYiaL77qg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:chaitanya.kumar.borah@intel.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:ravitejax.veesam@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38175-lists,linux-gpio=lfdr.de,renesas];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ninjato:mid,vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3EE16601D7


--oHvNJz1Mkf1rfBzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Linus, could you please drop commit ef76a3a28c79 from your fixes tree?
> The regression affects multiple machines including Intel CI and Nathan
> Chancellor's test systems.
>=20
> I will send a corrected version once the rewrite is complete.

Sending a revert patch seems like the better choice to me. His fixes
branch is probably in -next already?


--oHvNJz1Mkf1rfBzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmooCRMACgkQFA3kzBSg
KbaI+xAAidNB6SVhGcGwfOHSnpSKOEAvybQk277VBG7P0PcEF0cttdwI7D7IsETD
DX9cw18GsQppDW0xhQ6IF4zitAOzgLYIi3qQ8VxdnGGRFJOJP02MSwrYAgJ4Srts
nACqtagWqZn3HuqvKcIIlHkZUxC2CHQtNU2apiXa1QZRWN7pvPoV6KJJWZLsQ8O0
6FJ6Jho7Icukd+WIuVTChM3OS61q4EKrUy4aKuGl+NrDdA4+XerbPOuRVZm9yZ0V
FjbWX1yQ/dVMoYZW26tgoZcvPCn3wWq83x34ZfPD07zz2AH76o7qaRMGZqmK3Y50
8R46QLlUCeX0gWJTavefbVxj6jffv8Fsgbv0NcoSCAPblRL2JcH8lZdbz6v3KdBo
wG1SY1bIP+xWpwZlTkoXiizvl+d1zHdsUr4KBLg0t70U1or9w4BwDCMCmVrx6Oxr
CI/D1Gviv40dEmRkyBPCv+t5E8Xg/gzObAMVaUnBzJtdsk0+qUJofFBqUg3LKQrO
Qr5RfQOGrBZhS1qwBuYF0pwlJIRb1Yc0vCfJcV5roR14NmWr3vihDx0Ba37Kyddt
Sxx4Ai17oX1/RhtEPX1mUQVwNw23pArH99e5kAEEiU8n0yAeRIrG1GTTOcKZCTRE
996PE6za+z/Tl7xk2m1uK0FsQxLn4hmso0icL9TRL3OFBBWaGvA=
=b826
-----END PGP SIGNATURE-----

--oHvNJz1Mkf1rfBzj--


Return-Path: <linux-gpio+bounces-39420-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4e/MAErVR2rpfwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39420-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 17:29:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE2703E08
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 17:29:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GyAnGwkk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39420-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39420-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 312263005316
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 15:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADA9417368;
	Fri,  3 Jul 2026 15:29:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE93A9D8F;
	Fri,  3 Jul 2026 15:29:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092549; cv=none; b=dw5M9ZmV1nfmQ95A+qhRiFG0byFLBpU+3WLSynfu1nlw/ng2bbJ+I9s/i8y4rZJ0pjFrFM8d5nyaf9q6FuYAwL3rDEh+ONGt09BiDANJ+jehK/deMNBfiI4X6oH1P0QkH7ljr6LxigEJxgQOAlbAB+xdYQX4lhILJyArQu9Xp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092549; c=relaxed/simple;
	bh=QRSZBzWZVvGk9orGFJlFPHLfube9MNKRgNrIAajuVKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTaBYHWKB+exqX3DMhuMPe94OBZRosvhcLEvJ15mizyy5pJqQy/VGgmRiuRI9wOxv0ThsIvTsZdvBCih47kPws3lMvKwypttgx3p6a8aZ3bSOn7zqBQYRG8jKa3OFZyk4FgcbRXljCsnbAK3wuoNQ1LS3emhk4Xs6CTbkbXBxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyAnGwkk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0F41F000E9;
	Fri,  3 Jul 2026 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783092547;
	bh=zCf8waDDfB9xkYRSX6+tsUG11Ds9BUUIgoWtZjK6W4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GyAnGwkkZLG9s2cAIU7WblN5rauL5m93TqeTG58sLZE2540Ui4DO7k6+hfnQv6xtQ
	 5dQxMXczODHl0gltoZZ9+L/xD7o1PWbmNUGfqso/xh2wL8MgSnpVtkRpSx2wDT9j//
	 QWvzW2omldxoUu4KlJ9GgJRX1OwN3bPDy/qk208/xaaYs4XK/sgOTSWxscDsNr6yul
	 /Sc6JXxZ1L1p1eNxxZHuw2QJ51DiUq66fZ665D+BIJvmat6DenY3JCLvCy/xTQwRuT
	 mboDjgH2yPfhSBJ8Lrju2m5Py9ccCelhcfsUcAA6ntQaCjz3EMqd2+tZZJhHn8sFEw
	 o5I31NtCPWBJg==
Date: Fri, 3 Jul 2026 16:29:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	William Breathitt Gray <wbg@kernel.org>
Subject: Re: [PATCH v1 1/4] regmap-irq: Provide IRQ resource request and
 release callbacks
Message-ID: <1e550cba-ab37-4f55-84f0-0dde47e7158d@sirena.org.uk>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
 <20260702130903.1790633-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w9gIsdYu7gdKaoWo"
Content-Disposition: inline
In-Reply-To: <20260702130903.1790633-2-andriy.shevchenko@linux.intel.com>
X-Cookie: Another megabytes the dust.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mathieu.dubois-briand@bootlin.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:mwalle@kernel.org,m:eleanor.lin@realtek.com,m:wbg@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-39420-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDDE2703E08


--w9gIsdYu7gdKaoWo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 02:42:54PM +0200, Andy Shevchenko wrote:
> The users which rely on regmap IRQ to create the IRQ chip may also
> want to have an additional tracking of the IRQ requests and releases.
> Provide a callback for them.

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-irq-reqrel

for you to fetch changes up to 9bb4c0b37d54fc7d61f2a21cfa635fa2e3a29ac5:

  regmap-irq: Provide IRQ resource request and release callbacks (2026-07-03 16:24:45 +0100)

----------------------------------------------------------------
regmap-irq: Provide IRQ resource request and release callbacks

The users which rely on regmap IRQ to create the IRQ chip may also
want to have an additional tracking of the IRQ requests and releases.
Provide a callback for them.

----------------------------------------------------------------
Andy Shevchenko (1):
      regmap-irq: Provide IRQ resource request and release callbacks

 drivers/base/regmap/regmap-irq.c | 22 ++++++++++++++++++++++
 include/linux/regmap.h           |  2 ++
 2 files changed, 24 insertions(+)

--w9gIsdYu7gdKaoWo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH1T0ACgkQJNaLcl1U
h9D8Zgf+PDEbAE/+D/5VEkn/B8vWqpXBcosPjTZYkLQ57a3WUbL0iROa2g25hun+
JZan+QsYOj3QvS99sh2JEQhobI8EMX6gGLoF5m+Wl5KupMnBNbhwwMgBFS3WjHuS
qm/7d0y9yg9wodNR9TxMubeB9gF0o6HLIbjVVZjvDcmmtYEPv0SMem62Am8nMTkK
kK2VnKQgN0JGuwBKsFaett31Plyrt1WEPHaTYQv6EBrjHf2d1ItNA4fhFeeXcbCt
LV0YAUGDkRURILmiC4tksZ0YG5tsoN9ct9047C+mYERil1BTZCeuOLFdddOPddNh
912sZBAbJ0ge571OpgUKCNI613HfTg==
=Qq20
-----END PGP SIGNATURE-----

--w9gIsdYu7gdKaoWo--


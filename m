Return-Path: <linux-gpio+bounces-33985-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDPXES5QwGlnGAQAu9opvQ
	(envelope-from <linux-gpio+bounces-33985-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 21:25:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22D2EAAD7
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 21:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 663F13006502
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 20:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B9B37E2EC;
	Sun, 22 Mar 2026 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="NKAB6iDk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AC3161A2
	for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2026 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211113; cv=none; b=YCUkERrNEOjxEK010PGP2krV5wnrcgGw5efXSj+2eT7v/E9JkMlpJjxe7yI2nOJ7fHVvKl0byPN2LzUTq1MjdVjFtHVGUZeXLAkLAL8xVltaP4I+4JaBMJnhncjwt3M//pGBzx58IbEkKu48zv86Gw42Yedx/aGB1Cvj8i32BlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211113; c=relaxed/simple;
	bh=UzvZOrkyH2KiOl3GkVZNbYEnERYOuCCjsuyEYPiscQQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5GBHUCk/PziP7DLMe5snh3nIGDoVzdJG7HN2y73ttqGtxeC5wUC9Mi8VBjvQZSafvtYbYaIhKlXvHCFJ/4FARbNXktWniTith6Ao8jhl9lrKoeBS9YAgamPipTT7jVU5tTv144GuEQfd/yZli5w1X7U1UhIurhKGAmDsBfAhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=pass smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=NKAB6iDk; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qvtF7XBvWDRQkpaGLE9ad1vkFyBG2/OdAjGcrifbbtw=; b=NKAB6iDko04hBP/x8OB6aBBMsx
	5vsBr0sTUMRrbF5ouevnE5mEJy9P7wwj2HFTLo14iPRxsr5l7PI7kmxfpj8Pp+qT0m5lg8LbV1nnF
	UoifUqWzLsreIYjs2hNn9ZltmGG+J+DfNo6wZLt+MTcjW5Mr+qLNxM5m/B7bQUFZOBfQ=;
X-Preliminary-Spam-Score: -4.4 (----)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1w4Ovg-000ri4-3C
	for linux-gpio@vger.kernel.org;
	Sun, 22 Mar 2026 20:57:46 +0100
Received: (nullmailer pid 2758654 invoked by uid 2001);
	Sun, 22 Mar 2026 19:57:44 -0000
Date: Sun, 22 Mar 2026 20:57:44 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: linux-gpio@vger.kernel.org
Subject: Setting gpiochip labels from devicetree
Message-ID: <acBJtybZd6tnMFKY@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	linux-gpio@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qODLXFmymggi5qt5"
Content-Disposition: inline
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_DKIM_REJECT(1.00)[mail.tikatika.nl:s=201709.tika];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33985-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[stdin.nl];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[mail.tikatika.nl:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthijs@stdin.nl,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,spinics.net:url]
X-Rspamd-Queue-Id: AE22D2EAAD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qODLXFmymggi5qt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

I was running in some issues with GPIO pin and chip numbering not being
stable, which lead me to two suggestions to improve labeling on gpio
chips. Reasoning for these suggestions follow from my journey:

 - I had a script that used sysfs, which I'm converting to gpiod
   instead.

 - I realized that /dev/gpiochipx numbering is also not stable, so using
   gpioset with chip and offset arguments would not solve my problem.

 - I messed around a with aliases a bit, until I realized the gpio-omap
   driver did not support this. Then I found this 10-year-old thread
   that convinced me that stable chip numbering is not the solution, but
   proper labeling of chips and pins:
   https://www.spinics.net/lists/devicetree/msg134513.html

 - Often, you can use pin/line names for finding the right pin.

 - However, these line names often contain (board-)specific labels or
   functional labels, so it would be good if you could also refer to
   them based on generic chip labels (which are often something like
   GPIO3-12 or GPIOC12). If the chips have appropriate labels (like
   GPIO3 or GPIOC) then the chip label + offset could be used to
   deterministically locate such pins. Also, if line names are ambiguous
   (e.g. with dynamic devices), a good chip name helps to disambiguate.

 - I noticed that the gpio-omap gpiochips have meaningless labels: they
   are e.g. gpio-0-32 which used to refer to the global sysfs numbering,
   but since commit 92bf78b33b0b4 (gpio: omap: use dynamic allocation of
   base, 2023-01-13) is not even related to those (naming is just
   decided by initialization order.

 - I looked at setting better labels from the devicetree, but AFAICS
   this is not supported currently (maybe specific gpio drivers support
   it, but nothing in gpiolib).

=46rom the above journey, I had two suggestions:

 1. gpio-omap should produce different labels. The current labels imply
    some global gpio numbering, but they do not match the sysfs numbers.
    I am not sure if the gpio-omap driver by itself could produce labels
    like GPIO0 and GPIO1 to match the datasheet. If not, maybe it should
    produce no labels (using the gpiolib "unknown" default) and letting
    DT apply the proper labels.

 2. Support a generic "label" or so devicetree property on gpio
    controllers, letting of_gpiolib read it and use that instead of the
    label supplied by the gpio driver. This would allow devicetrees
    (which have most info on the context, I would say) to use
    appropriate labeling for each chip.

I do not expect I'll find the time to actually contribute these changes,
but wanted to at least see kick off discussion about this (if this has
not already been discussed before - could not find any threads...).

Gr.

Matthijs

--qODLXFmymggi5qt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmnASbQACgkQ6ZMxy91t
JYz5/hAAs+j7B4qf4UyzGj/gJ37MXQMKcLHrlZdE46eMZnCL6Mdj9Op2rqD7dZSj
ftY4/q8GnR++WDjMpesMmlJ5kDfN384DDcWg6wzoS6MePEKRfdLlPJy6xcGutA8H
/0FjWBVlKxKg7Olx4UK88msuausCI/Hh/3fesG6iDvkpjebAPdoo8r29S/kkx4YN
J1ExQrAkB2c9N0zsLDSgDBm763xZwNx1ptRvKznkJ3m8vnSplMJ55dY49TMvDtkV
6MzSzvp8Zn5aaptv5gaL4H/l0MTx8mQsDJZUIvWbo8A0FHz+q1A2x3689Lm8AFSX
vidHskX54kvvS0nf6VXvliCSTJkfT70XavTrKbnLTnJX5ESQC44dHLa2mcQaKD6n
SiAGtdfrLt+Zl4QU5WaB9QIqAsPMaa7bDXuAVtA/n0vCwbea41Jc/1dxV4pKli48
kS/WxBT/Y1KOpsgxb8qGsKPD3SBcZIp7h3+TbIEM626AyhMNF0t7TtCqtMG0Hweg
UeEXbfCbNE7VpkqjF2K1hNb18DWbo9tfnFELVKaBMLfVhXd0k2czJmfACnHnYR8+
m8sfAeXp8QBTA5VqncaknBRKqrEu8VQMN9RSMHbbS3yAbWvPAVyaL8BhFMayWAh4
eVFgccxBLJC6cd+rdKz5ImPhno6emWTMnBdX1fLfKgzVcEC0zHA=
=v1Sf
-----END PGP SIGNATURE-----

--qODLXFmymggi5qt5--


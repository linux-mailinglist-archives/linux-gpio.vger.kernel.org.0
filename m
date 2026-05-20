Return-Path: <linux-gpio+bounces-37215-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJqdFBnyDWrA4wUAu9opvQ
	(envelope-from <linux-gpio+bounces-37215-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 19:40:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D752594420
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 19:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 061D73074305
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 17:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B853FC5BF;
	Wed, 20 May 2026 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y296BHC3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CAE3FC5B4
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297105; cv=none; b=aSxaRg1dWShRSOdMtckWBCFxdX7lkuSP6X7I5vvNZxu6GWGjRFEae/Q7PRwzj8IIxe9RJAIMsL68hIQ4sKIUMEa2h5ULeYPMxJELwR057JUO6uWHGXoiwu40TZK4txXPjKdIPV9N2Qq3Mpj613sVS/HG05LPlxeo4e/V/EG8Kpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297105; c=relaxed/simple;
	bh=k2Q85aaymmwbOsFUcDfL90XgQNjxC7S86f5E332dBT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2NeGjx2PkvPb5/9KYq1qzaX6N2ZNMpI523u1C8c+KHK8eaAKuRebtxWBIiC/Uhy1zIeccvLQMGUMbtWMAOEckwOhv0Hnk+FBzF42yKnQPuhbcWEmjA/3lAqCOCiSigkI2ffYIZqDcreO9eeNrzM/ruEQtO3OxIr18OxQvJhDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y296BHC3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k2Q8
	5aaymmwbOsFUcDfL90XgQNjxC7S86f5E332dBT0=; b=Y296BHC3Gsjhe5skVNgE
	H6oDtoQ1RYqb18IlBp1n8AMwTTnD+GRtdGsOsxe6+aajqa+ExVbfiV1lo302IFKi
	7bIuLzsRRGwy9k8/Hr/oKF/eW8lAMzfluJDri9bDEIsbSKYMZC3NKydy8/hzcJ9/
	nlZaBKRox7EZrotRdW1dv9HXIAsTXLJVvKugqAw3F0ZU9yW/k94ExoHKfeFCQ2OS
	PBXD6uN2wGXy7WfOFoxcPODyhMolR/3bdo20ojPcwKrouhJXuu2I+AXmGAwDda9f
	Qh4u4iYclP8FIRX7DlpjFI0BKqOH9HtmU+vS9ovGA/v0ClNuFzfS8PVXHxWRcxVw
	fg==
Received: (qmail 744310 invoked from network); 20 May 2026 19:11:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2026 19:11:39 +0200
X-UD-Smtp-Session: l3s3148p1@b8KO40JS3TttKXAe
Date: Wed, 20 May 2026 19:11:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Lin <thomas_lin@lecomputing.com>, rafael@kernel.org,
	lenb@kernel.org, hoan@os.amperecomputing.com, linusw@kernel.org,
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	lucas_hao@lecomputing.com, puntar_liu@lecomputing.com,
	jihua_tao@lecomputing.com, stan_xu@lecomputing.com,
	lumin_liu@lecomputing.com, notics_zhang@lecomputing.com,
	braden_zhang@lecomputing.com, harold_wu@lecomputing.com,
	will_zhang@lecomputing.com, aurora_jiang@lecomputing.com,
	ryen_lin@lecomputing.com, andy_jiang@lecomputing.com
Subject: Re: [PATCH v4 1/3] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
Message-ID: <ag3rSq-gx5bruPNW@shikoro>
References: <20260520081140.637637-1-thomas_lin@lecomputing.com>
 <20260520081140.637637-2-thomas_lin@lecomputing.com>
 <CAMRc=MfM38h=zJU5Uy7zu9pigjb-XBAteBhUmvMAKZRWHGZNKA@mail.gmail.com>
 <cc8dc59e-fc00-4f7b-9f24-467c670c5615@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C43eFg3inUFmpyWE"
Content-Disposition: inline
In-Reply-To: <cc8dc59e-fc00-4f7b-9f24-467c670c5615@sirena.org.uk>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-37215-lists,linux-gpio=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2D752594420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--C43eFg3inUFmpyWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 04:24:12PM +0100, Mark Brown wrote:
> On Wed, May 20, 2026 at 05:15:12PM +0200, Bartosz Golaszewski wrote:
>=20
> > I'm not sure about how to interpret the cover letter - is it fine to
> > take this independently through the GPIO tree for v7.2?
>=20
> AFAICT any dependency that exists is runtime only, it's just a bunch of
> quirks and none of the patches touch header files.

Patch 3 depends on patch 2. So, maybe it can go all in via GPIO?


--C43eFg3inUFmpyWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoN60YACgkQFA3kzBSg
KbZuWg/7B0Oyzh9DcRFzHGW1LOVv+kxrLl+xW5SlGK4be3TLyZh64SFUzEsyJbCj
fXK4DX/kR1DKWKdwpmF7DoI/8n3EpVzF/kH52/HU3P0zpcH5PwnudVyHL/Pscg9d
D9iKbEamsC5F+dPI4/V6xWDqWfjXNgKe5aO/w/SnLHbIo7ClF5BKyAzYulUWqOcE
9BuSj14mk7uAwok6Y9k9gsr/yNpBU9R3mpp9VvS7JKATH7FWnxv8Q16jWnXNVl77
V6M+priqzlBg0CeTEdtnpVY+6XwDt66axEtG/TgjAk8FIxSDebTAdTgKuL9Eo+uW
H/r6+G13vZdP7jQHj8obnlOOLJMLQOsIHUKIfJFiaXMXylStCqSCerVBbh3GATHw
4rxOnYOc4AXeARWNroecJXTZgwUfhlP01LliWAYeEDGAaj6O4lAbOCvFTBXROxWY
cDI8O9+je/Pz4RjnIWN6K8Y0YVB8vrEE5dXrvW4z08k+MffDeIB8Kw+rUKx62FSx
RP0pYTkD6zxZ0QamBA0woPfsWu3FCenPCOU/+h/tLXBBHJDWSoTtTgiDNcqvXn5c
fONzPtn0rHr+Q1yv8dgozrF0xXMvx+ausJSCWcTV6KaCVs1Z+CckjTdg4pyHcs0A
X1zzOEefVJIc8+LVcLAa/LB5uY9UTGsQyI9CFWvGWHsemIDVdjw=
=mm9A
-----END PGP SIGNATURE-----

--C43eFg3inUFmpyWE--


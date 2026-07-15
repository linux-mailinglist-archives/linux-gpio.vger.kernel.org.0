Return-Path: <linux-gpio+bounces-40102-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ePllCaNEV2qAIQEAu9opvQ
	(envelope-from <linux-gpio+bounces-40102-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:28:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DC775BE07
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=HAy2Tc7H;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40102-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40102-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0A3C3009089
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42CB3CAA51;
	Wed, 15 Jul 2026 08:28:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B473CC334
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:28:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104096; cv=none; b=n19t3Rw1xg9JVdObCxP4e0IJbrjAzp2VZRC+ehKw1d6lhtRtmdBL8GiYP6ZGvj9hLoPzGIQ/blGXAiF8ci3TPHeLm0T3vB1YCrznP85n9WZKGPFJ0jbKlYjb3Yj6B/s1G+VBlGkYeyhyT+qChzNgYz4qT21wlQHqAwd9fHM1AIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104096; c=relaxed/simple;
	bh=oS0yShL8lH7iApDc19SUZV793vxVBGx2UPG+ZpRgp2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LA60Yu/MqAr7GvrBAJA0D13wfJvUHYb2rz6RJxbe+uDnNojRHpsIiwF9fMBXjcdMEPUMB/8/eeqKOuABt0Yqkq7kUgMPoSzR9KzVrp+QbKaPVsBck5x5xF5wPRCLkBRwRszWtNMmU9knv9XPxNRnt10t3KYR+q84nIVMZ1oOAFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HAy2Tc7H; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oS0y
	ShL8lH7iApDc19SUZV793vxVBGx2UPG+ZpRgp2Y=; b=HAy2Tc7HlOfXgTlKjMGU
	jSeMPN9D4EcuOOb0N/J4NJHBnOB3sLtXl8p/Hh61C+ONL3HpdKmod7ceF9AE5QJ8
	5ghFsh698cguiGtnfyQdZsGaOn7BBqa25o8G2N6hobkTcVdSZGQhaT9sWtg4wjxI
	evDBTjtlyE54w1Cd5mMeu/Ul2n3mSlK5htyyGpYqdWbmDgs995Gj8n/DY4lHHeKL
	2cRcS9JvDApl7PKLH19TNf/osWIYakM4UiufoFoWiIYKSJMgV2Ja1PuXByDtCxVd
	vdzMkVbiIjlHSORUdqT5omXpRSnf5xD+aMh92aImiFnzHhLQ6BgsHAtYQhhiPm2Z
	Tw==
Received: (qmail 603824 invoked from network); 15 Jul 2026 10:28:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 10:28:09 +0200
X-UD-Smtp-Session: l3s3148p1@gM56GqJWcs4ujntW
Date: Wed, 15 Jul 2026 10:28:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sloppy-logic-analyzer: Fix memory leak in
 gpio_la_poll_probe()
Message-ID: <aldEmLvO97NbAxlW@shikoro>
References: <20260715075311.527753-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7s5ErWSDxXaa8lyn"
Content-Disposition: inline
In-Reply-To: <20260715075311.527753-1-nihaal@cse.iitm.ac.in>
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40102-lists,linux-gpio=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:email,sang-engineering.com:dkim,iitm.ac.in:email,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42DC775BE07


--7s5ErWSDxXaa8lyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 01:23:08PM +0530, Abdun Nihaal wrote:
> The memory allocated for priv->blob.data is not freed in the error paths
> that follow the fops_buf_size_set() call in gpio_la_poll_probe(), as
> well as in the remove function. Fix that by using device managed action
> to free the memory on remove.
>=20
> Fixes: 7828b7bbbf20 ("gpio: add sloppy logic analyzer using polling")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for tackling this!


--7s5ErWSDxXaa8lyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpXRJMACgkQFA3kzBSg
KbYBqQ//VQuc71tG/flGNxpUhjj6jVGBhQpJbQhQu+1Yj/M2JKsUdWqBqCMhCmIr
qZtNkF4U0pHuYaQJ2WvuRREXUVVWlFA9eLDaGFHgOuOWzmkJ3YcvBMWf5+IOZAvt
EUGqjSyOCrUxyrBZ4bWnG8pzgMPRP6MnshjgE0Hjcd3VyTt057JlALAm3thEDuF2
6tfm2szDDGcppCks+gGng0iyASCsG6j+V5DArk5YQPkKd87I6L7aWPB5ad8k5U28
ZvzKXYyc2IC56bYfRQ34ijEc6EyZAXKGIXJDQJjG4DGrjkTMEnCq97Eg+/JEiWhC
ep4rcdjCEBTgXhR5v7XSkceGt/XKzdqVKhR3bmXC1k22b3bfDBLDvGP9HhcCSF5n
53XhfUKq2ubjoDiEV6d1Rk8p0ugJdWTdl2LtUWn3LRn/XE+6C0SJX1Hi9d93qRD2
CYIHxcMgUXBgTY/Lwn0xbzhxkmypmVJDY/XY/2i29xTvKF0HLtLY0mjKmirkN7Mv
yB+7cW0IClwcZiWg6eiZnwE6whyK4lGAB/ujbITT002IHVMx9qwO9JVjKEg9bLVR
veQlnPkuWAfC5AdkYUp6GV4LKDdvTQMw+XnSW7K1TFNQkyI0XGtPL+HpsHEm88f+
TnttErJ/zI8vdUVHqsxlkLlw/OsM9PTJQBKFEuBPyZnsaZLKGII=
=1WKO
-----END PGP SIGNATURE-----

--7s5ErWSDxXaa8lyn--


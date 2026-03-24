Return-Path: <linux-gpio+bounces-34096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBDzDOvOwmnRmQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 18:50:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B091031A542
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 18:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A4D23098415
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 17:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E6D40B6D0;
	Tue, 24 Mar 2026 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q53Uk/5N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF68408252;
	Tue, 24 Mar 2026 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374344; cv=none; b=ARs2BWOsiD0t6zJebuYgstU676G1S87oktR4kSXQXtmxfSKpoSEPv1GhoeQKow37wagPLhNjzBFfA/VdUdYlcp2CwcvOJ1ONlVYFq0+KGljxdaNocj+Ou1/bWjpQqpXIue8omjbyanxsYDJm0Unqu9b2jACXMrdSvXMGMfHr37s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374344; c=relaxed/simple;
	bh=upGFHp7lyoGcE1KG0T65EXU8eX+EfmbRVqdvqDeIAUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz/ucQAhzBo4eUOWhAYFjJV9K+ysPgxA8jSMHzCYHqnB4hY1GgzCAMptUDXE26Mv3L4Dq3dUO+snsld9jLogaNmlaguaLioGCVZRQmwhierU1oi8pKnVTZ3azz84ONGN5LQHd0u0kmJ+79XVMlhNySJG6k8ZQfEhjGNYQEEM+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q53Uk/5N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F335AC19424;
	Tue, 24 Mar 2026 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774374344;
	bh=upGFHp7lyoGcE1KG0T65EXU8eX+EfmbRVqdvqDeIAUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q53Uk/5NNGvIwCylp+3SADOvVjiS9lI19E4nwffc+W+jPguD3LZXlfftiMeo5crNU
	 TgX2WXgSwVn3XLcam/6EC6/4KEqZf4nDLCX92j+I8yEWZr+hjxLh8h7pVUKYecONEz
	 qdWCrjPj1iBBNV9Yq+3s2AZrM2G9CT1iupVi5obIom5M5JiUKE6ViZGY9tlfGYh48Z
	 e3hsjZF+Wc68XDsUhinxv0FoV/RqQkOqblpzRRwQ2ZOn2YjSgYZ8DY8KLdEOX2UBMW
	 86yKUKKwTyPvehziOoiVWCZpTEIsgT+kdKFoLM6WGwqvso1Rky4DZEFiZ2OhOMlqNw
	 B/2KA7mdl51ag==
Date: Tue, 24 Mar 2026 17:45:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Message-ID: <20260324-grub-finless-bacbd4d6ff94@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
 <177425976898.21144.1074460491522922532.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BcLAMXhdpy+bmO3t"
Content-Disposition: inline
In-Reply-To: <177425976898.21144.1074460491522922532.b4-ty@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34096-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B091031A542
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--BcLAMXhdpy+bmO3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:56:20AM +0100, Bartosz Golaszewski wrote:
>=20
> On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Yo,
> >=20
> > Here's a v3 with an extra patch updating the gpio binding from fished
> > out from my old branch, fixing the examples and setting the permitted
> > values of gpios for the controllers on polarfire soc and the existing
> > binding patch's example fixed.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/5] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
>       https://git.kernel.org/brgl/c/ececb46fc947705f22cc8c1f9182224e7ec4b=
b97

Am I to interpret this being all you applied and the driver getting an
ack as meaning I should take the driver change with the mux driver
through the soc tree?

Cheers,
Conor.

--BcLAMXhdpy+bmO3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacLNwgAKCRB4tDGHoIJi
0v92AP9QtYZ5z+bPYKGuedxGPgH9ZXMFl7PX5WuGUMEFrWPrSAD/c15IGtL/CEKi
ha8FmsQczul0R8gZyiQtGTaBH23qAwA=
=/NsT
-----END PGP SIGNATURE-----

--BcLAMXhdpy+bmO3t--


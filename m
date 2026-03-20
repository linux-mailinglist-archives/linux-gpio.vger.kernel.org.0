Return-Path: <linux-gpio+bounces-33939-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFDALI2FvWnQ+gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33939-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 18:36:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF02DEBB0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 18:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3BD4300D0E2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 17:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211823D34BE;
	Fri, 20 Mar 2026 17:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJfDfhUr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DDD3D3307;
	Fri, 20 Mar 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028170; cv=none; b=FwDEdtoIoGIte1JNkLE1+HrT8vZLalh8SeG2I/WRjRVfpPhtbU6Kp8lVrLupzas/Pyx3k8DPNJS0BYH9J2nfLzDSgyyxOq4fthjAJFrtExjoxFjQzOgq9bjG0bgYIT+EFAtKhxvp8NS+IJaG/g2RjZ1j6l/kE/6MzpJmQICWYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028170; c=relaxed/simple;
	bh=RpJfepnb7GGdFTxCrU7BUG5rwTfaWPn+NuwoCxqNJw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTIxC9Oq5s6EUxv/M/6u3nrCH/FbHzPBMAMpAtOfzN4g43HxmT/55OITmTZsBKX2eYc4FcugAi72GkqZFOEC2JPx/5G2SB/pUtm+AghvK40lLiOby6OkLbXXnGw7rT2XkHELnoSQvyrCeFzuCc9VFPyjwlJrmq2b+qLP7zID8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJfDfhUr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8A9C2BCAF;
	Fri, 20 Mar 2026 17:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774028170;
	bh=RpJfepnb7GGdFTxCrU7BUG5rwTfaWPn+NuwoCxqNJw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJfDfhUr5ViEbIVnipPiM/jeJK4WHWBX8IZUYZ4OSkRbMof5n5+Y1sGw0J/2tOiaE
	 n6pgdUZ09ontmjpry5grrBJaHAKLc/4IfxshquSK7EHuNbs+wWrmkOhYShqVBBP2+X
	 WRRILwSkszi0SY9kt3BsWWVOvwzp452qIS8F5+XOI9V/lNCQtE9BaqjLeTuQ8Ouo8G
	 eXIeYEkSGKSSoIfnZuAQEOovCFx1yw67G6NlhL0y6WqNZgxnSND1mawv9+FllLPK5t
	 am9CrTQT5/4oofhk/3nfW/8wM81le1vXyZTFvDF20XFioRBrhBOGlAzNmGV7EgQ9ny
	 /pFKtgTT0MbRw==
Date: Fri, 20 Mar 2026 17:36:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
Message-ID: <20260320-herself-unless-69288c6a3c43@spud>
References: <20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org>
 <20260319-mfd-arizona-irq-v3-1-24c251377ec2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRUQTrudxFxTPZlk"
Content-Disposition: inline
In-Reply-To: <20260319-mfd-arizona-irq-v3-1-24c251377ec2@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33939-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55EF02DEBB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--rRUQTrudxFxTPZlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rRUQTrudxFxTPZlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2FhgAKCRB4tDGHoIJi
0grWAQDuvuFa5z4HPw9IV3hAcV3Dckk2lfqC3gSYhFTJWCJAXgD/UeJwnPru8MNF
Jx0kVWISTpEJPL5mlSro2p7+ue4J8gI=
=udSC
-----END PGP SIGNATURE-----

--rRUQTrudxFxTPZlk--


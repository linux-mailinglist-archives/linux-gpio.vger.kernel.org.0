Return-Path: <linux-gpio+bounces-39480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +QbNNdBsSmqCCwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 16:40:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146E70A581
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 16:40:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WqJAyhuq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39480-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39480-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D38EA3009B24
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 14:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F163812DE;
	Sun,  5 Jul 2026 14:40:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10883322533;
	Sun,  5 Jul 2026 14:40:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262412; cv=none; b=l2NAxXWlb9T7Yp3G0r9dmViK3rd266f2iFA3uKocTJhYTAKj01G6iOfCq3LWvLezESQIGFxIbC61+0t+UniSPQw0S4alsJKpe6GYS+oMi0IGL/IBvBWE/OgejfqL1/x9+xIpzGeZG73prlfGmY0a30ZH1umt4M6gscCNbz3noZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262412; c=relaxed/simple;
	bh=BwKl9eMFvBj2osYggeywwCFY0L9kYCh5LIP7hc+VV10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcE2scOGwiquAC+yFVZM55nMlk+Y6rZzuiqR73Rn0MlmgCIlgW8hu3LxLGgZMMZ59GhlXdp61UyRf22ReJgaZpwuTdJN9GW1hVXTqF9pYU18w2dHwxotvR2aN47F7QVglpqkbx68CrwJKYLFS66vI4epABewwKdmkAsvHfIDJJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqJAyhuq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7CC1F000E9;
	Sun,  5 Jul 2026 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262410;
	bh=BwKl9eMFvBj2osYggeywwCFY0L9kYCh5LIP7hc+VV10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WqJAyhuqBiLYHCzO847uhFl2ZcRvAwHUrPn4aD9iwmwmVPr+JJM4SK21TGh4Sg/+2
	 GxaPbvsMQenTd5e/K/o2pJs+xHOvdwxfV1ENX0Bh9VPr3xi/MaOdzxESRLNJqJ6Gbr
	 EXS/rQopGjuzVCzU501QtaYS1SbBaLfvlMme6arz6PbpH4NcyoDbIta6TpL1Rql21S
	 R0hdAQwo8m4jP6R/rpl9VMsW1Cnm3gB0zmhFMWFTl8g5CR2wXy7dFu5MnthIKWA38l
	 ktdwMhCqWYY7nkjHbORAhnpQF/nuWGZNM4fT17qMRPMaKHNXOtzSu78J/kDd+fmcXz
	 YNnW494n7neuw==
Date: Sun, 5 Jul 2026 15:40:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car
 X5H (R8A78000) support
Message-ID: <20260705-bonded-zen-203d1a3e5c6a@spud>
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Un3OC9OyrYdULEP"
Content-Disposition: inline
In-Reply-To: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-39480-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,spud:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0146E70A581

--+Un3OC9OyrYdULEP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+Un3OC9OyrYdULEP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakpsxgAKCRB4tDGHoIJi
0tEQAP97T9HhU5jtAU/UofNCxdWT+VF/390G/n/9FSpRmxum6AEAw9CENBOsBSdE
77+QdJ/tEk/Istd5cPG8WFhEnNZKyQg=
=dNlk
-----END PGP SIGNATURE-----

--+Un3OC9OyrYdULEP--


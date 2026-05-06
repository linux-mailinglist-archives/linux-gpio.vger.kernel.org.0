Return-Path: <linux-gpio+bounces-36316-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJD6M2dz+2m7bAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36316-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:59:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 373FB4DE80B
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3572F300B61C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 16:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52351495524;
	Wed,  6 May 2026 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SI63Tth8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E444D039;
	Wed,  6 May 2026 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086520; cv=none; b=cnhPP106bEM4nQJ77hOB3S7GVrpazhjOBVmyKuzC6qU4WKm8EswGdN3wQmvM1xW3oIcY8qLWBH6WKrFfZiCVSQR+yKcox9PIUZC7QZHWuW0x57ui7+a+y8YNE/42ns2Zf+91PBKB+at52N1SphdOP2AzOo9X74PN0P3gCvGG6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086520; c=relaxed/simple;
	bh=+q6eX8yap3aX95o5D736mBa/UQIp49KQ5RRhNt+INSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmtP4NfafZU+yREyJOy2bLn5uTujzRxvjkt4Fpsft/9lrzW+DCAosRu4ORKt3DypLPN/PexyYeXdw1eMAw4kw9qEMnietuh7m69VrBjLZf5/jLIrx6vI48NxjZyhsu+U5UzKyhDAOO0HHs8VkgXxNyI0P8FZ+QkLUVNJDOnv7DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SI63Tth8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A299BC2BCB0;
	Wed,  6 May 2026 16:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086519;
	bh=+q6eX8yap3aX95o5D736mBa/UQIp49KQ5RRhNt+INSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SI63Tth8CtQhXThTfaW+P+Icg3d7+aW7B1qKP8POWXAc5liWzky+u/nckHFsoqJXO
	 LuCosHuBpETK1hNzPDzXv8vAlLXhU5Xt6+rdTZBtUYA09MANu80TTtEiytwKl/0HJ1
	 WRIuDqYY5GYjiJgO/cwz99fBRIdM3N36VbBjKN+wp77DDwpOdICGRHwT78tgAEFwHI
	 215hESx2BlqJnswP+xphk0YlVxt/EabtkMIHgVNSy7HZzTzmjOLMd15KdoHSDOb6+N
	 3EzLYi8XBRAwa2w7jgp+f3nCjKsDx2ycb2u9o0DUHnW8/9wMgp+oOccVa4NtUaniDt
	 gEqMqh02qzeJQ==
Date: Wed, 6 May 2026 17:55:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260506-throwback-cheer-a4fe420281cb@spud>
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
 <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VTJgj70HPTOBEk8v"
Content-Disposition: inline
In-Reply-To: <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
X-Rspamd-Queue-Id: 373FB4DE80B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36316-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,aspeedtech.com:email]


--VTJgj70HPTOBEk8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 04:06:18PM +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
>=20
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
>=20
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VTJgj70HPTOBEk8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaftycgAKCRB4tDGHoIJi
0pvzAQDCNCKCmxnYX47+b38C6ft8fB0xKq3WT2RY8vc+AsD4lAEA+acP/gpGYmZT
W8BeLJDQjk2yIgetqkKZ1Cfz+UYsSQc=
=1DWF
-----END PGP SIGNATURE-----

--VTJgj70HPTOBEk8v--


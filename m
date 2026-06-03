Return-Path: <linux-gpio+bounces-37913-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mQgJDH9bIGps1wAAu9opvQ
	(envelope-from <linux-gpio+bounces-37913-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:51:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BEC639ECF
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:51:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C7BrbTck;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37913-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37913-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD6F7302E0CD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 16:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D7D3ED5C5;
	Wed,  3 Jun 2026 16:43:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED812D238F;
	Wed,  3 Jun 2026 16:43:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504998; cv=none; b=IfZxZq6zHigkd+1hqyCt3AZYrGnerD9pjshzDhgrviiSPDxBr4csX94Prd+kxiOQdy1J73mmyJuakv3Sa5wnVZg4axkDrf/vsk64T65Y/eFMeZKDX3Pp6Pw0gax3hR54xJ9vyHo+Y3N9lCQMafPEcUsKTodRis3rnlNLXpatCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504998; c=relaxed/simple;
	bh=dntpDrMGqALzXTr+vxV/nyexYipxCv7gzTVl+1ltPdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEzLPK5XYO27U2sc3gCEfAUW4FGGBtfQkLJf8IZ9gUf0kSGQ7mphJ3vUQpaztMPclUqamrEu/uT5jGpLAJaXsh8YxHCJl8XWwso7ieLBDL83/Tl2jUk/HEJxoPp0ybOledT+madGOmxkGp/DJr6HjR4sQRx1hCD9Iny2zNnqwyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7BrbTck; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955271F00898;
	Wed,  3 Jun 2026 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780504996;
	bh=Z4JstCrvgUHq+IUxWBlO/QMKc5rWKAgnPJ1UKfXNnss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C7BrbTckQvXcWoV7k+AEBCsEVHxBwBKyRVbQMNUucK6Up4k+mlR/D2B+ty9bTqLC6
	 TXyYpg2iAmZbYrcSf/IMx42niQl+mHUvOCBb0t+zktt8WMQQcFeeZ+L8BsSY4TYrFe
	 SMxLlsrDm6jSETCY+mtmezh1ig1ZWzqM8StHwFWddZgXGWQRMy7Lzaz1dLLvobS5Ii
	 dA0lkSooslWUAphAp8eOjJTAjX54a8pnk1nPZ0IJK6im27QMOvdGhM7NfhvaKPvaXt
	 s7dJq2RJ1BZSMP41cVQv4yxHtDPtyuHL388CA2+C9GMN7wvIH310E7UgCTsSDcd20Z
	 it1IkgBNDLRfQ==
Date: Wed, 3 Jun 2026 17:43:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260603-groin-valid-a1d4445f7a6b@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nFVpdkwrvTMCfj3J"
Content-Disposition: inline
In-Reply-To: <20260603055347.66845-4-changhuang.liang@starfivetech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37913-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:changhuang.liang@starfivetech.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84BEC639ECF


--nFVpdkwrvTMCfj3J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 10:53:29PM -0700, Changhuang Liang wrote:

> +          slew-rate:
> +            enum: [ 0, 1 ]
> +            default: 0
> +            description: |
> +                0: slow (half frequency)

Half frequency? Slew rates are usually measured in volts per second, not
hertz. Do you know what the slew rates actually are and could put them
in here as the real units? Or is it just "slow" and "fast" in your docs
with no precise numbers?

I've got no questions other than this, so once this question is sorted,
I'll be happy to ack all the bindings provided they're effectively the
same.

> +                1: fast

--nFVpdkwrvTMCfj3J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBZnwAKCRB4tDGHoIJi
0vpAAPiFQ0YARyxgZCQaUynrtzsvBAbt0yy5kxy2vpklo/C5AQDWjzznOIi1/0El
tLNQlHJKrwJ3v5PG6RXO8m1+IwCdBA==
=GdZR
-----END PGP SIGNATURE-----

--nFVpdkwrvTMCfj3J--


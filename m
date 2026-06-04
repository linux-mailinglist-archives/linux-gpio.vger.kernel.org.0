Return-Path: <linux-gpio+bounces-37969-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +DzbC3K0IWp5LwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37969-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 19:22:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E44E642490
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 19:22:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PVJyKJwi;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37969-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37969-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76D3830580A2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 17:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FB64A3400;
	Thu,  4 Jun 2026 17:13:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB64968F1;
	Thu,  4 Jun 2026 17:13:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593207; cv=none; b=LI3N3CK0RHP54onuPTx2VOa/V56iXA0JNXKnDzMLQLf71vWewakaiZ7blCi2VPcvOD0koSYWcOVIu55cBaXeKZNScKJK3mdggAamy3dFEAm7WMjQ+i1hgrOApnLEPoaVhJ8NgM+3CJPjmRgBu10unpKieXpfQGhNgrl+jR2UkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593207; c=relaxed/simple;
	bh=M9HqPMUgUTrZJq/Oda3TrjUQxjZBJ4y86DavhVAAMKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReWA4/jEsw5YrOHx0vHlFbjfGhxbz/RJg8P+eY5Jke76ILwTaZI8bEi8OFq1G5AmZr+FjzEenKNnGvC7aWJqAaoE8xDDDJXge7Na+riLnlm8wEgfu+iNQjr1yyNKc6Vjh4kHgukpGWxEMTLOLvhiE2E7B9XcjVNmX2uPJKXrm+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVJyKJwi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231EA1F00893;
	Thu,  4 Jun 2026 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780593204;
	bh=3mNke4DPpjdjtMGcSKZlm7XTAekMgE3bOVU/KndyzOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PVJyKJwiKn4E+C2SFTGIzj7eZ0Pfz8EP9cwAr4kKCEOszyGFgTbErgFQUsdUm56hr
	 j4MFUxmPCMVR7CuieAhrJEFRlowxFkZK21I/gA2ohkxEJq5SLxSpEMVUWu4/NmhmVF
	 cB6zsftZUDCZyqbsRSepsPxbeYMHsKriG96aznk/2a8vNPE1V59Y+W81M40xOmjqkT
	 u/Oc5IwDzDJ6UG5bt2ih+hx4v87eP8j7JimkOqJDMi2fyiPZBEVJ/nVCWMUB7YhSmK
	 sKZxiO2rUIqnz6hdvX+x9kjlD+sZpM0ykNqMkj2qqDERYLCUGKRzBNmdxJG3nUiXEK
	 qo5+YOx6oJ5hQ==
Date: Thu, 4 Jun 2026 18:13:19 +0100
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
Subject: Re: [PATCH v3 09/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Message-ID: <20260604-veggie-constrain-16a72066e82f@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-10-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7KP5dV2MCZU0dpPN"
Content-Disposition: inline
In-Reply-To: <20260603055347.66845-10-changhuang.liang@starfivetech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37969-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E44E642490


--7KP5dV2MCZU0dpPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 10:53:35PM -0700, Changhuang Liang wrote:
> +          power-source:
> +            enum: [ 0, 2 ]
> +            description: |
> +                0: power supply of 3.3V
> +                2: power supply of 1.8V

I'd rather these were given in e.g. microvolts, rather than what look
like register values, that have no meaning when looking at the dts.

--7KP5dV2MCZU0dpPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGyLwAKCRB4tDGHoIJi
0qJ/AQCQ/vPUMhGA0s99RrlfmIhY43MmG9ypad6INnfVMc+/ogD/XOOCyrLph3nG
xf3MOhu5OXndhUYDq+Zw0JVREEKimwI=
=gfH/
-----END PGP SIGNATURE-----

--7KP5dV2MCZU0dpPN--


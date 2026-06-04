Return-Path: <linux-gpio+bounces-37968-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2mNLVCyIWokLgEAu9opvQ
	(envelope-from <linux-gpio+bounces-37968-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 19:13:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A18A6423EF
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 19:13:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TITIy85J;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37968-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37968-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E102E3016249
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 17:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68E3495505;
	Thu,  4 Jun 2026 17:06:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153747ECDE;
	Thu,  4 Jun 2026 17:06:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592803; cv=none; b=upwtGUa2NW7iNTkDDIYDNjWhTsc254evpZBiukzma6aevACLl4JNQ51+QEK+rcshA9JVLTJXqsaPvM/cH10+zj9004DfhWm5JUBHbA3rMbQvITaOaUpLYm95e0gHb8g0kqTjg2O8nXY4B0wuxDqDm5xu3SgpiUW6UJ560/5jurg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592803; c=relaxed/simple;
	bh=SZONiF7ghlZM9h/Sl8iPCmr9qNxd8DST8TS/saxze24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuyYuP2ohEi33/tebNDR6voz3v9vZIyVIdnGsQ/IHqyJ4Q9sMBqqN8ExlMQ8tU/Lsxlxu44XjS67yiQrz4sAEY+3A2BsPlA47fupIUFJRCaJVW8DyA4QXioHhYaqi5HTe8vooFo3w2CCvQ28VvYxlE4Loyzt258Q90PZLkaJAVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TITIy85J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0581F00893;
	Thu,  4 Jun 2026 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780592800;
	bh=THDk6fTtan6fuBzI69SEywQVTp9gJKd2GNHSC2lTvFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TITIy85JoinwJOkeT5cbUxS/Vc16E4lfxP7pIaD+by7otBrL5scyE0dw/MHtsFjfT
	 BWnjXNl402YIxvA+X6fqqtX7VPAbhzOYFQd/rX2/xhtWtntIg+68nzjnDY4q9mmqgH
	 uTG05lAUAOKwGUNbdxI79lFxAkT4bZqdg4bOmB9qoccvuaaxOlbO55ijuq+C9Q3SyM
	 A+YqCOwt9n+uIrGqeBYZFtNWLA35/G/aznjyGmkFGoINwv/ZNsEfZacjIftDlPiY13
	 t4cRtRPjwalb1xr/DYiIkE89mRuUGrk2k0AbteQSoKqLSQYqT3Ek8C5ZRCZosVqxFp
	 9Fhs5n5Vfwh6A==
Date: Thu, 4 Jun 2026 18:06:35 +0100
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
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260604-sprout-zips-c2c29e26fe1d@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-4-changhuang.liang@starfivetech.com>
 <20260603-groin-valid-a1d4445f7a6b@spud>
 <ZQ4PR01MB12022B5C460A34260ABFCE9FF2102@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MzAYvu0zafqbmMzc"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB12022B5C460A34260ABFCE9FF2102@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37968-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:changhuang.liang@starfivetech.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A18A6423EF


--MzAYvu0zafqbmMzc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 01:37:00AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Tue, Jun 02, 2026 at 10:53:29PM -0700, Changhuang Liang wrote:
> >=20
> > > +          slew-rate:
> > > +            enum: [ 0, 1 ]
> > > +            default: 0
> > > +            description: |
> > > +                0: slow (half frequency)
> >=20
> > Half frequency? Slew rates are usually measured in volts per second, no=
t hertz.
> > Do you know what the slew rates actually are and could put them in here=
 as
> > the real units? Or is it just "slow" and "fast" in your docs with no pr=
ecise
> > numbers?
>=20
> Yes, there are no precise numbers in our documentation. I will remove "(h=
alf frequency)" in the next version.

If the rate is actually half, then you can say that. It's just
"frequency" I was objecting to.

>=20
> > I've got no questions other than this, so once this question is sorted,=
 I'll be
> > happy to ack all the bindings provided they're effectively the same.
> >=20
> > > +                1: fast
>=20
> Best Regards,
> Changhuang

--MzAYvu0zafqbmMzc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGwmwAKCRB4tDGHoIJi
0nJAAQDvcEDwiD+3GTqQxZ57p33w5TBg+tRlXUgDnfGimF7w0wEApwva9vTpq3gk
vsB+mH5qfJJ7+KJ91nAQQG2RyRvuiQ0=
=h0/2
-----END PGP SIGNATURE-----

--MzAYvu0zafqbmMzc--


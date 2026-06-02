Return-Path: <linux-gpio+bounces-37842-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V5Z1EJREH2qmjQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37842-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 23:01:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D4631F95
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 23:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=DBC0jfpI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37842-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37842-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67CF63006B01
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 20:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2CF380FF2;
	Tue,  2 Jun 2026 20:56:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4229CE1
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 20:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433776; cv=none; b=o/nGfW2pIKJbBaT1lLAWcAh/gdDdvFPzhLTZKBav5GZBR4KDtYQE2SWNIKkWwsq6Hu1Bfk3JMLUc4SgQjR9l3f+jCraatr3KiDpcL3Ib1wB0joukP0CmGMMcDIHWDxI09/oFDV5kDny1asuo44TmUQX+W9fV76XkpRxhQKJinEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433776; c=relaxed/simple;
	bh=CQdkJzNSN7KYp8UJnkA0YcRmxVhL85hELiH1V9WBzvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw94PGR7UtdDri9uGluuykMMAU2nnwINvN4DBFGEQ1+dOoYbou3mQo22AvlSS+zQzsaOx4eaT19pzrejSXpeIdB2uOXxjrsksbdCfu0+nmjxocLCEvxClHUTS9UUSdu50j7kUpHtrlNi2AY/Gn4qaDHHuoPxqiku4/2aJSi7WHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DBC0jfpI; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CQdk
	JzNSN7KYp8UJnkA0YcRmxVhL85hELiH1V9WBzvI=; b=DBC0jfpIF8rCD/nI7LWa
	I1EOTOtu8v+FsTOjyz63pYZgbuP/SULAu1oI1jbvVMYn/3jUfFfcaB/6CNTVac7L
	y2Q2uMc6QE4PeU6v/ecTg7S7tm8CIQ5peyhF3Uf74OT9LmJvGdo4yb56ePb9F1t1
	JRJtPAuj+di2D+Qfh09Oy3DrEapUNcjcIj9kjEbJvNWzjHYZbnorSlFjLedYsesf
	xCaWQlAPq+1I92GCClyHQvav37AVi/wxEaEUpfFVVoAhb+5vDpMn3R3D9eaHP00F
	f6OibtBj6tnCN4FE9uQBElT3h4+rkJWaKaNdD71UdBFPdcMVuiylBYEJHICB69mH
	+A==
Received: (qmail 3021425 invoked from network); 2 Jun 2026 22:56:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 22:56:13 +0200
X-UD-Smtp-Session: l3s3148p1@esKViktThJgujnv7
Date: Tue, 2 Jun 2026 22:56:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
Message-ID: <ah9DbJcnYYR6eLeZ@ninjato>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <ah7AAgK0plmNfL5C@ninjato>
 <385c0e3c-f131-4d38-8d82-0e0b4ab8e96a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0NvjqdZ42maH1a9f"
Content-Disposition: inline
In-Reply-To: <385c0e3c-f131-4d38-8d82-0e0b4ab8e96a@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37842-lists,linux-gpio=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ninjato:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:from_mime,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC2D4631F95


--0NvjqdZ42maH1a9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I pushed it at [1] along with the v2 that I'm preparing for the i3c driver.

Thank you! The patches from this series work fine \o/

I didn't test the I3C driver patches. Dunno if I have time for this and
review in the near future. Maybe Tommaso can help out?

But cool that we can finally have I3C on the G3S fully upstream!


--0NvjqdZ42maH1a9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofQ2wACgkQFA3kzBSg
KbZIvg//VK+hiQ4BffbX6ShyxUQF+5YHH74eyxTz4xPp19rXt9gYnI2imS8u6kKl
btha9nQl4Xy6E+/teV3BCivIAF+qQ4FwKXuI5MDXY0U5j09L3Ei0gaNwC4onyE68
r+t2CRC286BkvtBKN8ZQTYWvx5tm0kNLYFXtyblWVBn02yFOoSiuLtyP2ysEg7nu
xXabRu2ggAeWhc6sT75HM4swZ/3kBiZcsg3A1vTt5Tt628CTcDv2JVv3IePvHphU
fne65Ag9vDkKhWgLLi65xrOlqSKBf0Yn4inUviD3YwlqhpqY2Frfeh6HCCl8kMMp
p3o0kEWy95dQrs4uX7ceFZNQAnAMwnp8uhDub7lzWBtWKHe661ulMEbKNGCLLN5v
BWc32bQ+pi+kFQQCkd/qu9ozRMASICp2m5bzdnIhnjPP9pNyn47Byfb8A5X4sZjp
cFcUKNywr/eWvv6zuSKXQcd5H0i+6CQBvoX3k4pjmTjGnG9JRWGgWKFsbb2IuSuw
F9C61ZtRju0ld8WZD5HtNR87EYkzaxvFvwfJe7tdhAiycvvbAzLPayL642+aEJu8
clSGvV0kdBVSKf94g4GecjhO47Enq4UJOy6ObbBhLy3rmXCbDG/PuwQw2f8cmrs3
GLXz4WhC012cPQ6KSaLUnUHr5A9QSV20rzKxNjH8R/YN9F66jQA=
=R+U8
-----END PGP SIGNATURE-----

--0NvjqdZ42maH1a9f--


Return-Path: <linux-gpio+bounces-38595-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DRytF2VvMWoLjQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38595-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 17:44:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B16915B4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 17:44:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PUqKcTgJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38595-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38595-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F97930FB7DA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9243044CADF;
	Tue, 16 Jun 2026 15:36:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C144449EB8;
	Tue, 16 Jun 2026 15:36:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624165; cv=none; b=tKKjTYwKoeNt7hV6npHP/tVncqS1z4wgjtUTT/PFM81XjE+rs1N5Okl4D6r+EXfuIZEvQsCkKVApaHKviHeYLNZrVQsLAnnXPvOtUW3fjOxmOwYZFpZeJPKFV5HjFeebL+t8pi5+R1o+nVbgax0bxO/lIeG8y1S6gIM0ueU9P+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624165; c=relaxed/simple;
	bh=Wd2qjQayVtYNCQpH6/G5M3DjEU7LR4pWOUMSd4iiR2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWTEOaZWmK0hONTk4pwy+YfeHoHSCy/E16uXZqFDrfkGQHXHPFMyOw8fHj2xJ2zJUg4f4de4PI1GlTT7YFKjdMHewPfamRcyc09V+GGFTTg1sQLK2qxGgR+pa/gwB7soqGCVjs7fArU3/hYnCMlMddDqEvGyTB37nT6lrdb1YPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUqKcTgJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D661F000E9;
	Tue, 16 Jun 2026 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624164;
	bh=Wd2qjQayVtYNCQpH6/G5M3DjEU7LR4pWOUMSd4iiR2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PUqKcTgJZJNNJ7C+53ifL2iwOd38k3YrP1gTidtlMc9Icth6gYhdyVFBP/4mDKfyD
	 zo+JQmSCKriy01gBjLYH8/j9DZ9kb+Z+wRQztrEc/VuBwShcvKN3Ztd9ia1ClnLDeU
	 BI5zUz/xNuZ6ql3jlFLL8qz0VpXBDI6SkT3aw5zLrfJhNaNUhKyKGUZ420uGKnOJs4
	 hRW6loKmVZCGvJovvzqlHiO0TgtmRS6tk2XcSwqwnjwln2r2aZUhEie38QPvL0mVdI
	 mMHbSfwtaiSV20BbCUdTf6unkjr1nJ0iqWJFG8hEWHOgpuYs1mOdgG9y3C8OgvIrjz
	 dvJhAME73YU9Q==
Date: Tue, 16 Jun 2026 16:35:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <20260616-awaken-gills-d341ee5c2dd0@spud>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
 <20260612200717.361018-2-l.scorcia@gmail.com>
 <20260615-palatable-aerobics-3091229b6ada@spud>
 <CAORyz2+4EquYcUHEnoq0N_p7vCmDpPONEhVrmAfO1eX_RNMYbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A1YEOfPW2EWY+SaK"
Content-Disposition: inline
In-Reply-To: <CAORyz2+4EquYcUHEnoq0N_p7vCmDpPONEhVrmAfO1eX_RNMYbQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:parent.f@gmail.com,m:val@packett.cool,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:parentf@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38595-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C37B16915B4


--A1YEOfPW2EWY+SaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 07:09:39PM +0200, Luca Leonardo Scorcia wrote:
> Hi,
> yes, sorry about that, series v6 has been superseded by v7 (I replied
> to the thread and marked it as archived in patchwork, please let me
> know if I have to do something else to mark it as obsolete).
> Sashiko was correct, the regulators node is required for this device.

I have no idea what regulator node you're referring to here or what
patchwork. Please don't delete context when you reply.
If it's the devicetree patchwork I don't you need to do anything.

> Sashiko also has suggestions for v7, a few pre existing issues and a
> few nits here and there but some are actual improvements. One bit that
> caught my eye is the use of the modeset register in the
> mt6392_ldo_get_mode function. I have to double check that with the
> data sheet and the android kernel sources. Not sure if I can do that
> before next week though.
>=20
> Is there any way I can trigger a Sashiko review before sending patches
> to the ML?

I don't know sorry.

--A1YEOfPW2EWY+SaK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFtXQAKCRB4tDGHoIJi
0uJ3AP4l5qgb9a67VOWooa8/C0IiEUjhucKSkZe27ZRd032Q4AD/SBEgsH9truaa
XQXPJ0QL5mTdmrYt2N205j+jwOitVAI=
=xinJ
-----END PGP SIGNATURE-----

--A1YEOfPW2EWY+SaK--


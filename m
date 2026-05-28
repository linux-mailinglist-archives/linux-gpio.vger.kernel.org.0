Return-Path: <linux-gpio+bounces-37640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCP5CzUoGGrneggAu9opvQ
	(envelope-from <linux-gpio+bounces-37640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:34:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F05F1554
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43C0130290B7
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD7B3E3D97;
	Thu, 28 May 2026 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ir21DB4r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE63E3C71
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968047; cv=none; b=Z6V3llhjexzegXBdHT5LPP8U0LAdtrumvkDTGlCNBsmevJtmfIy008Xn4kcESkX8Y+0LR5tb1RzKr/8Cvlu8iax9rP1nn6CQvm+Hv+FudAY3am0aCCwRk5IWh4RHtxvrqj6OMVVUnhyoOJDAh25qE7q9eoNLsdZILVcYAWXOdJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968047; c=relaxed/simple;
	bh=rhQ6FLcoQeFThrJvniqzi9J2Ifh86G51AZZAw44S8k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaNAZelMiE4CKKiMGG1qrUCffLw+pqM46hNJX5afu6ypCt8Qe9L3YFAWyW47UmcTxJNEeYG2mGxMroCGlOZazlSDzmBrP0l2/T87ubghd9W5q/cK2oNmO3pg3NuaGnvRwViDyggCmUNxX8sd29JzX2Xaq+He0aZvDpT5yVtzZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ir21DB4r; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rhQ6
	FLcoQeFThrJvniqzi9J2Ifh86G51AZZAw44S8k4=; b=Ir21DB4rXCvyz2Xonjdw
	SMCUjmZfgyV7lO+jGe5C6hPNgh5AylmjUNMnfwxFq3M7YL90WWC1AA1Bb7ft9vEX
	7sM+NhmRwughpLyIFIBgT9mSigRROVgK2KW40AMXKUlHM89CU269cg7Sj23WsSIf
	EE9KsCsBTkeHL9KcabFl6SCm7RPtWv43EMjBNuEgLawWlH5nxqbBHgJ6kTdFzlIc
	LfATi814SZwRP+Bd565Ao2KnS0cmWMOThh48kGOtNewsj/x5Xjuz3Y1YHoqj239S
	yd652n756mR95U0SCBkOay9hZABPZ4iib+TciDrOBphxiCusaNTaolKMbflKIwYg
	WA==
Received: (qmail 1014889 invoked from network); 28 May 2026 13:34:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 13:34:03 +0200
X-UD-Smtp-Session: l3s3148p1@h+nlGt9SrtVtKLEa
Date: Thu, 28 May 2026 13:34:02 +0200
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
Message-ID: <ahgoKsmW7XHbMUHF@shikoro>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <a3cfd3dd-05cc-4131-8f03-3a4cae445e6e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9qF92OsYzjx5lLHv"
Content-Disposition: inline
In-Reply-To: <a3cfd3dd-05cc-4131-8f03-3a4cae445e6e@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37640-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 328F05F1554
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--9qF92OsYzjx5lLHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 11:15:47AM +0300, Claudiu Beznea wrote:
> + Wolfram

Looks good to me. I don't have the expertise to review patch 1, though.
Testing this will need to wait until next week when I am back home.

Thanks for the update!


--9qF92OsYzjx5lLHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYKCYACgkQFA3kzBSg
KbZH6g//aw83FU5T81p00D6T4d9r5bowsNN9Ty4t6RD8WEUS8kmI16PW1aPWDGSh
BdrFIKgA9x265QTCh4ufoc4oO/x/IKVOrGhMX5EKR9kafHhHfrUA2ck3Z7wCS8ld
eIuiAHQzyBoR3uLIx2kCQ9jxu1hODGq4eZ6rOCLR1UpfbsnhXEjOWSAMtdVnS6i7
qlJMc8N7wI0pBE1hqFOQz75e3e2QOJw4tw05Qt4b4PVzj2kE/UXUIlygru18nYoj
8R6EIThEeHyip7G3WSL9DL5vtPllp0Zi9YG6F35HumyZ/f0zWunqtzCijCVt94Uu
Ofvie3rYk0R7gRa9KY+r7Awb3x70SeIz50/HyhbFr0Wr1E7MLQ7DKNhpiKGzM5Yi
DtW89Qz0xKwEQEV/aC0McP6ozg+gc3nV/P7iNQEffINxYLuNxeZ9RG6swVF/XcVN
jONrCwKXeBLDFvrpnYzfVoMzndEY0uBKCzML89wflteoD7JQjrV8h5wlcLrzTTA9
4wj9Tas5GvSRXC8bFhsMsgXGJDcYJf4kfQnyYfXjiEXjMceetYB4GoBJipHwIO3H
ESlQYQCReM1DZ6FtZDung7S2hvYqdgUwG4nEl1yaI0RqntW1Ya7mr94Hp6GJcyIl
poZMqtiTKku1T1Xn+khqrJKMZAPrsIVIKF0bSJAzl8eUEFbW5W0=
=D6v3
-----END PGP SIGNATURE-----

--9qF92OsYzjx5lLHv--


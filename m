Return-Path: <linux-gpio+bounces-37365-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFECBe1REGodWQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37365-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 14:54:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9055B4909
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 14:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1493A30CC4AA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030203806AD;
	Fri, 22 May 2026 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EHOlnRz1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82983803DD
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453059; cv=none; b=NYVgUh42HrcFPBvrsAJMeaWLghMhrcu6QrXGBwPHAUwIYf3d82I4gGaGBPD41OWSgqGR2mtfQSsHJvIuZoqRkoQ2GMNJXLHcZtjiSlYtwXYGrwqjFpIbGoZzDYMMcjE3MHR/EDTWqBA7TUnHPII1s/xCwphyIfobCfmZFmSjAI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453059; c=relaxed/simple;
	bh=JfGHHsD1G3B6UJcpzDrT1haJ0W08QQZBhpwGt/Uwacg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgKgU8oFsS1/LVANZs7SyuTSPG5eOD1uk7L5eT2/2DWTzWASNN5oh4w+gDqbBGe6ovmIjt1g7AwCgREpybspCVj0b4GQtqvqUSX7hoa8fV9n13z7wOsCLsyrgN5Iff4d7JmhGD835BQxts0561iWjTHT7dUja1qp7ggloO8Jf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EHOlnRz1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OA9F
	s6Xc7bljulKifOskgPqpBRM9CehGCnK6Wj+Cra0=; b=EHOlnRz1Ufm4pMzWgTRN
	vwaJP5wIIEk2vzwZGqfiXc8A9CttUeJEiuOV0QSHMF2/KrG4Ss5IxxSX/KlzipOw
	tMJfnul269F6TapJMSNSKsCh6U02CjyH0pOJ/iam0IgG3DSxcmQEWtDEOWkiHO0v
	29QuBMCp5VPEVxNyFzZc37zEJwNp1C6lTVhi0ym4OVuicm/HorASf2ZBzyZPmFDA
	qXgIe52tVSZ3qxdGal4TbPUNra+pnVEAtc76xQywDj4bq5wzhsaaxIQI+XoRJ9i9
	KftRTBHknkHW3PIzG+cZ5Du6C+xa8Zm8Fh9L8x3O0vnAvwEdhaJs50DQ2KNl2CYM
	Jw==
Received: (qmail 1435781 invoked from network); 22 May 2026 14:30:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2026 14:30:55 +0200
X-UD-Smtp-Session: l3s3148p1@PLxGM2dSTKEujntU
Date: Fri, 22 May 2026 14:30:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the I3C standby property
Message-ID: <ahBMf3bIvOTy7zHk@shikoro>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
 <20260522102251.1723392-8-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2TBwWWgC0INj6pFg"
Content-Disposition: inline
In-Reply-To: <20260522102251.1723392-8-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37365-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 1D9055B4909
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--2TBwWWgC0INj6pFg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

> +        renesas,i3c-standby:
> +          description:
> +            Controls the standby mode of the I3C interface when operating in I2C mode.
> +            When standby mode is selected, the output is fixed at Hi-Z and no data is
> +            transferred internally, even if data is received from outside.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [0, 1]

I commented on patch 9 to discuss if this binding is really needed.

Happy hacking,

   Wolfram


--2TBwWWgC0INj6pFg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoQTH8ACgkQFA3kzBSg
KbbaGQ//efBbRvSUAXnECvppI+J/4zj2grbVC0g68Us4nBun08CyiXIS8GungDWc
D0Al8xG4DED5jaWivwMJYAJxIztTR+1QmrcSDNk6t2lbt7gV6A8+MyHgn9PAWUtp
6VOTOMouHC6yhOx0fRZzpAsGBOCjeWwWYu6Kfdij3Ezk3u9SRppoQ+nSk+ij8169
RpLTFLAbyxcV1xUpY2xKsNA1DeuDWIr0t6VEa1K26LczSXdz/emLA6uw6+ScV/nZ
4DNn56XI0FPHIeYpTTUPwuCjIUfk+RSrBdkf77TdKFmtcdSjHFjApKkWel3uJJyg
M+yqwEE8x9Hln+rAsawd349ttRqy5I22+emlnzQ4tpLpDR10O5u4tCHXb/2CsAH3
Hhnd0iA0p1ylPKjhtgWV08e5LCGa7ZxTzqmq7faII6TrY4j3TSxQ/nessHfqzQL+
M0XJozs8lYbEIGEz8v859CNtfeq0KvcqdHHsGbeHsuWdwHjYa0TWyShhq53hvs5V
KyQVZijdsPCxk1DfVtmOMLEA6UUwfcnMzOg+VxedozunasnwPNFedZV8GS4Mg/lt
800O4ZTeEwQhqDQqRV4NY6wYfwJ14iNtKYVDaHjTF6pmUGdMXa6dx7Gg/NQo5YnF
7t9rYdm3l4IRyHfLn54CC4FbrFqvLxpbaYtNCAb28ojgXYkE3j0=
=dIBW
-----END PGP SIGNATURE-----

--2TBwWWgC0INj6pFg--


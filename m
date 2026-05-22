Return-Path: <linux-gpio+bounces-37364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAb8JtNOEGq5VwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 14:40:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 862CF5B447C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 14:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0537C30346F3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BEA3ADBA7;
	Fri, 22 May 2026 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Kzv4r3MJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE333A7D9D
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452983; cv=none; b=FUZCAX8ub9qMS1p4TRX/FJ1jDB4QOO1SWmUx2dq/aN2zBVHh0HYS8MBrxzQYxDGQUAjueIXeDX32cZE7t0JYWalpVDA2qYhMRtU5gMG6T/g7mO6XDi5NbNVQjVLOJIYBibOPhQtTn4Gl2q6BYzSiMjt4dU7sPMVBVWHpQ7Q+gYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452983; c=relaxed/simple;
	bh=3Ca1VgPTHLJ2ou7S9px078BGBehTDVJnTwyQl+2edRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcMFjDvb50O6bKRl/knBfERysReQl9isbtMdNdnWYFK6eoO/twvif50JKBQAAYOMRbNaeNasroDq/N35xMnZL8b3hsPipkkGVRYelf2ubKWvwJhhz1tQvsuOvlcSLOawzo1KJ1AkETIB4o5afL0BS/794yJOpzgDlaLUVEwt6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Kzv4r3MJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nt4q
	3GychOLg0I44sgF5e4XsbPoe0JIAS+XJptVSuBI=; b=Kzv4r3MJwb9xivDkZMcW
	4nazJesexYF4OUaVsXB+P36k4HTrrWljEIOA5eXsVq1+H+4ndq6Z95QtFPn2baEN
	KXlVHzYweSZMFGCoCtnkIAAO34rjiqtHEOiJMB6/Uxq1BVVhkA/BdNlT81Oaylk8
	j1Zq2zTTtCkigCn5c4geHKYf2zpKcVmxmRDKvoHfskY3UBghSP+eglmAzxgeYZKZ
	Jbk7C+3qwzXIKujrfh2+4vR8Pj6dFqM1J7cv4Ydd91e433E9ZIIA27d0cbnh+4Mj
	u8mJhD7PQBpKVmfMxZMfXyzQPy17FOLMQ63AIHkmNgTG8c6EUeDPI7Ocaj6LPKfk
	Gw==
Received: (qmail 1435240 invoked from network); 22 May 2026 14:29:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2026 14:29:30 +0200
X-UD-Smtp-Session: l3s3148p1@5sgvLmdSsu0ujntU
Date: Fri, 22 May 2026 14:29:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <ahBMKWrKQDko3cG8@shikoro>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
 <20260522102251.1723392-10-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/y315oQeuPfqUSK2"
Content-Disposition: inline
In-Reply-To: <20260522102251.1723392-10-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37364-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 862CF5B447C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--/y315oQeuPfqUSK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Claudiu,

> +	i3c_pins: i3c {
> +		pins = "I3C_SDA", "I3C_SCL";
> +#if SW_CONFIG4 == SW_ON
> +		power-source = <1200>;
> +#else
> +		power-source = <1800>;
> +#endif
> +		input-enable;
> +		renesas,i3c-standby = <0>;
> +	};
> +
> +	i3c_standby_pins: i3c-standby {
> +		pins = "I3C_SDA", "I3C_SCL";
> +#if SW_CONFIG4 == SW_ON
> +		power-source = <1200>;
> +#else
> +		power-source = <1800>;
> +#endif
> +		renesas,i3c-standby = <1>;
> +	};

That doesn't look like HW description to me because the pins are the
same for regular and standby mode. Their state is changed when powering
down, but that should not need DT encoding, I'd think. The driver should
know what to do, or? Am I missing something?

Happy hacking,

   Wolfram


--/y315oQeuPfqUSK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoQTCYACgkQFA3kzBSg
KbZ14Q/+LPuM2wp6qCNATLNeXiKudrlvgaOARZLShqPd5G8TwgIKW1lWmAxCZsoJ
1o4DY781OxEl8a+nTGm1YETIKUbl/arNc0KLfIzVEYQZiWPfqGIONPIDLD7/Sgde
oKolUFZlxgNRn4jc8aFUfHsCFqVWkgdtvl5x8nRmie9m2X0gU+n70izq6P5CO/z4
1AyNTgs4/4qnAeTfV+tH3jZbLT1WREfFx7Zr+EY+xFGc6hEAtgyd4P3k4GqP2SzJ
Cu38ol+hajq3HYzIX4TmWvhb2BCfVJL85qFLHAL5NPEjeGIexVXDn0B6N+Ha7/1j
wG369iTn2BPRYlNyG1GGWwRdvAfo5aQaUTCtx3FF6sTWaOu4ike4x23xOvq/UJpf
Ya/j2PLQmFICLwLJJzIyn8K3JSk8omk2YxdkgsHM2A4Yrkiu1sdQjk6Dc7s/TQfU
qXDcyMmj0g4YBZi7AiCLRHAjr9r5Ps0uHRvp6N84Dp4w8V1qZZ5O8a008ulRfAJU
JOp5rBu3lWeIVw8ZiFqU9ZrT7T5K6hywtaw2oFdZUN2ZkVpxojhHFK9XBiaVFnNU
Bdxc4vFEQTtfTyK7ClJqAtujURMEB1CXTeHN9/MORlHcPu7FiIDlD82wZYsvHcJ/
2O3GBUAkpyQHWlKUj2E93abttBsAJAyxQPJ6FFOYvM0cSF5SdHA=
=sgps
-----END PGP SIGNATURE-----

--/y315oQeuPfqUSK2--


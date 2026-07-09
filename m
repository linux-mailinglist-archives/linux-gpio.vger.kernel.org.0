Return-Path: <linux-gpio+bounces-39771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QsFnCJTfT2oypgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:51:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9E734003
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:51:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DLB6FESS;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39771-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39771-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8DD2300CDBE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 17:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B8B4DA52D;
	Thu,  9 Jul 2026 17:51:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2CD4195A1;
	Thu,  9 Jul 2026 17:51:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619473; cv=none; b=X8SuQE9YIzP8WZzd3r5nJZTM2lZnfnmvifSWW2V0HvFwziP0DrA0JkPouX/+r0H2ZynHlaEJpu+zmQ9pYaPYCq8LFlumpZ61hXqBmyQGJ0BbrLYXq5cAD9FrOLaJqS8k9ds9B/z+QJnXXPJ89EYqhtANpwz40Rib5Mm4Y0eU170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619473; c=relaxed/simple;
	bh=IiYDP/Yr6tDyICcpBbS+CcUbgi9+awvr2U2UZfqYxH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMu3+dJXe9M9esAg336tsk1WGZnaN8E/6nvVMagjDe2pQwAHW6mM1ey8YOKFaaESyQFEvM4hrzKpxmqXVGLvNCTB1NBqKnvh7yEfOhIFP1Y7b5/PLbu64T6GnD4SKB2GsoI2Fy7J8u/Z7g71Rk0z4D676bipuTT2y4Okcs6hRGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLB6FESS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282001F000E9;
	Thu,  9 Jul 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619472;
	bh=IiYDP/Yr6tDyICcpBbS+CcUbgi9+awvr2U2UZfqYxH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DLB6FESSA1rkHpOnbGOx3alYN6+UGaNFml6aKIm+F78m85Jf1z3XznAERRuPTIpOS
	 KmWCHLG7TUV2WZjHJG8hguNn8th/vh9Ra96QCCqZi/glbKAS/L/7HFy8/Gq6bn2cQz
	 6Nz8X+eEtsL2vxwKP9CxG4nsWWVB2osJ5RScksZTCQJhNJGYcQCp8ije06hTffIBP4
	 7y1sE1bEaxCgEQ/Bp+FF9WEmG0KNz6tO3rJ/K7o0N6EQHjBIGcmk2rWmgMLBgHjyWO
	 0W30p+KuUKVSOh/vuOmLvOwmNAizSUVe8BdfH7pMSdpvQPSWOZq/PMXw28zDODtLFS
	 anhZf4OVb78MA==
Date: Thu, 9 Jul 2026 18:51:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 05/11] dt-bindings: power: apple,pmgr-pwrstate: Add t6030
 and t6031 compatibles
Message-ID: <20260709-uncross-frame-f4e1ee999cfd@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-5-55b305833123@jannau.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rc4vPyNuP2jKmDXT"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-5-55b305833123@jannau.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:j@jannau.net,m:sven@kernel.org,m:neal@gompa.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:linusw@kernel.org,m:kettenis@openbsd.org,m:andi.shyti@kernel.org,m:ukleinek@kernel.org,m:k@chaosmail.tech,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39771-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,spud:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FB9E734003

--rc4vPyNuP2jKmDXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rc4vPyNuP2jKmDXT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/figAKCRB4tDGHoIJi
0m3OAQDzIzOeSCHYVfxck/T7kMRYB4bIgW4uZxglmR4yesQBjgEAx1p4AOxloY8c
e7UgRCo5xhBddY6h7uja/dDb6wjmQAw=
=q2ig
-----END PGP SIGNATURE-----

--rc4vPyNuP2jKmDXT--


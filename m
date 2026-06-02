Return-Path: <linux-gpio+bounces-37833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id odNkMwwNH2oxegAAu9opvQ
	(envelope-from <linux-gpio+bounces-37833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 19:04:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7006307E7
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 19:04:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CqJWqpFs;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37833-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37833-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8242E3047377
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 17:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4193F39FB;
	Tue,  2 Jun 2026 17:01:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D43F44CB;
	Tue,  2 Jun 2026 17:01:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419669; cv=none; b=Cq/ihq7NqcsUM4XF6rHYCJJpq1PQRqxALbYGSRCD8gtVKzM5pVev9c8AXheTCgEyXA4Zibzopk4PQx2t+UkaiN0wtS0xUkpOAcfK3GMhaafbI2OLfTm1mXd3VhkUBlcez68wD5MEIOYUdQG4Lhj/Zp4kBRHA5yROJkYn5G6bCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419669; c=relaxed/simple;
	bh=cR1ALlj+jB1tsDbCfhKZz3DyXvvp4ylXmf2XkJWOxUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqP3oevsmjSsJL+sg48FWRm1Q1WTz+V+0Ih7SmkDt8yBdnKgKG8PAIA5uwyR8zJXBI13JFZRewGtEZJFkHqAyyGKiEyOAjBdlIDaEXDTdpGVNxmIpBsfzRkfpXYQ2O2b7J7G2Cgk+rAHsWjTsdafDKx6eGibkaX3HH/bzXffzlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqJWqpFs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F121F00898;
	Tue,  2 Jun 2026 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419668;
	bh=cR1ALlj+jB1tsDbCfhKZz3DyXvvp4ylXmf2XkJWOxUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CqJWqpFsnFeBtwIEf+dP/dlZU3HF973//t1ZrnIj5gr1E38MLqTbLUvrrAvqwmKoz
	 RxLbY+ZUO59k5fBR+b1tbYrZr3R0mXKKPwAM9+RoHBhpOJSOAN5QVuv6cDkJ5kkyIV
	 kqfKWLawlUFwGerrn6uIjAe5vrPUiVX8eSvZcYC7RNi7sLWpwGMRzmBGNZb2iTdLr/
	 FFGHtE8nqULsRvdgkrEMPD/0/9CzocL3YSeHQVfoUJnF1S1BS0hv4W5lfjfJu2VLSU
	 njhQCdU6PhRPBeM4xulqxmQ1tTtdKBUF45PKqJSZxIeZ5AFzLwdERVKgxmZ8Rsuixr
	 jHQbH3VJa8mtg==
Date: Tue, 2 Jun 2026 18:01:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tychang@realtek.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cy.huang@realtek.com,
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH] dt-bindings: pinctrl: realtek,rtd1625: Fix input voltage
 property name
Message-ID: <20260602-statutory-grimacing-f36afa83afad@spud>
References: <20260601075229.2936513-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kLgSkdQyN5oK/h8O"
Content-Disposition: inline
In-Reply-To: <20260601075229.2936513-1-eleanor.lin@realtek.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37833-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,spud:mid,vger.kernel.org:from_smtp,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C7006307E7


--kLgSkdQyN5oK/h8O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kLgSkdQyN5oK/h8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8MUAAKCRB4tDGHoIJi
0mLpAP9IP57UfIaqVQ88FPwZ7MJZ7t/ZBCV+X+6XPj05NrvK1gEAjbHgnJ/u8Is9
QvKWldM92/3UFt6jcY2st+3K/Ajz/Ag=
=qkYQ
-----END PGP SIGNATURE-----

--kLgSkdQyN5oK/h8O--


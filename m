Return-Path: <linux-gpio+bounces-31166-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDztLOXkeGlftwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31166-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:16:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289B9794E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D8EE300E26F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 16:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4843161A8;
	Tue, 27 Jan 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBptyoc/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC5F29AB1A;
	Tue, 27 Jan 2026 16:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530504; cv=none; b=Eb2Wsxh/pI4KCsmI+wAO7HL24XhZN41HexvUmeqAz6Jq03JAtXvA3GegL5B+FJHqt2K3NtMFBsFgS/l5kEjfm+ebWJA1kOm/a99HDjIPkCV0whGbwGZJHdFwMStDbYcj9MLKz/YgtiSXzjR6VVB1FlGhybMgULZn91jM1qPzqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530504; c=relaxed/simple;
	bh=gZUYNGMMjCViWZNDd01peTgdhZw/VKXNmvxWDPe/8qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2baYan7LUmZnawY2MjpBrAjLI1LViQY/N+R2aiAmvkQ7/RX+lwEtmt/qKM1bTj3l8FvdGZaAiGVIbDUc/4XdTK4uS985Q2fb9gbE8A2fYZ3eba7SL471Mhs5ESrB5KG2gxzJNh1h2ErYQQe9HLqvsG1vJTWLRsZzfeQCzYjMPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBptyoc/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975FCC116C6;
	Tue, 27 Jan 2026 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530504;
	bh=gZUYNGMMjCViWZNDd01peTgdhZw/VKXNmvxWDPe/8qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBptyoc/TZa0A6ofsd/eLdLfT+Ju0AtRjE2+A+XQPtllzW5rzJylZyuq7yfPvuGsS
	 SvmS1S8PryeuPhlzBCgE6n0ffqgzk68ViC5+/xatOLVTYog844F5HbPnhxUAzBTHxX
	 5tT+H4W0wmS14m5A6EWG9Rx+Egk3/jto6xhlIqX9QL8fJXonx/i1AndsGF96QNwHXC
	 C6N084/IhmlgUmY19SOyHDOImwfqOgx/SW3ugGInxzGQwgdse+4a/dQPHi3MAHP30i
	 m/0g8sInEcsFndi9PIuZVbA9+z1/upJHm22JDTdY/eeFQlhAm/bR+6JA5w9vRrCRW6
	 8p5ESa0Gh9j8A==
Date: Tue, 27 Jan 2026 17:15:01 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: gpio: Add Tegra264 support
Message-ID: <aXjjmoTTWuSYYA0Y@orome>
X-NVConfidentiality: public
References: <20260127050358.1136279-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vt7x566kfzgxurqa"
Content-Disposition: inline
In-Reply-To: <20260127050358.1136279-1-pshete@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31166-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 2289B9794E
X-Rspamd-Action: no action


--vt7x566kfzgxurqa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/3] dt-bindings: gpio: Add Tegra264 support
MIME-Version: 1.0

On Tue, Jan 27, 2026 at 05:03:56AM +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra264. The number of pins
> is slightly different, but the programming model remains the same.
>=20
> Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,

This needs an update after you renamed this file. With that fixed:

Acked-by: Thierry Reding <treding@nvidia.com>

--vt7x566kfzgxurqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml45IEACgkQ3SOs138+
s6Eh9hAAoLcySd0KPl4Is5WtavNS0p03631JurVsA4ENDwpuZtrEsCWp57eUx29U
9RARRxP4l48AG6D856GQY1a7aNbTNCdBdxfyUe5FHHGSxVd/v8iN4Wvb9oIe2wIx
Bd0WxfKi21K7gQsoeQKhNnMPXdvzbAgBsyNJgN5IebxchBdv9wJjRXzA/8HmczoH
uoSz1M0nqXYQDPjTKU9wumSawyL9a3oUA6Ftx1lnS+GGsYP7QkM6Fc0MhftAYayX
yvWMHiLcW+/dO0NycjG6fpjrMLiYKVXjhjSqk2XatNhlJlTuY7iZu/hcg1zixEfH
A1TIkrP0oMgVR49wnoQQcZ7ORqZoU7cEh/n7NlY3S7sPXPQagxRjl3pFIK0TozT4
ylg8svXBZJXxFJISIByAojNu5zVtBrQB7h/Vx7/HIGuCYdVkilGhb/ygC4Z+jVwP
Hkfa/hRL905Ah3H8BGZTBEo1jwqYXwt6bKSuMALj5N8F8by3oiP2osJ8oejC6ho7
B2T1epxaajxOIAjOJKx7farqPxDKedThNQzBfnYsYfEF5wLrJCkR59pMqk6ZDJB5
t9dIaEBlWuvbAcvsHp+QGvvVpkMrzaCmDPGoyPj9+y13G2jFPF8o1HB6SVX8F2Bo
kUo/exeFsX1gQcxvS1Il+JbTggCf2QaB+F3EWFvwcO8B9BeGYWE=
=Zq1/
-----END PGP SIGNATURE-----

--vt7x566kfzgxurqa--


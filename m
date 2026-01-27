Return-Path: <linux-gpio+bounces-31167-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPGoIb3seGkCuAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31167-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:50:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC397F56
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 777F0301C266
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9419F36164F;
	Tue, 27 Jan 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPrHnJoE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DF1A23A6;
	Tue, 27 Jan 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530600; cv=none; b=pz7NitpHeDkULHKGK2CV6Rpt4q8JLV5xBhnAH7krWPJ7Q7p8LqPWlGedkJZBGLvE09CqkCHrclF7gonE3TS/YiByi4W7IiK8y3HKkzNlzMdJWryBjeAht5utcsKNUBZt4Q/yFOObZuKnTj5v6Yc7wcDSYRoRepYQZWJbfY9wQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530600; c=relaxed/simple;
	bh=NqFehIo+wBHMLRHMznX73JFaSdHutIeKjEWsJZ2JeHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecjE/FGPeOJTEKQp7O3Xr5+hvFLW6nti1yjKQHFUjlKTSKywSrlWTlRusJYeq6KHlHhFggzDVTclioTe12YEKlj8qhAMKSHwKolW96u9p4IVW+2SbHCfT/o4FJkh4uwLdQ4NwAvME9CNYjwN3NIZM9zd8tRIqqcFcz5OvK58bP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPrHnJoE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6514BC116D0;
	Tue, 27 Jan 2026 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530599;
	bh=NqFehIo+wBHMLRHMznX73JFaSdHutIeKjEWsJZ2JeHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPrHnJoES5+B4SO5Id+A461DHDKLrk6+GM3/Uf/n8N3inB4rEP/d1K4dzz/YC+DAU
	 gqzA6l1uA7yXlKKaaJ4i/gXpvdC9kZs7+FyjWImn2IfU7ezTuwwZVHaQSkZjpHDpM8
	 Frtgge+tLCAY/+ZCHfomsBumZyzizDrEAeA1vQ3P3yp1m6fKd6J22pPnZl4VkbP6TU
	 s3gRXa6uJNtG5H1692o+64MhnO8LLgllYtki1lrUH+qMJqBPQYHdEXO8wrO4arMQei
	 /bKZlodd4pbQW9+JdAtcLQaOSbTri5MQxvtIrQEki7eJI7uhbpNvvh1IXv14/zmNd4
	 y1nszUxOjxPNg==
Date: Tue, 27 Jan 2026 17:16:37 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] gpio: tegra186: Add support for Tegra264
Message-ID: <aXjk3VEb7f2tDGrW@orome>
X-NVConfidentiality: public
References: <20260127050358.1136279-1-pshete@nvidia.com>
 <20260127050358.1136279-2-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jmu6es2dltbgztd2"
Content-Disposition: inline
In-Reply-To: <20260127050358.1136279-2-pshete@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31167-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: C8EC397F56
X-Rspamd-Action: no action


--jmu6es2dltbgztd2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] gpio: tegra186: Add support for Tegra264
MIME-Version: 1.0

On Tue, Jan 27, 2026 at 05:03:57AM +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller driver with support for the
> GPIO controller found on Tegra264.
>=20
> Use the "wakeup-parent" phandle from the GPIO device tree node to
> ensure the GPIO driver associates with the intended PMC device.
> Relying only on compatible-based lookup can select an unexpected
> PMC node, so fall back to compatible-based lookup when the phandle
> is not present.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes in v2:
>   * Use =E2=80=9Cwakeup-parent=E2=80=9D instead of "nvidia,pmc" and inclu=
de the renamed header.
> ---
>  drivers/gpio/gpio-tegra186.c | 90 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--jmu6es2dltbgztd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml45OUACgkQ3SOs138+
s6Ge5xAAsNBPs+CZNlpmu3Xy/pYpzEzOCb+fYyZrPLrZ4G+YqBWaMYdJ+p0qlQEz
EpeCYYYG+0LhZ1RLV1oFcJck9VFGAkpi1AniCFM6F9lpk8KhaPh1D7+4i+MYG57L
G0Q0tW2ujibz0basbooe6Pmaa91pVi4XHpxYJdATxOFCeIHgln2I7dfT9zDGpSYP
TskNEGgywdbQG0SucKnUlgIikIr0gIugL7f+G14Gy2qXXhBBsDmiG9cPZNGA9KEO
n0NoBPvoptOJsfxsZcv7moBb3Hh8pqv8wHVgMwsE4VPsuEpBF4121gGnMiYN2zMj
czv+E3o95PKJ5bXt3TNE/VrAZoqTQJYQYfY6KgJKykJLhaSVpaGjudijSmQ6re7Q
q3KTpY3Ryvn0G77fP2M0u1Sib+V1VK/+E0WSz6Kcay82PpsD8RKQ9GXFpfBlzrlO
KFpRXZen+a8inwNnzlb8vqKX1NkKQMbvRF3M9a2LonNDh4HITYlpCCB65OppbtnD
sge7a/Gm3l5aWAhrzoaZVrD1JNUenf8a8m+fpOIGYBQh40sxcmCblCfQQb1uiNPr
z49qc57cM83jrcsPTsiljMh/oyiFw3a3al7E3ZWlKcNZwJz4fZCLLV+jDt2/i8xs
ZpOmMi7CNSemcmsu7w6rHDXLdEfsfAjCPHxzHg8sIXq8ulxhQpE=
=lDo0
-----END PGP SIGNATURE-----

--jmu6es2dltbgztd2--


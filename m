Return-Path: <linux-gpio+bounces-31739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DpzBj09lGmTAwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:04:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6C14AA88
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD44D300383D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E91E320A0E;
	Tue, 17 Feb 2026 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stDCcr1o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D728D8FD;
	Tue, 17 Feb 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322680; cv=none; b=jTCuQCdVD0m7MHQGexM8SckJL/LzyyEteZC6RVD057WwP6qOpqh1I1tfBaZrlEnkfrKHYELHYGZ+sFieoJUom0n1oDJl3IID9DEGIc4xEIV5les2Hz7Grw3pd7CWkrcUQrA0/5xW+W/1eVvCFmBZTwHeitNTDjmhwlnKhBoXn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322680; c=relaxed/simple;
	bh=cna8tXzB9QwB/AIrnrY+qpwe4CP0Q5vbocxgHUsoNx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNYRjXgJcjPHmm0yU4jZdObaZKVTDk8IdgfqM4tyELZ/DHP8/zQl0YfPn1RmJr5UguYxC4BObhoOc71vjrBJJ+pZaEQNsIbsk11UebV5QxCNEvGwnk/gOIWjjdKir2BR8ihBjWTkZf6AEzbe2/pv7Y1k6Jtf/5dDC8ca+AVVB6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stDCcr1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E668C4CEF7;
	Tue, 17 Feb 2026 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771322679;
	bh=cna8tXzB9QwB/AIrnrY+qpwe4CP0Q5vbocxgHUsoNx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stDCcr1oto++YjKAw7iNf1MjLcSNsrhD27BJ4E980nOAvnvS6owivvqkEhD7yhcyQ
	 6WybtGx4kkacJ/Ytz+sZdWqxgwe7NUxcT9C79XkzdcDVoETolj25o3yYiS6PS5biEH
	 heYjOZp0isSctpPyg7oUmvA364+t+JEKxqOJDAiaA3Gqy5C+QecARtoYIJ2fEchy63
	 j3DrUqd7XIGjDA8+Yext7Cl9ruRwxP7krzxcIgS9NcGeLCd4TJaQVTzow+W0LUah3d
	 cRuvE2dMOAei0PyO1tIhJmgImRUAfyKY/+/Idqb38TuN5t8hTZjN/bY65W6OeiZhl+
	 fp78c2XeIyqHw==
Date: Tue, 17 Feb 2026 11:04:37 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix
 handling
Message-ID: <aZQ9Knn41f2KNrYt@orome>
References: <20260217081431.1208351-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fepjia62crhmk4ik"
Content-Disposition: inline
In-Reply-To: <20260217081431.1208351-1-pshete@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31739-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 3BC6C14AA88
X-Rspamd-Action: no action


--fepjia62crhmk4ik
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix
 handling
MIME-Version: 1.0

On Tue, Feb 17, 2026 at 08:14:30AM +0000, Prathamesh Shete wrote:
> Introduce TEGRA_GPIO_PREFIX() to define the Tegra SoC GPIO name
> prefix in one place. Use it for the Tegra410 COMPUTE and SYSTEM
> controllers so the prefix is "COMPUTE-" and "SYSTEM-" respectively.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>   * Split the v1 patch into two; this one to simplify prefix handling.
> ---
>  drivers/gpio/gpio-tegra186.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--fepjia62crhmk4ik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmUPTQACgkQ3SOs138+
s6FTFA/7BlMrW2r8dgXRxCP4/L96/GvMOPTyAds5gjZzxiIgUFj+3xTvBcLGupRG
Qa0SGs6yaqWQQMOEkg+bU2RtTx2NycesDXSW+suoDZPWLOuxyBGYxxtnbjD3IKDI
7JsEkckkjw+rOT24A6llcB52cEPBZV6TVWQgFfMpXsZZINYuJqn4kRFt/Rlo0JFC
F+U4jTYs/xgldm80tW0VBVD0rZqpPGhl+r3nHbrh6dJMJpJXUwimf3LMCl32R6pY
2CKXeUEvd5jEyS16CWzC6vsr76eGtayz6Os+LZE9AepZFQZyxewzl/EILh12VrOR
Sy6bj56iU32OGGrYZULMpB5ODghuG9RwKNDP6YLSLRzaUIwDy4eLtRw9RhBXK/mS
5TfICTXTIRnauDr37sKIjTR+KrLrFVhj7lL1LJfDEAGuZwWqg0x2KdDRw3GErD/K
703Pq7SfpiQyiu0pEmGJpw7FJqc4FlcWVaGNW+k85bXdI4+y1Z/CDgkgIS+VA4jN
NCk7kjms0ZAJi8R28VTgF13Z4i0czo/sI8rvtau3s24db5wzdKvoJ06L2xNjXziu
Ac1hVqOy3GdYIu3B0XPKHK/U2R3e5N4hnZn/XOrKyknli0sEVg7YK5h8NdjBDSAv
+9Ty7cYd8ADNC6Z8Mt3EACVq79AuOB9YGCC6VXOx4claNKaDY9g=
=DhWS
-----END PGP SIGNATURE-----

--fepjia62crhmk4ik--


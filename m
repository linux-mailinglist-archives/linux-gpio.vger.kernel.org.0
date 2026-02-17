Return-Path: <linux-gpio+bounces-31740-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YANwE5c9lGmTAwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31740-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:06:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C014AAC3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBC7930120EE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 10:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C84322522;
	Tue, 17 Feb 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOxjzBax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65569320CAD;
	Tue, 17 Feb 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322770; cv=none; b=i73LKvcg7qhAw7hzU6YD+B/6B114KhFSRtw8PFtaZZA3hYfuVLIRKFXGRjk6U+bAp0O4MqyRsVswkolv6Eqny7qsepnMoyTDG9ed6ia0XD9G0SEbdo5qnaMVAzcl1/SfkV58SgdV5ycVYjcOO4IX0Z52ySspe/KKVwTq3ZXOW8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322770; c=relaxed/simple;
	bh=r5L6cKcfAkWaGx3tvtZVaAO9V+9f4ffqaiimw8Fum6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMLpHKb+0zOF8pSde76i7dhucbGo3zVDekzeDlVpgn6AaylTta/7cd2tPdxPPG+cIIfnt/H7Lb83ZJlFuPGo+Gyt8Yzi1FkP6IN4+M5TOE5aTMIBSUCI4hl8gzscQLVtq8TB4XiIXSBkY/1EUXkL4EwmaAnsNqqUuY8kRB6tHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOxjzBax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D86C4CEF7;
	Tue, 17 Feb 2026 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771322770;
	bh=r5L6cKcfAkWaGx3tvtZVaAO9V+9f4ffqaiimw8Fum6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOxjzBaxf18qIffWODMNjFfe3Zs0NvCCZUSFZTe1tcRnjX5QBco8AZSc8J5hxd47I
	 614ZtnXQIxoRaevgCHNJFn37AO96nCHj2YWnUFlrto0rAdsIGrspoX7ZdfT7WXiAjQ
	 r7MT9qlnaHnqTOCj5RTS64NweW6Abmm5iIhVNU+CGDMSxV6dJtbRPVlNPkXmubd7DS
	 84Lt4ttoIjRnZoY2z5rzLzDXMKD7c/3A+QaxrLHZczH9lmvEGEft8rD9jyEQSFG3PL
	 Lk1kfuX70CWydrTtnjXXbCm7CC0KGK1S155+CuwG4zJPfk/J2bnfRqcGbFbEl/50FP
	 wCpJ17gc/Q32w==
Date: Tue, 17 Feb 2026 11:06:07 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpio: tegra186: Support multi-socket devices
Message-ID: <aZQ9hz0XP_Y8rxjr@orome>
References: <20260217081431.1208351-1-pshete@nvidia.com>
 <20260217081431.1208351-2-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5l5iyjbr6luo66kx"
Content-Disposition: inline
In-Reply-To: <20260217081431.1208351-2-pshete@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31740-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 007C014AAC3
X-Rspamd-Action: no action


--5l5iyjbr6luo66kx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] gpio: tegra186: Support multi-socket devices
MIME-Version: 1.0

On Tue, Feb 17, 2026 at 08:14:31AM +0000, Prathamesh Shete wrote:
> On Tegra platforms, multiple SoC instances may be present with each
> defining the same GPIO name. For such devices, this results in
> duplicate GPIO names.
>=20
> When the device has a valid NUMA node, prepend the NUMA node ID
> to the GPIO name prefix. The node ID identifies each socket,
> ensuring GPIO line names remain distinct across multiple sockets.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>   * Split the v1 patch into two; this one to support multi-socket devices.
> ---
>  drivers/gpio/gpio-tegra186.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--5l5iyjbr6luo66kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmUPY8ACgkQ3SOs138+
s6EHzg//V/9aSc7rFhIEEYW/dvs81NkoXVnNv8gIf4hvUZUlJgIOYtkdH9OPGduW
06ooJy2r8YfI90mDQDDwbQQslitDQnyTFJA3B4mVIBCuQMT30DXoBQETWKps35rW
CSVCSzwhSPcHpitOtjUseyjHc0mwLq5qTf3iDJHAl66BD+974S3mIB+9uTRx7tho
giCdeRuN92FvruUwZFSknFx1MRlExGWrFrEiOYQ897uYyEdxFr0nourONpTkDUMi
mOoHRuej/6RbPD5CTSbTAJY5N1BjwtUghBZvDNpYER5uK4abG81e31fzHyvubfF9
tXaycbZUhmArp9BTGbX0MvCVrT/kR/6aEN+YzQnNWEtwu0ZCrjEAY6gOQbzWz/83
4s1wjshckjkeMvbSb9YOHyWspAytOvN6dTC4ZDgDuX+Qg5LUabZmBg5JKGirpXP9
6kIq8i+YRQ458J2RDhRb7WLKF/lMOkvP2MpNMtWHjPs9y/HKUjW85SotWzUioQKQ
pU79AtxivKLWyUUa5u/cyPqk9e1P4/JT0Na4x0dPDuBd8F2KyExVrXQ5Ft6rAkTH
f/rindNHU3FknkggSMN5WeTlFTAtfPP8ITeFGHs6qlKwHK6yfkPnYQK/wHC3fxJl
2d6+xfmqqbeKgEeLqqoiwVSVBbmYN896TRHewlQ0BJrL2H9tPPA=
=l2pa
-----END PGP SIGNATURE-----

--5l5iyjbr6luo66kx--


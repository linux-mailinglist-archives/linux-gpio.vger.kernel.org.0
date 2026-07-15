Return-Path: <linux-gpio+bounces-40109-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ly15Cal1V2o0OgEAu9opvQ
	(envelope-from <linux-gpio+bounces-40109-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:57:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F78475DD70
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:57:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fNZDHjf4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40109-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40109-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16B2C300FFAF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 11:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A9544B675;
	Wed, 15 Jul 2026 11:54:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B323E448D03;
	Wed, 15 Jul 2026 11:54:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116466; cv=none; b=AGljYsGOVdQOyB5s/LNe+VY9DLgPwT2AvOfS29iFxQLVtesXbl6wb3dt/86K+HfhoOKD8HvjGtV/QomJO4bvDJt521kejn8ET2ueEDptcyJzwBHoo4Juu4/buaA8TqpEHm+SLNmPq/NZSAMhfZMeJyF5BlfRSESDsObfDU+RpyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116466; c=relaxed/simple;
	bh=QlrEBqDfEOM99CdxCSEmbIGJD3ufJLBLKfyY36+xuio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyBQay2k29WqtAlkTwbugw3TCUzbsSdnxusMa7NerLFo4jdAfBbMp2iELh+AHtNZuUckw1vel9WFgrg6HEQHC+CQwid5pZatvrgd4wiNOgTipal4mZ5M4OioHcgmbw0frExtzmfeCO8hSh6HSb+3rHjsgUwGuTY/aJWf5BKpsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNZDHjf4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A970A1F000E9;
	Wed, 15 Jul 2026 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116465;
	bh=NhYA8Q87BJfBKaDY8l8b3XCkSJcIvDIgrVKuDPrrVU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fNZDHjf47/6qyfV3dTP/PwYhCyIUwJk59M534fYVEwd27t7s27j7w+t61qwIAovWz
	 /RLkinCG8LMZgdFKyH5lnWq3r6QSPMR+5FabagDLhDJfIeXCrPVGrQiuXQhJCBajlC
	 Mf7mCJ3xl42M16V0VRH6F7RdJtPfG+YkDioqlek9TFtcmCUJ7VZbmbImaCFP8JdeSL
	 NLPiSreUsgwRCMow00aQhon2Zd+gBMg8vrzRkZbdpYRUc2mgVvQJ7JiWdBZsCdzlrw
	 D8bEZQ7Gu/f5ZFngpSENEzIuCSQty3vOvM30x9Mkfelf05wlH+/Cw6vU/fyJVZreFV
	 Ozz9d9EyEaLnw==
Date: Wed, 15 Jul 2026 13:54:22 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	dakr@kernel.org, bhelgaas@google.com
Subject: Re: [PATCH] pinctrl: tegra264: fix DAP2 DIN/DOUT mux functions
Message-ID: <ald0pajFVzOEEfnB@orome>
References: <20260715101636.547305-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tw5m5fn7rkukkfxk"
Content-Disposition: inline
In-Reply-To: <20260715101636.547305-1-pshete@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-40109-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pshete@nvidia.com,m:linusw@kernel.org,m:jonathanh@nvidia.com,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:dakr@kernel.org,m:bhelgaas@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,vger.kernel.org:from_smtp,orome:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F78475DD70


--tw5m5fn7rkukkfxk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: tegra264: fix DAP2 DIN/DOUT mux functions
MIME-Version: 1.0

On Wed, Jul 15, 2026 at 10:16:36AM +0000, Prathamesh Shete wrote:
> The dap2_din_pv7 and dap2_dout_pw0 pin groups were assigned swapped
> primary mux functions: dap2_din_pv7 (data input) was muxed to
> I2S2_SDATA_OUT and dap2_dout_pw0 (data output) to I2S2_SDATA_IN. As a
> result the I2S2 data-in and data-out signals were routed to the wrong
> pins, breaking DAP2 audio.
>=20
> Correct the functions so dap2_din_pv7 uses I2S2_SDATA_IN and dap2_dout_pw0
> uses I2S2_SDATA_OUT. The register offsets and drive-group macros are
> already correct and are left unchanged.
>=20
> Fixes: c98506206912 ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra264.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--tw5m5fn7rkukkfxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpXdO4ACgkQ3SOs138+
s6F8Hg//ZABoImgatqapHITAK1K7gYn5UKftAxB+Odp6CXuBcRf/OQdZZ7URcosK
1BzFzGQKzdOQOvZo7G8hMbdJUPPjQImMuiV9FwVatSNrY5t5yzHoN0UQf+3/trph
stTDhAw4tDcFDEvqmQDIlQmjOgfydM4fDWGyybPLIGWqnM2dHPRqu5NuWh/QO1yP
A8P/QMwqL2l1aZebZRVosbLOZwxeh1eHroaeA628EDOOyKW0tBFTMHrVVW4ASxBK
4mrDoVexKxiNKpWEqvBYlgKG850GoH6syURrzVrFNi/lgZ9+p45lajfjTMagMWUF
NvFCRCCY2M0zrBaDRnhFYbBjlaB5RGR/4c54U7urj9Z85MP0Lnu4Md99BjIolf3q
QFLiXClYEML2Qr/WD6u6nY8eUrw+1Rq94iS6LNFaM9FmRoh0GR8vVYZ8ei5tFw48
KXHq9p3I3JGxy3UYzQSs+YmXNM6DEVGbDkcXGVYgL1GSQa9aEBxBibux00EcbrvA
D3PmUEvGWBy514cPaXTHsWNB44Ud7xpXKNstpkwduG6Nzu80SUiHfcBLZkus2GCS
77ZcOQw7iVHv5Voo7aE+pqngztk79wGx3hiu785WsRdB27dPXsb/DqDwcQ1FUukn
Xvjzz7PN5wAQuA65mNPJpPhVB3Rje3eP3Swhm60ZFazdQNayALg=
=7ciO
-----END PGP SIGNATURE-----

--tw5m5fn7rkukkfxk--


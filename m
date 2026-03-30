Return-Path: <linux-gpio+bounces-34434-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJZdI6eZymmg+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34434-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 17:41:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55335E114
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 17:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 271DC308F563
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 15:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8BF36492B;
	Mon, 30 Mar 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhCkjfAq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF609340A57;
	Mon, 30 Mar 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884843; cv=none; b=r4ghVrHWfpIDl0xqzE4DLyZ4PBApaJJs0sngyx30rwTRZ/UyUVMdaHSvS87LYAkRbuwmlS2QRqtrVCNAmH+ijUjQLbdWJTH2F6WvXo6mvU4+mPpImHKHdOANnJXBYtkdyoCBIeX11YypqiIpgf9ZEq3y+QF5uBm8oSKY9zHDfPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884843; c=relaxed/simple;
	bh=fMKWVcjf7DPRIhb4QuK3bKUPyuc60L/E8BOU/g6IMVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqMHtlXz+SN8JRgo7NRsSSAniCPOBsg9nN6fB6SUY1hcy3g1L167aqr+yG15EyPDpZDrC8dS1qaFA8azWFKTKoxc6Z4ITT92Ob+7G6PZL/G5mUlMIt1evnYr+o3wJZDJngV3MBTrP7JfYMU1IbGfSJYFZtY0NoafYr4wl2ez710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhCkjfAq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEDEC4CEF7;
	Mon, 30 Mar 2026 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884842;
	bh=fMKWVcjf7DPRIhb4QuK3bKUPyuc60L/E8BOU/g6IMVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhCkjfAq5yXthqKi9kX7nLJvODO5tt+7KLocrI0ReXpdAiGkYYo0/wRR0dFDgxdEu
	 YAWhjSar4kqDcgvlMPURtC3H3CBO0kZr2zRx+33FFmGAISW8JHX+PcdfAuO8R0KNjf
	 M6C4oefDCTf4PZFSs7kC53gJdcYLGuS+kUkJWRt2F5FQcPfsrZVxtLG3U2MKtH3/WL
	 SBdxXKo2pf5SsOm/pJD+/leo7Jq+y6H8ECs+kGV8GAClITL/S6buUShkxW+X4b29bU
	 ay/5yFyF3PLI48ChYS4lRYsrfGCPGUK8u5PcM5jFyN7p+XekcuDvfh7iQgjD8vh7V2
	 WQwK9+bzBF0tQ==
Date: Mon, 30 Mar 2026 16:33:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260330-manger-coming-943dc94f382b@spud>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
 <20260327-pinctrl-mux-v5-3-d4aec9d62c62@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffZCCc6Cf9/3pOLx"
Content-Disposition: inline
In-Reply-To: <20260327-pinctrl-mux-v5-3-d4aec9d62c62@nxp.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34434-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,microchip.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD55335E114
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ffZCCc6Cf9/3pOLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 05:34:00PM -0400, Frank Li wrote:
> Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separating =
DT
> parsing logic from map creation. Introduce a new helper
> pinctrl_generic_to_map() to handle mapping to kernel data structures, whi=
le
> keeping DT property parsing in the subnode function.
>=20
> Improve code structure and enables easier reuse for platforms using
> different DT properties (e.g. pinmux) without modifying the
> dt_node_to_map-style callback API. Avoid unnecessary coupling to
> pinctrl_generic_pins_function_dt_node_to_map(), which provides
> functionality not needed when the phandle target is unambiguous.
>=20
> Maximize code reuse and provide a cleaner extension point for future
> pinctrl drivers.
>=20
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ffZCCc6Cf9/3pOLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqX5QAKCRB4tDGHoIJi
0lKoAP9WusXVu3aAXNexzW+SejVhFKuHFElS/N0lptk8Ssyk2QD+JBxJ7gC7ZE1E
N/YaqZWz4FQ1xMrmZzhshVGfOWDHqgg=
=uzyT
-----END PGP SIGNATURE-----

--ffZCCc6Cf9/3pOLx--


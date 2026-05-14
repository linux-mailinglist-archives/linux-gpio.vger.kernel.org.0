Return-Path: <linux-gpio+bounces-36812-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NP9IfR0BWrAXQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36812-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 09:08:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1A53EBB8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 09:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ACC330589BA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 07:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9B63D75A4;
	Thu, 14 May 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEmkbDvw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481061ACEDF;
	Thu, 14 May 2026 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742399; cv=none; b=nVvuOgTzKciCTpDD1/cF6EZ4H6KakMl43Dzkrps43S+KV0Px1p1Xae47mCshBdCadOo8etXkzp0u0ImFMlrakGguOLf0W3Pb2s+E7z2ecKBB65dyJiD/46cl5Ffh11Rz1APnJEELh8mU95RGoIiwsk+OGZv8n464bNVEbHTCh50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742399; c=relaxed/simple;
	bh=+HdzZqfUNj8ORDjMNdRKXBgnzWFN0LY/u8kAkK0kCEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtWmwNf1mhfo2sIeayPUuSn3CnaufMnHBn3lvYBRwrRB1+lExjfR6bYib37lGeqIMKYwM0DgjKBQh8XpEOVVfVx0OwHDzzXFbXx4mi+ace9CV4nUiiKYFu0q9ZpQ3veW2loTzuHLEHqKULal58/R/9ru+5OjISyueoWb/ozlUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEmkbDvw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F08C2BCB7;
	Thu, 14 May 2026 07:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742398;
	bh=+HdzZqfUNj8ORDjMNdRKXBgnzWFN0LY/u8kAkK0kCEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEmkbDvwGbBtqGAJ2WfAn2rtH2CC2Ty4bT2WN7vY4VrwhVjQWP/ZWftkRApx0Octv
	 OlNWa5TBNOAaLqkwncHeGtpsOTlypIkvSJcNJtNifBJJIh9HnIlYhwvbI8o/8qoPOk
	 saJsp0DbKJ0FKqjR74ESRqlliA5I+v0/UYfCoCVZaNDBkBt0wKX/yJ3amGEAiT9q51
	 ZowYSG1nbRiBMDG7rzUMpLAH6P3gSVgeJWNVB4Fswmbs/OYq/y4h8LwAeVL7c5HDfF
	 3g+5IUS83iiV6+OdRHx22aPl3B4b2wjEW0C0AwpXsdNFrXWek+/pbVi/zTcyIY4jUc
	 yMrrwCCq8I+Ug==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 437521AC58D3; Thu, 14 May 2026 08:06:36 +0100 (BST)
Date: Thu, 14 May 2026 16:06:36 +0900
From: Mark Brown <broonie@kernel.org>
To: thomas <thomas_lin@lecomputing.com>
Cc: rafael@kernel.org, lenb@kernel.org, hoan@os.amperecomputing.com,
	linusw@kernel.org, brgl@kernel.org, mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	lucas_hao@lecomputing.com, puntar_liu@lecomputing.com,
	jihua_tao@lecomputing.com, stan_xu@lecomputing.com,
	lumin_liu@lecomputing.com, notics_zhang@lecomputing.com,
	braden_zhang@lecomputing.com, harold_wu@lecomputing.com,
	will_zhang@lecomputing.com, aurora_jiang@lecomputing.com,
	ryen_lin@lecomputing.com, andy_jiang@lecomputing.com
Subject: Re: [PATCH 0/3] Add LECARC ACPI IDs for DesignWare GPIO, SPI, I2C
Message-ID: <agV0fOmC8WsJnRlD@sirena.co.uk>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rhmaoK02hXRp0aPO"
Content-Disposition: inline
In-Reply-To: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 42E1A53EBB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36812-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--rhmaoK02hXRp0aPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2026 at 11:43:14AM +0800, thomas wrote:
> This patch series adds ACPI identification for LECARC SoCs that
> integrate Synopsys DesignWare peripherals.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--rhmaoK02hXRp0aPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFdHsACgkQJNaLcl1U
h9ChyAf/X6ocAan8qc4OburcMoOY7ITJEvQvrqBp/WMNHulMsDwyAsAWS1cM5eyL
GH+OwfwsBtU5GIsLp/H+VBS3odJwdGJalfIQox1WRVSJcWGBhvJtOAznVNbE+4Xw
4TS7TpNiV4wtITcEjsOpL/m27I6EBC8YdCn4yWweQuSQxi8TQyRavAJAT45BuonS
6ZXGf9bCe22BpT4zxUQAEnInRcxGnGOezSxozAmh00h/5LvNdU4w/IGRcAjuDEwn
LQy2NfuIeNMrNWVI+U4u2puolTf76q+s+sD3YnU7AR0MTsQXhXkrOWUNTon9XANm
sCT8uN3ysx5RR7VsUBs+5VK5F4zGvw==
=XSyy
-----END PGP SIGNATURE-----

--rhmaoK02hXRp0aPO--


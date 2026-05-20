Return-Path: <linux-gpio+bounces-37217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ+NKNrxDWp+4wUAu9opvQ
	(envelope-from <linux-gpio+bounces-37217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 19:39:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56764594352
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 19:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 949D13014741
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 17:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6C83D8137;
	Wed, 20 May 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiEnl7g2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF3836F421;
	Wed, 20 May 2026 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298080; cv=none; b=WYCDxkKl69Wn2+GrHRzOZDmLvfL6sV02bnBxXy239V6zxMaJOZTkURn3S0EzBzMgyBZdKtYoSie2C7vG0qhXaiAy6ri6LJcViZn+bCdk3cHNxLHTIXHlYj9w5ZJuVwPzdNE19OSbJbHRuwPYdM2XLH+WgSv5vGQnfVi8S7J70yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298080; c=relaxed/simple;
	bh=T4t0AYkXBbxhrKXSWi3KxDtESWa1GX6sqHzLFZB7Fgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK5kY3QjH6Q+txyA4VoJsApb7MHzvcmj81tyNzhAIVTgqzWCcLKv0KpcukdWoxStBcHs7TSd9fbG9HQu65gfKmGW420J4P79c68Qq6JgDJY2WNBoYDWWAq0M56qxnahMvgVUGuvG7ZPXg9eWsAuVwI3TwWia6OoahkR0opYXeng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiEnl7g2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623191F000E9;
	Wed, 20 May 2026 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779298079;
	bh=T4t0AYkXBbxhrKXSWi3KxDtESWa1GX6sqHzLFZB7Fgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CiEnl7g2AfENS+XBB/Cnom72JahiVgjX557YDa/t1LSNdYFZsHV03Sjv4+NcO5EmV
	 QFUafK8UdpDATEbOQ/H6DBZsik4sBBLaSJFyjdAPS4n8jAynoyRbjBC/AfWfHd4pIv
	 1SrnPMSxkeKL3xGQzpvGevflb07HPaD0hMnKhet8rRHQ1Pjakjme0Ldgey/LX24MVc
	 9bzpgRDTEezn9WL5BlUYvTwDWJ6+CHDftMdn1h9HpJXJ5ILsROALjuMGyAf3J44Kzh
	 wrTuftisz/hU21R/sz/PBvw1pw/hZlDvsGidoJUrwk8k8pZpqTNY8KDf/rnyKoRdgS
	 xHsXERJ3uA0tg==
Date: Wed, 20 May 2026 18:27:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Lin <thomas_lin@lecomputing.com>
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
Subject: Re: [PATCH v4 2/3] spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
Message-ID: <4818aedd-6c50-4c04-aa62-10f76eee452d@sirena.org.uk>
References: <20260520081140.637637-1-thomas_lin@lecomputing.com>
 <20260520081140.637637-3-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L51r+9yNE/7rxdEs"
Content-Disposition: inline
In-Reply-To: <20260520081140.637637-3-thomas_lin@lecomputing.com>
X-Cookie: Natural laws have no pity.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37217-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 56764594352
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--L51r+9yNE/7rxdEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 04:11:35PM +0800, Thomas Lin wrote:
> This ID requires a custom initialization function
> dw_spi_hssi_no_dma_init() that sets dws->dws.ip to DW_HSSI_ID.

Acked-by: Mark Brown <broonie@kernel.org>

--L51r+9yNE/7rxdEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoN7xcACgkQJNaLcl1U
h9C3Awf+OecxzdNos7CMLh/vM6CEjtTyz7FkmiPl67KhygyG7NWEgQ+SXdCmFhtG
hcNx08UHSnLPkZZ41jbIEUpp8kxqcNAstZfpK8bbLNx2+qmF++Nl1w3Q4vzh/WRN
LKyBW4c+wDsygAcd5bT55jhufPI5H71PpoqTNuVrCkRafcqTh/Rz8BnEvKkIyNBN
hegL6BBD1otB7dfjhcn9gqFGKVwirOLG4wrY1Me6xjbxI3oxwaf9RWZOG+vIbALb
VEcGgSfbQGbTATlcBTIYn1KvgfNQXLlHX1LBmpSlcW4KZmsnQatvYP1r9ndiY1oj
zEfsf41LleDBQwQMnzbmAT4Puw6wAQ==
=gAcu
-----END PGP SIGNATURE-----

--L51r+9yNE/7rxdEs--


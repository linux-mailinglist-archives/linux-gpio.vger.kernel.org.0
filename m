Return-Path: <linux-gpio+bounces-32401-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFm4AsoOpmmFJgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32401-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 23:27:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E841E5646
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 23:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03F4E3099C49
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EEA311957;
	Mon,  2 Mar 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTfh1LSL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CD282F16;
	Mon,  2 Mar 2026 22:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772489328; cv=none; b=DSMx9iby6xIljZ2tuYXuxWdff4v7V4Fmu3cMwoda6dEpTWhlbzg2eiB1WRgqnbV2BEeSymh+SDqpyuiRdzcyA316zpLBIeo+WQMA5AQOALQc27D0lHUpzwT849BW6zX37LyMCGxwYNInJ3N8wq4Bw0Ibjy27zb9u5O6o6W/n3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772489328; c=relaxed/simple;
	bh=MWeiRHOZVMp8f8oX8Z0AIictRy9pyjV/mPA9ZtkT2AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6P+vs0Mt/bOROIyFcs5kU49pniJjytvW4ctsrf1/zZ7wFsnzPh/QRWi7V27HbQ+e/W8wUvX98aKqZiecLr/lH3cAnS8PiW1WzYkTxj/FSes0ziJyFyEx6FYCMy0SjPh+KAH3+C19QRg3D+Nvy0RWXdsC7JOr1O975D+G5SA6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTfh1LSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94699C19423;
	Mon,  2 Mar 2026 22:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772489328;
	bh=MWeiRHOZVMp8f8oX8Z0AIictRy9pyjV/mPA9ZtkT2AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTfh1LSL3ln5ZRLjHnCQOQE2MGQjVfSGFu6Y+lcOa36J6O6p0e52/K4tId/GbXuGP
	 0eR8ggeMIFIuDSwHINvXBV+wUPHYOgb89fRnVXxuqRW1JoSvaWudstKXG91Lk8s3uZ
	 62S6r0Z2TsBMPaMaRTI4Gv1iuZIKe2mocQ1pNcpQ3ZdrsGvbGYyeV9E1kF/0+WjhLM
	 fyQ8cyRlkW4hybha8goZCuWpTZrJpThuP5W0YUESgQ5SGFcoN518y28h24wmvxUI0e
	 umK6cv52O5R7AKdTUVJdQUrY+k+tQJwRPOfnaibb3dyMOM8FK9N0/E+4Lo79DMLyzm
	 N2Ec5s2Zdl4jg==
Date: Mon, 2 Mar 2026 22:08:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: microchip-mssio: Fix missing return in probe
Message-ID: <20260302-mayflower-filing-e111fbcc7d30@spud>
References: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b9dU3SrgV6WWXKXq"
Content-Disposition: inline
In-Reply-To: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
X-Rspamd-Queue-Id: 76E841E5646
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32401-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email]
X-Rspamd-Action: no action


--b9dU3SrgV6WWXKXq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 02:13:17AM +0800, Felix Gu wrote:
> In mpfs_pinctrl_probe(), when pctrl->regmap fails, it just print out an
> error message without return, which could lead serious errors.
>=20
> Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--b9dU3SrgV6WWXKXq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaYKbAAKCRB4tDGHoIJi
0uf8AQCDlTaYPVh8zUpVkl/UC7RIvNq8xGN1yjVKohZC8GIqZAD/cKb+4dvv6/0O
8KAgzRWqTAcSvrgFQNI9NTsj6p+h7gM=
=75b+
-----END PGP SIGNATURE-----

--b9dU3SrgV6WWXKXq--


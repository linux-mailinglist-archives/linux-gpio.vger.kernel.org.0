Return-Path: <linux-gpio+bounces-33281-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C8QCiz8smmQRQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33281-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:47:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F5276C68
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96BF330FD72C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C823DDDA0;
	Thu, 12 Mar 2026 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJno1Os4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46D03A452E;
	Thu, 12 Mar 2026 17:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337577; cv=none; b=Ml5bfmTtoT+Bs7x0/9GscdSCeX7cI6g6Fu4c6xWhvowhsB4rYZgQofmdjNyYQe/gL1XZNA4QqcOuwuNdW88XhHVlOFDiQrGS0N0yiv2G5RhO2fU4+vLZdVqbZDB+Cx9Qpm5Gg7sN4mTdgxPrZmNeBH+k4VJDvFN49lzsokIDpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337577; c=relaxed/simple;
	bh=meviQmyqF1kqc9YGmZkuHNtSHzTX0EVSt/TuohoolFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyzmjZQ9LVCMqsuDFhhCtF5lTtaMVP0h9tc5ESfAZGFFPk+G0yrhJIXLT6vwg24NUTO3z3C6U8oUCN5/C+2gZcFJ+kN3+C7g2oUdnuhVSZc84ZPJPBCF0Xy6b9b/XRKCCsgQFcU2EUW60tJznUT/VVaCSej16xC640fDoyX4Uwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJno1Os4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A732C4CEF7;
	Thu, 12 Mar 2026 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337577;
	bh=meviQmyqF1kqc9YGmZkuHNtSHzTX0EVSt/TuohoolFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJno1Os4TyC+orQ3q2f7ippncDXGpK7OY6C1d0KzUtzsQ2vQgEgqusv8gquOWj5su
	 wNhhfkVTof7D3YmVOh4jJwWATk/m++0XmqZm8GV74MYX4H/z4EQol2CZYff5Bhhv7m
	 5ExjK7PV7loPSD0iANbuT6iCsTE5zSFdypnNzoejzW1eZgDjoXsj71WKeeWZ8VGMdT
	 ZboF8iifUztyoyxzq+DU3/GI+YaYxzL74kS4vtdAGrEegcYCmFVPI17UAI27eZ5xW+
	 Bw7vkqfFYAz18iKVaZKUcrAOIUViyPxBKUH8/+rsnOvHJ+oPQPR+8x3/1NfiLq+m3n
	 Hq5+HJoAtXhpQ==
Date: Thu, 12 Mar 2026 17:46:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Message-ID: <20260312-fabulous-enigmatic-a7da953094b8@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nYKNSAcxTp+Skt4e"
Content-Disposition: inline
In-Reply-To: <20260312113040.68189-5-eleanor.lin@realtek.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33281-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 879F5276C68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--nYKNSAcxTp+Skt4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 07:30:37PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
>=20
> Add device tree bindings for RTD1625.
>=20
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v3:
> - Changed slew-rate to use valid numbers.
> - Revert realtek,pulse-width-adjust to realtek,duty-cycle.
> - Fixed example values from hexadecimal to decimal format.

Modulo commentary on the new generic property,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--nYKNSAcxTp+Skt4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL75AAKCRB4tDGHoIJi
0iExAP0TS9ZR4jIaJv+WfNqXT1+/YBx7PrC0FvRZHXR73TBOEQEA2hD7PTwMl5zi
+A/E3kN/Dz0IcLWvJicp8ZpLvf6mPww=
=+01R
-----END PGP SIGNATURE-----

--nYKNSAcxTp+Skt4e--


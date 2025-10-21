Return-Path: <linux-gpio+bounces-27345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A38BF5004
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 732EB4E5301
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DA127AC5C;
	Tue, 21 Oct 2025 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXziEsyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D6264F99;
	Tue, 21 Oct 2025 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032335; cv=none; b=HDp2uGd0brxwlIhLX5intofyj9ziFlm3Dwj79Gtqh1vw87KqMN7ah9pQXtSY+TxlAOq0rcL3NdO2rTIEXURgmjJToFTOMl4Z/XujHPf0wnWYU1M989qeuFiOpPqFvm95zzMZoJ58+GjxWxn4KLOTskWPknh/VnyLTnxCIrMtp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032335; c=relaxed/simple;
	bh=vHFferdc9wnVHHmEcQcTqndecULFvcVf12ja2yCoymA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=sigVTZfSSRwaVQDXmXnqrGNOLRoDDw6hWJnHx9DemJeKGbpqxQ3am+xxJAYRd5kL48SEG3xS9Utvg/m431WuJ5MGWpwSpH2AUGSoYf1queE45NhSBUD5p+dkzrZUoNJGGTXNFra2gBDIm8u23j8nm3gZBDX3eeNloyj/SwBrvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXziEsyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEA6C4CEF1;
	Tue, 21 Oct 2025 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761032334;
	bh=vHFferdc9wnVHHmEcQcTqndecULFvcVf12ja2yCoymA=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=lXziEsyCX6aW/ra7wktzxPcascVmpx2AOChtoaRdMxdtMJEEQjFh8Bc+ZXyqC5vtY
	 09TKvXf2qgp9ts9O5HpyDf+sgc6iavQs+w91SpFZBtyRxXQzo11Ok9kC5i/+GJOkKd
	 Pcy5P6bSRcaUWhnkcYDxcpjfgMAjP9dnSoPEpiW8JjJinwzLJyMzDpkyULj3bIRI0A
	 TgXMO/+wZkr7nYvlAzzzglR2kkQpodx5P+5TRXQ+nNvrcl7WCAZcADeCKK3/2I/ng5
	 tiWrjxuufrFTOMe0zd11eKnoxEFAgdNb6SpIETVYLm5/cAJMco4DIfLS00DFawkgDT
	 fyaw4z7p4tSog==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=beb9f8f9ee4d183a7d1204fbb04464e8e5b381b05fd161ee3833599433db;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 21 Oct 2025 09:38:46 +0200
Message-Id: <DDNTUYA4T785.27OYNQIPCJUUV@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Sander Vanheule" <sander@svanheule.net>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [RFC PATCH 2/2] gpio: regmap: Bypass cache for aliased outputs
X-Mailer: aerc 0.20.0
References: <20251020115636.55417-1-sander@svanheule.net>
 <20251020115636.55417-3-sander@svanheule.net>
In-Reply-To: <20251020115636.55417-3-sander@svanheule.net>

--beb9f8f9ee4d183a7d1204fbb04464e8e5b381b05fd161ee3833599433db
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Oct 20, 2025 at 1:56 PM CEST, Sander Vanheule wrote:
> GPIO chips often have data input and output registers aliased to the
> same offset. The output register is non-valitile and could in theory be
> cached. The input register however is volatile by nature and hence
> should not be cached, resulting in different requirements for reads and
> writes.
>
> The generic gpiochip implementation stores a shadow value of the pin
> output data, which is updated and written to hardware on output data
> changes. Pin input values are always obtained by reading the aliased
> data register from hardware.
>
> For gpio-regmap the output data could be in multiple registers, but we
> can use the regmap cache support to shadow the output values by marking
> the data registers as non-volatile. By using regmap_read_bypassed() we
> can still treat the input values as volatile, irrespective of the regmap
> config. This ensures proper functioning of writing the output register
> with regmap_write_bits(), which will then use and update the cache only
> on data writes, gaining some performance from the cached output values.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--beb9f8f9ee4d183a7d1204fbb04464e8e5b381b05fd161ee3833599433db
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPc4hhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hwJwGA9Ko3G1nJZCRCp45NYqHrFYbxkBBGBFyU
R9+N8TABsmbyBZirACBc1G/TltIJ9cyrAYChS/a96C19thAvzY6J+5Cif3AXCMX3
VS0VBxnmiXgtR6q/ecrERM/rbDoMk1TxEMI=
=gq6+
-----END PGP SIGNATURE-----

--beb9f8f9ee4d183a7d1204fbb04464e8e5b381b05fd161ee3833599433db--


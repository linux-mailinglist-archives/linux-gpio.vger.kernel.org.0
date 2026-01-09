Return-Path: <linux-gpio+bounces-30353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAACD0A911
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F9A33008711
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB48A35CBDC;
	Fri,  9 Jan 2026 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJIl1a4x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6DC35CB80;
	Fri,  9 Jan 2026 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967949; cv=none; b=W2zTYCoSXKu78Mh5mbv9mNT+OCVkQvw7DpPYdrIc5v6s0snWKg13m2AkCFbhO/gyhKV3i21rRVsy/JLylNPBbj+03JJeG8wStnzVi0KvzJJdw3+qjAyco6sfFSGDBelsVvKtsuCaZKlhgnzn3BWFTztusw2KIsGXmAPiLOYX9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967949; c=relaxed/simple;
	bh=4+mzqDzEaOLsrYXhGxtACkTBLW6Z+meNNs5bZHIEMfU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=mUpl8SvAv367P8ZyM9aqSlLFExXck9zyXocxla44lTPwV6OwLTZIsfwemY2dvLTrcndDbodVoSnvSwuwDt6w6gFdhVvgZjqDYsj/CCYt8ZvRC+//mUnLrMhsey/ZgNkNty9MmvVZ34zcgB1PHyBJ7904xUcLBWvwEWtWdEnT9H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJIl1a4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC20DC4CEF1;
	Fri,  9 Jan 2026 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767967949;
	bh=4+mzqDzEaOLsrYXhGxtACkTBLW6Z+meNNs5bZHIEMfU=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=mJIl1a4xTSQzVlWcDldxHy2N/IguXfpNTNL/2JHYPTE3lr+pnFvVMlE5vScKJ71GG
	 qhLrumE3D8pwFxjCKmxpC7h3pHjNhVZaqwE0op6TWYCei5KZ3Qx+GDFMctl/KXGcdE
	 GKmdNOBuACqjDUDC6L1+dsDEHvYnygGQL+Fsq453xFn6CB0vLlAmaS3H/4fgA1BQh5
	 wZIgRuC8x7A4oWhEHKGsmWXHXLn5R1V4nFPhrhMgBWXeX/aY3O0oXvMGzS9iPgHzC8
	 niv5c/sJa8xQooGKOYjqpFNo3UEvq+qcgDt4Mv0GgZ5gA8UIW9lERyJG7q6uNlhMpu
	 HQPjRo+OyZkPQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6694aa45c8d7d90c717d128b40772a22741b9e2a5453c342ca2042e23cc0;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Jan 2026 15:12:23 +0100
Message-Id: <DFK4BWTWHHQF.2IBES82YDKAEC@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Keerthy"
 <j-keerthy@ti.com>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>
Subject: Re: [PATCH v2] gpio: davinci: implement .get_direction()
Cc: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>

--6694aa45c8d7d90c717d128b40772a22741b9e2a5453c342ca2042e23cc0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Jan 9, 2026 at 2:08 PM CET, Bartosz Golaszewski wrote:
> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even for fixed-direction controllers.
>
> GPIO core will even emit a warning if the callback is missing, when
> users try to read the direction of a pin.
>
> Implement .get_direction() for gpio-davinci.

I must be blind! I didn't see the direction register and I assumed
that the direction is fixed and only known by the pinctrl (as on k3
SoCs, you have to hardcode the directions of GPIOs in the device
tree.

Thanks for taking care.

> Reported-by: Michael Walle <mwalle@kernel.org>
> Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org=
/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

This will need a

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")

Otherwise the sa67 board will be broken with the defconfig (or any
config enabled ARCH_QCOM).

Tested-by: Michael Walle <mwalle@kernel.org> # on sa67

-michael

--6694aa45c8d7d90c717d128b40772a22741b9e2a5453c342ca2042e23cc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWEMyBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hcjQGAlM9IV3lYe6vCXh/T6g4V/rvpArdwWHK2
DP5dBy8nqCXPdggu+HYxlQKDoydyrvdQAYCytzoINBNgAsebYSADQjYKvmU79dOG
VFWCA/Kaq1kyu2DuJXiaOueKfUZndi3ukRk=
=dpCg
-----END PGP SIGNATURE-----

--6694aa45c8d7d90c717d128b40772a22741b9e2a5453c342ca2042e23cc0--


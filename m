Return-Path: <linux-gpio+bounces-16102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA0A37C74
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 08:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D4D18910D9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 07:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396EB199254;
	Mon, 17 Feb 2025 07:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUFcA8op"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E584919048F;
	Mon, 17 Feb 2025 07:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739778241; cv=none; b=sM9AZ8Xlc9yP/LTBY2TGWmf3cgAhpXcx+Iz3lu+fDaWdNFQ6BojWD6ub0G+oIBw/R94QcrRDKESyZS/IhAN2Rv0Xk0c1VV6cKN2Gf1ERoHtc0kA49VipVABmmIWvrwHzbpBAFaBfvuxd1OzZ89X8wuiIHMZuI2s779GGJWkRQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739778241; c=relaxed/simple;
	bh=K6SwD/OZzOjb86INDDt27d27FuwyWqZGz5olI05VfSQ=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=SaeZ7S47CbkBRPHrfZb1jCcebaTUDneup+tp1FP7I5hWJAk5iz0oO85SMtu5r2Zk6A6pX5oBrPFaW17MgNx69oLw82sNWhVJAmgrAb5b1FHoLFXWf0TgouxmtK/u070tOdx4KJBe1vNQHdzSGLSf/rNAKtlczyYhgltkySJ5sQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUFcA8op; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F9BC4CED1;
	Mon, 17 Feb 2025 07:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739778240;
	bh=K6SwD/OZzOjb86INDDt27d27FuwyWqZGz5olI05VfSQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=uUFcA8opzdESB4KWsYQlcLAZ8tTTeIfAQxun5ONQX0caO8dU28TiX8wA/VlvT4/Gp
	 2hqGe+Z7MNYUYjvmLfoDxn0YOV9gtLC/1Zaf1d4pbqMqiv2Tw1neVdgY1OcgmpSarl
	 bk6mgenepQgBLCyXyfZoqF1ts/ltPIX9VkTeKOngpoFmI+MZFkN2qyZILMeGX7PdZm
	 iWhBLRd3K9W/AY65N/9JH9kHPHnXX9c4wzF4cS1ZwCuyMj5Qt2Sl2fWrdqKwmqmx0K
	 ynATC/r77DQeNyHQgJyRWDSx8oknYa4NgbmAkHaBKCzG9f+r0ZjtMTgyKyy2grzNCt
	 nR8BYbIOYWIAA==
Content-Type: multipart/signed;
 boundary=b3bb0c749b5f1bd9189595d567a99657fdf2680f977c477f4a74cc7973e4;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 17 Feb 2025 08:43:56 +0100
Message-Id: <D7UJWW5NO0DE.3JYNEOH9CY05L@kernel.org>
Subject: Re: [PATCH v1 4/5] gpio: regmap: Move optional assignments down in
 the code
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "athieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <20250213195621.3133406-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213195621.3133406-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--b3bb0c749b5f1bd9189595d567a99657fdf2680f977c477f4a74cc7973e4
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 13, 2025 at 8:48 PM CET, Andy Shevchenko wrote:
> Move optional assignments down in the code, so they may use some values
> from the (updated) struct gpio_chip later on.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--b3bb0c749b5f1bd9189595d567a99657fdf2680f977c477f4a74cc7973e4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ7LovBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iK0gF/YmzW9+derpUKO4i4ZPA9SEKsC+YfPlxJ
78WdQ4lQRXZAZbtfGt7/vDoIj1U40Z+cAX4vjY7fXrQDceAt64hE0+B57zkkJugh
e52YsynpkavPy+El3hzNeOOMHZHgz9cyzdE=
=8MiO
-----END PGP SIGNATURE-----

--b3bb0c749b5f1bd9189595d567a99657fdf2680f977c477f4a74cc7973e4--


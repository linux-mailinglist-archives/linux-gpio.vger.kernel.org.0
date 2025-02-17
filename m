Return-Path: <linux-gpio+bounces-16101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7BA37C6B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 08:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580551885210
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 07:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E101A19F101;
	Mon, 17 Feb 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nubmVWJQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE919E97F;
	Mon, 17 Feb 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739778052; cv=none; b=kVQltD2h9Aqu+1wHttptlKpHwIfmsnvlkwJ6Kwte6Y1xc9Wf8H/QMPknqylGtEJ+64tSW7886Bx3jxwJz9ZmqZc968vPK8r58FZiJt24O4scbxFjwSMfJ89/PMKaBMTeGqaKrLX9eqAt8s8li+i4pqFQjxg2rS5/mu2sUd/j42k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739778052; c=relaxed/simple;
	bh=hJCAxOXGH2Bv87df0NWn1NlDsDEdMyCS/d/gEenDeSE=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=a/GsrmaytgswG/9mGcjHAQYW0vI/Pgo6x24UGR/lmdWNAtIL0sQ1fOIJtPJIj984k24j5H0IyTTNfzbwWL9QWxP63QTq8P+KNq6bgqRS6nArsj1PXm/9faOn5xb7R80D/7VYSBlQxs7Tq+H5c2yLI/Cb5VwVy9KfMe6D1XNDBbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nubmVWJQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5CEC4CEE2;
	Mon, 17 Feb 2025 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739778052;
	bh=hJCAxOXGH2Bv87df0NWn1NlDsDEdMyCS/d/gEenDeSE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=nubmVWJQ/dvBmtAKzzcJwdV8+zBI8G0yh4VrR9qQC0uyfifo373gmzxJKT9UAd/HS
	 9RuEFXSuSPFVY9DHxwFRwqaBL/PM1Yp6tKZTyJumN9/JUER6PVoT7C+33rFXWnqQqw
	 3dYsPQIs7miOVVP51V/T+xdOvVlXaWK1svq1cSICRKV5a5gaKCQZTVP0/Cy+xd8io3
	 wCvQ1h403ltAeDq9pghu+C69HaBEmAsff/3HnQj2JLHYCThaBuiB3sUq0aHtJNxkpg
	 d2wHPPRraXguC8miFAzb7fMxPgIxqv4B+5siffEdPvps0rBnWzCnfGZVvf5vPWkTDn
	 2Vs61qxZDSbpQ==
Content-Type: multipart/signed;
 boundary=a5f3114633a16736597ecb4613edd6a3286b97e102f23f69fc0836cec9a8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 17 Feb 2025 08:40:48 +0100
Message-Id: <D7UJUHPZNH5I.2YIX1Q3AFB7ED@kernel.org>
Subject: Re: [PATCH v1 3/5] gpio: regmap: Group optional assignments
 together for better understanding
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "athieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <20250213195621.3133406-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213195621.3133406-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--a5f3114633a16736597ecb4613edd6a3286b97e102f23f69fc0836cec9a8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 13, 2025 at 8:48 PM CET, Andy Shevchenko wrote:
> Group ngpio_per_reg, reg_stride, and reg_mask_xlate assignments together
> with the respective conditional for better understanding what's going on
> in the code.
>
> While at it, mark ngpio_per_reg as (Optional) in the kernel-doc
> in accordance with what code actually does.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--a5f3114633a16736597ecb4613edd6a3286b97e102f23f69fc0836cec9a8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ7LoABIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gDtQGAxAO5CFuWOk8DPp859niSj/Zyu+LdBqf+
prL23eg7WEFaHBDWTjUm93NhnW+xR2JtAX4vy5JtSaIMTS7h0IHipFbGvqrqMzCq
4PigvcyzRbl8V3MaQ2nMud9HlTyPtSzVqGs=
=/5g0
-----END PGP SIGNATURE-----

--a5f3114633a16736597ecb4613edd6a3286b97e102f23f69fc0836cec9a8--


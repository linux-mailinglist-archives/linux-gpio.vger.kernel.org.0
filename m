Return-Path: <linux-gpio+bounces-29171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48780C910B9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 265FA4E18FE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 07:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8675E2DCBF3;
	Fri, 28 Nov 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPrqVgei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C2E27B32C;
	Fri, 28 Nov 2025 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315455; cv=none; b=qzA1rz+L5yTu6lVNI4k0eSrXJAgjTLHyvHvkwClkNCmMnrTmGqVEQtVixjrCcVJl5H47sZtotUUzeU82eDVP376s2OpddvWZBnWhIfZm/Iys7XTyZKLpUlUNtrOGQtaipdYq8VsV/EvJmchB+NEEcL0fZPTJVykfOw5BK0FzdF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315455; c=relaxed/simple;
	bh=hhQAbDnJ6A1mJzR92r3buHEG6eXOUuVY5Mt5vQ68vlc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=PfNj+hmR/zL7JC3m1sft2EIb7M6trK/JQOzMq02hNu4qJXSNp+k34FEDAvpKRGrCzL8E7RdtDGDGt25SuLfW8H+kSEiK5vm0gky/s4Fp57Mg+eZcLpxN3UemAp8CGWZOL1VqOP+uGW5E6FAHcuu4HzjlYEVi9FGPMKWe+V7qQjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPrqVgei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D857C4CEF1;
	Fri, 28 Nov 2025 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764315454;
	bh=hhQAbDnJ6A1mJzR92r3buHEG6eXOUuVY5Mt5vQ68vlc=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=cPrqVgeiDm6lHHfxX0Wtz/jWRa14qmSZMSe/2KyiHvmtmDm0SDkdMDPbSjP+NriKe
	 nsZguiY0RRgE3uHjE4EQGjqLsSvgjK6UArq0VpgpSrQABkkIEJaBCzvvfy/ui7sEfE
	 IzI9P/yhtyPup7ZhsBzz42jI3T1lUGmMHaWg26iEjBbG9hHE9mLpLy6fcYL347rFDN
	 wT8dnLXxkAjzkVWPDTd8dzrTzqhFLWVFcOz+9kSMV3mVIAJSIhzGTIV5HYKphSgGLh
	 G9qyJWNpZnb3PUsKXoZez0THdIUNnqtp95OfnswPlUAxb9HEJG7jJJrXan21CFMIZI
	 KHjZGncpIY+pQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=580fd2a7aaf7a8f5e5cb56821e00c53187efb5b315d70ee72aaa947da780;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 28 Nov 2025 08:37:28 +0100
Message-Id: <DEK5MNS42Z8T.295EZ4XS7ZA4X@kernel.org>
Subject: Re: [PATCH] gpio: regmap: fix kernel-doc notation
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>, <linux-gpio@vger.kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Lee Jones" <lee@kernel.org>, "Mark
 Brown" <broonie@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Randy Dunlap" <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20251128062739.845403-1-rdunlap@infradead.org>
In-Reply-To: <20251128062739.845403-1-rdunlap@infradead.org>

--580fd2a7aaf7a8f5e5cb56821e00c53187efb5b315d70ee72aaa947da780
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 28, 2025 at 7:27 AM CET, Randy Dunlap wrote:
> Add a ':' to the end of struct member names to prevent kernel-doc
> warnings:
>
> Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_line'
>  not described in 'gpio_regmap_config'
> Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_flags'
>  not described in 'gpio_regmap_config'
>
> Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--580fd2a7aaf7a8f5e5cb56821e00c53187efb5b315d70ee72aaa947da780
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaSlRORIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hLbQF/es9q5kFMdJ0gwXUaStmgJEv3gVmCku2R
Vt1ES96Gv9jqQ/WAZlRrJ727RbjEUBxeAX4nVyyz5ORCNWCl0sbJb7lyCLETyv2I
7hegjQrOxfFLs8XHSvIKP1nmktVeM3YSVfI=
=X7pZ
-----END PGP SIGNATURE-----

--580fd2a7aaf7a8f5e5cb56821e00c53187efb5b315d70ee72aaa947da780--


Return-Path: <linux-gpio+bounces-27077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1EBD8FDC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E5894EADC3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 11:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108E630BF69;
	Tue, 14 Oct 2025 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evAlwKDX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE32DC768;
	Tue, 14 Oct 2025 11:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441132; cv=none; b=rZdsi+YLsls1te7BWj9Zwc1DMowvnA4RJ8AiII4MZOZ99Xt1OSKzv57FiHedo2p3vJWumEguMTmAN1TjEyYUC+KbU5V+3zfARbVJut+Tomh8PUspiOWa6kMya6ipnH8JE2CkDwb+Hwok6qFCQBYskPJeO8SyyRMEq/8yUtYBCTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441132; c=relaxed/simple;
	bh=nt6ubOK6ZBZxKAPQ3dEO20vGjhE+1Sl4P/HRIJTIsbg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=cEX/oDwKhWwF7SRFuylpI+tLvvozZftArQlBacz9LcYuegwLJwzez51Gn90zkvLSRmz88P3PanESkFnBnwUnYi+0/7b+XIZ3Xwlmr+M/yUVb7cumSpE+ERuo5GKeYkvsMiDDHRW8EybhdRwaT7CMt5NWs7aA2wC4bp/Rj/E40d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evAlwKDX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BEEC4CEE7;
	Tue, 14 Oct 2025 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760441132;
	bh=nt6ubOK6ZBZxKAPQ3dEO20vGjhE+1Sl4P/HRIJTIsbg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=evAlwKDX6+qLAo8EuBaWfuJusdDQrMca+iKhAmW5hKkJ30K7NVFVn3BieA3pv3T8p
	 Vc2zUkkjmr1canmfXQhmgu3zFt1ebHPvvmpMUVfCUkIHiKsnlO48upFdnHqt1LzKDu
	 ESEPz4zR6mwEuhkh9FWNmoFXxYRJ8PcR/sEg/bZRsVlqNnRhwZtIU3h05ZAZkFT4NC
	 2fL2kMt9krwKIFFvwelBwmOVBzFkSdPAH6HTsz3VzzXYGGoNZyo/hysF1PWXib1iZi
	 bosgwoJSl5am47d9Gz1YvVe1Ww+mQRiBHk3JdSppcickCB+prYJsXS3y+OHksHnEIr
	 UZIsJrbJ8sJyg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=df00eccd4d148f6d4f179f10837a6e86dde665ffb2837474f4fe0a537afb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 14 Oct 2025 13:25:24 +0200
Message-Id: <DDI0AO1RKDJK.1M31TW8HEJHFU@kernel.org>
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
Cc: "William Breathitt Gray" <wbg@kernel.org>, "Mark Cave-Ayland"
 <mark.caveayland@nutanix.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
 <andriy.shevchenko@linux.intel.com>, <broonie@kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
X-Mailer: aerc 0.20.0
References: <df4857cb-daae-4428-bd93-5878564624c5@nutanix.com>
 <20251009094905.223456-1-wbg@kernel.org>
 <DDHX9YA0ZMKO.C1MA3CHLT4ZZ@kernel.org>
 <jajbilboyqty3a5tbgjgwklrpcstv7gotkqis46cuzgew7ip4q@ej37jq2cev77>
In-Reply-To: <jajbilboyqty3a5tbgjgwklrpcstv7gotkqis46cuzgew7ip4q@ej37jq2cev77>

--df00eccd4d148f6d4f179f10837a6e86dde665ffb2837474f4fe0a537afb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Oct 14, 2025 at 1:21 PM CEST, Ioana Ciornei wrote:
>> To fix the regression, I guess the patch can then be picked up by the
>> stable team along with the driver patch which will set the
>> .fixed_direction_output config field.
>
> Just to make sure that I understand, do you want me to add another patch
> that adds the new driver user or that will be handled separately?

No, no. No new patch. It's just that your patch (just the one which
has that property added to gpio-regmap) has to be submitted to the stable
kernels (by the one who is fixing the regression) I guess.

-michael

--df00eccd4d148f6d4f179f10837a6e86dde665ffb2837474f4fe0a537afb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaO4zJRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hEzQF8D12xn9ofXfUYV0AVybedfQKkvPDtydDQ
D5FLXE+8tWx/HYLGI3awFmlpy7cdkkEVAX961UUEqG86uHFGL8gaJuZQ7Z6JXNjA
UGiW29kddM4fcLdx7mUJAhnZTTVWjn+Y7MY=
=Djbv
-----END PGP SIGNATURE-----

--df00eccd4d148f6d4f179f10837a6e86dde665ffb2837474f4fe0a537afb--


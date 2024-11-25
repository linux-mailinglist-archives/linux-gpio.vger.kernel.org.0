Return-Path: <linux-gpio+bounces-13273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550A9D8B3A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 18:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF84A285FA1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 17:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6462E1B6D0E;
	Mon, 25 Nov 2024 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6BKMq1E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B831B3954;
	Mon, 25 Nov 2024 17:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555296; cv=none; b=t7awL7v0pNmf7PafIuevwWy35xo8l+AU9NBioAi11sYSz61oUWG6Xdt+VgTn7/XgljaqjkvodeB7P9jd5h6Z/eezw/160Yg8C+xZVfr5WlIsz1oHl0XXBB9vfnCL30q1qPJ9By/wa5F0O1GZ/hz5AXmU8aZMnrAx8/9syWbBcZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555296; c=relaxed/simple;
	bh=koLza6+A8RGlfeWcy5rQbxk0LyXGp2tsL0UFQPEVXYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSyoy0Kc3tc1JraBFHkFPBEB8uBCB8HvBSXJ0sQoTgTw+X5f+Vd92/h4g021+DQD2EE4DPLfd9ijzGcGtfymtN9L7bBPfjMK0uMucZek74h0dvwYtc9QMejv19+aTRRj8GGtbBidEm6tXjaxVQwlNHa53Pj335A5NV2YtMl1+6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6BKMq1E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B267C4CECE;
	Mon, 25 Nov 2024 17:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732555295;
	bh=koLza6+A8RGlfeWcy5rQbxk0LyXGp2tsL0UFQPEVXYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6BKMq1EILB970Pq7+vMMrga80ICntau1SRnPLnhGNZ4Y82aQlHrFyd1EItXIzOML
	 3bcHJk1DstdmtTgPlenSZMj0D4ztcPG6KxURAUeIaPfI/n18E2pLGdT99/7EVx5ASz
	 SinFWdE8tm2ZaJjGYv7Veb3+rlc7HbQSzphp+xZ4PSUr5gVaBU2Bi6hBcjpeefcU+t
	 0T0iigAxy7yEafc5f0qFnksiRsASXzJT4y1wrt358zhCCpOigbb98LeCo8u8Ae1jpu
	 IaG2IwyryQYIMBwe2MlZ0wN1c4dg0uaX8YGLTed/wCU8s0mQDXkhyhIqpUmhwKCKCa
	 scdNsO553rMew==
Date: Mon, 25 Nov 2024 17:21:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	dmitry.torokhov@gmail.com, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 5/5] ASoC: Intel: avs: use devm_kmemdup_array()
Message-ID: <3bbeb2f0-e806-47c1-85d1-dcb309b8ca34@sirena.org.uk>
References: <20241123200527.7830-1-raag.jadav@intel.com>
 <20241123200527.7830-6-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tk5p24LMrVATe/rz"
Content-Disposition: inline
In-Reply-To: <20241123200527.7830-6-raag.jadav@intel.com>
X-Cookie: This bag is recyclable.


--tk5p24LMrVATe/rz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 24, 2024 at 01:35:27AM +0530, Raag Jadav wrote:
> Convert to use devm_kmemdup_array() which is more robust.

Acked-by: Mark Brown <broonie@kernel.org>

--tk5p24LMrVATe/rz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdEshkACgkQJNaLcl1U
h9AkHAf/YWNkHUqYPCmh5wF0cL2v6q34/N3jS6+UyWKrcOKKwiWo9t2XxTlJtgSL
5CMPA7CrtDt4EKbMxRBq98EQRb/A511Gg22Wwy4LrLYDlotD5cDKZxVR0ws1+jQ7
iE5/+N4atLsqGrF8kM3DPZkJtN5qW1CI0llLwz3hQHlyPN6UVX7CZryPuMjPRmeN
daWV+u35LduWLcHpy9WXJ1OzzMxOkMcJAZ+l74kMO0lrYwmOtFz3ZKa/bGpTVr5+
dO6FEXfJAStwHpuosF+kqCBDBGP9fNRPOu4gnbNOWeLfWOiBNS1wD0aDWBZHCmtm
mmPczz6ogTqF/I1oyvcxQzhtMLpIRg==
=kigg
-----END PGP SIGNATURE-----

--tk5p24LMrVATe/rz--


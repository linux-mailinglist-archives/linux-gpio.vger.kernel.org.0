Return-Path: <linux-gpio+bounces-6842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3D8D3757
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 252531C23D9D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AEC4C83;
	Wed, 29 May 2024 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+sSY9x2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F82572;
	Wed, 29 May 2024 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988524; cv=none; b=oO4ekYH6aOfyn8LUwnpO2YGNkzfAmnq1Cyh/r1Cc7IQC5WxgXXxEcrbyCZDGi2c7d5E+5b+mlr7v3pmNWDxkwlVIYEAEfOET3kw8BRmRbfD4aJtzTXzvozfKmVeXvBbO3YtfASIHUy9PR+XnUMlnGwzRj+yfsUAlkLnQjEMQgHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988524; c=relaxed/simple;
	bh=ujzhhXCydAwZXc7rS5LhBrMDvamEvdGbdaBp/U8b0oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUnIkfyKWDDxnqoh5q/PzCgpMKKPDiCjZBZsU4wSZm6Mt35vnc8t7nGeB/lWG147e3uMC8cFpJcg6ft7e9OY7liDhMhTmRfEdk/rslRKcjzT68rZGOLNUsoAlafFEMvTw5wEA+bWHOHhuE9TR6uZh94yXFGvH3/xtguAS0qqNhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+sSY9x2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F58AC2BD10;
	Wed, 29 May 2024 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716988523;
	bh=ujzhhXCydAwZXc7rS5LhBrMDvamEvdGbdaBp/U8b0oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+sSY9x2Yr9SOckTZ0mrTp0XctmZIan7I1jgy+rBnVb5Y5LKO6/8i5FTX7h1XGmQW
	 5SCmmxjYTmk5S1d47S946+DXlDncD8ytFzgK9f/MXx/IswC8zZjqrzfY+j8G5wP+fk
	 e+aNg6gR91SaPXD4YuqMskL5j3iuYXwNmDU/BqZL3hLSZLzWK6hYlzKUBO/0FZUEAZ
	 cC5tDEhR2efhjkE6CwlXIV3CLpAT3WWTUb3QDEZklkBmcmJCgoYXY6PhjcNr+GsyTo
	 Y5nrN8wZjcxZSZBVJNNwtatUfwKJTUWf37s5ru8ZVVDDKaQjVi6C2bpEsOhMxcPz8N
	 P/zxR/ZW0I7mw==
Date: Wed, 29 May 2024 14:15:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: gpio: Correct default GPIO state to LOW
Message-ID: <ee5798e5-bcc4-4715-9c93-913094160b97@sirena.org.uk>
References: <b80d65600641e6dcf00da53ae797f4a40a80e2d0.1716976062.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U4bdCLzVLSiyC7ix"
Content-Disposition: inline
In-Reply-To: <b80d65600641e6dcf00da53ae797f4a40a80e2d0.1716976062.git.geert+renesas@glider.be>
X-Cookie: Everybody gets free BORSCHT!


--U4bdCLzVLSiyC7ix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 29, 2024 at 11:49:51AM +0200, Geert Uytterhoeven wrote:
> According to the GPIO regulator DT bindings[1], the default GPIO state
> is LOW.  However, the driver defaults to HIGH.

> Before the conversion to descriptors in commit d6cd33ad71029a3f
> ("regulator: gpio: Convert to use descriptors"), the default state used
> by the driver was rather ill-defined, too:

That was 4 years ago...

> I have no idea if this has any impact.
> I guess most/all DTS files have proper gpios-states properties?

That seems optimistic, and a grep in mainline shows some users but not
really as many as I'd intuitively expect.

> -			/* Default to high per specification */
> +			/* Default to low per specification */
>  			if (ret)
> -				config->gflags[i] = GPIOD_OUT_HIGH;
> +				config->gflags[i] = GPIOD_OUT_LOW;
>  			else

The risk here is that we start glitching the power where previously we
didn't.  This does make me nervous.

--U4bdCLzVLSiyC7ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXKmUACgkQJNaLcl1U
h9B9Gwf/R2iAIKgEctcw6myFMUeu271otHOu/guyQ+Ko2nLT21+UkH3EiiU5p4b3
cY20iuEK4tmSJPUueJDiwdXAlPOZhQ8JFxIZvXPm0ZIMWDNdMECgb/LkRjJFTN46
WAjtna5x94CON+5t0Bx+OMpM/obwIYqvYWhAZPR8boURfOULjQed3Qs4UzB5O7A2
c9QLLGmeAcCjknN1Xc9OJgVe7sfHp86mwyivy5/5QAvmYPCDJYbt8dPFqg34Rjec
Xk2lJxw1LE6kD0xYg/60lxTEWeiuBJAsX7aVXdxHf8+dP5Y1qgTWwoYY8f9ww81W
X/EozJGbyVxrkmP6w29IaAXV1Ol0Kg==
=DNcl
-----END PGP SIGNATURE-----

--U4bdCLzVLSiyC7ix--


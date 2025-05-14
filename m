Return-Path: <linux-gpio+bounces-20137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D95AB65B0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 10:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE2C3B4B5F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 08:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E9F22156D;
	Wed, 14 May 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O31B7HzE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAD202F9A;
	Wed, 14 May 2025 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210656; cv=none; b=Tuo5mvseCT5zXTVhYcu+1HxFoSlXg7adBX4v6rdYzr/4AJ219NHZH5r6y0UjmRltLyOYMAtg1/kMSHdgHde/P2kIT1Ibm/XPclWKbrqYg9V0f31EuFsmXEKq78iu7oMfRc7kXdbgNBqYwqR1l6a51WmGsV1MZNqS1agdVAU9p3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210656; c=relaxed/simple;
	bh=HrEby8X97oMS/rj+guNPUJDiVtS8KqyTeO4FfPyEZHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN1L0DOV3cQPfUekMm9ybf7pKoGd1GvRVcwCkAB3wX/ctGrfrsDoTRjOFzvVSDEFAFzFVfewseChf9KFBlyOkdC2zr9rfyB8/NfccvyhgJKCldfuJtHAJCj4JU4iRZHnPFqjCh1Qtfw9+v+zVJcS1mD0DzKHBdf5oZWQ5KVb4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O31B7HzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E50C4CEE9;
	Wed, 14 May 2025 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210655;
	bh=HrEby8X97oMS/rj+guNPUJDiVtS8KqyTeO4FfPyEZHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O31B7HzEyj3Nh4DAAJoFtHFRHPDbN7/g83eRGt9BVOdIa407ZQsTtrzwDXm08UiHf
	 au9g7acBtuIWljLhpr1LVdKmuA8eumou+3pxY2wx3+y4tNi2Da0cT7MJesdUQoTz9M
	 x3xxKgtVuJl2rvXx+koXEHh2vjGBnY7kezCh1XkcOUJx3DdswXJ0KhNUIt7N7AvEDZ
	 rI9bK1c389FzNXR/9nABj8vY3s7LJ2xWKNrLciHhrbc0NFCR3BrPv935Avf+Fzw7u4
	 T0XJMfje25BR4bZ5c1G189g5NyRAtkKpL1STKWQFKkrsIWLPUncgYk1ehmnKyxJOhp
	 VoQMI5UaLWtjg==
Date: Wed, 14 May 2025 10:17:30 +0200
From: Mark Brown <broonie@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 04/10] ASoC: mediatek: mt8196: support ADDA in
 platform driver
Message-ID: <aCRRmk2Vqplbbusn@finisterre.sirena.org.uk>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
 <20250514081125.24475-5-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Ucd00qPZdK+Pv3F"
Content-Disposition: inline
In-Reply-To: <20250514081125.24475-5-darren.ye@mediatek.com>
X-Cookie: Well begun is half done.


--1Ucd00qPZdK+Pv3F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 04:11:06PM +0800, Darren.Ye wrote:

> +#include <linux/regmap.h>
> +#include <linux/delay.h>
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-afe-common.h"
> +#include "mt8196-interconnection.h"
> +
> +#define MTKAIF4

This define is there unconditionally, what's it for?

--1Ucd00qPZdK+Pv3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkUZoACgkQJNaLcl1U
h9DiUwf8CeXyIw1furK0nf9QfBubUYFQ3DjxWzlkFbKAyVnUb3qF3V4vkrVIRC2P
HYiWu0j8HLfZE/o+6cFkU0RIhzDgC/TGdMp/8ZlCLG3PpX8n124t3GsigTEOv+ZP
13p4rzmwS4GdMZD5uY7yI5mg1ScK69kNmb6ah4DeOTo92/GJQTITnJXq8B3UegXr
P5rk8qlBWvgKL4ebpRSGbCztpZZ+rDkUzaNutwIk0I4mzdmGwfJ/u/kBk1oUNhoD
+dvn4qemKwDA8J9QV/sDzEu964KbUx+iWz1AryHn3TwKzF6kO1I2nirfld6rrqqK
0vtfqUZc+p2IdLOgN8NnSiL0/t3h4Q==
=xV1N
-----END PGP SIGNATURE-----

--1Ucd00qPZdK+Pv3F--


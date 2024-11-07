Return-Path: <linux-gpio+bounces-12667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B721C9C02F6
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 11:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CB15281AD7
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 10:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC09D1F12F1;
	Thu,  7 Nov 2024 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSv66I4R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734531DFE24;
	Thu,  7 Nov 2024 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976682; cv=none; b=qFWQwipXkUQNwfTsMEEQns6WigG7GvsKZGcGx+mUeepwPLREpkOmdU9cVfUgX7SmUyT5ezEK9tCqA2W4ztMFzaZuPlS0MTp15oomrWtIJu3Ioyb57zOzlKvIi8rBtXTSHBe0ldWzImtaVDJsVF1bflrkVyKsywhlCw7tlC2HShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976682; c=relaxed/simple;
	bh=GcosasGhQ74nJq0riXDCqlQclpSS5R+ZseW69SbcbMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btd3CP2FOO9Upwg2dJXyrMFbxktPKwjNnZ02zQLvpiT+B7TjwLu6DGFW2gTZ8saV5ROCr9R++zqo+QKtFFFYav2SScPlMC0Xqx3B1sZOPOOH1GKZi8bSmPktaTKBSeoaJ4jYVy1bxiHcvpxa2r0rEwE46W8Mofjnkjs8Tuk5aNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSv66I4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F91C4CECC;
	Thu,  7 Nov 2024 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730976682;
	bh=GcosasGhQ74nJq0riXDCqlQclpSS5R+ZseW69SbcbMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSv66I4RPu26MvPX1DytbCJXP5PvX7SFrpIh5M8IBxPkKMYhLQeRdB9G2wkYFXdEC
	 0SK0zNj0zibab/q6HVAkZZWOMfV48AHH0fYUTyqMR2riuYjAgS3QMLcmXgpupMZoCN
	 a82HM6J8e+wgYrburnjgNzLqMVq4bjGWKzQrd85V0+qno+qS4fmDBPajFt4lFtP9+B
	 S1LcfghqCH373bR4a6wQHyqX+Agw7ThWl35vjsGMwu17porT4M/P/A/ax+erqhltNd
	 qvLmQ+LUD/wcGqNvCO4lIkndYxG87ZB7azD/1UcEvGZTeb0gu8b4H7Z+nJDOkmMgov
	 xPOZOQVhzFtDQ==
Date: Thu, 7 Nov 2024 11:51:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	Adam.Thomson.Opensource@diasemi.com, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 21/31] ASoC: dt-bindings: renesas,rz-ssi: Document the
 Renesas RZ/G3S SoC
Message-ID: <xdgo5sfvk7crqt2zmdzfazfglzvj36zg57pujsh4e2bq4bm5hw@mvyejqmzpslp>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-22-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106081826.1211088-22-claudiu.beznea.uj@bp.renesas.com>

On Wed, Nov 06, 2024 at 10:18:16AM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
> one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
> it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



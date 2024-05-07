Return-Path: <linux-gpio+bounces-6199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB3B8BE72B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3181C23D9A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 15:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A35C1635CC;
	Tue,  7 May 2024 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5bYQe1y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3A1161914;
	Tue,  7 May 2024 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094935; cv=none; b=SAeASRx6DGtHNLU7eKuU7xj8OZA4QObBEJR+sNgE8wEVGZ6MQ+ZmhuW+l3Y4U/OuY6yC634HlwMs/oNHctCFeVZIDyRN4NJ5yxhAUds1kKklVqEFYdAToxtN/Q9Si2ZKpCTdYeicrtSTKTN/CQuf7lTC1jfKb5aUNA4nXbr4RVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094935; c=relaxed/simple;
	bh=AF0IG7U9yLaf0TKDjmv2oW0NAZ5Yv6qM/EdNBZdaA+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlVw9IiUfBF1wfQKbuFtX3twj1dIX2BJhw316lCgSaRzfO7SNA42mHAgr9qfx9KkkvOv5n9Mn9o2WxdaiAR4Sa2Ft9yo/XDKNC6zcMfpyLYXWmzBftwJdAi2hwo3NDs02m1LAo6g3bGAom5bHxhlsxquJqkpJcgHCoxtnEviAqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5bYQe1y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F331C2BBFC;
	Tue,  7 May 2024 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715094934;
	bh=AF0IG7U9yLaf0TKDjmv2oW0NAZ5Yv6qM/EdNBZdaA+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5bYQe1yIl5osdfHFh58czWgmEpherJOCYDFqdQqTSJ7s9wfmt+AOOJ1/l4Q3g7qJ
	 vTYfylx128AP7P4/AAQsV3/EN5mNgSQCUu+TZqLAKJuSPeeId8hMMt3GIHGzoH4QDi
	 kOL+KBP9mQb98GY7LtAVJgqC3Tvg8blVd/wK7KReF/KwDNCbcWbXk3Fs3sO/D6F6ly
	 txyM8vZoxtvQ100G2Y65/qu5S2X/GfOj6BGaLAuQQdJu5r4AR8KnDAmPDE2lTl1s36
	 hSLVUzZkp0CyUMG88QDwF59bHtFI9sMLAu250o1l8Od8kJLkOQOXJjQUDUTgoPx5OD
	 5frM4STFkxL8Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4MXY-000000004ZW-2wmP;
	Tue, 07 May 2024 17:15:36 +0200
Date: Tue, 7 May 2024 17:15:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 03/13] mfd: pm8008: deassert reset on probe
Message-ID: <ZjpFmGNWCu6zXLrC@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-4-johan+linaro@kernel.org>
 <ZjkoAzHnYTKk_6Yr@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjkoAzHnYTKk_6Yr@surfacebook.localdomain>

On Mon, May 06, 2024 at 09:57:07PM +0300, Andy Shevchenko wrote:
> Mon, May 06, 2024 at 05:08:20PM +0200, Johan Hovold kirjoitti:
> > Request and deassert any (optional) reset gpio during probe in case it
> > has been left asserted by the boot firmware.
> > 
> > Note the reset line is not asserted to avoid reverting to the default
> > I2C address in case the firmware has configured an alternate address.
> 
> ...
> 
> > +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(reset))
> > +		return PTR_ERR(reset);
> 
> Shouldn't you wait a bit to make chip settle down?

Yeah, probably. I actually asserted reset here for a while (e.g. to
reset the address), but didn't have to use a post-reset delay then.

I'll see if I can find someone with access to a datasheet or maybe add
some small delay here anyway.

Johan


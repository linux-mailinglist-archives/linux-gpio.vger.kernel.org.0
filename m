Return-Path: <linux-gpio+bounces-22263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04654AE9E8E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 15:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 355B816D1F7
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 13:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00F228C016;
	Thu, 26 Jun 2025 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqHhb0Pj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299B21CC62;
	Thu, 26 Jun 2025 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944184; cv=none; b=LhEx5grSvfx4ZbLVRmCtkc0uULl9j/jg3aMm30DZ5xjLd+KWj1lnM/OvCWECLKfX9dSn5A+U3c4OFwRaEEUzIUyQs9BlPiD0Kzogx01ZsqmpyQAZ/n4UOT/Q0o9/FCSt8RZjUJYxaghrCGhGe3cDxTjGo0hCcV3mMKXaWXtuzgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944184; c=relaxed/simple;
	bh=0J9XAPALMHCGTDiJj9uTHhow6UcZ3bYIJmApqHiqf4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIDvIi+XXNrPxu4JuUok/2B9eMNpjvGZ9hTBtZLz1LCXQyo6zJNLL+zpsleE7E9xp05CjFamKqVihwSn4DBz7VLn6fuWKrAsdtPkmalp+kAO9T3yOjH1MbFtKT/toktfCqkhSwH8Z0ESsHAzHe7adX9pdTY06e0K+e4y8B9ih3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqHhb0Pj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89813C4CEEB;
	Thu, 26 Jun 2025 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750944183;
	bh=0J9XAPALMHCGTDiJj9uTHhow6UcZ3bYIJmApqHiqf4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqHhb0PjB4oZGRa+tmOszHEDrhs7SMXBOMBdp76LA0Z/dojo0WYe3uPumaSp6fV3V
	 8Aqm9lBOzXBz2VAJbrSWOlWxorNUJhOJwcWx4hfZyMHKr3OmZ7FR5vZkk177JtYHTu
	 Ug7WME5D91qi9ypSo6yxYSNkgeBj8MAAIdyy2JgGddTaiReBGc0ZB8h+qwEgCTujhg
	 iwEXB/ziHc/HTqnwgSORjsITVbRpee0F922SugdrpOsskxLZdiMV/agOMH2Tp3NRru
	 LamukhIm39q7+9o4yiQ1Z8u4lYDFR9GzlYNxD1bNqb5o/KxYo32Nweg5RYuq3V0aIr
	 SzhypWot+Ypnw==
Date: Thu, 26 Jun 2025 14:22:57 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Message-ID: <20250626132257.GE10134@google.com>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>

On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be

Spelling.

> parsed by gpio-mmio.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 18 deletions(-)

Can this go in on its own, or does it have depend{encies,ants}?

-- 
Lee Jones [李琼斯]


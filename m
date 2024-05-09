Return-Path: <linux-gpio+bounces-6275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BC8C0F85
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 14:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA231F2301C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 12:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC5114BF87;
	Thu,  9 May 2024 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOw4Qrg0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42414B091;
	Thu,  9 May 2024 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715257226; cv=none; b=YdLJ49ekwLeEPivWDOuwyARZpwm4HTrmPDf/Mbg0Kka2hjpE9gnOYe0IPU4iTT5/CumdrxpgJkR98I30OTA3CJgS0/MI/xxs1ycEp3cOirTcF6GomDC/7Xm8VDe+mX/jxn1DuEpIiqga6Ukwu+/WdT+9+dwarofnH70A30/Znfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715257226; c=relaxed/simple;
	bh=h3t85u57Kt6KbmQLMuFWHWJfsb393pB2tMS6O7Z9wvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfMB/nlsnwuvctMrqNgmg/voYbfn4MSiG+86Is8/q3dsJjGERVD8xLGhuI0nMvLEFW4Ad3nm633UI8QelAsdjVZ5AzFcOB6J0qoGEwVPeMPYaGtchcd8iMPQSZwuXWxJSkAXZbtf29iEIqtpbwE5Ux4JWm6o4chIQfUGewCGzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOw4Qrg0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B836C116B1;
	Thu,  9 May 2024 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715257226;
	bh=h3t85u57Kt6KbmQLMuFWHWJfsb393pB2tMS6O7Z9wvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOw4Qrg0aNgq0oMW7VJ0fFngyxp1MXdaeU/9D+WUoZIYuKgDpjrRlj65e3/q/Nt4n
	 idN8MagmO1eHsVaVHAoeJsrmW0l8QfJXJJP4c4/n0k76ZBcIyJvi9yn5CFVx/PIN9J
	 0wQHsrVzXHA14ua9Q28S2yUKNWAfHFOyo0KrklxoURlbVW9IKxHplost4PXb7jzoV0
	 4xpa0wmyT6ctPpRuZilSZWxxb2TglsDf1M8HgwgQwQNJ54yb5E+080bdpxW58FvcPg
	 bZOYcui7rSUfjaCHKAGPJCBUzLsR6l/BgGxmMndrV8eG+l4kHWmyR1fu5p0S5e03Ub
	 QM7iOudQiY3lA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s52lC-000000004oO-0DEd;
	Thu, 09 May 2024 14:20:30 +0200
Date: Thu, 9 May 2024 14:20:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <Zjy_jp2f-aY5mAR6@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>
 <Zjy8Zj_naFQ2Ri0M@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjy8Zj_naFQ2Ri0M@surfacebook.localdomain>

On Thu, May 09, 2024 at 03:07:02PM +0300, Andy Shevchenko wrote:
> Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd kirjoitti:
> > Quoting Johan Hovold (2024-05-06 08:08:29)
> 
> ...
> 
> > > +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||
> > 
> > This should be an && not || right?
> 
> > > +                               (ARRAY_SIZE(nldo_ranges) != 1));
> 
> In any case BUILD_BUG_ON() is not encouraged for such cases, it would be much
> better to have a static_assert() near to one of those arrays.

I think the reason it is placed here is that the above line reads:

	rdesc->n_linear_ranges = 1;

and that would need to change if anyone expands the arrays.

Johan


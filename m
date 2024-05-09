Return-Path: <linux-gpio+bounces-6281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD68C1046
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 15:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F65E1C22A4C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 13:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA331527B5;
	Thu,  9 May 2024 13:24:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6D813173B
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715261087; cv=none; b=mPY3t96XTIs5gE6qZaaALZ1v0SH8t5OMj9Et1HJzBaMEBI8HDQJwiiy3G27JcP8TAi9J7MkZpqjNjjUO9SI110RKE+xPaXqtEua9dzvSQ5Xo41TJZaeGDdby513ybKoNZHRHz4FTyf4oa0d381ZWvdzsUUb2jIV836Ygq7LcAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715261087; c=relaxed/simple;
	bh=6USuKq62doKHphgqcLAIG53oZFLpJicWipnC4Iu7nI4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc/zo5NdxHN10EgH+aaTkWEMCq9nRygP8cjXyPuRP+DVrGYj5fuy2xUCXVDxEmU+IuamURpW27HhyiUZPutMlOZSFJ2n0mzhZO/er1VplPS+XTSqkgPdSCXXcGs10PWZR0DSjRRE8XGB+ymZI28j3EDQy/0Bt9+CynK7YqOW9lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 7f04bc40-0e07-11ef-b972-005056bdfda7;
	Thu, 09 May 2024 16:24:43 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 16:24:42 +0300
To: Johan Hovold <johan@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
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
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZjzOmgdM_lkOPlXK@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
 <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
 <ZjyO7uu6HKFYny9d@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjyO7uu6HKFYny9d@hovoldconsulting.com>

Thu, May 09, 2024 at 10:53:02AM +0200, Johan Hovold kirjoitti:
> On Tue, May 07, 2024 at 08:22:34PM +0300, Andy Shevchenko wrote:
> > On Tue, May 7, 2024 at 6:44 PM Johan Hovold <johan@kernel.org> wrote:
> > > On Mon, May 06, 2024 at 10:09:50PM +0300, Andy Shevchenko wrote:
> > > > Mon, May 06, 2024 at 05:08:29PM +0200, Johan Hovold kirjoitti:

...

> > > >                       return dev_err_probe(...);
> > >
> > > Nah, regmap won't trigger a probe deferral.
> > 
> > And it doesn't matter. What we gain with dev_err_probe() is:
> > - special handling of deferred probe
> > - unified format of messages in ->probe() stage
> > 
> > The second one is encouraged.
> 
> I don't care about your personal preferences.

Did I say it's mine personal preference.
Or should I put it as preference of several (majority?) maintainers?

Whatever, it's up to Lee.

-- 
With Best Regards,
Andy Shevchenko




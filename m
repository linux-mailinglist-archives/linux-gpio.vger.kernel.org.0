Return-Path: <linux-gpio+bounces-6282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A08C1053
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 15:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3B52816AA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 13:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12AD158A2C;
	Thu,  9 May 2024 13:26:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AADD1272A8
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715261167; cv=none; b=OnoPZPi2g+GrGz/gJWSjIkoy3H7iDmWZ4ls5RZ2DlB69HBD2rGr04oT6DEfJ1wo9wiQ0TE3Fp8kDczBGmrpxjhIjK5556hRNZ5aFqiXoeYYFuTk1Mppk33GtsUjSkemBQb8z7xkQcrinZw7y1dE/IpvkRay464f7kjFwLP08/i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715261167; c=relaxed/simple;
	bh=D8LYzUgF3hHRALNDAuNfy+B9rBZtLYSpGxhdvjLQAyc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+h03gM/ogmKaRaabmIDDHHSNOd3RvQ6Xkl3lfzGcdv0xuypsD6SciOMDMcH6q++haJBs3zJ1Nr3Xsv4P4vnmvl8R8UyFLHzQx65Cuq8rp55hguG6rk/Kd3DMq6DbICTdkDyTgZ/61vVSCDw4QdATljDIqT3e0UHXogTHNBcPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id aeaeacf0-0e07-11ef-b3cf-005056bd6ce9;
	Thu, 09 May 2024 16:26:03 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 16:26:02 +0300
To: Johan Hovold <johan@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
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
Subject: Re: [PATCH 02/13] mfd: pm8008: fix regmap irq chip initialisation
Message-ID: <ZjzO6qB9_oExklaV@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-3-johan+linaro@kernel.org>
 <ZjknxSsyo20b5_Tm@surfacebook.localdomain>
 <ZjpCL_NQD7X3hasO@hovoldconsulting.com>
 <CAHp75Vf0raEoVmvRKNxDQ7wdAOtwWYp_fQ1m8WBdnWEFGFOrYA@mail.gmail.com>
 <ZjyOGNAaWjRtOE0s@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjyOGNAaWjRtOE0s@hovoldconsulting.com>

Thu, May 09, 2024 at 10:49:28AM +0200, Johan Hovold kirjoitti:
> On Tue, May 07, 2024 at 08:16:45PM +0300, Andy Shevchenko wrote:
> > On Tue, May 7, 2024 at 6:01 PM Johan Hovold <johan@kernel.org> wrote:
> > > On Mon, May 06, 2024 at 09:56:05PM +0300, Andy Shevchenko wrote:
> > > > Mon, May 06, 2024 at 05:08:19PM +0200, Johan Hovold kirjoitti:
> > > > > The regmap irq array is potentially shared between multiple PMICs and

...

> > > > > -                   dev_err(dev, "Failed to probe irq periphs: %d\n", rc);
> > > > > +                   dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> > > >
> > > > dev_err_probe(...); ?
> > >
> > > This function won't return -EPROBE_DEFER,
> > 
> > This is not an argument for a long time (since documentation of
> > dev_err_probe() had been amended to encourage its use for any error
> > cases in probe).
> 
> There was apparently a kernel doc update made in December 2023:
> 
> 	532888a59505 ("driver core: Better advertise dev_err_probe()")
> 
> to clarify that people are *allowed* to use it also for functions not
> returning -EPROBE_DEFER. That's hardly a long time ago and, importantly,
> this is of course still nothing that is *required*.

Fair enough.

> > > and that would be a separate
> > > change in any case.
> > 
> > Sure, but why to add a technical debt? Perhaps a precursor cleanup patch?
> 
> This is not in any way technical debt.

OK.

-- 
With Best Regards,
Andy Shevchenko




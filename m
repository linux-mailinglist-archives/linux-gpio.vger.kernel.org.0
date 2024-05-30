Return-Path: <linux-gpio+bounces-6911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B15FB8D478F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E28261C20EB4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70A96F316;
	Thu, 30 May 2024 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrDPeC2x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB76F301;
	Thu, 30 May 2024 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059388; cv=none; b=VcVybITCTwQgDal5FhlCFXx3rguDG3Pq3KIMziBMArBd94PyjXXbFzw2SKkT0wgMMwZUWLYWOKKAZH+e8Q/3nrJbeAvrszJZWFkgjxHoZOC/GaTWsoQ14EkVf0rYQvkasn4q/m22s839HFLd1VEROKIX5CfCg7FtXAenOnNBPfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059388; c=relaxed/simple;
	bh=fum/BPvWuDHoboZhfPtwEwo9cUCkLkyCgJcO+Gf/NjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwi6T4Jb12nZ0Xrz8CyaasEanfmkrQLXYPMuPs6hrDzjpYHbPFcw62KSgu9cruCv4AJjogdbqmfiZqG8c5+KfzLTZFD0FLye65RRhWY/xZKzj/wF5WsdwKki151BUb/bskXIY8B5E6Tiiz4zzMo7wAPdfTKIj+TevZtPsinLkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrDPeC2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5B2C32786;
	Thu, 30 May 2024 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717059388;
	bh=fum/BPvWuDHoboZhfPtwEwo9cUCkLkyCgJcO+Gf/NjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrDPeC2xAruMf0dsLELM9FoeYWMHVJCNCBGH8lb4co9Con9cFEHZl3zEt26HxOX8T
	 wv5V3SUq47QQghlMVGMwD8CnghcgGDPdi4zmEr9c8WuXg+Lln3jXBRoQipd/aGL8ZP
	 eJoNUKhq1dJZIPdSRcI3plFu8KT/4nF7XHpDS6lgqYAfmARlrH7Eic/3Bwb4nq5PPE
	 y5vEzRHuvWd49tf3Qhq7Qv68aDHDVq8RIXizIQqPSxm0Q0oXvE2VZSIih4F0VgfgCB
	 MU5L1amHuAmAPgNUsKyEi88dsPNotrHJwnerM5k+0fwZy6TOXzgQzXdI4xW6fMZ1eA
	 gafO4//xKUfIg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCbaG-000000004kF-0kIr;
	Thu, 30 May 2024 10:56:28 +0200
Date: Thu, 30 May 2024 10:56:28 +0200
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
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 13/14] regulator: add pm8008 pmic regulator driver
Message-ID: <Zlg_PP3PomxYGJ8A@hovoldconsulting.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-14-johan+linaro@kernel.org>
 <CAHp75VcC5t1FynFeHGd+57=AeXKE8u0uduzOfozsG3MEzCPpDQ@mail.gmail.com>
 <Zlg1bGOs3V3TkHck@hovoldconsulting.com>
 <CAHp75VeiVSxJwjxXyNueinudOfj-WHZEUg32VBTW4PfCfB9Q+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeiVSxJwjxXyNueinudOfj-WHZEUg32VBTW4PfCfB9Q+g@mail.gmail.com>

On Thu, May 30, 2024 at 11:46:12AM +0300, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 11:14 AM Johan Hovold <johan@kernel.org> wrote:
> > On Wed, May 29, 2024 at 11:02:57PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 29, 2024 at 7:30 PM Johan Hovold <johan+linaro@kernel.org> wrote:
> 
> ...
> 
> > > > +#include <linux/array_size.h>
> > > > +#include <linux/bits.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/math.h>
> > > > +#include <linux/module.h>
> > >
> > > > +#include <linux/of.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/regulator/driver.h>
> > >
> > > + types.h
> >
> > This one is already pulled in indirectly and I'm not going to respin for
> > this.
> >
> > > + asm/byteorder.h
> >
> > Already explicitly included in the code you left out.
> 
> Is there any guarantee it will be like this? I don't think so. That's
> why there is an IWYU principle to give more flexibility of reshuffling
> the (core) headers. And I believe you know that we have way too far
> dependency hell in the headers in the kernel. Have you seen what Ingo
> tried to do and what the potential achievements are?

The driver is using cpu_to_le16() from asm/byteorder.h so the __le16
type definition will be pulled in.

> 
> ...
> 
> > > > +               rdev = devm_regulator_register(dev, desc, &config);
> > > > +               if (IS_ERR(rdev)) {
> > > > +                       ret = PTR_ERR(rdev);
> > > > +                       dev_err(dev, "failed to register regulator %s: %d\n",
> > > > +                                       desc->name, ret);
> > > > +                       return ret;
> > >
> > > It's possible to use
> > >
> > >   return dev_err_probe(...);
> > >
> > > even for non-probe functions.
> 
> (this should be "non-probe deferred functions")
> 
> > This is a probe function(), but as I've told you repeatedly I'm not
> > going to use dev_err_probe() here.
> 
> Yeah, I got it, some developers are leaving in the previous decades to
> make code very verbose for no benefit, no problem.

And some developers write unreadable code just to save a few lines of
code. I prefer clarity.

Johan


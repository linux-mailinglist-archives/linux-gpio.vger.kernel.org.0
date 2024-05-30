Return-Path: <linux-gpio+bounces-6910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5838D4782
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1162A2847AC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB2B6F30A;
	Thu, 30 May 2024 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJdjKfxu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEA81761BF;
	Thu, 30 May 2024 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059088; cv=none; b=pM5pOmuI0jY9qJcL0o8kCPy13fOTOHrByS+FoyL1ltgVKs56ppZafWodf9AMI7WfB/czVPz4VGVY3CvHMwIXF5To3mz9BGgmtN2rtVr4oOMBi1WwK/giYDa+exLe7aUWAxk1oZNoSWRonZxMDIuV7lZ+mNVRTQ/sOvN2oyKJaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059088; c=relaxed/simple;
	bh=12lD408jDSRLnkwKIW9yHUd+rx1knohzy66UIp2Jx8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD3MFwK1RkS6KN6wbFjg0yhW/BgjZg/ecoIZEaXYn0nZhIW3vFP4zDHwVoMF/Qfc+RaL6iCiWKD6DeB12QSNxu6b/50LLrdNN94TGmjus65tej17MdfhYguXiUGXKmdRVazBxX9fSDizLrmlRX9rMXfVTzvuCI1jpCh6bfPcqtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJdjKfxu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F18C2BBFC;
	Thu, 30 May 2024 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717059088;
	bh=12lD408jDSRLnkwKIW9yHUd+rx1knohzy66UIp2Jx8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJdjKfxu8S49zrrbS8zrKI3n+RFs0HhC2z+kEIfl1woQ8vqzCl52oHIKHIh+aTEt3
	 bmsvFlq7lvLJCdt9SYyECsLXZ+s3W67FLjY3L0n08O+vzNbZct9vQEnV6XYD/lVrtt
	 LCWzq1hFjXCyhN5ilyruZzp2ZDqFTUYfbOqfBfLRmKD9WCfjBijHdaD9dTq6qWiVpm
	 /Ykf4etC7QbQZS4lIBKwbV9mHATzNcN74L8bMZ/lmZ6e61T9dnv1a0sE2pOav0eaQu
	 /fXV1j7ZcDzPbKIHZLRUlQiPxGcONkVRlp+5qdtH83OHuXDXCG65I8eow0keU4z6m/
	 QWaOdL6k8ykbA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCbVP-000000004g3-2xc6;
	Thu, 30 May 2024 10:51:28 +0200
Date: Thu, 30 May 2024 10:51:27 +0200
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
Subject: Re: [PATCH v2 03/14] mfd: pm8008: deassert reset on probe
Message-ID: <Zlg-D5yfrafbUei1@hovoldconsulting.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-4-johan+linaro@kernel.org>
 <CAHp75VdnTQJFfqOdxC99gWckxebdUr4hV0wp3ZTs1Pey7q_fsA@mail.gmail.com>
 <Zlgz3nDjfRO5LYnY@hovoldconsulting.com>
 <CAHp75VewzRUiKQvQ9D9HWPOo6Yfqtv+AV+AVTPQO=foRzMoegw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VewzRUiKQvQ9D9HWPOo6Yfqtv+AV+AVTPQO=foRzMoegw@mail.gmail.com>

On Thu, May 30, 2024 at 11:34:55AM +0300, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 11:08 AM Johan Hovold <johan@kernel.org> wrote:
> > On Wed, May 29, 2024 at 10:45:40PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 29, 2024 at 7:30 PM Johan Hovold <johan+linaro@kernel.org> wrote:
> > > >
> > > > Request and deassert any (optional) reset gpio during probe in case it
> > > > has been left asserted by the boot firmware.
> > > >
> > > > Note the reset line is not asserted to avoid reverting to the default
> > > > I2C address in case the firmware has configured an alternate address.
> 
> ...
> 
> > > > +       /*
> > > > +        * The PMIC does not appear to require a post-reset delay, but wait
> > > > +        * for a millisecond for now anyway.
> > > > +        */
> > >
> > > > +       usleep_range(1000, 2000);
> > >
> > > fsleep() ?
> >
> > No, I'd only use fsleep() when the argument is variable.
> 
> Okay, this is basically the same issue as with use of dev_err_probe()
> with known errors. fsleep() hides the choice between let's say
> msleep() / usleep_range() / udelay() from the caller. This, in
> particular, might allow shifting constraints if the timer core is
> changed or becomes more granular. It's independent to the variable or
> constant parameter(s). Whatever, I'm not going to insist.

I prefer that developers are aware of what they are doing and understand
the difference between, say, usleep_range() and udelay(), instead of
hiding things away in obscure helper functions.

Johan


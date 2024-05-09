Return-Path: <linux-gpio+bounces-6266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D80518C0CCC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 10:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70C2E1F222A3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 08:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474E414A087;
	Thu,  9 May 2024 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMGiwF+Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E80128396;
	Thu,  9 May 2024 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715244565; cv=none; b=UitPKQ0PfuKTLmBnVqooPIJPf3mL65rjxYhT6V7jgFo9P7Lrf6prbRtDaHfj1fJ9U+GahthirmGr6APb0bDzrYckR8G62QlJPdNwYS2MjrhJq7euHnNDLyZ+bwBbSRrYoBvbUkh1vOyf3PpjXlwHDHP4bHvTREEXPeP3uceiwvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715244565; c=relaxed/simple;
	bh=+VvcGiY2uFZX5aI1UZuE6DJBPKfYza5f+UNOutxHHjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW5eS5skb5NmEPmPsm8BERCHWJro8ln6GMT54euzJBzklhPzBXbr8UclTPHo3b6FFvrMxbDZOAus7mAnFGXNsHCQFc/FSzUKuUsMY9MYTRouW3LbR2UFtZm6KxAzm0Ky8KfzlmbCoDAOmLYKObgbRh8WsCJPoyP27cQfO6gdCUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMGiwF+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABEFC116B1;
	Thu,  9 May 2024 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715244564;
	bh=+VvcGiY2uFZX5aI1UZuE6DJBPKfYza5f+UNOutxHHjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMGiwF+QRQHtuA13zW1mIDSkX5pF5ccv2+xViTdAaIGxh6llCSgybZ4FJpEtqcURi
	 59biNfeZbPHVTGmi+INT9/aB1YWUWusFxhuoYqOvSRgWqjoFxiF0XoISd6DVv32hpX
	 e/R5vZ1KDpu7uMNZd2qXzNwqr8X0qBo+8BlKx97pGsfPBrgeCtypnWZ+30ZZXUJHkz
	 o0fsWrA+2T7+T11Cp+WRPgACPzc1KZuWo7XIHP8uovdo1XSfMwetTnDNnVedaxfPgz
	 Iq2STjs5u7oIYGO+ePl26VicGbbeLYAGrfdmNvDhaF2rcZfqQMss1gD62Ux0lcz00W
	 kdljiclqTfotw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4zSy-000000000NM-0rIA;
	Thu, 09 May 2024 10:49:28 +0200
Date: Thu, 9 May 2024 10:49:28 +0200
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
Subject: Re: [PATCH 02/13] mfd: pm8008: fix regmap irq chip initialisation
Message-ID: <ZjyOGNAaWjRtOE0s@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-3-johan+linaro@kernel.org>
 <ZjknxSsyo20b5_Tm@surfacebook.localdomain>
 <ZjpCL_NQD7X3hasO@hovoldconsulting.com>
 <CAHp75Vf0raEoVmvRKNxDQ7wdAOtwWYp_fQ1m8WBdnWEFGFOrYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf0raEoVmvRKNxDQ7wdAOtwWYp_fQ1m8WBdnWEFGFOrYA@mail.gmail.com>

On Tue, May 07, 2024 at 08:16:45PM +0300, Andy Shevchenko wrote:
> On Tue, May 7, 2024 at 6:01 PM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, May 06, 2024 at 09:56:05PM +0300, Andy Shevchenko wrote:
> > > Mon, May 06, 2024 at 05:08:19PM +0200, Johan Hovold kirjoitti:
> > > > The regmap irq array is potentially shared between multiple PMICs and
> 
> ...
> 
> > > > -                   dev_err(dev, "Failed to probe irq periphs: %d\n", rc);
> > > > +                   dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> > >
> > > dev_err_probe(...); ?
> >
> > This function won't return -EPROBE_DEFER,
> 
> This is not an argument for a long time (since documentation of
> dev_err_probe() had been amended to encourage its use for any error
> cases in probe).

There was apparently a kernel doc update made in December 2023:

	532888a59505 ("driver core: Better advertise dev_err_probe()")

to clarify that people are *allowed* to use it also for functions not
returning -EPROBE_DEFER. That's hardly a long time ago and, importantly,
this is of course still nothing that is *required*.

> > and that would be a separate
> > change in any case.
> 
> Sure, but why to add a technical debt? Perhaps a precursor cleanup patch?

This is not in any way technical debt.

Johan


Return-Path: <linux-gpio+bounces-6903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4F8D46BD
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED7F11F22A73
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC97914884F;
	Thu, 30 May 2024 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5dDGIVS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A7D147C71;
	Thu, 30 May 2024 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056555; cv=none; b=gkLPWakPl8zrYRSsskLN8koiYs4iYMzyhKinfkS7jgAznWCJnTS46Q5rRzJnpp/Ryugqpf/gwfNmAjuRHZXF75YqhZlRlhfjJDSVTkZrip5uUOjs+RFQ6RUMSNDLrPlSCbthbzL9meyf/012rbKfN692evM3nF8DdYUEisaF/4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056555; c=relaxed/simple;
	bh=hKn7oFMCnOZVKPyympTibzQkvUmq/EUgiG5cwPu4Avc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyYfSJU7Xt29vBUfEE54Pxm5ud9vwIyV1QBbpA444waaDAg9KjQOjQi2ndEdzbN+GYuK0XETPHnElnHq4jvjvOV85K+7MQ70GqMYxNnC/Xn3OThSL1c/m2LFlz4iFdukvX1apsG8tj6qwkJXh4cZqTgStLHnmOpctjQlwVT+//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5dDGIVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8E2C2BBFC;
	Thu, 30 May 2024 08:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717056555;
	bh=hKn7oFMCnOZVKPyympTibzQkvUmq/EUgiG5cwPu4Avc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5dDGIVSsyafnDcC1uJFPdZbdKM5Hw9oPJSfySKJ4D/FNIQUzL4RydD+vGp+xRMgP
	 sQVsKY1BVJjQ4j3mbUc4MDCvrF+J5C+xXHgMpgbamhxByzUqsup6yHkyg3aAqTIh/P
	 njSCf/r0oNxMGo6V9Bq79HGUammLhszPTvUaVSDXkU7uuCo+kGs1/cL6PupwdaMoRI
	 lOa+bmzZ7bD6h/OOdKFp3t6etPn9M5jkvupGrFj88IpnhXsNtI8By1gGh9XLNVJYTL
	 BJyFNhbioB1h7GW8eTA+nOlGGMJ8X6MKDyOXiz90h3QI6zTYKxbcp4GzyIXEQS9uL1
	 fkQvhh+sS2Bgg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCaqY-0000000042S-3YHu;
	Thu, 30 May 2024 10:09:14 +0200
Date: Thu, 30 May 2024 10:09:14 +0200
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
Subject: Re: [PATCH v2 12/14] mfd: pm8008: rework driver
Message-ID: <Zlg0Kn8gI1zKhPct@hovoldconsulting.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-13-johan+linaro@kernel.org>
 <CAHp75Vcww07EkUDVSMSd+RviQ9_uku=w4pkCWUt8iGTW580eXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vcww07EkUDVSMSd+RviQ9_uku=w4pkCWUt8iGTW580eXg@mail.gmail.com>

On Wed, May 29, 2024 at 10:53:09PM +0300, Andy Shevchenko wrote:
> On Wed, May 29, 2024 at 7:30 PM Johan Hovold <johan+linaro@kernel.org> wrote:

> > +       ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> >                                 IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> > +       if (ret) {
> > +               dev_err(dev, "failed to add IRQ chip: %d\n", ret);
> > +               return ret;
> >         }
> 
> I believe there is no harm to use
> 
>   return dev_err_probe(...);
> 
> for these. But it seems you don't like that API. Whatever, no-one will
> die, just additional work for the future :-)

Correct. And there's no additional work for the future here either.

Johan


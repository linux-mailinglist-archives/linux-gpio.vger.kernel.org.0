Return-Path: <linux-gpio+bounces-6902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E18D46AF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4495C1C2106E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24F9146A9E;
	Thu, 30 May 2024 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVZjzg/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC3176AD2;
	Thu, 30 May 2024 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056480; cv=none; b=d0Ib0/BE9YpLb7oEniJMgkxFTmbHMzAZx8oNB/ySCV6wf5xaArubd7k3Y1FNjHKNwUk8clj7LpoImKZx0EEZL1gZhS20NI/h3BMEcNuyqImcjo6jcgsTp5GSEo9i9344hj15kQ47ykwBcVC1AlOXAesadqAyvn9tpEwD+0nv4SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056480; c=relaxed/simple;
	bh=w3n/45oEbfFxqAimcpQO8TVqfQH0H9GcJTD+Mjl8Uws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3i24oARTvVji0EYkVfeBegea1fPx2sXqebE4NoJqIbpYLvL378ufqy/EZjprD5BOPA7M+Jf6uc/YJWMg5j3N/fQ88cHTGKwP5rNJecH9Q2HqK/6AkAmZ74m2UGcnF13WugnHs459aWTlK0wZkfUUvp4nmP9Ksd7U+3pWsh/iWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVZjzg/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCF6C2BBFC;
	Thu, 30 May 2024 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717056480;
	bh=w3n/45oEbfFxqAimcpQO8TVqfQH0H9GcJTD+Mjl8Uws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVZjzg/BAZiQfiiRbD6Qnn+nr/J4kHDWwHOuGGXaQ7T0c2FqPKxSm8/+MOVVZ2Rl4
	 h3rGiyv/30nVz38en6eL9wOF2Y7r81592fYEEP+VYzdgMA34WO5vquzfFUJdBDRJPN
	 nc/wB6n9uW2gRyCiu+Z3t5xa3e2zssCiXEJy/KkaVxsH4XcTdkvMQF9/9uY8R6UxEp
	 wiJph6hi9dTWGhqPFxfn1uQ0G2MCh+CEw14P1vdZ/RcQz+WLexI0jAZzJM8rnQjMnu
	 mcra1kbWhcbWxe9KVipWDqYbBKtZKXKWbeFOq8jIW6EL+ieg1B7eIEptH4/VGU6k8g
	 Etj13hWw9nkqA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCapK-0000000041N-3p0D;
	Thu, 30 May 2024 10:07:59 +0200
Date: Thu, 30 May 2024 10:07:58 +0200
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
Message-ID: <Zlgz3nDjfRO5LYnY@hovoldconsulting.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-4-johan+linaro@kernel.org>
 <CAHp75VdnTQJFfqOdxC99gWckxebdUr4hV0wp3ZTs1Pey7q_fsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdnTQJFfqOdxC99gWckxebdUr4hV0wp3ZTs1Pey7q_fsA@mail.gmail.com>

On Wed, May 29, 2024 at 10:45:40PM +0300, Andy Shevchenko wrote:
> On Wed, May 29, 2024 at 7:30 PM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > Request and deassert any (optional) reset gpio during probe in case it
> > has been left asserted by the boot firmware.
> >
> > Note the reset line is not asserted to avoid reverting to the default
> > I2C address in case the firmware has configured an alternate address.
> 
> ...
> 
> > +       /*
> > +        * The PMIC does not appear to require a post-reset delay, but wait
> > +        * for a millisecond for now anyway.
> > +        */
> 
> > +       usleep_range(1000, 2000);
> 
> fsleep() ?

No, I'd only use fsleep() when the argument is variable.

Johan


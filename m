Return-Path: <linux-gpio+bounces-6267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466E8C0CE6
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 10:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FAD028277D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 08:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1363014A0A9;
	Thu,  9 May 2024 08:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASAaYWBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F7913D289;
	Thu,  9 May 2024 08:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715244778; cv=none; b=csuJm5Jfp6IRNXw8pSdZQMcC5+/TZli6++mme8aN+obDdTRA9pQPqxkbukOAI9DEwqMI1oZF6+JOOCWlR8ZblVY++97yKQwEhuHW8t2XA9ADkYt5eII45spesCPT7gE7rXPnB9Fa198/zwRpHegGezJC/yDMyK/cbFoSOfEzO8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715244778; c=relaxed/simple;
	bh=juspyWQDTCZdu0kbwUFZjaI2NP83vlBOJo13pP24/HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMyU7Ys6u7Yc4bgX1cef6QMSeOK/opDfQ4T3cpwdO9691LGg6c5i1Jv5NRLL3iAB39pDcapPpKnXsxh0zDvocbB+UGoAveRWD/wgwpb5GEELPh1uLJCOTCQnkt6Tvci5Ax94h13eBXNHofPSawl/oXluPr6lN0+2XnXBU/vbqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASAaYWBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39286C116B1;
	Thu,  9 May 2024 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715244778;
	bh=juspyWQDTCZdu0kbwUFZjaI2NP83vlBOJo13pP24/HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASAaYWBjtmdcC5lbjF9kSzdupVpoBFM42zhqRa7R0g8LbyY9Fqbn5iDeFLYyNz+2g
	 QNqMRla8iM+Xl5EfaY6AQsreE6ikaQgpJ4SfOczXB9+GDNNfIdNo2jL9us62Kk+1Av
	 eqmGgYKP+x0NZcUE3yWWBpaLpp2ZrMcILlTkN6qpizFg0SR5nM9QdHJ/Tn7zl5a8fU
	 SbztAv+tHZJ9x9DAlSDJMkjGBSpyxbxBMs9FppVynorHV8lYOjjgSvS9fAg/u32hUp
	 yeBQ8lSJBIA/JGDa9VRFrNcUDX1GhbAQ2ZFwyyRqu17jvwBaUsYba/JhuV+qbpRJqE
	 RlMlxaZW/G4zw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4zWQ-000000000S4-22Eh;
	Thu, 09 May 2024 10:53:02 +0200
Date: Thu, 9 May 2024 10:53:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Message-ID: <ZjyO7uu6HKFYny9d@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
 <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>

On Tue, May 07, 2024 at 08:22:34PM +0300, Andy Shevchenko wrote:
> On Tue, May 7, 2024 at 6:44 PM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, May 06, 2024 at 10:09:50PM +0300, Andy Shevchenko wrote:
> > > Mon, May 06, 2024 at 05:08:29PM +0200, Johan Hovold kirjoitti:

> > > > [ johan: rework probe to match new binding, amend commit message and
> > > >          Kconfig entry]
> > >
> > > Wouldn't be better on one line?
> >
> > Now you're really nit picking. ;) I think I prefer to stay within 72
> > columns.
> 
> Not really. The tag block is special and the format is rather one
> entry per line. This might break some scriptings.

This is not a tag, and using line breaks here is perfectly fine.

> > >                       return dev_err_probe(...);
> >
> > Nah, regmap won't trigger a probe deferral.
> 
> And it doesn't matter. What we gain with dev_err_probe() is:
> - special handling of deferred probe
> - unified format of messages in ->probe() stage
> 
> The second one is encouraged.

I don't care about your personal preferences.

Johan


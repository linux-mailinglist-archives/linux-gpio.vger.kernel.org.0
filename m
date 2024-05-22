Return-Path: <linux-gpio+bounces-6551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C736E8CBC8A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 10:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA4641C21C27
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 08:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6287E56B;
	Wed, 22 May 2024 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrqtgxHH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2779182DB;
	Wed, 22 May 2024 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716364831; cv=none; b=REXW1qs/mM0XltAZU00+q2crMRaU6e4HliHC6O/hc7pVyFsO51FeS3IdjTYtA2os0EbE7SqI4UkPjjUzesjtFeocp9OEH63wJoULMhyAASJ5L384AjeB0j3dYkBKs5klVtxVqlgOMEV+6b25iZCTH5XVZBBQBc91C5CjYZUQwoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716364831; c=relaxed/simple;
	bh=k03dfXKacAQksrmP4DO5pxvFhcvSvUfVXIXzKKP1VCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSoyLtk/t3ggFtj4qehS0bj3PfhN6R84kAWAT8aBPzLYcTBW0Ua99iN/nCTZevp5Oe0Jjr2Y3z0xL4M+wqrRhPLP0j9pg0XrzjFNqof/zrzZHgUo9vbgnCvHnQDGsE5OZQMFJ5zVxiL7lUvNysKTJ9GE+NKW+FULD42qcgtd8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrqtgxHH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADC8C32781;
	Wed, 22 May 2024 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716364831;
	bh=k03dfXKacAQksrmP4DO5pxvFhcvSvUfVXIXzKKP1VCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrqtgxHHQ73jfB7ZtvLDnbb5gv1FpAQmvRfxfjthcoGCksvmVCrUoIeHItMSHtuxz
	 6kFHJhJqOFcqar2hutAA0fITAM3V0kM3YXVes4g9QC+n/hnMyiTGuVPos1NGVCiswt
	 9kl7cKXk5V1NpeQ+Eg5MUtE0FzsgOmybdopoJTrfAEj/mnABxEMIpsLQYdyeWQpXJv
	 me6/pzaRIG/3F2SUElz5lNnSjm31LiYQkuDEq8wDYzlILW8Y/V+K0IV0auW/C5Ivu0
	 FBnlQY8YW+ViIRqgcVYxPHO96fFaRbUZkva/Z+mY0FnT7zxBMTQjPMAlIp0n7WBPNI
	 abYZxxfY72DoA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s9gte-000000000fm-3hPm;
	Wed, 22 May 2024 10:00:27 +0200
Date: Wed, 22 May 2024 10:00:26 +0200
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
Subject: Re: [PATCH 11/13] mfd: pm8008: rework driver
Message-ID: <Zk2mGpseH3DFqCjK@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-12-johan+linaro@kernel.org>
 <ZjktIrsZS-T7cm-A@surfacebook.localdomain>
 <ZjyafGz_1pY4J9C7@hovoldconsulting.com>
 <CAHp75VfP2AB45mn6gB3suCAO9iT3bOWZ=7m9U7E087Lac0P3gg@mail.gmail.com>
 <Zk2VX5JRzmePxG4N@hovoldconsulting.com>
 <CAHp75Vcs3DvBK3P058gU6L-24Q9PTrPg_hLujxaUGHNB=JCW0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vcs3DvBK3P058gU6L-24Q9PTrPg_hLujxaUGHNB=JCW0A@mail.gmail.com>

On Wed, May 22, 2024 at 10:13:33AM +0300, Andy Shevchenko wrote:
> On Wed, May 22, 2024 at 9:49 AM Johan Hovold <johan@kernel.org> wrote:
> > On Fri, May 10, 2024 at 04:15:43PM +0300, Andy Shevchenko wrote:
> > > On Thu, May 9, 2024 at 12:42 PM Johan Hovold <johan@kernel.org> wrote:
> > > > On Mon, May 06, 2024 at 10:18:58PM +0300, Andy Shevchenko wrote:
> > > > > Mon, May 06, 2024 at 05:08:28PM +0200, Johan Hovold kirjoitti:

> > > > > > +static void devm_irq_domain_fwnode_release(void *res)
> > > > > > +{
> > > > >
> > > > > > +   struct fwnode_handle *fwnode = res;
> > > > >
> > > > > Unneeded line, can be
> > > > >
> > > > > static void devm_irq_domain_fwnode_release(void *fwnode)
> > > > >
> > > > > > +   irq_domain_free_fwnode(fwnode);
> > > > > > +}
> > > >
> > > > I think I prefer it this way for clarity and for type safety in the
> > > > unlikely even that the argument to irq_domain_free_fwnode() would ever
> > > > change.
> > >
> > > If it ever changes, the allocation part most likely would need an
> > > update and since devm_add_action() takes this type of function, I
> > > don't believe the argument would ever change from void * to something
> > > else. With this it just adds an additional burden on the conversion.
> >
> > I was referring to the irq_domain_free_fwnode() prototype.
> 
> And I also referred to that one. The release callback, i.e. the type
> of the parameter, is solely defined by a caller of devm_add_action()
> end friends, and in this case it means that if ever the type changes
> (this is your argument why you want to have explicit line for that,
> necessity of which I oppose) the devm_add_action() arguments also has
> to be changed, it can't be done _just_ there, in
> irq_domain_free_fwnode().

No, not necessarily, but as I already wrote above this is unlikely to
ever be of practical concern.

Johan


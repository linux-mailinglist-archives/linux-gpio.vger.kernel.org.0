Return-Path: <linux-gpio+bounces-6545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AF8CBB8C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 08:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B77F81F223EC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 06:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2505577F32;
	Wed, 22 May 2024 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhdaP4IG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9978770EA;
	Wed, 22 May 2024 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716360548; cv=none; b=FwLfydWvOkk+tx5jZXf1KauRol3JEsqC9rxepnXiSHYQ9dp0dbBAHZ89Uujy9kEoXZPIFztVfVhr0HpBROszewF16RPf0AmP/qhOvzD6M4+xbqwnT00iiTOZMTs+3uISoIhnrEAA7YR4scIcZMs2KujOafXG0Uc4t/y2OM1SVxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716360548; c=relaxed/simple;
	bh=CeMXYGdyxRFb87MLEU2wKkVTrxdM2DN0261kgTe8GyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7CsZMcrLabFjdpP4d3kzR/bU123PzR3S6MSsIiQErpw8Erg9F92vFJYHsXMGlnEWfFfveb+wyR2sCJgGK2Aq6R3ii8TFwn4Ix0DngA9a4tfZYGFpNnyDjm7SrKmmJYhCoCKuTcYiW0iQwxu2gbC+6atsIENZYNR6GHOr5x60pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhdaP4IG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8E9C2BD11;
	Wed, 22 May 2024 06:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716360548;
	bh=CeMXYGdyxRFb87MLEU2wKkVTrxdM2DN0261kgTe8GyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhdaP4IGKfpy9K9vnmhuIP+iDLoyVNynedwbbMol1RbN9E20GAhr28+L+FFIfKbUN
	 OsnSuuT4f3a2/aXNN/zLMn33P/S6yrd2zJIXaihCJ353zLMajd/RmybzEt7fUNnhcr
	 gKt11gv/llSJArVXURFq3nzcgZk6ipBNygRiaEsYpGhnVHdztDdWiOLJbw1Pfol+2P
	 Yyz2I4+E2lP8YgTOV7+MCRGJxNeOXBb0Jlvg6BFDs5H+j0GuuK5kgIHB6pLMC2ATjk
	 hY4pzHWRhZlI++YsPyebKYdojp306tmwkfZypEc/3QeKKlo40npn0I49y8Q1BuUX92
	 hol4ewdWNrZyg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s9fmZ-000000002vV-2Xji;
	Wed, 22 May 2024 08:49:04 +0200
Date: Wed, 22 May 2024 08:49:03 +0200
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
Message-ID: <Zk2VX5JRzmePxG4N@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-12-johan+linaro@kernel.org>
 <ZjktIrsZS-T7cm-A@surfacebook.localdomain>
 <ZjyafGz_1pY4J9C7@hovoldconsulting.com>
 <CAHp75VfP2AB45mn6gB3suCAO9iT3bOWZ=7m9U7E087Lac0P3gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfP2AB45mn6gB3suCAO9iT3bOWZ=7m9U7E087Lac0P3gg@mail.gmail.com>

On Fri, May 10, 2024 at 04:15:43PM +0300, Andy Shevchenko wrote:
> On Thu, May 9, 2024 at 12:42 PM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, May 06, 2024 at 10:18:58PM +0300, Andy Shevchenko wrote:
> > > Mon, May 06, 2024 at 05:08:28PM +0200, Johan Hovold kirjoitti:

> > > > +static void devm_irq_domain_fwnode_release(void *res)
> > > > +{
> > >
> > > > +   struct fwnode_handle *fwnode = res;
> > >
> > > Unneeded line, can be
> > >
> > > static void devm_irq_domain_fwnode_release(void *fwnode)
> > >
> > > > +   irq_domain_free_fwnode(fwnode);
> > > > +}
> >
> > I think I prefer it this way for clarity and for type safety in the
> > unlikely even that the argument to irq_domain_free_fwnode() would ever
> > change.
> 
> If it ever changes, the allocation part most likely would need an
> update and since devm_add_action() takes this type of function, I
> don't believe the argument would ever change from void * to something
> else. With this it just adds an additional burden on the conversion.

I was referring to the irq_domain_free_fwnode() prototype.
 
> > > > +   name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
> > >
> > > You are using fwnode for IRQ domain and IRQ domain core uses fwnode, why OF here?
> > >
> > >       name = devm_kasprintf(dev, GFP_KERNEL, "%pfw-internal", dev_fwnode(dev));
> >
> > This driver only support OF so why bother.
> 
> Sure, but it makes a bit of inconsistency.

No, I don't consider this an inconsistency. Again, *this* is an OF
driver, other subsystems need to deal with ACPI and use fwnode.

Johan


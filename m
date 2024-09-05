Return-Path: <linux-gpio+bounces-9851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BCC96DDBE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 17:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5323CB20837
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 15:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814EE7F7FC;
	Thu,  5 Sep 2024 15:18:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337BD10A3E;
	Thu,  5 Sep 2024 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549505; cv=none; b=Okm5ruPvdcDnE9GHJJCA6FDsCKjxKxtWX3CHttQgD1rS5Y2Ymy5pQlr3IPuEK+H0xmRhC+1JoO2JZExDPcYTAyySFJ0xxEUtXXHnPkrijGmIauMhGU42NYCuBNBn+F1jhi2XeUCISKhIcF+fEjRSivffXo3birGVWxBPCGUiY4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549505; c=relaxed/simple;
	bh=MUroUxd4gJRxbzaf3jIryAo3e9kcrEcakzHeV4kkfkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgZUVsKcdNqGJTt48H1CDLBsLLrNDIZIKHiONN5xdMEqM3Ej35okCZTZwOr3RsXnRO4AKK+YXxxC3i2459084HtMsnlzhlCQUxWdOkphBEwMN138C5nHY/FtKhMffnEYahljyX0is8qAK1cg77Fc2I+KW6yub7+mS3kXRLNgSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 043ED45735E9;
	Thu,  5 Sep 2024 11:18:16 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HgpPizzBmpHt; Thu,  5 Sep 2024 11:18:15 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 82AAA457328D;
	Thu,  5 Sep 2024 11:18:15 -0400 (EDT)
Date: Thu, 5 Sep 2024 11:18:14 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <ZtnLtgLRq68usPgf@freedom.csh.rit.edu>
References: <20240814191509.1577661-1-mstrodl@csh.rit.edu>
 <CACRpkdYyo9MD6zfiPde+3vSdpH96r+ZO12bdmMAfjw5PCNJ1BQ@mail.gmail.com>
 <ZtCBgWrdFI6h3zbo@freedom.csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtCBgWrdFI6h3zbo@freedom.csh.rit.edu>

Hey Linus,

On Thu, Aug 29, 2024 at 10:11:13AM -0400, Mary Strodl wrote:
> > > +       u8 gpio_outputs[2];          /* Output states for GPIOs [L, H] */
> > > +       u8 gpio_dir[2];              /* Directions for GPIOs [L, H] */
> > 
> > Caching states of lines is a bit regmap territory. Have you looked into
> > just using regmap?
> 
> Do you mean gpio_regmap or using regmap directly? I'm not sure that gpio_regmap
> will do what I want because I need to provide an irq_chip (and I don't see a way
> to "break the glass" and access the gpio_chip directly)

I realize you're busy, but wanted to make sure you saw this question in my previous
email. I've got a patch ready to go that addresses all your feedback except this point.
 
Thanks again for reviewing!

Mary Strodl


Return-Path: <linux-gpio+bounces-26791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C14BB73E6
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 16:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA01719E5915
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 14:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1643C280A4B;
	Fri,  3 Oct 2025 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="guByXMb1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CC2459CF;
	Fri,  3 Oct 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759503173; cv=none; b=NykVl950imRT5SwDbnsziLM2bBm5qWFYg/TMWg1V/7VOVzWAi7BtbT8sPPCzeIN4DZqGbVG7CrnNxFbSeyF3Ua+yCVRJo1/4xh104/AKNrGrHOM9ZEd4awj6odbXfXJFTBMAS7grdl9k1UT0f94locPgJAv+QoCn9cxHNzg8Cv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759503173; c=relaxed/simple;
	bh=dupjp7FP5qZchfQuTclqti1tGveoZD8rzbPZzo7EZgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+o8g+5lVTuzIjYcPYbXN8kGa2Ecfw73/YKJzleCNOqcXHCCRPFJulW0dHkYg55RJTryRirZ3XO73FQI4//IrT2NAFViAbR1Rb2NLxASu8t6/lU2kQfS35lzkVQwz7YJKtp4ZgAjyLmN9AgZ7Rm4ZbO2VzWW2SCLWmSlhKsPtHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=guByXMb1; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id B939340DFF4C;
	Fri,  3 Oct 2025 10:52:49 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1759503163; x=
	1761317564; bh=dupjp7FP5qZchfQuTclqti1tGveoZD8rzbPZzo7EZgc=; b=g
	uByXMb11Zz/cdckFDA+kIlCFak0s0ZgTaDu2W8mYgI3hO4jZruzk8BQ2M8NryN6S
	m/DjpfeG1GLSO6lyMc+fGAbtny1JVb47XaAt4MKKxrGLcgbf9rwyi7ksUsuLb3Dy
	BlesfDjssm2AfgDeuQrevsv/gcY/A0OAQOsi7m8fCs=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ovg1XnF8HcYM; Fri,  3 Oct 2025 10:52:43 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 459A545735E9;
	Fri,  3 Oct 2025 10:52:43 -0400 (EDT)
Date: Fri, 3 Oct 2025 10:52:42 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, tzungbi@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/4] gpio: mpsse: add quirk support
Message-ID: <aN_jOrYnPMWtoR8d@ada.csh.rit.edu>
References: <20251002181136.3546798-1-mstrodl@csh.rit.edu>
 <20251002181136.3546798-4-mstrodl@csh.rit.edu>
 <aN7hxUz7TGG38Hv_@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN7hxUz7TGG38Hv_@stanley.mountain>

Hey Dan,

On Thu, Oct 02, 2025 at 11:34:13PM +0300, Dan Carpenter wrote:
> On Thu, Oct 02, 2025 at 02:11:35PM -0400, Mary Strodl wrote:
> > * dir_in/out are bitmask of lines that can go in/out. 0 means
> >   compatible, 1 means incompatible. This is convenient, because it means
> >   if the struct is zeroed out, it supports all pins.
> 
> What?  No, please make 1 be supported and 0 be not supported.  This
> really weirded me out when I read the code.  If it were just 1 for
> true and 0 for false a lot of comments regarding dir_in/out could be
> removed because the code would be straight forward.
> 
> You can easily set everything to 1 by assigning -1 or using memset().
Okay. I was thinking leaving out the fields altogether would be most convenient.

> > +static int mpsse_ensure_supported(struct gpio_chip *chip,
> > +				  unsigned long *mask, int direction)
> 
> Just pass mask not a pointer to mask.  It would be different if
> you were going to allow more than 32 bits to be set, then we would
> need to pass a pointer and use set_bit() etc...
The reason is because of set/get_multiple. I can deref in there instead though.

> > +		dev_err(&priv->udev->dev,
> > +			"mpsse: GPIO %d doesn't support %s\n",
> > +			(int)find_first_bit(&unsupported, sizeof(unsupported) * 8),
> 
> Use %lu instead of %d and get rid of the unnecessary cast.
Good catch. This was a fix for m68k builds that I forgot to remove:
https://lore.kernel.org/linux-gpio/CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com/

Thanks for taking a look!


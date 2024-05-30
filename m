Return-Path: <linux-gpio+bounces-6932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10828D4882
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55B68B24D35
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B3C74076;
	Thu, 30 May 2024 09:30:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CA518399B
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717061416; cv=none; b=ORE8L8a2Oza2uIeoL6d0ULOvFXuCsE+PDnaBBqFBe7gwZVrPehEhMAE7wqK352wejMIfUrvgRmfJfw41EXYhQS8PJR4h68IXCVW9YY39XT8Lejz9DXOW2gDHmg7sWX7ZuFXFLB+ziHRRf/Zadqcb0GkQHXLhi1LBxHktpDGA1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717061416; c=relaxed/simple;
	bh=rU2sbGTi+ki3c8kGrs0qQzly72EhBp/+bupNnKrZrUs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQK8CXMDG9V0u+7KD0BW2UT+bFWjQ70pp12R7ikVZc/QA1bhXzhMvYUVnYQt6snEUtskWVr4as5qDVWMPVo/SbZ+1sAYCpJuUusW6hVFIjjM7nSa+qJH85dBFcTSv1qEYsIrZFLGE7830JrUupYQJkcyv9r4+7sjumU57Hubv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 36c95d36-1e67-11ef-aaf9-005056bdd08f;
	Thu, 30 May 2024 12:30:12 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 12:30:12 +0300
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to
 errnos
Message-ID: <ZlhHJHJOHKqoea_N@surfacebook.localdomain>
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
 <09f2f3ac-94a7-43d3-8c43-0d264a1d9c65@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09f2f3ac-94a7-43d3-8c43-0d264a1d9c65@moroto.mountain>

Mon, May 27, 2024 at 05:02:12PM +0300, Dan Carpenter kirjoitti:
> On Mon, May 27, 2024 at 04:23:44PM +0300, Ilpo Järvinen wrote:
> > diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> > index 6f3ded619c8b..3377667a28de 100644
> > --- a/drivers/gpio/gpio-amd8111.c
> > +++ b/drivers/gpio/gpio-amd8111.c
> > @@ -195,8 +195,10 @@ static int __init amd_gpio_init(void)
> >  
> >  found:
> >  	err = pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> > -	if (err)
> > +	if (err) {
> > +		err = pcibios_err_to_errno(err);
> 
> The patch is correct, but is the CC to stable necessary?  Is this a real
> concern?
> 
> Most callers don't check.  Linus Torvalds, once said something to the
> effect that if your PCI bus starts failing, there isn't anything the
> operating system can do, so checking is pointless.  The only fix is to
> buy new hardware.  There was a hotpluggable PCI back in the day but I
> don't think it exists any more.

Now we have a USB4 that can tunnel PCIe, I'm not sure no generation of it may
not fail with the errors that are listed as positive PCI bus specific codes.

And it's hotpluggable, of course.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-gpio+bounces-6585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A46478CCE1D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 10:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562DB1F22C72
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 08:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AAF13C9BD;
	Thu, 23 May 2024 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="LvVA6vHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52E113C9D4;
	Thu, 23 May 2024 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716452334; cv=none; b=Z9/M4+fo9KbrdODyIa+cy/5KtWq1QRKvVvASt6T0c15W1cE4GLEF5IFC3GRuzGZ+dJkwklChTLXGofc+wKjGZNUVo/yV3WKon3hQeugqDQOuX+VCvek9b3EQvj+Fos0ftg2eAH3mSrKscMBjaMBUoDor5ChAuA8vb8g8TKeklYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716452334; c=relaxed/simple;
	bh=w299kG8Edsg89u0v/aSQGcyYpudc+c7Glz3pREaxJJA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Texj+nVhCw9NGE2K6TZLmMi29YyEK/Cn0w2Nc/N/hB0YT8W1LKcp929tWj5pCsr5uDb7ifn/wtkjRy0Eny6WFX1mOMykygkCq0/C5+ti0PI+Z1gwKDEW9Zj9rwhqKs5axIkYhrT7QmncExMeZIB/gGiccfbx8YI5HbBaMvGEBDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=LvVA6vHm; arc=none smtp.client-ip=99.78.197.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1716452333; x=1747988333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUsYc9BwnOG4VzAcYCz2q9BycQd6fXIw6/Ld/KfdEdM=;
  b=LvVA6vHminxmHbj9rKkL5thqHIpXApNtXRTJWKD/ocK5wcDVYdqkPIki
   12sTr3vhCiBfFNZsSYZ4KUeJT0MLcAwYIVc/f1Mg4a1kakkYpYpgQW4En
   p4Z8cmNEovHZf5p/w95D882TDpnr8i6U6h46ijoL3JERhHYcbW0Y4e7jZ
   c=;
X-IronPort-AV: E=Sophos;i="6.08,182,1712620800"; 
   d="scan'208";a="298131678"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:18:50 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.17.79:24108]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.34.215:2525] with esmtp (Farcaster)
 id 59c5ae50-83a4-4f20-8725-5a34934fcc07; Thu, 23 May 2024 08:18:48 +0000 (UTC)
X-Farcaster-Flow-ID: 59c5ae50-83a4-4f20-8725-5a34934fcc07
Received: from EX19D002EUA004.ant.amazon.com (10.252.50.181) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 23 May 2024 08:18:44 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D002EUA004.ant.amazon.com (10.252.50.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 23 May 2024 08:18:44 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 23 May 2024 08:18:43
 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id 7689520D4C; Thu, 23 May 2024 08:18:43 +0000 (UTC)
Date: Thu, 23 May 2024 08:18:43 +0000
From: Hagar Hemdan <hagarhem@amazon.com>
To: Kent Gibson <warthog618@gmail.com>
CC: Norbert Manthey <nmanthey@amazon.de>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hagarhem@amazon.de>
Subject: Re: [PATCH v3] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240523081843.GA7085@amazon.com>
References: <20240517101227.12118-1-hagarhem@amazon.com>
 <20240517124911.GA435070@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240517124911.GA435070@rigel>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Fri, May 17, 2024 at 08:49:11PM +0800, Kent Gibson wrote:
> On Fri, May 17, 2024 at 10:12:27AM +0000, Hagar Hemdan wrote:
> > Userspace may trigger a speculative read of an address outside the gpio
> > descriptor array.
> > Users can do that by calling gpio_ioctl() with an offset out of range.
> > Offset is copied from user and then used as an array index to get
> > the gpio descriptor without sanitization in gpio_device_get_desc().
> >
> > This change ensures that the offset is sanitized by using
> > array_index_nospec() to mitigate any possibility of speculative
> > information leaks.
> >
> > This bug was discovered and resolved using Coverity Static Analysis
> > Security Testing (SAST) by Synopsys, Inc.
> >
> > Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> 
> I still don't think this Fixes commit is right, and that would impact
> where this gets backported to, but Bart can weigh in on that.
> 
> Cheers,
> Kent.
>
yes, this Fixes commit is wrong. Stable trees need another fix patch.
I will remove this Fixes commit in the next revision.

Thanks,
Hagar
> 
> > Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
> > ---
> > v3: update the commit mesg
> > ---
> >  drivers/gpio/gpiolib.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index fa50db0c3605..b58e4fe78cec 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/list.h>
> >  #include <linux/lockdep.h>
> >  #include <linux/module.h>
> > +#include <linux/nospec.h>
> >  #include <linux/of.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/seq_file.h>
> > @@ -201,7 +202,7 @@ gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
> >  	if (hwnum >= gdev->ngpio)
> >  		return ERR_PTR(-EINVAL);
> >
> > -	return &gdev->descs[hwnum];
> > +	return &gdev->descs[array_index_nospec(hwnum, gdev->ngpio)];
> >  }
> >  EXPORT_SYMBOL_GPL(gpio_device_get_desc);
> >
> > --
> > 2.40.1
> >


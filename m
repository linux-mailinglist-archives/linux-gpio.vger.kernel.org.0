Return-Path: <linux-gpio+bounces-6409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEF8C76F7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 14:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6AF1C21543
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 12:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2118146A81;
	Thu, 16 May 2024 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="RzV538HB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B871474BF;
	Thu, 16 May 2024 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715864276; cv=none; b=D04eK2Rya+OxXuKNAQSx7RgfX8yMwlztZv5w2y7K634MwuK6evp4HocuJCDh7/p6YX80Xfif0wKoJ3tycmjxz3LabLodMg7Koq0EP4ObW8teImVH6PgHyMf4trHCOEU9xOwko5x2rSOtUEjCoLJi8rQiP02hDeqONxjGxD9h7qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715864276; c=relaxed/simple;
	bh=D082drQ3+fR+yT4LdI08Rc37UV5rMeJR/aG7eX9MgDo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7lmO6NiVhETs6MV5RL2VCMfLzLTq2miIsaS9sy9aPygCu6TCVwjsvAG0JfQoCe10bRpIAwxqJU8mM8Y4SHr3qJ194KP6s3N2gHE5WPyGEB18nt+Pvdg5g2M/wn95Fn6xxqnyHAtVrOKISZnvbU24ENn9MSnizRsRokZhd6k/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=RzV538HB; arc=none smtp.client-ip=99.78.197.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715864275; x=1747400275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+Rqyg84e/++nESTIJoWcy14dhUm9sKb3isOo0+iOAjg=;
  b=RzV538HBA9uPwrtbycOUvtDlCz9zo8UxBMOlP13debyMKwi6wrA8/5Y5
   W5ubRtUBIIhKJ9DDL3EUpDVR8xbHmrCH4io9AnXjzpZt+wIOvcq0UWWVm
   f2sIvhplYgtLszUp27spbqKJL0D/hlfwWn7va957ojuQ6et5+hpqGMsyP
   M=;
X-IronPort-AV: E=Sophos;i="6.08,164,1712620800"; 
   d="scan'208";a="89591144"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 12:57:52 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.43.254:21742]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.38.98:2525] with esmtp (Farcaster)
 id 15655bab-d417-4d16-8fb6-4e2f551c9b7e; Thu, 16 May 2024 12:57:51 +0000 (UTC)
X-Farcaster-Flow-ID: 15655bab-d417-4d16-8fb6-4e2f551c9b7e
Received: from EX19D002EUA004.ant.amazon.com (10.252.50.181) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 May 2024 12:57:43 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D002EUA004.ant.amazon.com (10.252.50.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 May 2024 12:57:43 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 16 May 2024 12:57:43
 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id 920C320BED; Thu, 16 May 2024 12:57:42 +0000 (UTC)
Date: Thu, 16 May 2024 12:57:42 +0000
From: Hagar Hemdan <hagarhem@amazon.com>
To: Kent Gibson <warthog618@gmail.com>
CC: Norbert Manthey <nmanthey@amazon.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240516125742.GA14240@amazon.com>
References: <20240514122601.15261-1-hagarhem@amazon.com>
 <20240514124221.GA76024@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240514124221.GA76024@rigel>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Tue, May 14, 2024 at 08:42:21PM +0800, Kent Gibson wrote:
> On Tue, May 14, 2024 at 12:26:01PM +0000, Hagar Hemdan wrote:
> > Users can call the gpio_ioctl() interface to get information about gpio
> > chip lines.
> 
> Indeed they can, assuming they have access to the gpiochip device. So what?
> 
> > Lines on the chip are identified by an offset in the range
> > of [0,chip.lines).
> > Offset is copied from user and then used as an array index to get
> > the gpio descriptor without sanitization.
> 
> Yup, and it returns an -EINVAL, via gpio_device_get_desc(), if it is out
> of range.
> 
 In case of speculation executin, the condition (hwnum >= gdev→ngpio)
may be miss predicted as true and then the value of &gdev→descs[hwnum] is
speculatively loaded even if hwnum >= gdev→ngpio.

> >
> > This change ensures that the offset is sanitized by
> > using "array_index_nospec" to mitigate any possibility of speculative
> > information leaks.
> >
> 
> Speculative leaks of what?  The size of the array?
> That is explicitly public knowledge - if they call GPIO_GET_CHIPINFO_IOCTL
> it will tell them.
>
Speculation leaks of gdev→descs[hwnum] when hwnum >= ngpio.
As in func "lineinfo_get()", hwnum is an offset copied from user and used
as an index to get a device descriptor in gpio_device_get_desc().
Could you explain what do you mean by it is a public knowledge?

> > This bug was discovered and resolved using Coverity Static Analysis
> > Security Testing (SAST) by Synopsys, Inc.
> >
> > Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> > Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
> > ---
> > Only compile tested, no access to HW.
> > ---
> >  drivers/gpio/gpiolib-cdev.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index 9dad67ea2597..215c03e6808f 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/kfifo.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > +#include <linux/nospec.h>
> >  #include <linux/overflow.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/poll.h>
> > @@ -2170,7 +2171,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> >  	lflags = eventreq.handleflags;
> >  	eflags = eventreq.eventflags;
> >
> > -	desc = gpio_device_get_desc(gdev, offset);
> > +	desc = gpio_device_get_desc(gdev,
> > +				array_index_nospec(offset, gdev->ngpio));
> 
> Moving an out of bounds index INTO bounds here is totally wrong.
> That is NOT what the user asked for, and in that case they should get an
> error, as they currently do, no an actual different line - which is what
> this change does.
> 
> NACK.
> 
> Cheers,
> Kent.
This macro "array_index_nospec()" prevents out-of-bounds accesses
under speculation execution, ensures that bounds checks are
respected even under speculation and not moving out of bounds into bounds.

> 
> >  	if (IS_ERR(desc))
> >  		return PTR_ERR(desc);
> >
> > @@ -2477,7 +2479,8 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
> >  		return -EFAULT;
> >
> >  	/* this doubles as a range check on line_offset */
> > -	desc = gpio_device_get_desc(cdev->gdev, lineinfo.line_offset);
> > +	desc = gpio_device_get_desc(cdev->gdev,
> > +				array_index_nospec(lineinfo.line_offset, cdev->gdev->ngpio));
> >  	if (IS_ERR(desc))
> >  		return PTR_ERR(desc);
> >
> > @@ -2514,7 +2517,8 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
> >  	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
> >  		return -EINVAL;
> >
> > -	desc = gpio_device_get_desc(cdev->gdev, lineinfo.offset);
> > +	desc = gpio_device_get_desc(cdev->gdev,
> > +				array_index_nospec(lineinfo.offset, cdev->gdev->ngpio));
> >  	if (IS_ERR(desc))
> >  		return PTR_ERR(desc);
> >
> > --
> > 2.40.1
> >


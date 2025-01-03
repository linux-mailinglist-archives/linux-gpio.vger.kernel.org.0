Return-Path: <linux-gpio+bounces-14459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9389A009E4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCF577A1665
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 13:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DF01F9A9F;
	Fri,  3 Jan 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="lWW5dU8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB01137750
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735910774; cv=none; b=WE0jjvqXcL5RZG2fQ04PqsjBwbU81lVPK6I8lt8nun2/Kv+u7W4fcZsV343J+cDE2Y6DAiW4xKgUEe+/GL/nBZjvBT/f/fyrIKVxuON/USGNKZ6zxPeQDz7PLRi6oCItyDe4RiTt2aSGfnGVdPjQ5c3BNAGpHyANZsSEyxJJNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735910774; c=relaxed/simple;
	bh=Mdn2+VU0qMizUPVo9y1Fggu+1MXhg1eEcLjmoSvAiVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gerPz0TSsp9Ut3umPrsc+Fe0DnY+JFHnOMaVx32zVgSppXgQ5SZb7HpLmz27kPpepB/LPNoJjCl3Gz5GAetdSOUZADAG99/HAimj0/XFTUVbtXzK+enqI8szuPrT2jxBZ+4pNmsKBDcj/pptGB7weTZRAzAxPITfRi4k46eBGi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=lWW5dU8y; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D49503F8E3
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735910769;
	bh=OFy5CdhWaaf9oCUL8m+8yuCQHITKqVDWyJ0VY6zmTXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=lWW5dU8ysUjFAh6ltWJpFu86BqtQR/U2486f8YDf4wUTIcBthODPKwYYaX9lehuTi
	 B7orVMhuj3bO4OqLqytKjKXothT7VhhmU9zhDp5rl0xXUhpeH5+eMS9fp6IBUlUTNK
	 0nszOQ9RWF47ZsN/aw6JcS1jqR45vtOzKV9WU04hkXHY+6EJJ1foWpC8MgT5PIgDnb
	 moDObWuyWJN7nTaoVepa6S4qOdmFNHfItb0LNeES7QiRr19+CdwJbmjK9RRruJHIy6
	 +SucKlps1CK7U2ccORRaMZ2oWCuFxJWYAofLgKnD5C5OzQM3nv3BBjMvtP8Z+8YTOl
	 yrcf3zsopWakw==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21638389f63so143216325ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 05:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735910768; x=1736515568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFy5CdhWaaf9oCUL8m+8yuCQHITKqVDWyJ0VY6zmTXE=;
        b=US8W74UPg/k8/Z/JbevnMwA8EuUapJWI51w1rpTAyFIu+uccNaXScpCW6IcYYVSjQh
         W9lFaLTXlWgS2hmPr7mEIT5ztc66f+ESoqGS0lo9U0YgsCOCTGG8fr0YX6DgA7x3M3JU
         Lj5AMDb9v7+2dNXxaub14thjUcg+myABVxkGGhj5yR7vtDWmrdH5i8G4TpQXNAzi6wh/
         9aZAt1ys9Z1AXqXaHeKg4pBDVYKp2CmNLStrabpQSgpB+5FmqLXscrCG5e2RBH4gOalV
         A9tyb5BL/Jva7pHyCSQFUfSOw59dy6uPtpPrkLohvVgngpVbowMO7qkL1JDWPNEmBwTe
         713Q==
X-Gm-Message-State: AOJu0YwQwSIbF4zQkIcMS2FMbgXBNjJ0tdeeKHSYLVIEbNcI7T4e9R4a
	42ih6LTpQqjjkv48xirCUkC7Txnczuh4gm2irWVsJbWAMxF9fiTFbvd7CiwK20c2GX3kR64Oi8x
	xtu6FnFGKdmhUlNSc5RzOnsUyrHTYuzZnkWcMrcUUcFra9nGEbQDq8iCo12jKOrEtD6pNe3LJvz
	VW7HsX5mE=
X-Gm-Gg: ASbGncvyDgojFggP2cOagVx3bsrqk9cVQ68zpjTXvN6dofBhfxcaVmrsATkkxXF9QfL
	ED0nRFFQTKUfrleUX9nur/zpVnBGVxgAEwIikWhPODmz92VqsWaGSGBdLtPmwcTvX0ZI4zNV2ij
	/Yj30nl22LZ8uxpv0+ld/xklV3yS5zM+1XW1rpdbq7EBgvPHd1cWw4T28iZi19HxiDuM6mWmNwa
	bcQUSKQf4u7tbt5EjYUoFMVEQECgZSrHzxtcNU1SssT1vIwTFMe1kGm1go=
X-Received: by 2002:a17:903:2286:b0:215:cbbf:8926 with SMTP id d9443c01a7336-219e6f10978mr678786035ad.35.1735910768436;
        Fri, 03 Jan 2025 05:26:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPPYeJcIdE8dTtk2OdIqY5KjK8LiNiLEXQ98NqmgQKQLpUPcV0FVgrkBW7m7l0Ha/KM9SryA==
X-Received: by 2002:a17:903:2286:b0:215:cbbf:8926 with SMTP id d9443c01a7336-219e6f10978mr678785765ad.35.1735910768092;
        Fri, 03 Jan 2025 05:26:08 -0800 (PST)
Received: from localhost ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca04c33sm244798065ad.247.2025.01.03.05.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 05:26:07 -0800 (PST)
Date: Fri, 3 Jan 2025 22:26:06 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] gpio: virtuser: fix missing lookup table cleanups
Message-ID: <qm3h43voxpbk6wz5x7bhgh3n7zs3khfa54qbl2w2ju42xx4dil@u3w5n45pvp2u>
References: <20250103030402.81954-1-koichiro.den@canonical.com>
 <20250103030402.81954-2-koichiro.den@canonical.com>
 <CAMRc=MejjiFin4hU_-8Cnzs03gDsd18cM6ahoSsZVQDeFSZd6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MejjiFin4hU_-8Cnzs03gDsd18cM6ahoSsZVQDeFSZd6g@mail.gmail.com>

On Fri, Jan 03, 2025 at 02:15:17PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 3, 2025 at 4:04 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > When a virtuser device is created via configfs and the probe fails due
> > to an incorrect lookup table, the table is not removed. This prevents
> > subsequent probe attempts from succeeding, even if the issue is
> > corrected, unless the device is released. Additionally, cleanup is also
> > needed in the less likely case of platform_device_register_full()
> > failure.
> >
> > Ensure the lookup table is removed whenever the device activation fails.
> >
> > Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/gpio-virtuser.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> > index 91b6352c957c..ec5abfebca3d 100644
> > --- a/drivers/gpio/gpio-virtuser.c
> > +++ b/drivers/gpio/gpio-virtuser.c
> > @@ -1487,10 +1487,8 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
> >         pdevinfo.fwnode = swnode;
> >
> >         ret = gpio_virtuser_make_lookup_table(dev);
> > -       if (ret) {
> > -               fwnode_remove_software_node(swnode);
> > -               return ret;
> > -       }
> > +       if (ret)
> > +               goto err_remove_swnode;
> >
> >         reinit_completion(&dev->probe_completion);
> >         dev->driver_bound = false;
> > @@ -1498,23 +1496,32 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
> >
> >         pdev = platform_device_register_full(&pdevinfo);
> >         if (IS_ERR(pdev)) {
> > +               ret = PTR_ERR(pdev);
> >                 bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
> > -               fwnode_remove_software_node(swnode);
> > -               return PTR_ERR(pdev);
> > +               goto err_remove_lookup_table;
> >         }
> >
> >         wait_for_completion(&dev->probe_completion);
> >         bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
> >
> >         if (!dev->driver_bound) {
> > -               platform_device_unregister(pdev);
> > -               fwnode_remove_software_node(swnode);
> > -               return -ENXIO;
> > +               ret = -ENXIO;
> > +               goto err_unregister_pdev;
> >         }
> >
> >         dev->pdev = pdev;
> >
> >         return 0;
> > +
> > +err_unregister_pdev:
> > +       platform_device_unregister(pdev);
> > +err_remove_lookup_table:
> > +       gpiod_remove_lookup_table(dev->lookup_table);
> > +       kfree(dev->lookup_table);
> 
> Just one more thing: now we open-code this but the actual allocation
> and adding of the table happens in a dedicated function. Can you
> package these calls into their own function
> (gpio_virtuser_remove_lookup_table() maybe?) and use it here and in
> gpio_virtuser_device_deactivate()?

Sounds reasonable and cleaner. Thanks again for reviewing, I'll send v3
soon.

-Koichiro

> 
> Bart
> 
> > +err_remove_swnode:
> > +       fwnode_remove_software_node(swnode);
> > +
> > +       return ret;
> >  }
> >
> >  static void
> > --
> > 2.43.0
> >


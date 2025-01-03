Return-Path: <linux-gpio+bounces-14472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24749A00B13
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 16:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3674418824A9
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FE41FBC90;
	Fri,  3 Jan 2025 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="IPxGjnMp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801A31F9F6E
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916671; cv=none; b=LaAVBXSuZ1APA0eNFzZBuKH+iq9n2vEuDes4Km09yv9nId5LbV5x+op0czAjbhrE6k/+ezIAkSWLKRf2rQ+GvG4R4T/jTuTLulcicXygYSPy4Rlw1iCwinKPFdOXFXU15KWtDXP3qzLwmy5U3zYEMo+4LvntQt0MHkefytbmC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916671; c=relaxed/simple;
	bh=LcEep8EjJ10mr4PIzfDz5QxzD4mKe88ZY4b09+rQW0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Im6jXoiiL0t9GePgbycikd9DyEmFep9hh/sI0Z5vaomjdQty93HELciBVvs2S3A1Tk2KthtVuaZc6WifGWR2DqE8JXo0M4wW7FNaQhplH18y9BQNFSeIHYbFe9dwZWLQdEmQNTlCAW9MY6wPLnT0gdihQ4rhQO7lHWHXqBZbnfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=IPxGjnMp; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A6CBC3F291
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735916664;
	bh=bRvmf/nalKi458MJxjYiJNSYaSrpe1+++Bi/ER61qS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=IPxGjnMpQ+5M/uul/pJ5Waq+sbBmAXWwTJewBMVLoq3w4vF2kVPguo0FdZzo5lB5E
	 IKbSRlZb9gDRYMETOA6VCLPooHRs4CJLKNJ0l+oS+8WayvJpfY00RkKF3SmVBMNbc5
	 BKWkeD1DMBKwMeATHkRuHIk3gfTw3E875Ag39odubIJJb7KrXkhyHxc/XVcGuY0qd3
	 +99YNMantNjqnZ2rLlGSJ6WR18QCW1A7RLNFOg0CvJ9p5xm9pkS0HdaR+y/IeaiIll
	 Bwl+I0OXcIYGIvH+Cu2nKnSpXn4JDnPUdmDRrbNmpVfjmeIuJOXn4qLIyjcF9dQyWK
	 uFFwfWrRdU/Gw==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ee9f66cb12so17490541a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 07:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916663; x=1736521463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRvmf/nalKi458MJxjYiJNSYaSrpe1+++Bi/ER61qS8=;
        b=Y8llMW8EmGa/uYwB07QzugrFTzVQ2LxLYdlZFIKf21XWvvB+Nq53MOB2cbKP9z2Deg
         LxGKD0DrR9C/6h1uDbNTl4n9ODR+YH6bULCIIIk6AGgNLmGjdonoeLb+Jl7Y9mefLmBd
         /iyi/QK444BMpRx6xphEOd/5vEg+73nAQDOP9b2nvkYnGPQImZvxkMTtdDKr+EBNc2Ky
         kMQR96mA3e6THtkGNVE0ZXEN47JO5SAUu7XRLWic1f8c4gwv92Rqb5wlOzVeVPivOlq4
         5+mpYRa9ZvSX89LaAw2Wtzjh+pior87IC0is0DNjXc/TL/of7TUNz10DSenddEevME0H
         LH8Q==
X-Gm-Message-State: AOJu0YxHJ/BAamyl7cbXvbyoEuoQb81O2kXpZWuaUA86vaJRZ7r4VWPM
	hJ1snEdDZGg/3hLSR1j6RmTNTm5H4YJjHpp/S2wYW/LPhHZ4sWbcrZl8zxMqwYedKNkRWLGQ445
	mNY54nZbreHAsYNJOBdGBrbIhJNAfk+2bU1xzMGkYTg6HjfIKJBYuvfsrXVctj3gAmBmgDHXSuZ
	w=
X-Gm-Gg: ASbGnctK386fHUaD9uZR0qXy8Q6JCyK/u+gnamMCPq0i62+bvii4uSA7oP8yECwGVCS
	L1xTWwk8Eh7rOIGwUW/yF/UFPeDn69+N+oyJLfz1rtIjHRVTWf87PMuLvcb0l0oWjDepGvV/314
	8/WItNuu5rUGsC5HkQLVKbUymsWme1hcqvk6arERujJO6ybJC7Gy3AOaeX/IahD5Kgh0pmEsb60
	pcZAvjzjguWJ042q1xkKOUXgHfcYBEVuCEpPiqOi5htnsWdxJb1lzxmGNA=
X-Received: by 2002:a17:90b:534e:b0:2ee:7a4f:9265 with SMTP id 98e67ed59e1d1-2f452e22c53mr79616285a91.15.1735916663111;
        Fri, 03 Jan 2025 07:04:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYclWA2SwSBNmXwtuZrNu9I2Mnt6bhGwMkdDDeUf20d5iZ7IuOJWBALcJXXrheKd0sum38iw==
X-Received: by 2002:a17:90b:534e:b0:2ee:7a4f:9265 with SMTP id 98e67ed59e1d1-2f452e22c53mr79616248a91.15.1735916662745;
        Fri, 03 Jan 2025 07:04:22 -0800 (PST)
Received: from localhost ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f7312sm245021655ad.225.2025.01.03.07.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:04:22 -0800 (PST)
Date: Sat, 4 Jan 2025 00:04:20 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] gpio: virtuser: fix missing lookup table cleanups
Message-ID: <nvhxtxiooepkbrl6duymqzf6rduaebcstvz6vvpi5ft3nnvkzu@vtn5bmlobdfx>
References: <20250103141829.430662-1-koichiro.den@canonical.com>
 <20250103141829.430662-2-koichiro.den@canonical.com>
 <CAMRc=MfwK8o44MYk9pPAkHn6t+wY3=x99Uy88CKgx7nN8x81mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfwK8o44MYk9pPAkHn6t+wY3=x99Uy88CKgx7nN8x81mw@mail.gmail.com>

On Fri, Jan 03, 2025 at 03:38:46PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 3, 2025 at 3:18 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > When a virtuser device is created via configfs and the probe fails due
> > to an incorrect lookup table, the table is not removed. This prevents
> > subsequent probe attempts from succeeding, even if the issue is
> > corrected, unless the device is released. Additionally, cleanup is also
> > needed in the less likely case of platform_device_register_full()
> > failure.
> >
> > Besides, a consistent memory leak in lookup_table->dev_id was spotted
> > using kmemleak by toggling the live state between 0 and 1 with a correct
> > lookup table.
> >
> > Introduce gpio_virtuser_remove_lookup_table() as the counterpart to the
> > existing gpio_virtuser_make_lookup_table() and call it from all
> > necessary points to ensure proper cleanup.
> >
> > Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/gpio-virtuser.c | 36 +++++++++++++++++++++++++-----------
> >  1 file changed, 25 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> > index 91b6352c957c..e89b1239b635 100644
> > --- a/drivers/gpio/gpio-virtuser.c
> > +++ b/drivers/gpio/gpio-virtuser.c
> > @@ -1439,6 +1439,15 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
> >         return 0;
> >  }
> >
> > +static void
> > +gpio_virtuser_remove_lookup_table(struct gpio_virtuser_device *dev)
> > +{
> > +       gpiod_remove_lookup_table(dev->lookup_table);
> > +       kfree(dev->lookup_table->dev_id);
> 
> Ah, this has been here all along as well. :/
> 
> 
> > +       kfree(dev->lookup_table);
> > +       dev->lookup_table = NULL;
> > +}
> > +
> >  static struct fwnode_handle *
> >  gpio_virtuser_make_device_swnode(struct gpio_virtuser_device *dev)
> >  {
> > @@ -1487,10 +1496,8 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
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
> > @@ -1498,23 +1505,31 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
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
> > +       gpio_virtuser_remove_lookup_table(dev);
> > +err_remove_swnode:
> > +       fwnode_remove_software_node(swnode);
> > +
> > +       return ret;
> >  }
> >
> >  static void
> > @@ -1526,10 +1541,9 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
> >
> >         swnode = dev_fwnode(&dev->pdev->dev);
> >         platform_device_unregister(dev->pdev);
> > +       gpio_virtuser_remove_lookup_table(dev);
> 
> Any reason for moving it earlier?

Just to make the resources teardown order more natural and better align
with the error path in gpio_virtuser_device_activate() (i.e., the new goto
labels part I added). IIUC, it can be safely moved as such under dev->lock.

Thanks.

-Koichiro

> 
> Bart
> 
> >         fwnode_remove_software_node(swnode);
> >         dev->pdev = NULL;
> > -       gpiod_remove_lookup_table(dev->lookup_table);
> > -       kfree(dev->lookup_table);
> >  }
> >
> >  static ssize_t
> > --
> > 2.43.0
> >


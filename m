Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3C01D6879
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2020 16:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgEQOrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 May 2020 10:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgEQOrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 May 2020 10:47:42 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF6AC061A0C
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 07:47:41 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id v5so5720531lfp.13
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vmvBd2EJ8YKPq1cQ4V4w5I8K4gVTIIFWHUspErvVGxk=;
        b=t+SSpMzrZJ4HglpKhAVCRm/AkYqoBFkjwcTtB5snXWqO4yPCi9ZBN2GbM4be8LZZQ2
         aEAcqFVpImyG63dA9a43d+8jAqM4oAYkRzgpckhArKoMBwKVsSa2FhsuD4hSSgGYGWJa
         DBDA+qokiPlb15WIufaRhAv+getWOo5clmgUXcqHKwVNce57+dmqJtLSY4Tb+DSnMJBu
         TFZtlsCcl5afzj/m8tLZjukDQYc49G7pDmPnVzsmhiqPrHlpxozM/1DA8hVniDhoiDyA
         BLMbe9Em9tLNWROFIYTOqEJkEW185mv58eyKqcNzgluRkSCzvModxiROE3bDFHlIkYEz
         H12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vmvBd2EJ8YKPq1cQ4V4w5I8K4gVTIIFWHUspErvVGxk=;
        b=DGfP+bFdoXS840lBWkJ8VjkJuwRBeTUtltB881XR8pjvXsEoRhosf5U8xGr+iJ4/eR
         in0GGiTPBq7Yc73+4BsLwgOTNJqO1otb/FO34i9BrDQBy5tM/3lNBLrfmcTP1NggVxBD
         5K5nu/mgGzazgX1F5OjXZ/3msgAKL1zNXL/6Iw4GdYNINmUdb3DOc0FAIj15TOPxdnDm
         rN+GY4D5JICAvFbR6hx1C5P8nc39szmgo5erA/36NoTeWZrUkurWb6oQED9Awf81kpba
         nRBOSf1F/ZHo1e2eyoSU8yReOpSzXElxAZtFyFMNwDILpTSofPP7Qmr5H12S2G2/nAfg
         Y2Cw==
X-Gm-Message-State: AOAM533XcDLINURj5Epdc/tBgsTmAloQJgLJ6rAFLyMz6rqEp0J12xyj
        KndSCLHcvrW7ekInaVjr8sQ=
X-Google-Smtp-Source: ABdhPJwSHrLuWKhilT6ZSUDShXkwWfjjYE1hB5X/VEOog+1jGRGBGTmmE2wke5gzEQdGDK7eBnt8tQ==
X-Received: by 2002:ac2:59c3:: with SMTP id x3mr2136130lfn.117.1589726860112;
        Sun, 17 May 2020 07:47:40 -0700 (PDT)
Received: from mobilestation ([95.79.192.151])
        by smtp.gmail.com with ESMTPSA id i124sm4231288lji.95.2020.05.17.07.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 07:47:39 -0700 (PDT)
Date:   Sun, 17 May 2020 17:47:37 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 3/4] gpio: dwapb: Drop extra check to call
 acpi_gpiochip_request_interrupts()
Message-ID: <20200517144737.zii4c22rbyzxckob@mobilestation>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-3-andriy.shevchenko@linux.intel.com>
 <20200517135521.tnz6uegenoh77bfl@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517135521.tnz6uegenoh77bfl@mobilestation>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 17, 2020 at 04:55:24PM +0300, Serge Semin wrote:
> On Tue, May 12, 2020 at 09:45:12PM +0300, Andy Shevchenko wrote:
> > There is no need to have an additional check to call
> > acpi_gpiochip_request_interrupts(). Even without any interrupts available
> > the registered ACPI Event handlers can be useful for debugging purposes.
> > 
> > While at it, add missed acpi_gpiochip_free_interrupts() call when
> > unregistering ports.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Serge Semin <fancer.lancer@gmail.com>
> > ---

[nip]

> > -	if (pp->has_irq)
> > -		acpi_gpiochip_request_interrupts(&port->gc);
> > +	acpi_gpiochip_request_interrupts(&port->gc);
> 
> Hm, perhaps replacing it with:
> +	if (pp->idx == 0)
> +		acpi_gpiochip_request_interrupts(&port->gc);
> could be more appropriate seeing Port A only supports IRQs, which we'd point
> out by the (idx == 0) conditional statement. So we don't have to call
> the method at most four times for each available port. Though judging by the
> acpi_gpiochip_request_interrupts() function internals it will just ignore
> GPIO chips with no IRQ support. Andy, It's up to you to decide. I'm not against
> the change the way it is, but if you agree that signifying the IRQs affiliation
> would be better, then please fill free to add the conditional statement I
> suggested.
> 

Please see my comment below, before you decide what to do with this part of the
patch.

[nip]

> 
> >  static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
> >  {
> >  	unsigned int m;
> >  
> > -	for (m = 0; m < gpio->nr_ports; ++m)
> > -		if (gpio->ports[m].is_registered)
> > -			gpiochip_remove(&gpio->ports[m].gc);
> > +	for (m = 0; m < gpio->nr_ports; ++m) {
> > +		struct dwapb_gpio_port *port = &gpio->ports[m];
> > +
> > +		if (!port->is_registered)
> > +			continue;
> > +
> > +		acpi_gpiochip_free_interrupts(&port->gc);
> > +		gpiochip_remove(&port->gc);
> > +	}
> >  }
> 
> Could you please move this change to a dedicated patch? It seems to me this
> alteration might be appropriate to be ported to the stable kernels seeing it
> fixes e6cb3486f5a1 ("gpio: dwapb: add gpio-signaled acpi event support").
> Linus, what do you think?
> 
> -Sergey
> 

BTW after moving the change with acpi_gpiochip_free_interrupts() into a
dedicated patch, you can freely merge the rest of this patch into the
last one of this series. So the has_irq flag cleanup would be performed in a
single commit. Especially if you implement the comment I provided above regarding
conditional (idx == 0) calling of the acpi_gpiochip_request_interrupts() method.

So your series will look like this:
gpio: dwapb: avoid error message for optional IRQ
gpio: dwapb: Don't use 0 as valid Linux interrupt number
gpio: dwapb: Call acpi_gpiochip_free_interrupts() on GPIO chip de-registration (<= This commit can be moved to the head of the series as being marked by the
Fixes tag)
gpio: dwapb: Remove redundant has_irq flag support

-Sergey

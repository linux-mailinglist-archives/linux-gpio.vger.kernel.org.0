Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B86235623
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Aug 2020 11:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgHBJct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Aug 2020 05:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgHBJct (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2020 05:32:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C30C06174A;
        Sun,  2 Aug 2020 02:32:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id c10so5461364pjn.1;
        Sun, 02 Aug 2020 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lQyCse9ldgzSvTNwCVrbnPBDFh47UeLMm99PjX/Y9Ug=;
        b=JiQq24jVJttFMFq7sYFEaw6AvoUegLS2lzK0HxgFI0hxO2hNNYpCd6YFU+EBJWTNQf
         p1QkXMfPFRy2+Tey4+LHSXeM8N+HX+rU7b3IWfoOpYyIPfepiuAEKK3wPzz8gsuS8cEV
         YHlbJjwMMVw6aJZ4r8Do1bnwC3KXWbNDn4hWiebehnD4jnojcvhGaqDTMkfrq4//Q3R+
         qcZmk4jtPTerl0Cwqk/FAnAM6wZj3P5u95iCdk35oAbtTSvHE327Hx1LjyBqAQVpImxT
         QyiQJqfU33ksp3DgDOcgFwwrC//MZfVo/q4wybwSd83lFZZNY21xM1OKYeZxSw4Ww2zr
         YQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lQyCse9ldgzSvTNwCVrbnPBDFh47UeLMm99PjX/Y9Ug=;
        b=V+xbDH5fvPngycJPD10ky79WG6FedxHWjVnPXeXl/S8lMrK+jTLeF94Z+qL9weSXIp
         toR3m93mu/8neiGaV7FI4IdSeyUUitvsJfn33a2xwAUQ4yHy1M42TloLtwLwFYPGDJ26
         mwEzC8CpTHawI8yz43GRjPl3bty/FMzFk2rSVj2RYCV1/pLS7WYQ+Wq5fZqoSaEre2AP
         WMfdKXQyUSX3mL0dHylkAWWc7S/4RjsgVr24VK2IuU9gYjWbd3aFpBcBJR9TocOirw+6
         dSKoYGE3skM1ok8sU8vARKe2Ki1w44cLWzC46Nt4JpczyLuB1RJkFloAbZlre+/b8pAu
         lZRQ==
X-Gm-Message-State: AOAM532D0ifnGj9y0qMuCjOfpszEdVURsGbNDEsjDhGahJOvPQ/tgjT8
        f+YUPqbDZa/bBJlavqgEyIU=
X-Google-Smtp-Source: ABdhPJwL0hTPFE5j/dtwuax92ub5eNLPucfnEP4P3GU0AB8UdeHnowIWbb93iQ6vSDf7f0Eij+alzQ==
X-Received: by 2002:a17:90b:3d7:: with SMTP id go23mr11072181pjb.44.1596360768524;
        Sun, 02 Aug 2020 02:32:48 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id e15sm2818167pgr.39.2020.08.02.02.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2020 02:32:47 -0700 (PDT)
Date:   Sun, 2 Aug 2020 17:32:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200802093242.GA23877@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol>
 <CAMpxmJWaEVwjXSFHTYmwdfA+88upVkJ4ePSQf_ziSOa1YdOUKQ@mail.gmail.com>
 <20200802033158.GA13174@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802033158.GA13174@sol>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 02, 2020 at 11:31:58AM +0800, Kent Gibson wrote:
> On Fri, Jul 31, 2020 at 06:05:10PM +0200, Bartosz Golaszewski wrote:
> > On Sun, Jul 26, 2020 at 3:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > 
> > > >
> > > > > +               dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> > > > > +                       offset);
> > > >
> > > > Perhaps tracepoint / event?
> > > >
> > >
> > > Again, a cut-and-paste from V1, and I have no experience with
> > > tracepoints or events, so I have no opinion on that.
> > >
> > > So, yeah - perhaps?
> > >
> > 
> > I think it's a good idea to add some proper instrumentation this time
> > other than much less reliable logs. Can you take a look at
> > include/trace/events/gpio.h? Adding new GPIO trace events should be
> > pretty straightforward by copy-pasti... drawing inspiration from
> > existing ones.
> > 
> 
> You only want tracepoints to replace those dev_dbg()s, so when a line
> is requested? What about the release?  Any other points?
> 

Had a closer look and it seems to me that the correct place to add such
tracepoints would be gpiod_request() and gpiod_free(), so they catch all
requests, not just the cdev ones.  And that moves it outside the scope
of this patch.

I personally don't have any use for the dev_dbg()s here and am happy to
remove them - they were only there to match the behaviour of
linehandle_create as closely as possible.

Cheers,
Kent.

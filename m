Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C761394A84
	for <lists+linux-gpio@lfdr.de>; Sat, 29 May 2021 07:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhE2FMH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 May 2021 01:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhE2FMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 May 2021 01:12:06 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45695C061574
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 22:10:30 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so5682173pjp.4
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 22:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tTVwCfkz/BeTPvE8VCM1Wd7bhUe2cYzDDact+RxH+hg=;
        b=ndLuUWy7yd8Tt2BmzNJLU3YESIHFqaox9CP2Vr5ABb+lOWmIAZY9OYVL8rNGqGDZt/
         BVUlUh7fSRkkeHuNNVt0u3aG6s8yQJE3dTiKSNY4JA/pWqSDbLAzyGMCPEubRER2osvn
         ZiBOuGQu5M51zHNf4VmqpYoui2CTZ4AqFDermTXBVMsyvQsJqKj/b2ZJvpVTPM16vKhu
         6JpSKHDx+XWuXtet6d45BA2OhEgLhUyaJbxeZI1niHy61xVWMcYAXWtIcFzERLLLxFe2
         KwINdIt0LEHUiQbaPsDp5s6iLc1xo92qTGV3l+XfKlKGo3Wm8ko8cEzIoYPjOXix1rN/
         fy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tTVwCfkz/BeTPvE8VCM1Wd7bhUe2cYzDDact+RxH+hg=;
        b=dnrYqLrFzROqJwreYqOAeyYCoF1tEsf8msTPWRKtyiwLhC+lbqby0cYZqsMhOTl4Mc
         8UOMWBpULH0eM8ek5P/e0cQ83FfiLvH12qDi99nfaxg0DxdEGzfDLInmuRO69tDwf/0o
         m7rqClbp5LWZyMriQ0b1qCJ16BKYTBSpKTLSaaUBscTeuX7fhKnrntaKyIlzgutG8biF
         CCWWEk4HQLpal3zH2odlHPojSGSoKk/isfyR5+zMY8Dt61BqJQ8yQtEGSkOfG2uHpyKG
         ZlioXMo73yLHoeIGryxVe+41nY4aubdJ7vld9pNOuuw9kQabjp+ufSO9gPnfECrS/32N
         VjJw==
X-Gm-Message-State: AOAM5320TLVAk9kwMWwzkEwSRRtOJDZACqgl2GXGAb3o2eAWlB0ro0lH
        Ro3InDji072l1NYHnzP8uvc=
X-Google-Smtp-Source: ABdhPJwE9k+OiJUb+vGINucmAzDB0vAoZHsVnEWL20krHS9d+zMsFbUxiJ3mW5bkZtGf4lgQxcdOSA==
X-Received: by 2002:a17:90a:3bc6:: with SMTP id e64mr8342046pjc.156.1622265029785;
        Fri, 28 May 2021 22:10:29 -0700 (PDT)
Received: from sol (106-69-175-91.dyn.iinet.net.au. [106.69.175.91])
        by smtp.gmail.com with ESMTPSA id b16sm5925048pju.35.2021.05.28.22.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 22:10:29 -0700 (PDT)
Date:   Sat, 29 May 2021 13:10:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
Message-ID: <20210529051024.GA18025@sol>
References: <20210518191855.12647-1-brgl@bgdev.pl>
 <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
 <20210528232320.GA5165@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528232320.GA5165@sol>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 29, 2021 at 07:23:20AM +0800, Kent Gibson wrote:
> On Fri, May 28, 2021 at 03:51:03PM +0200, Bartosz Golaszewski wrote:
> > On Thu, May 27, 2021 at 1:27 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >

<snip>

> > > >  /**
> > > > - * @brief Get the handle to the GPIO chip controlling this line.
> > > > - * @param line The GPIO line object.
> > > > - * @return Pointer to the GPIO chip handle controlling this line.
> > > > + * @brief Get the pointer to the line-info object associated with this event.
> > > > + * @param event Line info event object.
> > > > + * @return Returns a pointer to the line-info object associated with this event
> > > > + *         whose lifetime is tied to the event object. It must not be freed by
> > > > + *         the caller.
> > > >   */
> > > > -struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line);
> > > > +struct gpiod_line_info *
> > > > +gpiod_info_event_peek_line_info(struct gpiod_info_event *event);
> > > > +
> > >
> > > Rather than the peek/copy you use here, I would rename the peek to
> > > get...
> > 
> > Ha! I think we'll disagree here again. In most cases in low-level
> > linux C libraries, a "get" for complex objects returns a copy (or a
> > new reference if we're using shared objects). I would like to stay
> > consistent with that pattern. To me "peek" is a good way to
> > distinguish those functions that allow you to look into the internals
> > of the parent object. If anything - I'd go with the get/peek pattern
> > where the former returns a new object over whose lifetime the caller
> > takes responsibility and the latter returns a pointer to an object
> > stored in the parent. I went with copy/peek because it hints at a
> > different behavior than regular get but I can live with get/peek.
> > 
> 

I forgot to ask about where gpiod_line_info_get_name() and others that
return char * fit wrt that pattern.
So a string isn't a complex object?
Maybe they should be _peek_ as well?
Either way, it would be nice for their commentary to describe the lifetime
of the returned pointer.

Cheers,
Kent.

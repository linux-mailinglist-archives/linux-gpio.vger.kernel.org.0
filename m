Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52ED4394EB1
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 02:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhE3Ar1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 May 2021 20:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhE3Ar0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 May 2021 20:47:26 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD28C061574
        for <linux-gpio@vger.kernel.org>; Sat, 29 May 2021 17:45:49 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id 69so3419378plc.5
        for <linux-gpio@vger.kernel.org>; Sat, 29 May 2021 17:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cf7Uaf+odp0TbLcUrbgauQfhsfY0u53wpoT4cmn0MYM=;
        b=DRPzJBLLvJJe7ieaYy404se9ndeo++dvQi9tIqsqYCY4NUzLp+HOuVjmZrqm9e61tc
         nGboxtaQJBVe2hwSmVQIbuP8Ud3taNIu4QX/QdsZ5+/5Yia+f4AP6IKQFR8ECLIX8j3J
         1EACdW42m4/eQNMqHLUeG3+bC8TfOoBlULXl1ztzxtpNrRRtbRJDIdc5p6ftwTKFjswX
         AGHeg44+zQ3kst0xvLshXK70MZrRm7Vu5npxVPOwj095mLdobvmDp51MnfjxjcjEwryU
         VsKfyGcOhkN0YbrfNZPnmWrNPtHQbuJX+xmFjr34ZwrEmwt/o8CHzt+FosmqxYLXalhw
         sDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cf7Uaf+odp0TbLcUrbgauQfhsfY0u53wpoT4cmn0MYM=;
        b=lDSmIXAMnNC2iLR1Mu2DQcpLZh8HeY+sKaoTZ1WbwkFTTZigaOwJJG/ifA+jaZ5IUD
         9p8R6kGSAwC+DsjbbYWcaNKg/2y+uM9T/hbvkxHOzDsZ2C0XnHAeaZ7JF/rZA527ZlBs
         i4TFImh9X1IOwTJh32otSmsBjMkTApIXD0NSxglNNv5LjJUT4pEorohHuyoTftACFukK
         bQt94Ses1FKs6tggkUsQsqHlMXI71DztzI9b5n9/nQMr9SHhELe7sFpW76OMA4QdyQDa
         /nbpKHylT2OyMUAsf7J6hBGaiRqeWET3d4btYZgUfdgBCSD739TgILT8ZIZgczwiBMFJ
         sZCg==
X-Gm-Message-State: AOAM532vWdVv+/SZ5BxaInE0PV7VqH4Qva7zBXytcey4pjKk4vbXeDG2
        FKFdhBAOX9C+LQogQl0zK4o=
X-Google-Smtp-Source: ABdhPJynwpwnEQu/j2Fss56jRIdX54/ojsKtv5Ycfr8fWv/vm+5/h8Hg2JDlOGRZX6W3wpc9nKTw0Q==
X-Received: by 2002:a17:902:da8f:b029:f4:11e0:48f with SMTP id j15-20020a170902da8fb02900f411e0048fmr14234557plx.56.1622335549316;
        Sat, 29 May 2021 17:45:49 -0700 (PDT)
Received: from sol (106-69-175-91.dyn.iinet.net.au. [106.69.175.91])
        by smtp.gmail.com with ESMTPSA id 25sm7300133pfh.39.2021.05.29.17.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 17:45:48 -0700 (PDT)
Date:   Sun, 30 May 2021 08:45:44 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
Message-ID: <20210530004544.GA4498@sol>
References: <20210518191855.12647-1-brgl@bgdev.pl>
 <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
 <20210528232320.GA5165@sol>
 <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 29, 2021 at 08:19:32PM +0200, Bartosz Golaszewski wrote:
> On Sat, May 29, 2021 at 1:23 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 

[snip]

> > > >
> > > > I would rename this to gpiod_line_config_set_output() and have it set
> > > > the direction (to GPIOD_LINE_CONFIG_DIRECTION_OUTPUT of course) as well
> > > > as the value.
> > > >
> > >
> > > I like it but how would that plug into the global direction setting?
> > >
> >
> > You mean the default flags?
> > You can work that out as part of the translation to uAPI.
> > It would be whichever applies to the most lines.
> > No need for the user to know or care.
> >
> 
> Eek this sounds vague. If that was part of documentation for this
> function - as a user I would be confused. Is there any problem with
> just implying output for any line for which a default value is set?
> 

What part of "No need for the user to know or care" is too vague?
The user does not need to know how libgpiod translates to uAPI - that
is your problem not theirs, so don't go there.

But for your benefit...

There is no global direction setting - the lines are treated
independently until the translation to uAPI during the request or
reconfigure call, at which point the most common flags setting can be
used as the global default.

The direction flag is only set for the lines specified in the set_output
call, so offset for the singular case, or offsets for the subset case.

> > > > And maybe add a gpiod_line_config_set_input()?
> > > >
> > >
> > > What about "as is" with this pattern? We agreed that input would be
> > > the default so we need some way to set "as is" too.
> > >
> >
> > I didn't suggest removing gpiod_line_config_set_direction(), so you would
> > use that.  The as-is case isn't sufficiently common to warrant its own
> > short form.
> >
> 
> 
> > I forgot to ask about where gpiod_line_info_get_name() and others that
> > return char * fit wrt that pattern.
> > So a string isn't a complex object?
> > Maybe they should be _peek_ as well?
> > Either way, it would be nice for their commentary to describe the lifetime
> > of the returned pointer.
> 
> With strings the common sense is to assume that returning char * means
> the string is dynamically allocated and must be freed by the caller,
> returning const char * means the string is stored in the container. I
> can't really recall seeing any other pattern in any sane C library. In
> any case - I will add a comment to every function that returns an
> object that needs lifetime management from the caller in v3.
> 

Sure, but don't assume common sense - document the behaviour - even if
the returned object doesn't require lifetime management by the caller.
They might assume they do - and free it for you.

And the point was that you still have some gets that return objects while
others return a reference - even after renaming some to peek, so the
pattern doesn't follow for the whole libgpiod API. Granted that is
nitpicking, but I would prefer internal self-consistency over following
what other libraries do.

Cheers,
Kent.

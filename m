Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47F023D4FC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 03:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgHFBP1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 21:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgHFBPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 21:15:25 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544F4C061574;
        Wed,  5 Aug 2020 18:15:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id l60so5797003pjb.3;
        Wed, 05 Aug 2020 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uDEn5WbaWPVjadOM3efG6b6rzYHXFUMjTCE/PXxN2KE=;
        b=ZZTv9isO88CSv/2LFGhQydIXIteR0kDnWuGu9LcmtfQAuhHQaMkTzAI/mlUltgQJeq
         idhJXGMWU9pPOAhHnwDHOL93WIgorsG6AScMcoO6Gt6fVsaYl5Hj38BYKlLCvDtft2ri
         rYHogv6eqz27qHK6OWYkTt0aJoZKovydZnIIMpGJxYr/SL+VaVDV4opscaaKsCVu7Qdy
         Ou8tF69bwv2eXbYcgoaqB8YGZZ9llWewGSplxLPPOL0en3ucj0vc/cZNzJI+gk60idIb
         ynzqsEQTXwFppNx5lU072pCBCcxt8cbDOXuOtIioSVo4ensuyYG6RhCku4H0NqHqpxpr
         1rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uDEn5WbaWPVjadOM3efG6b6rzYHXFUMjTCE/PXxN2KE=;
        b=SXvxlG5RPlqYUMieX7mm3zcfru23UkOXyxgCb5RxJmOYvqdJ/0sM7CLFXY13uzseSY
         R4/CHN6FQyNdvUr85OKYPsdH6EAADbpxl1lPIwpGZFDjihlet9tU5u0A//O6iQ/TjPHR
         nn4LKe7a+Hz0xA/RVC9QoZ0gYdOJPJqnKP+geVrgbquOXxi/NkVeAN0Zu3Fn8g4eWM9S
         xOKi1bSUrZsiLySeBMqJQuhIOixH/S+3HRF0snB+GNHgoVHsCuucqnUaDiurTh/JR+Lt
         m2Ha4tff4AvkxsDn5vvNXVaphhdPJKLLZ6CNwj5bb26ChgXh/SltSRA9zg0Br/QOyYil
         7SkQ==
X-Gm-Message-State: AOAM531hLdynP08if66u+mkhvQ/S4ro+krWe9aMYHdUEtF4hX/ITt5B6
        5FMB1AuVx88448QXiYd3Rws=
X-Google-Smtp-Source: ABdhPJyOmYwF9Id6mbrkyH3Esv4bGEUBzv9uDe9HT13fBibOHw/90OO4CkX8gxUnjkiPmnr+gmYbhQ==
X-Received: by 2002:a17:90a:e381:: with SMTP id b1mr5781174pjz.218.1596676519021;
        Wed, 05 Aug 2020 18:15:19 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id a13sm5170877pfo.49.2020.08.05.18.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 18:15:18 -0700 (PDT)
Date:   Thu, 6 Aug 2020 09:15:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/18] gpio: uapi: define uAPI v2
Message-ID: <20200806011513.GC11890@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-3-warthog618@gmail.com>
 <CAMpxmJXocdDTvC7_76UwZ9FONn86p0MjZtorRKTR5bxN7PJy6g@mail.gmail.com>
 <20200805051853.GA122005@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805051853.GA122005@sol>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 05, 2020 at 01:18:53PM +0800, Kent Gibson wrote:
> On Tue, Aug 04, 2020 at 07:42:34PM +0200, Bartosz Golaszewski wrote:
> > On Sat, Jul 25, 2020 at 6:20 AM Kent Gibson <warthog618@gmail.com> wrote:

[snip]

> > > config, info, info_changed and event structs receive updated versions,
> > > and the first three new ioctls.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > 
> > Hi Kent,
> > 
> > Thanks a lot for your work on this. Please see comments below.
> > 
> > One thing I'd change globally for better readability is to have all
> > new symbols marked as v2 - even if they have no counterparts in v1. I
> > know libgpiod will wrap it all anyway but I think it's still a good
> > way to make our work in user-space easier.
> > 
> 
> Fair enough.  Oh joy.
> 

Given that the intent is to highlight that the symbols are related to the
v2 of the GPIO uAPI, and not the second version of a particular type, it
makes more sense to me that the v2 is placed adjacent to the GPIO in the
name.  e.g. gpioline_flag_v2 would become gpiov2line_flag.

Does that work for you?

Cheers,
Kent.


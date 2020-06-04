Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F001EEE41
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 01:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgFDXav (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 19:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgFDXav (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 19:30:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B202C08C5C0;
        Thu,  4 Jun 2020 16:30:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v24so2832640plo.6;
        Thu, 04 Jun 2020 16:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=FW/OSHxQdI7/2m/YvmIaaghDq0GfzNoQim9YGqjpp98=;
        b=Bsum9bBGQ813p4UUMyqGsugEnLA2aXO2iIy6rghlmvZT3An4doO86c5BDoKe1Uttox
         Vte6W01nbTg/h5Nwo6MgcagBtu1NMhx/dOGDhXNdimkRrKwA3kQQcLFZvv/DmZ/vyIih
         DMfqxDy2SETdmXJnYkdfXdmOvkAQg/5Ud7Ye15Uvgy1gou6dkgkFOkDbNdxtvxPlSk0x
         j5ae+rBaiF27idd56iqEcgev0A+Ul9ykJu7PamUxJVHjJBZs5SVHG8k78pEDcisGnLHS
         v1SqCyXla1qFO9yGQvArtuRW/N/PjPBv6x1yWItZP98huoQECaIgHX89amV54UTj4Jt8
         twMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FW/OSHxQdI7/2m/YvmIaaghDq0GfzNoQim9YGqjpp98=;
        b=U6FSLiGFVAOgtvMo99/MJdAu6BXIv5yjOrkHp76/fNa4zxpAToK0UIBNAyiKVhUV6q
         s2ScJDw7JBZPc2D1fH0jENXl0sYXIUFOsT6CnCmINFy9LrPQJWM/fvEsbhLJBdqARYVJ
         g5ZqxV7DwT96PuI5Ti/JpACVXRYEDhrNdnUz3X/Buu+XDN9+xbP0hb3tV/aX8kOFFAsK
         mHuCvvLd16Qh5QTxtLM++Lqew2pU0MCBYRdO2OQWVOCaeS4WpJFORiAKrOlahLLiJ6pw
         k3Lyi3fzLyKUJXArpPuDspfLhfs+oM5m8pwLNKv1YCEGOWhIhJrmkHEYl9PJfv/9YKqa
         +upA==
X-Gm-Message-State: AOAM531oAIW5FrajLoyVAgvT2ln8t0w41n/bumBCp/nPsap6IcqXW1I7
        jwT8ixqAMa2/6tAX0CmFN2Q=
X-Google-Smtp-Source: ABdhPJxCDYqfuUpsDs9juooBXwU2cchNCjv1+vWP1A9yFPhp2jPQbk9dmqvnwMkeR4Uo5myoO+xoQg==
X-Received: by 2002:a17:90a:2647:: with SMTP id l65mr8818004pje.20.1591313449618;
        Thu, 04 Jun 2020 16:30:49 -0700 (PDT)
Received: from sol (220-235-66-207.dyn.iinet.net.au. [220.235.66.207])
        by smtp.gmail.com with ESMTPSA id l3sm4775015pgm.59.2020.06.04.16.30.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 16:30:48 -0700 (PDT)
Date:   Fri, 5 Jun 2020 07:30:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: split character device into gpiolib-cdev
Message-ID: <20200604233043.GA8913@sol>
References: <20200602141048.1995-1-warthog618@gmail.com>
 <CAMpxmJUjYn5SHg3BpCeKbYc_OpCjd8d943yfYL_TF15wyTenfA@mail.gmail.com>
 <20200604141804.GA5050@sol>
 <CAMpxmJXyVO4unLQOzC0xf47CTmK6VurTk+Q=9RDWhcP0pu73pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXyVO4unLQOzC0xf47CTmK6VurTk+Q=9RDWhcP0pu73pQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 06:22:43PM +0200, Bartosz Golaszewski wrote:
> czw., 4 cze 2020 o 16:18 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > >
> > > Is this comment relevant for the character device?
> > >
> >
> > True - that comment should stay in gpiolib, and gpiolib-cdev should get
> > one of it's own.
> >
> > Any suggestions on how to maintain line history?
> > I know you can trick git by moving the original file into two new ones,
> > then moving one of those back to the old name, but not sure if that is
> > what you would want to see in a patch.
> >
> 
> People don't seem to care much about this in the kernel. Files get
> moved and git blame results get lost all the time. Don't stress about
> it.
> 

Oh, ok.  I guess that explains why I couldn't find any examples of how
to do it in a patch - I had thought I wasn't looking hard enough.

There are still a couple of commits in gpio/fixes that will conflict -
are those getting merged into gpio/devel any time soon?
Or is there another branch I should rebase onto?

Cheers,
Kent.

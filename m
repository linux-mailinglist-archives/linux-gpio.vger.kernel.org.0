Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F0627AA64
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 11:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgI1JLW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 05:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1JLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 05:11:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA33C061755;
        Mon, 28 Sep 2020 02:11:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so275072pjb.4;
        Mon, 28 Sep 2020 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiEI44lVQql3CV00anMbhOQHPESlcWHyF66pXqicaoQ=;
        b=aasVp887UK0+pu3XY9sdoB11qRDafaGklbzs0JAIQ+p5WCp2TNLpvyyZhgBjSM27Eq
         fI1Dzl3XlyIlZsWMoNivjoWW1a1M67/+iycWqLTR2/+V1rM9GDKEhnN7tDL9+s2wB3bi
         eDdkEiQu0qalqs7JLDDA9LpqfIDQ8ePI5rfc/tfVlVY9aozHsESsGWHuq4/IHV6tg4DX
         qN9qIwu4zirlwrmNnXwHU3t+aeiVcqsNF8DMCKx8rrvaGWNo+PV7GmrYkTiTfbEUWsOc
         +qQrk/4mNCO/Dk/B12yMe1w0GvErIjEkR02Laj5d5XqVqKwKScj1dErHCef42thnYHju
         DhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZiEI44lVQql3CV00anMbhOQHPESlcWHyF66pXqicaoQ=;
        b=exaCOXEU6Hu5O5GoYYzBxiNSqX9aHgsKjOhl18xwF29Q9dnWlld2dLs1TxjWuTFJX8
         YzOC7qQvsed9OYMFrqD4C6fM5wt+7S+rweJJXh9j5UNb27fuVXibCrvoHLVP+IHwefrI
         Y1jD4YdMKEGc1TqwCAhOMQA1Lj782gFQ6L5LLYpqUP7A5PXQFkRwhExUv5GVuPgC48hT
         MSLcWS2XTsPqn76K7i9cqEVWB8LdVRiMSCuLw9XSqkGS2/hC9tA8yTR/9Jm4ANsmzDfU
         iUkC+43FTeQ06MNiSqIQR/Ij0kMKcJXbRBlA1V2oLvN4LE+JZYYFWn61VIcIS0sV5q2+
         7eAQ==
X-Gm-Message-State: AOAM531sy7lZJRRQv78QyIxuLQ9b3JjugedfZHmwvs+l9BAmC7S9AFtz
        R76qx8TodNA4o27bIWxVWPPuLZJ/uNbnIvzGgdc=
X-Google-Smtp-Source: ABdhPJy+VIGI1poKYp14uXMKvEj9HZSaqqhzHFFJP9v3EK+X9zHUaL/bj52Swb/V1SYklh/cFgA2kviSVoJjDECW+U4=
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr431011pjb.181.1601284282032;
 Mon, 28 Sep 2020 02:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200924113842.11670-1-brgl@bgdev.pl> <20200924113842.11670-9-brgl@bgdev.pl>
 <20200925090329.GZ3956970@smile.fi.intel.com> <CAMpxmJWBSwofFy94mHZWB2mdvHGStYp5oLDZp2M+wO57t40HSQ@mail.gmail.com>
 <20200925123000.GD3956970@smile.fi.intel.com> <CAMRc=McfBLaE=N12z29JjTDJ0ABzC8OW4rPWeeSU82kag+9pgQ@mail.gmail.com>
In-Reply-To: <CAMRc=McfBLaE=N12z29JjTDJ0ABzC8OW4rPWeeSU82kag+9pgQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 28 Sep 2020 12:11:03 +0300
Message-ID: <CAHp75Vd9N+OWCq_M3U3RfTEwx+xCyJHzSpZOXWiXQRRdv3tSDQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] gpio: mockup: use the generic 'gpio-line-names' property
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 11:45 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, Sep 25, 2020 at 6:41 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Sep 25, 2020 at 01:40:10PM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Sep 25, 2020 at 11:03 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Sep 24, 2020 at 01:38:41PM +0200, Bartosz Golaszewski wrote:

...

> > > > > +             kfree_strarray(line_names, line_names ? ngpio : 0);
> > > >
> > > > Perhaps you may check for NULL pointer in the kfree_strarray() and drop ternary
> > > > here?
> > > >
> > >
> > > I did in the previous series and you told me to not to. :)
> >
> > Hmm... What was my argument? What was wrong with me? free() should be NULL-aware.
>
> Well, it is - your just need to make sure ngpio is 0 too. :)

Do you really need that? If you have NULL as a first parameter, the
second one can be anything.

> I'll revert back to having the NULL check.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59592317A9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 04:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbgG2C2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 22:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731062AbgG2C2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 22:28:21 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59EFCC061794;
        Tue, 28 Jul 2020 19:28:21 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t10so5769076plz.10;
        Tue, 28 Jul 2020 19:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w5wshDDSYg1LYpcAUeQIV+9c4+ZcOe7Ex7p3INomeN4=;
        b=F2LZlYX76zy/c5Rrzvh6td9p/UFAQUEFskEcInNrz4Pf/kKNmvsvRXxT0eoYjQQFev
         GsWqN0kUqnPlvQJFX4XkoXo4FBeAXrzpw6iHCf//YuaaYCTEHXsjqgklSnAItMSvqgGK
         5hxnp24WScuCn154vv7d5xdc0BwyBCsVw2HE1irv/GqZZPSBA5gmV5+OApoNYSEdpqg+
         9I4DKy22Dkek4JHojU3qZMnYFLhtH8N3dRWu2mw+i3CkxBrIARktiNOJKqfrM+N3ErIG
         pUPx88kpFf5f0KSZCyAjcKFfpK1bWwFJooeRQ2k+G6PfYMPJZql1rY7cINH2KiHHR4aQ
         GHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5wshDDSYg1LYpcAUeQIV+9c4+ZcOe7Ex7p3INomeN4=;
        b=qBZzt1bNiOewZC2hyxNWkW6j+uSfWmxJZFNAPWI5xh8/3XGMBX+YlHsaz6lFzp6xAR
         UTxP4D1+X7d8X9Drp+ydoZlj1lkr/yVj7sSHtmKHY8COjuwn20YEwwQrTAnWBH3iw/WK
         mkLMgrbli156x7p+409aBo1ZqyyK8bFYsmu1h3/tb/R2DcSydan4ICRBn4rgu8pvWwR5
         fJ8pJkQwJmGbeJZHmTvGqTjQ+9eaDzcyidZSaq04gy3QZxwIpnLwkUhZ/mC2THDnlaYm
         7pJpcSeWIoA7/vBpQVgELc7qXzWc5llFur6NZsT1bSwLfzggjI2jZLy2tMPAFFoqOcEg
         2KUg==
X-Gm-Message-State: AOAM531rYUz6Vlgr4qAduHl5o2OspRqa/9MqNaUU28emNaF5jWbpwImc
        m5HXBgPlc49lop08P/JwbLY=
X-Google-Smtp-Source: ABdhPJwBOPLslwkb0ySS95Ox36T31XmpkjOr+NNmYZvlMknV5I1h3TMHPpse4NorHh5CiHRvsZ19Vg==
X-Received: by 2002:a17:90a:8c91:: with SMTP id b17mr7641252pjo.74.1595989700830;
        Tue, 28 Jul 2020 19:28:20 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id v11sm364987pgs.22.2020.07.28.19.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 19:28:19 -0700 (PDT)
Date:   Wed, 29 Jul 2020 10:28:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200729022814.GA1750878@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726011244.GA6587@sol>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 26, 2020 at 09:12:44AM +0800, Kent Gibson wrote:
> On Sat, Jul 25, 2020 at 11:51:54PM +0300, Andy Shevchenko wrote:
> > On Sat, Jul 25, 2020 at 7:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >

[ snip ]

> > > +                   test_bit(line_idx, (unsigned long *)lc->attrs[i].mask))
> > 
> > This casting is not good. What about BE 32-bit architecture?
> > 
> 
> I agree the casting is hideous, but I thought the outcome was correct
> as it is manipulating addresses, not data.
> You think the address of a 64-bit differs based on endian??
> Happy to change it - but not sure what to.
> 

You are right - using bitops on u64 is problematic for BE-32 - the 32-bit
words will be swapped if userspace treats the flags as the u64 it is
defined as.

I'll rework that for v3.

Cheers,
Kent.


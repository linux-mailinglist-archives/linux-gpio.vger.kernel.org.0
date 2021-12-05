Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159C24689DD
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 09:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhLEIO3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 03:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbhLEIO3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 03:14:29 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E385EC061751
        for <linux-gpio@vger.kernel.org>; Sun,  5 Dec 2021 00:11:01 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id e3so30024124edu.4
        for <linux-gpio@vger.kernel.org>; Sun, 05 Dec 2021 00:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eFOKFsG7bK+3U2HPhrs3B7QxCunJHugKrtQkwrA1kg0=;
        b=sRk2x8Yd8OB9XmewWtAmaz5od59gGkUfBCpvIMtGq9RzsQW7kIY/TyM4MOWMA360Tq
         MjqXMVe9wZe4CLLQVgCGgmqx/VfEnOmg+6UdTkb3uz/Rx2J6ligCjB/VC+RLoQ5vyjxW
         cFOoBvmwweWT5jKeRkgIEJo6rdeQMZjlnCV+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eFOKFsG7bK+3U2HPhrs3B7QxCunJHugKrtQkwrA1kg0=;
        b=CXihCDR3U4TXS5UeTc8P20z3stWlqaw1jc67dpBTiJiG6XaRXwLcl/eXN6sJt/useY
         rr95I5YLmX+1PPd1jpdEagvLEYA1IhbZjzE7oZQ9rLyV2w47jO1ziTj9VV4Ucb5e0cT5
         LWhdhPNSZQJ2eZoDXjbte/lvnxaGMjpQjmdyXjwoBl7eX17wn3j5ocl5rsfiZ9k36xhp
         TorTRwIYZv8xdO+ky1wVIfX2fyP5WTECYwrZPuCp45GvoRd5aZ9ESUckyzmrpRmUPiU+
         i1vhpTdmU1/pdgofguuVDA58MapXMrd9fNJx3eZvoDmNkuLRq4DiaxjDJp+P2Xb4Igze
         DCUg==
X-Gm-Message-State: AOAM5339mLwim7cVLow8cNJ0hRxomZJu3UcWZ+MLzqFx1iUZzHonezHh
        2mjPNtytfjTTL1BgA8U3wMvS/DHpAflnNw==
X-Google-Smtp-Source: ABdhPJzKHXCmSpWmU0pdGuOH6G/H2dagMZQCWqTiUyDnh/rB1mxGTcvhzWM+r2Wrz0uUO4mjGOjvAw==
X-Received: by 2002:a17:906:a08d:: with SMTP id q13mr36462501ejy.465.1638691860482;
        Sun, 05 Dec 2021 00:11:00 -0800 (PST)
Received: from karbon.home.net (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id t5sm5481849edd.68.2021.12.05.00.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 00:11:00 -0800 (PST)
Date:   Sun, 5 Dec 2021 10:10:58 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid
 context
Message-ID: <Yax0ElWLg3N4qILU@karbon.home.net>
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-12-05 01:18:23, Linus Walleij wrote:
> On Wed, Dec 1, 2021 at 10:40 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
> > [ 1674.787685]  ___might_sleep+0x148/0x180
> > [ 1674.791572]  __might_sleep+0x54/0x90
> > [ 1674.795195]  mutex_lock+0x28/0x80
> > [ 1674.798556]  pinctrl_get_device_gpio_range+0x3c/0x110
> 
> There is the error ^
> 
> > gpiod_set_value() is supposed to be usable from an atomic context, so this 
> > appears to be a bug. It's probably been there for quite a long time. I 
> > suspect OPEN_DRAIN isn't very common, and I think this might be the first 
> > time I tested this driver with this kernel config option set.
> 
> Nah has nothing to do with open drain :)

OPEN_DRAIN is regularly used in single wire (1W) bit-bang drivers, so no, it 
isn't related to this flag.

> > Any suggestions?
> 
> pinctrl_get_device_gpio_range() needs to be modified to not take a mutex 
> because mutex:es can sleep.
> 
> static int pinctrl_get_device_gpio_range(unsigned gpio,
>                                          struct pinctrl_dev **outdev,
>                                          struct pinctrl_gpio_range **outrange)
> {
>         struct pinctrl_dev *pctldev;
> 
>         mutex_lock(&pinctrldev_list_mutex);
> 
> BLAM!
> 
> And this definitely needs to be called on this path so no way out of that.
> 
> This mutex pinctrldev_list_mutex is there to protect from devices coming and 
> going as we look for devices with ranges on.
> 
> One way to solve it would be to simply replace it with a spinlock, maybe that 
> works? (Check the code carefully so there are no things like calls into 
> drivers that may fire interrupts etc...)

Have not seen the code in discussion, but unless the spinlock is taken for a 
really short period of time, an alternative should be used.  I am not sure 
refcount would do the trick here, though.

> If it still need to be sleepable (mutex-ish) you need to convert it to use RCU 
> I think? (Which would be pretty cool anyway.)

Yeah, this might be RCU-able and, if done, will also make Paul happier. ;)


		Petko

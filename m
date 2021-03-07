Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFAC33043F
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Mar 2021 20:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhCGTYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Mar 2021 14:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhCGTYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Mar 2021 14:24:19 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E639FC06174A
        for <linux-gpio@vger.kernel.org>; Sun,  7 Mar 2021 11:24:18 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id l2so5000164pgb.1
        for <linux-gpio@vger.kernel.org>; Sun, 07 Mar 2021 11:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UOFHztsb7GNvixK/1TIj8OHF7/yf3wR6h4EXZRdMIks=;
        b=VaSIJ9N5Nd+/72Bb+FG+/VUhQWjbjCiehtVpOLJGVwe+RKuwlj8/C5lXabC3piCyOd
         tTDsqDe5DEq5k41tq/c8I3uYRmB52LF7S6/vkm08nUs2oe2EJYzv3vQ74PPnJzE1t+HR
         PfG55fn6ue2cNWjkqyHa1J/bNpiPY6Q/LHk0ql3iESEOZFkWMzRWsdE5nAH9IvnRzdaN
         X9axVD1KUOPu3SDvMUejcNcI8xkcFGf+pvnE5QZW4V0RDGaD8u1Yz+oqZhLQw13zcgpt
         X9XhO2FHdaF35+A6CHDVGaQVh1adDEUIiKYSGhWaBNsqFLUCxPO1TIiez5gJSroYVMdj
         ZCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UOFHztsb7GNvixK/1TIj8OHF7/yf3wR6h4EXZRdMIks=;
        b=bGsiY53I1gkUT4ayhQpOWWDCxzciMfOSx0TnpERLe6xE7OMseVappLdTnUoJKfg0Bk
         ozQgha7ieyRo56l6NXN5fs4ZAWkZ5/YCvpQ5naeyIcdzK02Uh/iOC+guZTRd1ln/fPxC
         ykizr9rqBNXjyn1narQSX2nO7pu9JlEHBvsW6vfPrm/8CkXexVB7nIERbAlzBYv/OSHe
         CFQT7iFTjiLu00eMrJyuyA6oWFgVWgQaO+6Lphzr1JI73MxSgKAzCfQQeOHZc6fwSib3
         0qHjguJBQIo9J9HY6958qkUJ5S1f+QbdhjiLm3tT/iiEWaA4zOj0DXlVDNSMT9gzp2ku
         NUdw==
X-Gm-Message-State: AOAM5303xNnZJpijfZZBxLwbjkJ8zYTUp+MyK6+5gY1M30pmWp+Ifmvn
        MlyMzCGS3b/YoItbnYIRTwQkDYizxtYDOOrm7Ps=
X-Google-Smtp-Source: ABdhPJwmYH1CuF5RYvrYWkfE4QulVrwiMmgYoemCtjonHLcoa0RXZK73StEtiNIZBxjgvzm8IMW01/UYwMdi5Q2870Q=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr2623845pfb.7.1615145058395; Sun, 07
 Mar 2021 11:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20210304201119.702637-1-sander@svanheule.net>
In-Reply-To: <20210304201119.702637-1-sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 7 Mar 2021 21:24:02 +0200
Message-ID: <CAHp75VcufEB+Y12ik9Me8TJesnqnN46b-fN-EhQDSeqk2fdEBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sx150x: support building as module
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Gregory Bean <gbean@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 2:57 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> The SX150x GPIO expander driver, and the subsystems it depends on, have
> seen some development since its initial introduction. Let's add some
> extra bits to enable building it as a module.
>
> Build tested on 5.12-rc1. Run tested on a MIPS device with OpenWrt,
> kernel version 5.4.101, to confirm unloading/reloading works.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> This is the first time I've attempted to create a driver that can be
> built as a module, so there's a reasonable chance I missed some things.

Indeed, see below.

...

> -#include <linux/init.h>

Nope, you have to leave it. See more below.

>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/module.h>

(This is correct)

...

> +module_i2c_driver(sx150x_driver);

Nope. You have to leave below.

> -subsys_initcall(sx150x_init);

subsys_initcall != device_initcall


-- 
With Best Regards,
Andy Shevchenko

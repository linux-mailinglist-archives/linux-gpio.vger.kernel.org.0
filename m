Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A75AFAADC3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 23:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389595AbfIEVWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 17:22:50 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37935 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389217AbfIEVWt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 17:22:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id 7so3200834oip.5
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 14:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0cnbIe9gOrVh1+4RkkZfV9Qd5QUru6V45yI8RpWai/8=;
        b=qkfY1RHmC0HXVV7rdeAxcYiehIobG/GcIronToTit69rNaaxHGqwI/fTATB3KGHvqS
         vHNS8G3rSxGqHySXT6G3ZnvXYCASkn4hXvA+pixRd0oRgN//vWZB6pTBKgJrBHeriVzb
         Gtde4YtMyRNQiHzXFEEAbBYXAgcGIcJ0pFwEVx9JrJCrlgdWIsCDno8BaewSq89w5xsV
         ELPdXxsk//UIrSKshd/BiP6PC3g8e/nVUsPQNicIk7DYPHUKQhnX6LtqemAOiOJ1IrL6
         bzvySMjdrcLEPpwPfgd3c9Z/AA+Cn5T9EE+PeDbufphShquNdXiS96M/tOh4UpweeHDc
         UGtw==
X-Gm-Message-State: APjAAAWEe3ohfNtMqYfv6g6v05HLr66qaEJWHzXfmjPXEru73eVL5Cxv
        ekuXmRlScawx+arCWTEmK+X3YJVD5vZq2YixS6o=
X-Google-Smtp-Source: APXvYqxUFV8ck46RpfqtTps76vq4uobOYk6Gk9i7/v/Z4/Vm8k+OVUGjM+fSqUo+Xt+2KOSpWO01hG1J3pk+ScP7Ejs=
X-Received: by 2002:aca:f305:: with SMTP id r5mr4268871oih.131.1567718568491;
 Thu, 05 Sep 2019 14:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <201909052108.b1uElYhb%lkp@intel.com>
In-Reply-To: <201909052108.b1uElYhb%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 Sep 2019 23:22:37 +0200
Message-ID: <CAMuHMdV75ng-w5KoDAt8=yp0gO=DAU-u9HCy+ydPu+pS9HZhGw@mail.gmail.com>
Subject: Re: [gpio:devel 53/53] drivers//gpio/gpiolib.c:1402:2: error:
 'status' undeclared; did you mean 'kstatfs'?
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 5, 2019 at 4:04 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel
> head:   151a41014bff92f353263cadc051435dc9c3258e
> commit: 151a41014bff92f353263cadc051435dc9c3258e [53/53] Merge tag 'v5.3-rc7' into devel
> config: x86_64-lkp (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-11) 7.4.0
> reproduce:
>         git checkout 151a41014bff92f353263cadc051435dc9c3258e
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers//gpio/gpiolib.c: In function 'gpiochip_add_data_with_key':
> >> drivers//gpio/gpiolib.c:1402:2: error: 'status' undeclared (first use in this function); did you mean 'kstatfs'?
>      status = gpiochip_irqchip_init_valid_mask(chip);
>      ^~~~~~
>      kstatfs
>    drivers//gpio/gpiolib.c:1402:2: note: each undeclared identifier is reported only once for each function it appears in

Looks like the merge resolution in 151a41014bff92f353263cadc051435dc9c3258e
replaced "status" by "ret", but forgot to update 4 occurrences.

Note that it's still broken in current gpio/for-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

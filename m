Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDFD22E315
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 00:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgGZWWn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 18:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZWWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 18:22:43 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B3AC0619D4
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:22:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m15so7287683lfp.7
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=THzlRqgN0rjUHiAQzqk5KhSMHf6FYVohjt3FnajZbYY=;
        b=xgKdjra2/4+RInKaf0aGHk5SxaDW9Tyrest156u/U0OFV+DJgAsYR4dystOdKs+D66
         4IeXMJLIvhADs010gssRPGW+q6hQ8Ln16U3pPkXi1PrYG2FtHJnQyCOl3/4z0g9dLvqC
         jP+ipH4/XH6XZZ8JsPUTuq1F2QPsTJrxV2H8PnY0Jfz+IoIjQBXTXN2RxGcS6xQdRcJ5
         0Yo6IPFgd6rjGcKpElh3zHPDRD+oFv7x0O1qOJxJUFFcKAko6crufHjGJA9yQORcwJE6
         x2T5dBdzV+KjCTdXpouvhOxpwpeBG9+oHbycLFuC8ZHfzjbUSgARedRYyqGUhzzlU1DG
         yYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=THzlRqgN0rjUHiAQzqk5KhSMHf6FYVohjt3FnajZbYY=;
        b=Vg5G6M8sh4KJxz2WQd7S0HCq3A/k2AhoLr5xGxUFiQmyCwrB6+s0w70XG4Ib0heRI6
         Pf+Ldh92VWcmbwluO3k/gd10IHf3OL8HrVqCbeU+qGkzwpc5ZGIPOFnSas4KcGSuo9tI
         bteCL00QvyWdzsYl15qq08lWRGqFAZ4CeHnjBQM06zmOiaxZscL5FsVdb2gKv+Ils/Vq
         Cm6x8YG0h4E8H8fLQ9EXxZMC/tGkLsywPEKKqJjS3RFfp5pzDwdaHN8xB4AdZme7ngN+
         LidUSX9b1iTE0isSf1dfUbp8WjsJt2XVUICaLBO7Y3gJkdFK0IE9Y+92revggphkLvIR
         Q1yw==
X-Gm-Message-State: AOAM533yRi1tbdOXYKqjGiRA9LJ4Avd5ORgDWBLL0O0VOk0095a6BmRJ
        nQQb1ki8al8BW1PFVYLJKCAaljDx/ZXAcZXRAj0Lig==
X-Google-Smtp-Source: ABdhPJxBOcrrdKBlfifvmb9beDuuI3k1zaBpTO89UwsFWSHiX+VtagPfGhMO2OwGzI0vOxcg+ZKMsrUmtwlzVcChOzk=
X-Received: by 2002:a05:6512:3139:: with SMTP id p25mr3156807lfd.47.1595802159850;
 Sun, 26 Jul 2020 15:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com> <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
In-Reply-To: <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jul 2020 00:22:28 +0200
Message-ID: <CACRpkdZarVTeBbSqZ-N6iGC4fj2-tdtfxuuxJO=YvO29-uHAuA@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Marc Zyngier <maz@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 1:03 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:

> According to the DW APB GPIO databook it can be configured to provide either a
> combined IRQ line or multiple interrupt signals for each GPIO. It's up to
> the platform which of those signals are connected to an embedded IRQ
> controller. So I guess theoretically the array values can be sparse.
>
> Anyway now I see it's rather problematic. I didn't forget about the sparse IRQs
> array case. I just thought it would work out-of-box. Before getting your comment
> and digging deeper into the IRQ subsystem I had thought that it wasn't a problem
> passing invalid IRQ numbers to the irq_set_chained_handler_and_data() especially
> seeing zero IRQ number was supposed to be considered as invalid. That method shall
> just ignore the invalid IRQs since the method irq_to_desc() calling radix_tree_lookup()
> will fail to find a descriptor with invalid IRQ value and return NULL. So after
> getting a NULL irq_desc the method irq_set_chained_handler_and_data() would
> have stopped setting the handler. But turns out it may work only for
> CONFIG_SPARSE_IRQ. If that config isn't enabled, then a very first IRQ
> descriptor will be returned for zero IRQ number. That descriptor will be
> initialized with the passed parent_handler callback, which isn't what we want.

Ouch but different beahviour on the outside of the irqchip API depending
on whether IRQs are sparse or not on some particular system seems to
be a problem with irqchip reallty, if we wanna get to the bottom of things.
(paging Marc)

> So in order to fix the problem we could follow either of the next paths:
> 1) Just make sure the passed IRQs array is not sparse for instance by remapping
>    it to be linear.
> 2) Move "if (gc->irq.parents[i]) irq_set_chained_handler_and_data()" statement to the
>    gpiochip_add_irqchip() method.
>
> What to you think? Linus?

What about (3) fixing irqchip?

Else (2), making the code inside gpiolib be careful and skip over
invalid IRQs.

Yours,
Linus Walleij

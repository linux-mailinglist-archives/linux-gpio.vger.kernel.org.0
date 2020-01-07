Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A4013229B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 10:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgAGJhP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 04:37:15 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44204 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgAGJhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 04:37:15 -0500
Received: by mail-lj1-f193.google.com with SMTP id u71so53964198lje.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 01:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EjaL6TQQ67z3Hiza8RIJBFEWpIcxuINQkeVUEw4p0bg=;
        b=TlO9sELlXVwO6vHRNSdRj0yMgj7w5fcPcrhI59kz1i5xLmAPlByZzg6ceNKc51aFD+
         z/ouDTFq9LN+RS6pHBrLleeFSV7kRH63Lqxr+sI7XG6VAeejnpmn3nxdPDv4qr5jfNtj
         xNMAZVGIk56yodRwLq+KV1Ug7pVQIAG9DqD7F5AEM8NR+u1tdqp50WhSNyBxxPExIWt3
         lBAGD5mSE5KkTla33goZBBg9B48WcRu95LEtmO6m/HMyHoVrsTXsfDzlKabFaSJ4+BaH
         9dKIj+sF58tbGXkIgJPiMDbZ38NISl2YLtQdl1pn0HasmP0uM0FAEVd28rvFEYbkkysI
         tzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EjaL6TQQ67z3Hiza8RIJBFEWpIcxuINQkeVUEw4p0bg=;
        b=r+AoMO9yd1Sj5WHruPt7ctODsCKidJKKynQf/Iuh4ee0lTI81fy9iCOiCDSyqhVENX
         aG6uSNIhTSIRPj//hJROCY2Zy2uIg5z/a+vrl84aIeKQ5yzhD209ErI+o3htNnyV4ifc
         lolwvhZ5agV5jgEKBZOWpZYPETw9hpBwu2+5S36hFxGIDHrX5zoGmkUCt6J+xiPgnFbJ
         bRu0eMAmTFSwBZhoRd8Y+DKJm9lfrRIaa0GLwRjIT8eXatuy7Z48CVHttJvawVxv034p
         zomgUJCZZYycsi9loXT3PKkgDTCrs2UG7aMMlP5u28hFe132c9kE8uvkDFguRBW6qW4q
         pkvw==
X-Gm-Message-State: APjAAAUy2JSxjFoGJRxCmf3q8vDbu/ZN2j2PXrnZb4ac/t6Cg15Tb7RU
        +lj93ZUkYueCUOsoEDSY8Sh00SA+3dUK5s9gCtEROg==
X-Google-Smtp-Source: APXvYqzB2j28WO/M2d32CA7lzxO2yvIBzwHpXUuZ9BN186aaxvzkAOxXfE5Y252VvGFkaL9F8nV8CDYVZ4plw7vK3w0=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr60204347ljh.42.1578389833544;
 Tue, 07 Jan 2020 01:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20191218132605.10594-1-baijiaju1990@gmail.com>
In-Reply-To: <20191218132605.10594-1-baijiaju1990@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:37:02 +0100
Message-ID: <CACRpkdY4JsvOsjQvB=hb=QPV=bLXkC3ekmPUXFiPMnj1NK-Jtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: gpio-grgpio: fix possible sleep-in-atomic-context
 bugs in grgpio_irq_map/unmap()
To:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        Andreas Larsson <andreas@gaisler.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 2:26 PM Jia-Ju Bai <baijiaju1990@gmail.com> wrote:

> The driver may sleep while holding a spinlock.
> The function call path (from bottom to top) in Linux 4.19 is:
>
> drivers/gpio/gpio-grgpio.c, 261:
>         request_irq in grgpio_irq_map
> drivers/gpio/gpio-grgpio.c, 255:
>         _raw_spin_lock_irqsave in grgpio_irq_map
>
> drivers/gpio/gpio-grgpio.c, 318:
>         free_irq in grgpio_irq_unmap
> drivers/gpio/gpio-grgpio.c, 299:
>         _raw_spin_lock_irqsave in grgpio_irq_unmap
>
> request_irq() and free_irq() can sleep at runtime.
>
> To fix these bugs, request_irq() and free_irq() are called without
> holding the spinlock.
>
> These bugs are found by a static analysis tool STCheck written by myself.
>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

I suppose this is correct, so patch applied.

However there is a deeper problem, this code was added by Andreas
Larsson in 2013 and at the time this was a hacky way to deal with
an interrupt that is actually hierarchical.

Since 2013 we have gained:
- Hierarchical interrupt controllers
- Hierarchical interrupt chip helpers in gpiolib

So this code really needs to be modernized using a hierarchical
irqchip.

See for example commit:
aa7d618ac65f ("gpio: ixp4xx: Convert to hierarchical GPIOLIB_IRQCHIP")
for an example.

Who is using grgpio these days and could work on fixing this up?

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9CB262984
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 10:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgIIIFw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 04:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730244AbgIIIFh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 04:05:37 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13550C061573
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 01:05:26 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id d190so2219830iof.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2020 01:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kr7tk7pBL9RWjXr12RbXDnYjpfBjCIgfZkcUw/ec8fg=;
        b=cuMx0TU/UZ4k0CXHA2U90rTFin1dTzxjWfJ/sWLR/4/9aW88f+aSA5qyDML4tr6D7T
         zeaiHRr5QTTwlNWS2pDILfb8tIFDeu572WqhbGSkvqGjpuvTfrcQon0CG0NFKUqEselB
         lFReSUx2wbV/DTIA23TIwBnb8v9P50LCkrIZ03pYfnhw3tjHVLY+Iooj6SsMF9kW5NRO
         YGh1AAATncVuQOO/9gb0ZMmYq6E/+BUYchew27hs9v4gqJKvHCRDcIZvr9u0Ip9FTheK
         TmIdM7qWcHWJASyI5Co7YlGSR6NGe7aFONclOlYTtLlUDk2L5bs9A1AUZ9f0ZeCY31cP
         Ms0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kr7tk7pBL9RWjXr12RbXDnYjpfBjCIgfZkcUw/ec8fg=;
        b=UcDuBWysIPoERIUDUblsJapGiRx+pwF3/iFxYwjrgKgoqooHMQ+/qbmw2tB6zRcQYn
         Zddg5vgPxCV/jS7rYeqxEj441ylLGAtPV8Ak5f/suYsKNQ07b5/Qb37sx4CUsTrFCx4v
         0PYThMU5rG0YZVqlNy9vYoCy0yc9zwPRArROTCEsSFJpvydBD2g42CUvGbKzEG6recB7
         t91OPpqVS/FoaGSHyY2BRopSXX3Q9B2IR9ispfGCA6nkXJk1WaHBWJduQFUuWLGUbSa/
         zQJ3G8JI373l83RkXIWv/2v+7Rpk9gG+a8rSAHmwImgc+cLa7jWQ2aThVMM9V1nUFJ3z
         Uk5g==
X-Gm-Message-State: AOAM533ajuXn+6gYGhQYeVEaujsoq1ByI2jcjFV/GBhZdpeO5lfv9iUK
        OPvyEKMd2LClyK5cSJ4w9LJjBK1WeWB9A3UevYkXwA==
X-Google-Smtp-Source: ABdhPJwyHSSd/xO8EnxyCbBdA6VQdl6hevJZSNvQs05Zm0OwtQiudi/zoxGEx3dMNLpbIrN5fWGde8KjGZlMPDrj0eU=
X-Received: by 2002:a02:7fcf:: with SMTP id r198mr2939882jac.24.1599638725391;
 Wed, 09 Sep 2020 01:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <2572959.mvXUDI8C0e@waterstation>
In-Reply-To: <2572959.mvXUDI8C0e@waterstation>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Sep 2020 10:05:14 +0200
Message-ID: <CAMRc=MeKaSaajcariAqfugW6RGK=A1URZV=ir9BdGm-QubMKgA@mail.gmail.com>
Subject: Re: [libgpiod] Integer overflow in C++ binding on 32bit systems
 causes wrong event timestamps
To:     Florian Evers <florian-evers@gmx.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 6, 2020 at 6:52 PM Florian Evers <florian-evers@gmx.de> wrote:
>
> Hello,
>
> I found a bug in the c++ bindings of libgpiod that affects 32bit systems.
>
> Observation:
>
> Only the c++ bindings lib is affected. For input events, the time stamp
> delivered in the event object is wrong. Instead of providing a complete
> "system time", it delivers time stamps of of a range "-2.1"...+2.1 seconds
> (which relates to the time stamp range of a signed 32bit value, in
> nanoseconds).
>
> Cause:
>
> The bug is in line 219 of file "/tree/bindings/cxx/line.cpp":
>
> event.ts.tv_nsec + (event.ts.tv_sec * 1000000000));
>
> "event.ts.tv_sec" is of type signed long, which is 32 bit on my device. Thus,
> that multiplication to convert total seconds of a system time to nanoseconds
> causes an overflow.
>
> Fix:
>
> There should be a cast to uint64_t before the multiplication.
>
> Thank you for fixing this!
>
> Regards,
> Florian

Hi Florian,

thanks for the report! I see Kent already sent a fix - could you test
it on your setup?

Thanks in advance,
Bartosz Golaszewski

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C965B57A6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 11:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiILJ4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 05:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiILJ4b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 05:56:31 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7B2B1E
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2022 02:56:30 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b35so11948167edf.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2022 02:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=B0+OE8VXDoRTxh9i6eriGohbYVJR3cjU3m0gr8M6bQU=;
        b=kdvGPE8Of/ge0WhsAzI3BcvMQhAQVx75RN70Ut262Bd0Y3yYnZi7xnFEkfhhLXo0l7
         bKGrlGbIpWb1gj8dwAYucqHPJYmFcfcnWV8LMwBb6RjkgdpYopM4OUgpw0vSwAg7Qb5V
         Sq7DVuiSXE9+LcYQK508BZH18sqBFyFm1WVbHxmROdxPchBFVZ9DRxN/weMqu+LoWGW4
         OFQmzleFBpcTwUb/KCZ3F9k3i5Hw/6Yh8anVyyCNzWKv5j4JIop9Gw7ND9yEPDjBtF0m
         TdIPx5Bs5y+HwKXWy97L35a3199k5mZH/nNYibjkJOwkGVlvjHnyIbuXAlFMfqQhkC9W
         tPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=B0+OE8VXDoRTxh9i6eriGohbYVJR3cjU3m0gr8M6bQU=;
        b=L6iNseiedRPTUmV2AVqOLbZcLvEtxnHx7Ep8gEEIMAPPReCfG7s5zRfNIg5aDTPmLJ
         Z0xia6BP9skQn4t6nfZN87FsuWil4AW9/PGk3cQGtYdWwYNrSW7jDdrh1SjpfqMcsBUx
         WtEDBqSVoYOV4FKXjxwGJnWVzrx1VuSHAHYmaZp0W9GraTvlhvvyk7x4h3AZ506vozqY
         EcMlCV9hjLeQ6uYYP/BnWh1GswG8atTeUGxmlGtt9iGjYvHT8ask5tleJb7uDxcTgn9w
         TKXbdJBWuJVgmvQgJIRXtyzPOJ4NEqiL8gtkbQmawFGJDcooGaGI70pohI77GCfT6V6w
         4TIw==
X-Gm-Message-State: ACgBeo2tZOYG7NeZQKRpn2I/+PlHEnQq5/KwYIhFPexVPC/D0FYKBFn0
        lPNXrxzZZxzqAbKnaZNTpj25y3iqrYvqcxigOyyDgQ==
X-Google-Smtp-Source: AA6agR5+RvJMt7gLbYMaWFWPzBly7Pn1NpOVb/B5jQlouqfeTSIiY9yQvRKZxEHDImxz9p+HDxLGR3s+rlAoQFYgTQA=
X-Received: by 2002:a05:6402:354c:b0:451:d47f:653 with SMTP id
 f12-20020a056402354c00b00451d47f0653mr3272379edd.69.1662976588677; Mon, 12
 Sep 2022 02:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220909121329.42004-1-brgl@bgdev.pl> <20220909121329.42004-3-brgl@bgdev.pl>
 <YxykorLetCjAls/Z@sol> <CAMRc=Me46b+Fjz_AAbZZVbaELjY6NGVfNE6mwueiKRTpYe98rA@mail.gmail.com>
 <Yx8Bj0+4STpklMc2@sol>
In-Reply-To: <Yx8Bj0+4STpklMc2@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Sep 2022 11:56:17 +0200
Message-ID: <CAMRc=Me=QxXRgZKyirj23r4hEN9bzcPSM6N4z=0yGgAZheh=Qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: cdev: export the consumer's PID
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2022 at 11:53 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> > >
> > > My knee-jerk reaction here was to make the pid unsigned, as we never
> > > pass a negative PID.
> > > Keeping in mind that the existing kernel will return 0 for this field
> > > (the existing padding), so 0 needs to be excluded from valid PIDs
> > > anyway.
> > >
> > > Andy suggests returning -1 for kernel held lines.
> > > In that case 0 would mean "old kernel", while -1 would mean "kernel
> > > held".
> > >
> > > As libgpiod will have to convert the 0 to -1 when returning the PID to
> > > user-space as a pid_t, I'm good with the uAPI using 0 to mean
> > > "no PID available" for all cases. I'm still open to passing -1 for
> > > kernel held is there is a use case for it, but I don't see one.
> > >
> >
> > Using -1 sounds good but I've just realized there's a different
> > problem. A process holding a file descriptor may fork and both the
> > parent and the child will keep the same file descriptors open. Now
> > we'll have two processes (with different PIDs) holding the same GPIO
> > lines (specifically holding a file descriptor to the same anonymous
> > inode).
> >
> > This already poses a problem for this patch as we'd need to return an
> > array of PIDs which we don't have the space for but also is a
> > situation which we haven't discussed previously IIRC - two processes
> > keeping the same GPIO lines requested.
> >
> > I don't have any good idea on how to address this yet. One thing off
> > the top of my head is: close the parent's file descriptor from kernel
> > space (is it even possible?) on fork() (kind of like the close() on
> > exec flag).
> >
> > I need to think about it more.
> >
>
> I thought the O_CLOEXEC was set on the request fds exactly to prevent this
> case - only one process can hold the request fd.
>

O_CLOEXEC means "close on exec" not "close on fork". When you fork,
you inherit all file descriptors from your parent. Only once you call
execve() are the fds with this flag closed *in the child*.

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B273974235A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 11:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjF2Jja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 05:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjF2Jj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 05:39:29 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3AE6ED
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 02:39:27 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7918b56b1e1so166324241.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688031566; x=1690623566;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6uejqa9hDQzxJd+PZbUa/7rfuQsvj8USOoM54rTlT04=;
        b=4YkB7jWAIOmGhE+t88u5H9meTEIRSv2d4Ru3jIGckrYI7igkDRU/EK8k3UrtdnV//F
         bhbh+G/7t7F4M8kkNbRPGWc7IOrcz7A5uXakhXNU0OuPSbJZKQ9uhP4Y8GyI60msqKYG
         KNd+Frryp2vBTprirhLpN/6suiFYb0j8osp4y4Jdb6EtYCflbgaFtRsxnos+16uAtd+O
         DgZPGzj+DmWs4B0gwAQVGscbA3g2M3l1ur80b6bTzbw1MByNA54RIotqf7xUWriGKwA+
         NJ4WMUWC7it4efkOV9azIB2ELOsYIjT1oimR41MuVLp+TC24MxLt7AjHOZ4cZAMi1EnU
         IWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688031566; x=1690623566;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uejqa9hDQzxJd+PZbUa/7rfuQsvj8USOoM54rTlT04=;
        b=JWf4kiWdOhWVDEQxJ7jq3AgpB6VnHa6L7tM84+lSr49oYfRPKYt0GgWQ+ckFhQeM4N
         Vyf53FTZUtIDyncamkfviUD2qAzPPRYCPIXTMqAZb8AuhQCQ+HZhzwhXJpwSPfL0p0yG
         J84u5RpzuePQc4BPAy/jQqEmIb+0PL0B1aDhYgDm6UxXheHvh4orzm73y9CJCZHOIvJ/
         lQPFuhIBHV8znlgiwvV9khlu3vmgpwrOmpzCxJfpL+WDCleL0X8G+MovScrmGXajKI1+
         uj4Vo7eq5zq9AOIj3fFLNuPmiMDEg7+vmGYUl6psMkNi2i3QJzXxXiA3HzSazktoMVFo
         Qtbw==
X-Gm-Message-State: AC+VfDzsDkxul0oMy/YMVhf8Bf6BbrUtx1cfCWBDAk5flUkBjPwDjoKy
        T+b5jI/Q8TjGoeakAsnN0I6exVsYOP71BJshVOZXgoI9Bx40ykoj/bg=
X-Google-Smtp-Source: ACHHUZ5ZCrVrssMe5sGEF2FVfha57KTBlvTPhqTx36NN5X4j+CLa2X1Eka5rriTA1vHZ9pad2PmC4IZt+4Umnn1nJss=
X-Received: by 2002:a67:f24e:0:b0:443:6449:479e with SMTP id
 y14-20020a67f24e000000b004436449479emr6733167vsm.8.1688031566597; Thu, 29 Jun
 2023 02:39:26 -0700 (PDT)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 29 Jun 2023 11:39:15 +0200
Message-ID: <CAMRc=MczceSat_G5yO=DjDDePZ6mFSNF02-OJcBU6TzKQ+ne-g@mail.gmail.com>
Subject: Improving the hot-unplug event handling in gpiolib
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hey Kent, Andy, Linus et al!

I've been spending time looking at the gpiolib code and trying to
figure out all that's wrong with hot-unplugging code in order to
finally fix the issues that lead to various memory corruptions and
crashes (or at least paper over the issues enough to make it
semi-reliable at hot-unplug events). I did some experiments with
promising results but before I start coding for real, I wanted to run
this by you.

The easiest way to trigger a crash is instantiating a gpio-sim chip,
running gpiomon or gpionotify on one of its lines, removing the chip
from configfs (simulating an unplug event) and then killing the
program. This will consistently show up in KASAN output as a
use-after-free bug. The same can be achieved for a real-life example
with the cp2112 driver which exposes a GPIO chip over USB.

There are several issues here, and I also list some possible solutions.

1. Not waking up the poll when the chips disappears.

We should call wake_up_poll() on the relevant wait queue with
(EPOLLERR | EPOLLHUP) when the chip goes down to force a return to
user-space from poll(). This way, the current syscall will not be
stuck with a chip gone from under it and any sybsequent
read()/write()/poll() will fail the gdev->chip check.

2. Freeing descriptors and irqs after the GPIO chip is gone.

The GPIO device is gone after the call to gpiochip_remove(). Meanwhile
linereq, lineevent etc. are reference counted and are only released
after the last reference to their owning file descriptor is gone. This
means that userspace process needs to call close() on the relevant fd
or exit before we start releasing the resources associated with these
structures. This is fine for fields only used by the code in
gpiolib-cdev.c but for system-wide resources, we need to free them
right when gpiochip_remove() is called and "numb down" the cdev
structs like we do with the GPIO chip.

To that end I propose to reuse the blocking notifier in struct
gpio_device: let's add a notifer block to struct linereq (I'll focus
on this one here) and get notified when gpiochip_remove() is called.
We can now wake up the poll and free all resources that must not be
used anymore.

3. No locking for struct linereq, lineevent etc.

File operations only take the inode lock and don't protect any data
touched by the callbacks. I think this can lead to some still hidden
issues and especially when we start freeing resources when notified by
core gpiolib. There's config_mutex in struct linereq but it seems to
me that it doesn't protect all data everywhere and linereq is also
accessed from interrupt context, for instance in edge_irq_handler().

We should add spinlocks to every cdev context structure and take care
to protect all accesses correctly.

I'm sure the above list is not complete and other issues will be
uncovered as we move but it's what I figured out so far.

Let me know what you think and if any of this makes sense.

Bartosz

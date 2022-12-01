Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D4463F10B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 14:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiLANAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Dec 2022 08:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiLANAW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 08:00:22 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FA49076E
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 05:00:20 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d6so2356439lfs.10
        for <linux-gpio@vger.kernel.org>; Thu, 01 Dec 2022 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DqSDmVNHy2Q/xp7vUIn4GRUx5KsEEXqp4VrjsuGNq4s=;
        b=GWZ9/ieTuTI9IwJNdlzJl89iG/PxyDMcSExhXalcV/QL2salUZIyMHgVuMyAmujFIZ
         7TfnWtYgTRSwaIPoU+q9Uzn++kd+ROyDzS/HPmfAF+Ihd4kezoYVGzxj+eHmjRf2vNFM
         uA/pMvzS80Rr3DQf/FXdjzw13w5x35p5ON3Q7OBQq5Js8zWs7vxRMzFChOc/E4dfZ9Dq
         kLN9UDZ7b8zMJcYkHc4ccIbyqI8G5pfbXGZLZkeaJHz/nqiCYg7qtP/RWKdGy2OmKUF5
         T8n7FcIgOUAG1n7WEAKCv/5IDRxpK/aG6BgoHKiUpmTk19xLboFnAE7MkSNo9JLQDs/d
         CVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqSDmVNHy2Q/xp7vUIn4GRUx5KsEEXqp4VrjsuGNq4s=;
        b=em9UVI9reh5P61N85Z2oKD5Z34FysZoEjqy0VB25huCQwaBiftXEKp3qQxdTVn10vY
         XSovm85RJbpHnYSaMwaoNIZkPksRn5346fWDPILuIoxuNBGHe6QgrpVV3Vlr56pyN/Bt
         vsoKSX7q2m3+zUoSJhMDA+23/yHdeh/RXSL17vwQ7tdRaUXV53ss1koHhuz6sXeQd3n9
         +nUm0ttiCYAAD7ak8bXwEXIlD/wBnQ2pi6q9uo7n6wUbSNOmUPXo1OBTW731NEOGpmha
         a7oBpqfD2AL45lrNPf3kHqwsB7CI+/ZZq9LVvQY4PNuqciJ8vNIXB+GLgy8dSn8zqNyt
         T+sg==
X-Gm-Message-State: ANoB5pn6/3oLwSNI1PuJR1oQQXZQ3H7YQ9hG1D5zbDyvyfIum+52hhzy
        TOYfcwDNy2zUefYaiR6f7qGPCDjfbESVrwZ2OIG3Og==
X-Google-Smtp-Source: AA0mqf5R857XX+UFJqQpjaqhYKzw9X+9ySGbZ8XUm/uBjY0zMq+ynm/BGLtWKE9462T04BciuPaCEZBWWXNe5BC8k+0=
X-Received: by 2002:a05:6512:3b88:b0:4a3:9533:f4c9 with SMTP id
 g8-20020a0565123b8800b004a39533f4c9mr17381527lfv.615.1669899618856; Thu, 01
 Dec 2022 05:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20221201125928.3031325-1-brgl@bgdev.pl>
In-Reply-To: <20221201125928.3031325-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Dec 2022 14:00:06 +0100
Message-ID: <CAMRc=MfGi52s+LcTrBnBPDV91SbC4vf1prrLUpzQ_KZQQZGBuQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] gpiolib: don't allow user-space to crash the
 kernel with hot-unplugs
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 1, 2022 at 1:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is (hopefully) the final iteration of the changes that aim at fixing
> the situation in which the user-space can provoke a NULL-pointer derefence
> in the kernel when a GPIO device that's in use by user-space is removed.
>
> v5 -> v6:
> - signal an error in poll callbacks instead of returning 0 which would make
>   the user-space assume a timeout occurred (which could lead to user-space
>   spinning a timeout loop forever)
>
> v4 -> v5:
> - try to acquire the semaphore for reading and bail out of syscall callbacks
>   immediately in case of lock contention
>
> v3 -> v4:
> - use function typedefs to make code cleaner
> - add a blank line after down_write()
>
> v2 -> v3:
> - drop the helper variable in patch 1/2 as we won't be using it in 2/2
> - refactor patch 2/2 to use locking wrappers around the syscall callbacks
>
> v1 -> v2:
> - add missing gdev->chip checks in patch 1/2
> - add a second patch that protects the structures that can be accessed
>   by user-space calls against concurrent removal
>
> Bartosz Golaszewski (2):
>   gpiolib: cdev: fix NULL-pointer dereferences
>   gpiolib: protect the GPIO device against being dropped while in use by
>     user-space
>
>  drivers/gpio/gpiolib-cdev.c | 193 ++++++++++++++++++++++++++++++++----
>  drivers/gpio/gpiolib.c      |   4 +
>  drivers/gpio/gpiolib.h      |   5 +
>  3 files changed, 180 insertions(+), 22 deletions(-)
>
> --
> 2.37.2
>

I know Kent and Linus left their review tags already, I will add them
when applying.

Bart

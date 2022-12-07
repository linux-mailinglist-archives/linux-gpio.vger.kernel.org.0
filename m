Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9986C64557D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 09:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiLGIhh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 03:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiLGIhg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 03:37:36 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6504DD80
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 00:37:34 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id n9so5784534uao.13
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pVg7Pmla93CggHMoCWl+BFTT59Doc5QL4FspLhqDNl4=;
        b=XNnxAuc/jRa1TZ7thasHTcefirI4w13L3vGQOtTTc9TeWhyCJr39UCyGiOdVYFsmOv
         BHdyiklurW8oZqEM+G6eK7cMbUljx0U5hKqM27eLRtF5E+Ik6aHvmKdm0+WXye+2qXSX
         9fE6aJTcYY7KmiMk4NKqCSfQBJh9RhzMp57wwX1Ym7X5X7SnnPMAk3UMeooVD7nNqz7H
         Hxo3DbtT1F7XZ/lDbMiLlqR0u6KPFPUvhtOdUCPz5j7PrsgGVwiYVoT/aWWjy2xEHv/a
         ujPoom7pCa08AmaVs7UqYTNDfyvZwQLEdlsFYcUAZfn9Gh2VEH7FK991S8Af2dql3MKS
         c8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVg7Pmla93CggHMoCWl+BFTT59Doc5QL4FspLhqDNl4=;
        b=M+XZItCX9RcXCEcZ/hT+BhR8w5+vckcGO9f+MseEz9Uye+9ZAQDtfkrddqsWIhq0zO
         EWqKeWJnad36XE2QTFgrJ61enYkZNIJ2ljoWUMCoF8dSSLAhB7Dp2FTHmc6wkM7eP3ey
         R63RK0mSLhZpVFbn1c2ZLNmej6sgJOK0TITsexL4IdkJiGsTk06IfCWEol+2SEW0vAW4
         DDLBx92qGv8DFRJcSiliJRXTay/5B2OFV/KTLujHySnqjft8HAskRQC2AfwIXwPzcvnH
         u2tsdcbqKbFEFJ1hDupu2qBffuNAE/E4RriK4m+NwnSU5kPRfR9xLqdSGHg3k/EP5+Ct
         lTdg==
X-Gm-Message-State: ANoB5pmH59iTMxS7X8zn/OPT/gexT/ahXmZPlR1Vk3zgNj8pZBmY/La3
        CqrL+HfnfU/4ruWxaKlM+glEc/OYcE4WYle4JHk2rw==
X-Google-Smtp-Source: AA0mqf6ugLEr8XTmsl8up9QcuoQc7Kkv66H+qhJJ2j+QnVC+Ppxlhr1GRm9QYYXuyDAtB/NyNougAdkZ0Lw9x+Ec8iI=
X-Received: by 2002:ab0:76d9:0:b0:419:1a4a:cefa with SMTP id
 w25-20020ab076d9000000b004191a4acefamr25712790uaq.66.1670402253414; Wed, 07
 Dec 2022 00:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20221205123903.159838-1-brgl@bgdev.pl>
In-Reply-To: <20221205123903.159838-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Dec 2022 09:37:22 +0100
Message-ID: <CAMRc=Md36QZYFd9+D_CR0mWEDoxXB1rkFf8q93ohQ=StN3jDhw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] gpiolib: don't allow user-space to crash the
 kernel with hot-unplugs
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nick Hainke <vincent@systemli.org>
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

On Mon, Dec 5, 2022 at 1:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Linus Torvalds pointed out that using trylock here is wrong. This iteration
> drops it in favor of unconditional locks but keeps all the fixes that came
> later.
>
> I will also not send it for this release but make it part of the updates PR
> for v6.2 to give it some time in next.
>
> v7 -> v8:
> - don't use down_read_trylock(), just go straight for a full lock
>
> v6 -> v7:
> - fix a build issue with CDEV_V1 code disabled (giving credit to Nick Hainke)
> - protect the gdev->chip also in gpio_chrdev_open()
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
>  drivers/gpio/gpiolib-cdev.c | 204 +++++++++++++++++++++++++++++++-----
>  drivers/gpio/gpiolib.c      |   4 +
>  drivers/gpio/gpiolib.h      |   5 +
>  3 files changed, 188 insertions(+), 25 deletions(-)
>
> --
> 2.37.2
>

Reapplied again to get it back into next for testing.

Bart

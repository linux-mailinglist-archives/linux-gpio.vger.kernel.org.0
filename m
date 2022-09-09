Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2DA5B3F57
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 21:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiIITSm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 15:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiIITSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 15:18:41 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6A412ACC1
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 12:18:40 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id y17so1159831ejo.6
        for <linux-gpio@vger.kernel.org>; Fri, 09 Sep 2022 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bWppDnHcPKTnuypihInrM+uVif9S3LL38Vx/2xcXQ9k=;
        b=g7HrYuvgsD4YAQaqYaXK1xqRnzd7giTbhTVuKr1ZCDpVya7ZfOEm6064HpCGJitxTF
         LHCqLs4IArnyFufmpiJGMHOCvmjFvDOOegBe8MEaQznefjKy8CkGRBgs8WNaNWJ6BZyJ
         F0uonF2zMSb6Ztug3MolFD2FZRms3NViQVLGZ8k0ZUSnruEC1iEKMDii2EU0+VLhdlrD
         pHoFH5sR0zIojtx29xLRxYt60bEiEfAnlocKtMYgNx20nWUeWfxm54J2BNGCAN3i8WEI
         aPtOJyOy0VeI8Vl2zgFJsygKfK3galPyODb6ssEJ4LxL5X3/7vJ+HANgz1gfyxtA+ZIO
         FUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bWppDnHcPKTnuypihInrM+uVif9S3LL38Vx/2xcXQ9k=;
        b=ithUvDeTi77zlXoVM5CSX3PknziYFD1Nry8jk5fcE24F8s6+/3BTh4wDvuyiTX2Faj
         1qnhsuPeJDCUJi6SyYC7QM0XgLlB+a2zXmRtPPohkVU8leD5RCNBFNWB0WiqbPSPqCwX
         hsMfCEzX8EYTWUsu2dd8ptxXnmCj5Gf0+icxSERQMdjyoWBmARlKI+1eDMapiseW8a65
         OoRUjUCAxdRTIqjZCnf0xREI7wcYVddBvP50uKyYXlr9JGDoZhZYng/YtlJLFg2I+A5Q
         dLqZHhAZcNmx4UGlIAlGqU/JAZSKPloZqPQMQf/hjJho80IoQ7zizisVhxCMuQAbAPnA
         ERVQ==
X-Gm-Message-State: ACgBeo14om65PHvV4cmtM6sGvPpsXQfD6xZwZAF1a9b9kU9j8eFyN08Y
        nwvMZitjWvZPrp8BBHor7bw2X0R4h82H1yoAGw4I9Q==
X-Google-Smtp-Source: AA6agR6Cp8/UX8n/CVq3P5YqszAg4JxSezXNwhJrr/8OtG/sg2IdUZJ3mSjClVq7iDV+/+BBRtpcx6Cw1PrT0CiQOx8=
X-Received: by 2002:a17:907:1c87:b0:741:8199:a59d with SMTP id
 nb7-20020a1709071c8700b007418199a59dmr10694013ejc.736.1662751118977; Fri, 09
 Sep 2022 12:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220909121329.42004-1-brgl@bgdev.pl> <20220909121329.42004-3-brgl@bgdev.pl>
 <YxtEFNdgzmpbN94s@smile.fi.intel.com>
In-Reply-To: <YxtEFNdgzmpbN94s@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Sep 2022 21:18:28 +0200
Message-ID: <CAMRc=MfVr__25iAhA08LUo361i9y=fiPwj08TcYdDu0dru_N7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: cdev: export the consumer's PID
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 9, 2022 at 3:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> +Cc: Kees
>
> On Fri, Sep 09, 2022 at 02:13:29PM +0200, Bartosz Golaszewski wrote:
> > It's useful for user-space to be able to know the PIDs of processes
> > holding GPIO lines in case they have the permissions and need to kill
> > them.
> >
> > Extend the gpio_v2_line_info structure with the consumer_pid field
> > that's set to the PID of the user-space process or 0 if the user lives
> > in the kernel.
>
> I'm wondering if there is any security implications and this PID
> can be abused.
>

I was wondering about that too but nothing came to my mind. By default
any user - even one who doesn't have permissions to access
/dev/gpiochip* - can already figure out by browsing /proc/$PID/fd that
a process does have some lines requested - but not which exactly. This
provides that additional bit of knowledge to users who already do have
permissions to call ioctl() on /dev/gpiochip*.

Bart

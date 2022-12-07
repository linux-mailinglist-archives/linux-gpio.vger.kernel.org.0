Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07926458BA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 12:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiLGLR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 06:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiLGLRX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 06:17:23 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4575A3880
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 03:17:19 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id l17so2940900vkk.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 03:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lcdQpPKqIQOvqDqMp2XJ6jki0KbEwrv8fLwlpzf20aU=;
        b=jfKs3Se9eBEcGkgu7w0D50lsYRburFxC+TczcDIlv7eOwxVhLB7+xdNmOGEKf9QGnb
         w52fpO3wdZGxIm0vdLxF741fPmZ0cNDKduSc0IQwE/uoX1pbSX4Xd/vROgBSGpnecrRO
         zJjB5jjStyaPkqgPc5qnw9spmCgqdmirbxr4XGBH55lcYfUAfHfRjAzRjDJdfR7CcAjg
         fjO/1yKKGRHVuFEPPxQP1EsACxS+BHI3x3BTIpN8+T3LJy8eyIesrONPQ7M//Qtz54Yc
         Uj4xz8RASho89ysaRzwP1qMSjk1F0N8nwa61Xbr6AlZsuqPXRgClGyOQHGMeZXRz+XAT
         2e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcdQpPKqIQOvqDqMp2XJ6jki0KbEwrv8fLwlpzf20aU=;
        b=zjlsqxIQEyD7G86nVCHUnrjq9Bk/N0ERdhaHC039mrnX7sJW+GqvJFaDrH1pTxRUTC
         31uoH9uUuesYkdEIFo7JpwBUwTNvGRi87vNyrIFkg/5y7TTiZxCImz+C4m4wzGWkVe02
         aIYB3wo54k7Ug0iackaqotimPya1+rb/stdpe9Kae8hI3cESNyz9O3WuqDvfpfFGxm1G
         gf9ftehs/ShrQmo+sPs86rFKhbzR1NCQlruzCD1/lSb0l91K8jz/62gcxtR9gv0NRTcO
         ymApV72Zut0g2RXfr2BgVxKAMdU/xK7XW14vNpw+s7UmN7FD5b4T8ohDpH/lD6OjgJhE
         w07g==
X-Gm-Message-State: ANoB5pm0h/ghGu6DRNIvOVkF9Pfk3T30KfnKw46vg01L4XMkUZ0h2bIt
        qfL31h8HLQjMfb148HMA/VTYxxlYAaxKc8yPsslcmkvxPnjsuB3q
X-Google-Smtp-Source: AA0mqf7hMySPvp0VQzJLpcgJF1I/X2X35C3eaMC5nTRySFYPkSa/n28Lj0zfbEfwCSqglVPY+ngiVqXWwgGGBT+Uyy4=
X-Received: by 2002:ac5:c915:0:b0:3b8:7fbd:9554 with SMTP id
 t21-20020ac5c915000000b003b87fbd9554mr40929510vkl.27.1670411838421; Wed, 07
 Dec 2022 03:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20221207091413.61616-1-brgl@bgdev.pl> <20221207091413.61616-2-brgl@bgdev.pl>
 <Y5Bxftq6b6ENKD2R@smile.fi.intel.com>
In-Reply-To: <Y5Bxftq6b6ENKD2R@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Dec 2022 12:17:07 +0100
Message-ID: <CAMRc=MfnJcWPtwhuKNt9-bc6geLhpp2nuCs3P0uSF_UaAw1UGQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/2] bindings: python: tests: set the process name
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
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

On Wed, 7 Dec 2022 at 11:57, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Dec 07, 2022 at 10:14:13AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > When we run the test suite by calling the __main__ function of the module,
> > the name of the process as visible in the system becomes "python". Let's
> > set it to "python-gpiod" before running the tests. This way gpiosim will
> > name its configfs attributes appropriately.
>
> Perhaps you can refer to the [1] to explain why it's needed in Python.
> Also it can be done via ctype module [2][3] or via module [4], although
> I haven't checked if most used distros pack it.
>
> [1]: https://bugs.python.org/issue5672

Sounds good, thanks. I'll add it as Link:.

> [2]: https://stackoverflow.com/a/923034
> [3]: https://stackoverflow.com/a/31134436

We're already using cpython C extensions so let's not mix multiple
different FFIs.

> [4]: https://github.com/dvarrazzo/py-setproctitle

I was aware of this module, just don't want to pull third-party
requirements for python bindings if I don't need to.

Fun fact: the above C extension is a modified version of the code
generated by ChatGPT[1].

Bart

[1] https://imgur.com/a/SuDnyuO

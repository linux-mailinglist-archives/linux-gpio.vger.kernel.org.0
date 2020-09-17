Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E872B26D84F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 12:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIQKE6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 06:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgIQKE5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 06:04:57 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBEBC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:04:56 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z22so2430798ejl.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ycl8YMwqrq2eIfLCJC7q4UYSg1v+hIchcgj1B2KfYYc=;
        b=SrNwQnRxBIR44nklxI5SKb7VHVm75CyViGMWFvbW/27h1HbqV64ZD9PQJC80ucdKPY
         ukzfZfyTDVKiibkaac172rdrAE5WMiT5DaAbW3PVCjHEfdrvLJEHzuqF3nD8WfyRsltE
         4qnYVLh3zW04qX+GPvEBCLdsLD6RtHiMVESAkE2vACK4xjU6h0O3siejrcDluOlPwaxM
         77sOw4xHom+nOWjk71zErwuXHkEVqJz1NNXpr8m+jCg+JlflEkAH8FzyvXlONku1u1k1
         tQOLLhIiozuP7SYnKiLKjD4mFR22AWM4U65uzP36PNYOQrltFYb3Jv+db4YMltgYzl9v
         52mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ycl8YMwqrq2eIfLCJC7q4UYSg1v+hIchcgj1B2KfYYc=;
        b=sP8JqjABewf84ued3kYHXJHV/XF7D73UTzIpkfj8GyJkQgI8P2ZBbPx/MZbuji9rl6
         vpnFd8UT/Lhc3FhkLxIK2QMueXvp3y4Two055JdkWIG6X4Yk/yxtdnB5TpMmFLD8RYjn
         PmKrLY8l1AjXLmdqPnQoCY09oYvbzXyw9dy4g5z/XVUkdsMDT3ETyxvz4m9ihWVMHrxy
         Hv+GlCuQZG+IOeV7k7EzZ7QhJkMW1iJs/MVY0Yo9xBow5gGJ5vRiCRIdSTqsPDhjVFt7
         lMnku+mKyB1NtPPo5VzG6udtBPbPTyKDF1kvU2hMly6TCM7wdJucJxI4/YTBBHWupY+5
         7zqA==
X-Gm-Message-State: AOAM531jAIVHysi7fvlXuXh1Yv+lfUF+1LSqlxqjs9gfwVywQU6kuUi6
        IYydq1BtQ5T7Hd9wuAq4mfensDCxCq8nIANKnX+fOQ==
X-Google-Smtp-Source: ABdhPJzwUJ2HqJh3A34bhXOyjTRGZENU7N9n20JQH/3b4+Zsy3+T9Rf1QiXWZS1pqtgukWxhBt9l0ur50wi7r2Ayd94=
X-Received: by 2002:a17:907:20d9:: with SMTP id qq25mr28547312ejb.382.1600337095268;
 Thu, 17 Sep 2020 03:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200915125816.47148-1-andriy.shevchenko@linux.intel.com> <20200917075920.GA1512423@sol>
In-Reply-To: <20200917075920.GA1512423@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 17 Sep 2020 12:04:44 +0200
Message-ID: <CAMpxmJXQ0bJAjgdfTLpd6gUTe5ga=xTj7sXXUyLCS_o2RX87Kw@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: Fix line event handling in syscall compatible mode
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 9:59 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Sep 15, 2020 at 03:58:16PM +0300, Andy Shevchenko wrote:
> > The introduced line event handling ABI in the commit
> >
> >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> >
> > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > In such case the very first check in the lineevent_read() will fail
> > due to alignment differences.
> >
> > To workaround this introduce lineevent_get_size() helper which returns actual
> > size of the structure in user space.
> >
> > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Tested-by: Kent Gibson <warthog618@gmail.com>
>

Patch applied, thanks everyone for the patch and QA!

Bartosz

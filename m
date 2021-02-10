Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D9B316466
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhBJKzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbhBJKxN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:53:13 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD55C061574;
        Wed, 10 Feb 2021 02:52:25 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 18so1021693pfz.3;
        Wed, 10 Feb 2021 02:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5aQ3P4pzj3MIu+x6a2h0jZYuvjE+2Bw6hXq6j4YSBkE=;
        b=TYxdWTbB/BabarLs4YVgppIIivafvxLP7lWhOGbgvAl4Xl+RqRBjR9WqlWhSfnM6vU
         m6LPN8dnmaZHzCJx/2ilVNL+DAudR9YIgrYHjX+Q8BEEdXBYZ5/KqF6JzwMMIRjMVzU5
         vraqt53tPXV9/Ero9FbwbGbZm42V5TV137/KIaaMzGdHOLQzIAd7AmRPu8HBH3TwAWx/
         XEV/VGTCodtPYpV76gXJx1PDZAaOR41As25Bk820QO0lgQCpY3ogRZybSgazHC8Jg5Ke
         9wlJfwGYL4wwIPtIDw6zxW9Xcx6SXTq2RjWGGpVC6o2Zvu5OrsIqU76Vat6LUrOrNh7P
         Egiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5aQ3P4pzj3MIu+x6a2h0jZYuvjE+2Bw6hXq6j4YSBkE=;
        b=Lsxkhev8wuFikA6HM8muiMkLCh4DvYq2C4vJdNIEVKob2KhGRgANXbodPLhbGcBtsG
         U/0GSANi1Ru95adNJ6W0lTa1VZ/O8wN2Grw2bFaXciqguiCmRqUMQYLKHmk7LxBL8S8r
         ngiiSdAm+qWlJm2YucUqYjz3IiLno/QlWS8krayWS4Dk3ZInSviVbUxIcknqPxQG4FyJ
         WF8dPB38x+VwJdUWDuzwatWYnC650196rbeJdVV45cAxjBYUQ4Mx0eChECGaaEQ+nz5I
         0BBVFgx3meqsfjWr5IPH7IyLScyABUKo0ZGaAXYPgd/U6R9hGN+oW1Rea3FcOuEb9jHo
         ySxA==
X-Gm-Message-State: AOAM530801Lkxjp1NLH1RZcVfYFsLIbhfomwr3uOiOk2ZprEcFQvQrtc
        KrB0w+xYEG61x2ES31N3JLzY5eW3N/eSGO/DSE8=
X-Google-Smtp-Source: ABdhPJwOgx0mlW1I19ll8xr+Ox7zptfTi+i1hB84L28gHB6LbA89rI9+N5B5whOLRx8DBrF89TBSSW7fEOvaxhlUM08=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr2472078pfk.73.1612954344590; Wed, 10
 Feb 2021 02:52:24 -0800 (PST)
MIME-Version: 1.0
References: <1612774677-56758-1-git-send-email-luojiaxing@huawei.com> <1612774677-56758-3-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1612774677-56758-3-git-send-email-luojiaxing@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 12:52:08 +0200
Message-ID: <CAHp75Vcr+L-+UiX_CMHB6UtVxg1ZX+q+=R878jyjP+aRSrJFWw@mail.gmail.com>
Subject: Re: [PATCH for next v1 2/2] gpio: grgpio: Replace spin_lock_irqsave
 with spin_lock in grgpio_irq_handler()
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxarm@openeuler.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2021 at 10:58 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
>
> There is no need to use API with _irqsave in grgpio_irq_handler(),
> because it already be in a irq-disabled context.

It seems you haven't read the code. The handler here is shared. And
lock there is about something else that we discussed in the cover
letter.
Moreover, the driver is quite outdated and code inside is horrible
according to the modern APIs / standards.

I would rather remove the driver completely.

-- 
With Best Regards,
Andy Shevchenko

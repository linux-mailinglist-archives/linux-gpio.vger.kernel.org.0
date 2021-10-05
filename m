Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAE2422254
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 11:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhJEJdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 05:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEJdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 05:33:19 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F537C061745;
        Tue,  5 Oct 2021 02:31:29 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b8so41468194edk.2;
        Tue, 05 Oct 2021 02:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EmB7OeXU5o6C+KiyCR3Ohm6YITBPDbDtMCfLfGaNHJk=;
        b=jtp5BiXVCTtWAL62IvjXWGYglrVQozQx03iRCeKc3Zm0Lxxk4aSj2yRrX4C0uMKQgy
         yBs3N56ch3RWvc9kk4n/DDJwbDq0TbUzbHr5cDX357Vl4yblcDlyuOTterB4BBIvCfqg
         DTG6eIxdxi42N0QXOkxxavdcFYOzpiM/GzvfzrvUqD2jn2EPnm/rbvSKr6NBhkvZYVjK
         Mob/5WYPJiOH0JN5tm55z77WQDnbYOGdkF9z4AgEd5ahzjzNnDCL6Zwe/CYNzoC/PLh0
         Mhab736XYhZfXyyeKv8PZNgNNflryI4VbuspWCAXFOGz9KBtaeNZvSkJACNxQSRSWYRw
         f6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EmB7OeXU5o6C+KiyCR3Ohm6YITBPDbDtMCfLfGaNHJk=;
        b=UOYSEX73mUXpDf0YNbIlIwE2+eDXwEp6lhJR5ppAQE5wGh6J71CcWixKKbQGOnRiB6
         SG7KkFoHm5eSaOwVUzpxQTkCquAcCeTFFQqUjogCjZodgfp3YXjetol61Kk8n1j5J9Na
         NFdNeVTpRq1QVBi3zi3pZtoaOsBiIFAjBjKdarrcH5tXR73Z7Ug+2r34e7m+Z/qBo91D
         YbI76WJR/wmazvnPHoiSJ+KWrGMPDhb/1T1orp41oMz6hOYSUxrLjDx7zrKhxGOmdSXc
         f1btZ1siCnLmd3fNr+iHBVZBrVDh/3r3IYntRidPWm7tO2Jl92Y/zY+jUundpe3F+XH0
         bDtA==
X-Gm-Message-State: AOAM533V22MfqPRXCiN4fQszqxgHcTexXVp942n9FVN2Umo8uW9qTH3/
        IvLZKxIo/SDvedD7zPoRdVqw7VUB2USPXqTUvh88iVB8JhY=
X-Google-Smtp-Source: ABdhPJxUnkw64eTN9hSWkQSihfGlhDgYLX8g/RLdhQ8D7qPICJAD8gET/VKSq4EErKPVHXrV7EdTH5jc/ruii0CHQq8=
X-Received: by 2002:a50:fc86:: with SMTP id f6mr6909433edq.283.1633426287791;
 Tue, 05 Oct 2021 02:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211005091016.18519-1-andriy.shevchenko@linux.intel.com> <20211005092753.GA911482@sol>
In-Reply-To: <20211005092753.GA911482@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Oct 2021 12:30:51 +0300
Message-ID: <CAHp75Vf3Fb2e7efr1XpsCUB6yAPv1nT96KQ_h+hT_xUtZTksZw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Convert to use software nodes
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 5, 2021 at 12:28 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Oct 05, 2021 at 12:10:16PM +0300, Andy Shevchenko wrote:
> > The gpio-mockup driver creates a properties that are shared between
> > platform and GPIO devices. Because of that, the properties may not
> > be removed at the proper point of time without provoking use-after-free
> > as shown in the backtrace:
> >
> >   refcount_t: underflow; use-after-free.
> >   WARNING: CPU: 0 PID: 103 at lib/refcount.c:28 refcount_warn_saturate+0xd1/0x120
> >   ...
> >   Call Trace:
> >   kobject_put+0xdc/0xf0
> >   software_node_notify_remove+0xa8/0xc0
> >   device_del+0x15a/0x3e0
> >
> > That's why the driver has to manage lifetime of the software nodes by itself.
> >
> > The problem originates by the old device_add_properties() API, but has been
> > only revealed after the commit 5aeb05b27f81 ("software node: balance refcount
> > for managed software nodes"). Hence, it's used as landmark for the backporting.
> >
> > Fixes: 5aeb05b27f81 ("software node: balance refcount for managed software nodes")
>
> Shouldn't that be:
> Fixes: bd1e336aa853 ("driver core: platform: Remove platform_device_add_properties()")

I think you are right. I thought that it happened during the last rc-week.

> > Reported-by: Kent Gibson <warthog618@gmail.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Other than that, looks good and works for me.
>
> Tested-by: Kent Gibson <warthog618@gmail.com>

Thanks!


-- 
With Best Regards,
Andy Shevchenko

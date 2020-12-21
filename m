Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE45D2DFB1B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Dec 2020 11:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgLUKix (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Dec 2020 05:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgLUKiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Dec 2020 05:38:52 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1092BC0613D3;
        Mon, 21 Dec 2020 02:34:47 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id e2so6107190pgi.5;
        Mon, 21 Dec 2020 02:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FklssIwn1yVcoIJZyNpcVRYgVyRZCquRsP0VE53HmvY=;
        b=L7MNheK9EJOPLzx/NFdPtXo9/ReY4lnmlxjNua40Wxj7DdpAXN6LVcbsHg33LBAOyu
         3C0hKvqWh3wLFpJPTY0vvj/GkwxIGNO2akMNMlQeV2saM661ukxZCtT3FozLfJYBbv7s
         f3wI6UgYriktUsciCSpU5KMqZG0MEBeS8QTOH5wzd3XB1zZi2PqxQa0CDJcntdOLN9ag
         Bw5YXtD6xIG+gttegouatk/LJx+S4Lbacj5gL/Z3Kk4TuWlihpNsg8R3glxKQG9MrtzW
         jLk3w/ye0W0gAb9LzzvygEm7s3We6SehPmTFU1KQEHlTscmP8hlVxlPsVx/FPLQXXh2c
         t0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FklssIwn1yVcoIJZyNpcVRYgVyRZCquRsP0VE53HmvY=;
        b=U1dvz9rrPLFO2NBVtUq1cq1p7KeKaZejBDJ7+RDQeipatjhyZnm+MraDCU6NdFyQNF
         b+DudJ/7RWcxpZuaUcQaXSAW2ku7+0lg1NeBiL2IDo9+GCfD6LQISKJ4/iN9i28AIDqC
         0Xjn5YBWMVDRm+UlfOlAl92Doi1tameuQfhTfKI9k0V7hfh3PDEK7H/5ZxJ33VbXz6zk
         6LWKrJxkhY6wb7ZggA86jFLQldNvb5YDtC31t05Kd8lXhATiwyzZv/6ng5gXFJ48JN6Y
         v3MhBw40MEgbl5Fn9399X0hwc0sqQo2JgCENZM1aIfZv9pAEQwNaKO7b9dpoafKIDKzk
         rLlw==
X-Gm-Message-State: AOAM532N3sCttfJZC8rwsTfL+48K9BBStPrCDpUjRoMTeZXucP/of57D
        piDQWUUdjL8J7SpQwkR8c7gz+ukQgDlmpLEmjuhyFnVGHsY=
X-Google-Smtp-Source: ABdhPJxWzv3rlOM638JCF/8vUD0ganyPjfBsJ8PEc5+qKpDmo+6kVpIcYgAINNRNrcs9ZJ8VdhOOrZj2EwEczaaGRAE=
X-Received: by 2002:a62:19cc:0:b029:19e:321b:a22e with SMTP id
 195-20020a6219cc0000b029019e321ba22emr14678598pfz.73.1608546886430; Mon, 21
 Dec 2020 02:34:46 -0800 (PST)
MIME-Version: 1.0
References: <1608539124-4914-1-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1608539124-4914-1-git-send-email-luojiaxing@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Dec 2020 12:35:35 +0200
Message-ID: <CAHp75VcV2E+e9e_o7zwrL+gzZ3xUkZYOnTDACxH1j59bxTVifw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: hisi: delete some unused variables in hisi_gpio_probe()
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 21, 2020 at 10:25 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
>
> kernel test rebot report that dat, set and clr in hisi_gpio_probe() is
> unused variables. So delete it.

Fixes: tag?

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>

-- 
With Best Regards,
Andy Shevchenko

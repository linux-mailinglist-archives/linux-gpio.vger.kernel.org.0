Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA36C1ADBA0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 12:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729364AbgDQKxy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 06:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729362AbgDQKxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 06:53:54 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A520C061A0C;
        Fri, 17 Apr 2020 03:53:54 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d24so837058pll.8;
        Fri, 17 Apr 2020 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TwKXCfRB7o/vWoJfqpmR/E8zhEf8tOObq3WWbVw22sU=;
        b=Cm5zqdnBFbTeC9M5Y8O0MXbTT+eFoIY3PgXsI8wW324Ut2G+IDpk/apV0kZdS3hqiS
         pNZCf0ZhQ0ckpo8iLum2/ppe79vq/SA9smKSGFjWmaEPFbSShozEFFRNgS96uEgtsQWW
         UqEqZE9kMTaqZSySj5dPLmXDiFj1XmT4oUGWjiSCKLYBMzELX6mdEQCUn4+Umcvivu+Z
         UtEbQFWXGwOzwCC6guT6FLL1xmmtJVXSd8OwYTCFehqVvGeW2I6VpD3X6h6NaHYOiJ2D
         xz7Yk5C0WYEkzRdVMC0+0rEytPUjHCefgceaWZaLGVrb6MUuzWitGy6vkAEfgPwedH9J
         ywvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TwKXCfRB7o/vWoJfqpmR/E8zhEf8tOObq3WWbVw22sU=;
        b=QlkTpe6IF6R+G0py/y1uj8UG7aYT/808PHC1MsnJ2Oy+iGU38vnSepaHTdsuassvlb
         k3c2l2cLVgASLY+9RvotUT1MgmoFDv5Pcc1II8mDTg6oC/+eG8bJpaQGLex1dgz0xUNI
         aTHRpKYLOelvNjvigB3h8SVTEnEp2hZIFzYr52uVSyq2V5q9Nq4b01B0GebCKqNZx7dH
         54PFj1p1AoVVjYC85TEE4CaDkuZKS9MJ+Ir4o3gHxTCbNKrzLIUha5hwSD1sXExEJBJ4
         1RMPBu2XaXUyHNV0h0ckUC4jv/Z3uC/IMhoIcWfXHPVTBlrIXA7uhJhEMN1/EN8EDQSu
         Cthw==
X-Gm-Message-State: AGi0PuaDwPTA+cMpUaopbqSjaM+pS1GegPcfio4wixh8issaiKH/b/l2
        BFZVvmlPg9FCMNCY7ahQBUWIbxJKZBQHEve3TJs=
X-Google-Smtp-Source: APiQypK+2sBRVRLPujtMMuVoeXXw5cj0wrSmjDYVT57zBlOi1idDmGMyWf/HnVXhCk0hfkD1TR7XjNxOeGJHsz3uWKg=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr3611175pjb.143.1587120833719;
 Fri, 17 Apr 2020 03:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200417092125.12513-1-yanaijie@huawei.com> <CACRpkdYm7_DYSxvj+cwciUrfDZETbJSdGj=5L8O=QK5xcGYcCQ@mail.gmail.com>
In-Reply-To: <CACRpkdYm7_DYSxvj+cwciUrfDZETbJSdGj=5L8O=QK5xcGYcCQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 13:53:41 +0300
Message-ID: <CAHp75VdbxuWpJecCgRBO7pGKjv1xrseSj2Ftx=kqML=oSAF9MA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: add module license
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jason Yan <yanaijie@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 1:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 17, 2020 at 10:55 AM Jason Yan <yanaijie@huawei.com> wrote:
>
> > Fix the following build warning:
> >
> > WARNING: modpost: missing MODULE_LICENSE() in
> > drivers/pinctrl/pinctrl-mcp23s08.o
> > see include/linux/module.h for more information
> >
> > Signed-off-by: Jason Yan <yanaijie@huawei.com>
>
> Thanks, patch applied.

Thanks all! And sorry I somehow missed it.

>
> Yours,
> Linus Walleij



-- 
With Best Regards,
Andy Shevchenko

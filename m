Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C082541D584
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 10:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348469AbhI3IfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 04:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348460AbhI3IfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 04:35:02 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B211C06161C;
        Thu, 30 Sep 2021 01:33:20 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id s17so18855190edd.8;
        Thu, 30 Sep 2021 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tr+Z4RYSqEf4hgq+xhRPM2Lcu56pvmxdACh96P6z2Rc=;
        b=XCnuCIPZRjYRzpEkVbRu0dKawZaFY2TM5U5tYd4mHYtQcN3glLOxdEdnnagGPOzQ5K
         tZYvbAj0/L2N59km0Lf/76n2Vb22Rk3kjP9AoeJ5XIO2Y1ou7Q7vTAwCwA9c7ptoy5/j
         /Eyts7/Uh18Dq2WrSxgYpoDWuORkTpmNvpDn5BFCfqE3Asv9+xepZcKOfmC8Mmk2XRPq
         H7/lUig+EdVS7i8h+bB+tC8ZMBVR4Fm4v5Od6nEejfkVtJwVNqz6rWHzflfM8BhCtjA4
         PrcCL0VzTrv4e5NZpHuMZ6J0d83OPHe2y1qm5zD3G8h2vp/vxiDzeIDZFYaeYQLdRieq
         JmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tr+Z4RYSqEf4hgq+xhRPM2Lcu56pvmxdACh96P6z2Rc=;
        b=GPQsFP6FyEOgb+Lbaosq1uT/cOL1X1Jww0NN9QOIZxi6EX7PUQFaeaeMU8V+xc75An
         im5yvEhjannZnGaI/xvc/AxafSaWuKpYpQHVPu+Wvo1Up+fZo+C/MiXSI2zjWoFblb9w
         zLQyzMidJihLxeMY6Qr8QkE2aacLrn4tT6da6+K28eome35LWFQ4SLnOUD3aqv4Udzwx
         Zg1GTWj9Ofwh57TUrgoiC2qWJwh5hmR2BXXpkEAsFce7ugbGuTOyQzkuul5s22FhQBPj
         nSxEFtPyJSRDCtVJr2YRAg86JgapBYAcQkUasyzpPFWzoDUm31vqUY60cHIJF5tvf/HI
         LMjQ==
X-Gm-Message-State: AOAM5306LMcHHiXzvCYdYeMK20nwuM4c9Lv9NQHzoCRfk/1CWXZnfOne
        0HLCwydEYWZ7KrT8CW4eZ4FWc6/vqz7rT5PDiEI=
X-Google-Smtp-Source: ABdhPJwuTlcdX9RmcWvbnH+oJ5uLIjOpQLf68VXmPfOheqpGTb0wtk8YyMmnR4dul8GHzmt6wTmI474EiyTY+UMj3nk=
X-Received: by 2002:a17:906:1707:: with SMTP id c7mr4917931eje.377.1632990798353;
 Thu, 30 Sep 2021 01:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210930075807.333-1-luojiaxing@huawei.com>
In-Reply-To: <20210930075807.333-1-luojiaxing@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Sep 2021 11:32:41 +0300
Message-ID: <CAHp75VdagWQ4L64GCQ=PZe8SAFA+0PpLQjnEEeMTWaYq3Tjb4w@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Change maintainer for gpio-hisi driver
To:     Luo Jiaxing <luojiaxing@huawei.com>, liuqi115@huawei.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 10:59 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
>
> Qi Liu take over the maintenance of HISILICON GPIO driver next, change
> the maintainer information.

It's nice, but you forgot to Cc to them.
W/o their ACK it's no go.

-- 
With Best Regards,
Andy Shevchenko

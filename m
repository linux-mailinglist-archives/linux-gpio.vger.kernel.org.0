Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053AC422287
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 11:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhJEJoB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 05:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEJoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 05:44:00 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A07C061745;
        Tue,  5 Oct 2021 02:42:10 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id bm13so25868483edb.8;
        Tue, 05 Oct 2021 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQEWVSeSvtXbT1tKvPVwFqzMKyHVooMS6v9cZBWAAT4=;
        b=B7yvR1eRxSwJe8b/O3vBDR62F6Vd30t7dvRv4UQp5aOXeIW9qLvTUrR+BaEgJveq6r
         8oPXAV82GzoWY0GpHt7SXbFrraGkVLs359z3FsKe+/P1aVkCMx47LoMYTZK0GAWaAu5B
         tPsFwE9pIUMvflCJwA3975gICn7WpW/+vrdJX6r8O6afF1EtgQNUnmhFEekULWL2tyLi
         4CTSSPSYeue24CXWlq1wrtzNRpbabKV9M/qWumpFJZkPyjXhUJI8aLsGQ5/Vx/Pundb+
         cLXCMocwN9vd4DAc1cmFn5GAEWY/ChUuVqNluf+0PvZ+6phLYapOhgsofxxMQ6pXlVOd
         /xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQEWVSeSvtXbT1tKvPVwFqzMKyHVooMS6v9cZBWAAT4=;
        b=715KN4QERsPZVEwl84CfCyvu6V+UwEzJSHZZd8XVMeD0IRR0fyPc34TkPvSOcTPDs9
         ALAH2pwUZS8oGIf7ueqzyiddBdOKNYOFyDFOYaIeV7x2duz8SYZlo0veL0jSxDQY2nXq
         +5HlYeYSPhVtmB8qMlmlKddD7rfLw83efxEjmmx9Z4FAO3qXuC6zXS38yUnRzcWo1kQf
         grTQtA64WhJSNuJ92hZzHt6K62IwU7nv5jfs8vsPPr83xp8PaltuEQ887RmJeoFay+FZ
         Ja6MAVTZiJxtWUd7tJ+mgrQxF3FpKOdUCMR/oGwJvwwwjF0arQDJUZskPYVPR2he/wse
         HROA==
X-Gm-Message-State: AOAM530RaP2wj4wzJqBV3TDyovWb3ZNNBwBaris9ESQ45AGmzJY5f6Fo
        Onk2kbtF9aoaDll3GRxRxaAKSPJZEdH6oZ87Hxg=
X-Google-Smtp-Source: ABdhPJwx30iGr1g+bcLGtgxP7CmhKNoJj7GS3hnc99rrO866tN1AOIZbs5yKCe+laMJG0ZN7ygBXgSYHKjFzTKbCPQ4=
X-Received: by 2002:a05:6402:143b:: with SMTP id c27mr25590294edx.224.1633426928185;
 Tue, 05 Oct 2021 02:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211005091016.18519-1-andriy.shevchenko@linux.intel.com> <CAMRc=McMzezBgxGij3M51nOAzzHNza7EbQ49CwpQp2okJnXc_Q@mail.gmail.com>
In-Reply-To: <CAMRc=McMzezBgxGij3M51nOAzzHNza7EbQ49CwpQp2okJnXc_Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Oct 2021 12:41:31 +0300
Message-ID: <CAHp75Vc2+N5nXPKAZyV24HQBZarWAB+FKCQ2UsgMp774AQFDog@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Convert to use software nodes
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 5, 2021 at 12:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Oct 5, 2021 at 11:10 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> I suppose my gpio-sim patch is affected by this issue too. Thanks for
> fixing that.

As far as I remember the code (it was pretty much inherited from
gpio-mockup) yes, it's also affected.

Btw, I just sent a v2.

-- 
With Best Regards,
Andy Shevchenko

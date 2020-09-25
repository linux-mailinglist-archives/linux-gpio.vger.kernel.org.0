Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D1D278B35
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 16:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgIYOso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 10:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729097AbgIYOso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 10:48:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83306C0613CE;
        Fri, 25 Sep 2020 07:48:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t7so1964038pjd.3;
        Fri, 25 Sep 2020 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVqS3zBnRdVRz+9mXTOOAoznlEAtOOoAuXzzPbgOnlM=;
        b=fjdEyy0lm0lfbMd8quwV5EcORq/59e7GsjxrSeIHl4IpI7gmZHLKr4xHvmJQRxU6js
         5MwCGBxPkkHeo+4L2LG4d8kP29PmmBQEnVjq8LeHavzI3UEeGGDkvkRnMl99xKOCwuc2
         +igt7GJkFanZLWu/nER20z3IFcqCIXW/5zBRg4iWKIjfloATCP4+3NPBgKILqvAjlwvX
         SfmlXREqP5Vx5SFEXJptfG51HKDJqB0zJul52Pc4uRWORF4k+A8TYgzVz9d/Kca/9PcZ
         dfSWTSDNg9SfWXmth7/xLpv14bIqh6YWY3Dce3ZTbe6uhTsSQNOxtZRN72LBMXOzJIA4
         JhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVqS3zBnRdVRz+9mXTOOAoznlEAtOOoAuXzzPbgOnlM=;
        b=X9kk94CKIQDh9JicE57kNR9hnyA/lM+G5Jxr6iVWBrCHLzIb3Srhhtq2bLjJQ+7gj+
         dBBy9Y7Hr9YzqIPBZ0AGsyAlmlJlb5K1v8Ip3C++HH3R+/yKPSMNPvZ9dy89Wd0XCF83
         mAoOnqE4O3eui9g4uqO1ORbVGTEEb4APs5H+MuMxuQseIi+lV5yWsCQ1sCU85krSrCoI
         j/HO6MhdlagRIUowKaFLJQ97HwmzjrciuDNRCNyIQDNxHwvJVhcjxFEqjLsELV0ATaqh
         Wk3axPzIKiPyZ5JzlAjzOAb5rYbd9hxoW/8KhUkisdyIWehFAiPXtHmWzJN7/T54d6g4
         fNnw==
X-Gm-Message-State: AOAM531r9E6i8Qr17uu/bCvO42lj1QG1ITU99LxY+OQrbCegXP9wLF4v
        EefRbvADREja+1+6KnSF3WoQ17rbsK8HLsA07xIQysMcqFqTww==
X-Google-Smtp-Source: ABdhPJw/FYjtv9/SHu5oIIcyPHQ0fiPTzLLucdLj+N+59Gh4EwvhWxz43CJuCYGhgUp4wTDpUKXiRJPg2PF/XmktFec=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr639852pjb.129.1601045324033;
 Fri, 25 Sep 2020 07:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-10-warthog618@gmail.com>
 <CAHp75VdyOodxqkJCgmrdmcppyjVkDTyHDB-fqjoKS1g-88-umQ@mail.gmail.com>
 <20200924030732.GB11575@sol> <CAHp75Vd7Bmy5FWSputDCAAwSheH6ugszMyCcu1HOgC7BPVEX-w@mail.gmail.com>
 <20200925122651.GA218809@sol>
In-Reply-To: <20200925122651.GA218809@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 17:48:25 +0300
Message-ID: <CAHp75Vcw0HBwkdCFWpcGLs5MunGmDJBNrCeqmzz-mGDUWGNpog@mail.gmail.com>
Subject: Re: [PATCH v9 09/20] gpiolib: cdev: support edge detection for uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 3:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Fri, Sep 25, 2020 at 12:35:49PM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 24, 2020 at 6:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Wed, Sep 23, 2020 at 06:47:28PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > > > > +       if (!line->timestamp_ns) {
> > > > > +               le.timestamp_ns = ktime_get_ns();
> > > > > +               if (lr->num_lines != 1)
> > > > > +                       line->req_seqno = atomic_inc_return(&lr->seqno);
> > > > > +       } else {
> > > > > +               le.timestamp_ns = line->timestamp_ns;
> > > > > > +       }
> > > >
> > > > Ditto.
> > >
> > > Firstly, drawn from lineevent_irq_thread() which is structured this way.
> > >
> > > In this case the comment relates to the condition being true, so
> > > re-ordering the if/else would be confusing - unless the comment were
> > > moved into the corresponding body??
> >
> > Yes.
> >
>
> Does that mean I should re-order and move the comment into the body?
> That would work for me - the normal case is line->timestamp_ns being
> set.

Yes, that's what I meant.

...

> > > From gpiod_to_irq():
> > >
> > >                 /* Zero means NO_IRQ */
> > >                 if (!retirq)
> > >                         return -ENXIO;
> > >
> > > so it can't even return a 0 :-| - we're just being cautious.
> >
> > I would drop = part then.
> >
>
> ok, but you'd better not come after me in a subsequent review for not
> checking the 0 case!

For IRQ?! Maybe if I'll be drunk (quite unlikely).

I really don't like to check IRQ against 0. To me it should be
transparent to the caller. If IRQ == 0 in certain API or entirely in
Linux is considered NO_IRQ, then it should be either correctly handled
(means all following actions on it shouldn't fail, or it shouldn't be
returned in the first place).

-- 
With Best Regards,
Andy Shevchenko

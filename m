Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D305A7F70
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 16:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiHaOAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 10:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiHaOAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 10:00:40 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384396E2F5
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 07:00:39 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id e18so11000449edj.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6P2lNRWGpZ/wwTsS6VCxsNms7FDaVc457DP8/wjf4sI=;
        b=52a+2IX0YGfnqz28f3UmFbBleYRk6kTKTLXnAGyUYgRMmVD1G3B2whwY8hGfSNj9tZ
         4S96eLI7xh/bOk7Q2Sf3XdlDb4MhpYUPI04ZuvDxLZrWrCRDtQbWkc1cXvZ3aL1juPcM
         6aBk499GW2+fpjSMJU4+uTjmx+9k9Le7RjgiPe3d4AeIGbZHzyyrTesZx4c1ZFgXML9F
         yFYXWyJYY5+m3bRUFY5fW9ZHTmOoNiLRjoX3H3UaNfrFfxWYxsMf/4Qi/rCO5zYxVvXq
         bFVzKPPxTNSQudB4bZBISfM4VLwMTTZ5AWFl321KoAsNhJADDmNTG15hFH3U63eab4/l
         JR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6P2lNRWGpZ/wwTsS6VCxsNms7FDaVc457DP8/wjf4sI=;
        b=EVbMTqp1KMK9lKNl7KNIp9xnwQ6mWO5edcw2nsEAJ30/xMyQ3sA2gamsizw6oHFc4N
         64hM8LPh5Wp/ex3Sw/MpBt11sZctXRGE64WBlQmk5AXhbcLeCFgpKUUOAb82AeagAxVa
         MCmr0sKAjruGhZOL9oAHvXDYm5qI6Bp+xI8LdIx/W0cIuO0C05R/9OxInuzoeHz5PrEg
         4bHMkYnV+wq9Icf0TlXe2lNSsRtHxFcxDkGh53cUj+8+ROawY4tZLyJCi/yaUaHsETPI
         3QTd694he2Ek0RET0SejcZMTDOkVGAjoRrdbtyBi49Z8L75/myp7KYfriPbAfHQAXUco
         9zEg==
X-Gm-Message-State: ACgBeo2TFMwdjBJMS4/YjNMRpXAQhJRmp9UVrglqQhbTGEYOu9yZKXjm
        Rg9TBRzR0ORniDKRvFgBb4JxfNca2Dw3SM2MWaHMYA==
X-Google-Smtp-Source: AA6agR6v2xfdp44q10zwuyuTtHUsTsSrbGtgUSYRAGCpH2+GAlWVbFFmwXd5cRLVHL5VvMA4Ov7vkQJOB7EHM3Bd32o=
X-Received: by 2002:a05:6402:51c6:b0:43d:dd3a:196e with SMTP id
 r6-20020a05640251c600b0043ddd3a196emr24908383edd.213.1661954437747; Wed, 31
 Aug 2022 07:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660839809.git.william.gray@linaro.org> <CAMRc=Md5Et-T++mZVw+jXnOWQS23o5hUOATYqs6b+pR1zr57Yw@mail.gmail.com>
 <Yw9n+m26FhEyxbNs@ishi>
In-Reply-To: <Yw9n+m26FhEyxbNs@ishi>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 16:00:27 +0200
Message-ID: <CAMRc=MeDZz9uK6o4dzL8YqvquepCeM6ZeL+2K0PLZYp50x-Wgg@mail.gmail.com>
Subject: Re: [PATCH 0/6] isa: Ensure number of irq matches number of base
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 3:54 PM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> On Wed, Aug 31, 2022 at 02:35:51PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Aug 19, 2022 at 1:11 AM William Breathitt Gray
> > <william.gray@linaro.org> wrote:
> > >
> > > Several ISA drivers support IRQ and call devm_request_irq() in their
> > > device probe callbacks. These drivers typically provide an "irq" array
> > > module parameter, which matches with the respective "base" array module
> > > parameter, to specify what IRQ lines are used for each device. To reduce
> > > code repetition, a module_isa_driver_with_irq helper macro is introduced
> > > providing a check ensuring that the number of "irq" passed to the module
> > > matches with the respective number of "base". The relevant ISA drivers
> > > are updated accordingly to utilize the new module_isa_driver_with_irq
> > > macro.
> > >
> > > William Breathitt Gray (6):
> > >   isa: Introduce the module_isa_driver_with_irq helper macro
> > >   counter: 104-quad-8: Ensure number of irq matches number of base
> > >   gpio: 104-dio-48e: Ensure number of irq matches number of base
> > >   gpio: 104-idi-48: Ensure number of irq matches number of base
> > >   gpio: 104-idio-16: Ensure number of irq matches number of base
> > >   gpio: ws16c48: Ensure number of irq matches number of base
> > >
> > >  drivers/counter/104-quad-8.c    |  5 ++--
> > >  drivers/gpio/gpio-104-dio-48e.c |  5 ++--
> > >  drivers/gpio/gpio-104-idi-48.c  |  5 ++--
> > >  drivers/gpio/gpio-104-idio-16.c |  5 ++--
> > >  drivers/gpio/gpio-ws16c48.c     |  5 ++--
> > >  include/linux/isa.h             | 52 ++++++++++++++++++++++++++-------
> > >  6 files changed, 57 insertions(+), 20 deletions(-)
> > >
> > >
> > > base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> > > --
> > > 2.37.2
> > >
> >
> > Looks good to me, do you send your PRs directly to Linus? Do you want
> > me to take this through the GPIO tree?
> >
> > Bart
>
> Hi Bart,
>
> Would you take this through the GPIO tree? I'm planning on submitting
> some more patches later for these GPIO drivers so it will be convenient
> to keep all these changes within the same tree.
>
> Thanks,
>
> William Breathitt Gray

Sure, just leave your Acks on the first two patches.

Bart

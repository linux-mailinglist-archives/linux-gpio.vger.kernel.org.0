Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8082D4022
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbgLIKjv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbgLIKjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 05:39:51 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55C7C0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 02:39:10 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id f9so737053pfc.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYhJRPwi46R4OiNBvna2fl9iuS/T/Z0gnmLAbxys4bo=;
        b=QcQg85PYsxfFTstUmzoJ7NdPmo7uv1O4ylDNC8lLMxVlXsApI/E/0GAs+ajBHwhDSv
         YoopDCK4W+BqYIlUhbC7BgUihvgXtt28D5bHH4m9ckCn706zlPXL9rHN2277KiXV/dCc
         RyTsnNzzGc6gs0jo7hIYDl3pE5wnd+j+qizg3lVnqRaCBiEh40pL46yRnuSC4gxSAxkg
         GKJospJeZxYaeaoT+ud0q2Z+v3tWgxtkhN0HkHX+KOKqGhTW17qi3/yXdieB/LOTNtBG
         yiuDuVOFiGAX+AeoXpLEt2MTZAE4K+uldSDD5RaR1w6rCCWw37as7RWY0ZFtJYCKfimB
         5Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYhJRPwi46R4OiNBvna2fl9iuS/T/Z0gnmLAbxys4bo=;
        b=EmCuDj3WL74AGjMiBZSEQb5nBBL3nWprFjXeEPINOx6AJATle7WgK9ZDNXWnTkzUQ7
         Nbd+zCxibsuOqj/whgUr8WNPSthH3yjChfHO2tOEY3kYrk41OBKTSXgPcmGlQmLfwd55
         iFMRLjVb9FAYuYP6utYzCSjbBVcZpf8CxMMyf68Z875rLnaeaKpDdUHf4zSoYSJJCLZ0
         DmaCVusxo4KswOgviTB+G0333+2orEY2NGEjRLDVnSZZEZllqUmQeFe9TPKiz377D/Ln
         cKv2IDtV71+RKcCMPqWSGH63bxcsdrXM3s+rM56KeSbCMpFzFsGt9WKWYRz9lAHtda6V
         FQag==
X-Gm-Message-State: AOAM531RWfv/2VwjPSGSgJdpWOKYX/ljPNWZuatURJT5/x9OE7EROcQJ
        iFiQIhOpsDvJHWB4AklZhFNZeWog0/38r4CO/Q0=
X-Google-Smtp-Source: ABdhPJzrYuc0Xv9hRzTjnYyMqcQ/IcQkkr/g27TKPOi6NerC5bWK++kZH/M0ComHu34FDydPu6MDeMp+VJhc9HxThq4=
X-Received: by 2002:a63:4002:: with SMTP id n2mr1424898pga.4.1607510350444;
 Wed, 09 Dec 2020 02:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20201209095248.22408-1-brgl@bgdev.pl> <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
 <CAMRc=Mdq7LBTAbUguuLH=f5_vfo5pc95BCveqSvApBTC26aNQQ@mail.gmail.com>
 <CACRpkdYM2knogZLRp+AAdE5ssvhULDZ6xr8yGrO8rvSMrZuScw@mail.gmail.com> <CAHp75VefreUB1KvdPGYUqmd7jq+hEWuPoq7nRG4RxLP6YpPRLA@mail.gmail.com>
In-Reply-To: <CAHp75VefreUB1KvdPGYUqmd7jq+hEWuPoq7nRG4RxLP6YpPRLA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Dec 2020 12:39:58 +0200
Message-ID: <CAHp75Vebqe2ndfAx5b_awLnjM7UCh2bmcdJBEakVZL3hSQhRQA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.11-rc1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 12:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Dec 9, 2020 at 12:22 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Dec 9, 2020 at 11:13 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Wed, Dec 9, 2020 at 11:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > On Wed, Dec 9, 2020 at 10:52 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > > These are the patches I collected over this release cycle. Nothing all
> > > > > too exciting - mainly just updates to drivers and refactoring of the
> > > > > core code. Please pull.
> > > >
> > > > Nice!
> > > >
> > > > But I get a merge conflict in gpiolib-acpi.c! Since I said Andy should
> > > > be maintaining that file it makes me a bit nervous.
>
> Linus, no problem. This conflict can be easily resolved.
> Do you want me to publish a test branch with an example of resolution?

Here you are:
https://gitlab.com/andy-shev/next/-/tree/test-gpio-brgl-merge

Manually I did the following:
- removed the conflicting hunk entirely
- added 'break;' to the existing function in 'case
ACPI_IO_RESTRICT_OUTPUT:' case


-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307E03E2DD6
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 17:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbhHFPiB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 11:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbhHFPiB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 11:38:01 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF72C0613CF;
        Fri,  6 Aug 2021 08:37:45 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so2315186ooa.11;
        Fri, 06 Aug 2021 08:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lGvJmsycmgCmOI6JA8Sa8r1RAAPuWHxfhQIzlc+oq6o=;
        b=ezk+ASffkDFeAcncK6Qb5oLmf4erXkwYEstcgEDeoNMyf7hdGjWcUDTWLYc7Rd+Zv4
         BlOT8YE2VWTQEJaVThYWiW2fraesUAYiyRx1VJ6ezlnFEyXLtmsOymHlpp2sOGfd3pdT
         cW/pxdXA5PkbqaKKi8LtDnL4Md2+mqnfHNDcEEekfvq8wEKLs0ItnqYKjul/VAHQvKba
         tabZtf+WdLhKQFWvrwvKl5iDirvTFvt20Jn5Tl26fhoo8ldyZjUdyM0GBki9ZJHkNKx/
         qZF/sS8YO72rw+pmZms5p5KlkKnjJ8Yc85OQ40I/vtUTs7axXLLlP7zuMn/N/TsyiaL+
         brpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lGvJmsycmgCmOI6JA8Sa8r1RAAPuWHxfhQIzlc+oq6o=;
        b=f/6A83xKm3FD8zlsRL/9A1PZMFrxwzyimTuMC+Up/nlOyn+6qt8MwQT7O8aKQKQlxd
         ZNYf193WGNSU8I/6JaeFTLB9k4v20YAb5OfRR9ZLe4xxeWIfVPJkftwQIjEDx55qnKGV
         c9J3I+4Q4OQguF2vZVtWQcuKeQ1b59HgtqxO9iLys9QcAoot6ZsNx/Vs66jiDG46N01x
         7qpsIOB+nvA22+MAve1tl9oWYwcUKQA9Y6xyZdSchI7cgAJjqWTk4pEW248jf8gwk0Y3
         GI+MnR+yLe+/cl1CRWOm7evKAHq+J02J2iLUzo8wuIiHm/KnSa56SKpaItqYdNiwS9uL
         j9Rg==
X-Gm-Message-State: AOAM531RTUZoVuvfK/4d8nytY14MeBlZC1AYyeJKk2H9EXh7DBiQ8pVE
        tKNNC6GgN2quat/bYHq9n/Na5UevPUhhpIVQ0/U=
X-Google-Smtp-Source: ABdhPJwo8vIlNnRf18qqvY3RITaMHPGnW2f+zeFdq908SCRyLrIg1M5cSJeEPMoD2SakQZL0VOTGDapw5berB1OV1Wo=
X-Received: by 2002:a4a:b601:: with SMTP id z1mr1757127oon.7.1628264264376;
 Fri, 06 Aug 2021 08:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210806005755.2295193-1-chrisrblake93@gmail.com>
 <CAHp75VenSw9BanwH58VSCNpw4cNFf7h3uSWTXLb5n0+OPtnDTQ@mail.gmail.com>
 <b5430038-c18c-6037-44d1-a3c0089645a1@redhat.com> <CAHp75VeUcrHuBOW9LJ=sPR0atxoEEe19mpD32UfjY1NncD5dLA@mail.gmail.com>
In-Reply-To: <CAHp75VeUcrHuBOW9LJ=sPR0atxoEEe19mpD32UfjY1NncD5dLA@mail.gmail.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Fri, 6 Aug 2021 10:37:33 -0500
Message-ID: <CALpBJjosR8WvG=8QB=i12JSpbS3wyPbWLC_N1YM+8FSfVyL1rQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: add meraki-mx100 platform driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 8:59 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 4:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 8/6/21 9:52 AM, Andy Shevchenko wrote:
> > > On Fri, Aug 6, 2021 at 5:47 AM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> ...
>
> > >> +#include <linux/gpio/machine.h>
> > >
> > > Does this provide a GPIO controller driver? I don't think so.
> >
> > Actually GPIO controller drivers use <linux/gpio/driver.h>
> > <linux/gpio/machine.h> for board files / glue code which
> > e.g. needs to add lookup-tables, which this code does,
> > so including this header is correct.
>
> Ah, indeed. I stand corrected.
>
> --
> With Best Regards,
> Andy Shevchenko

Hello,

Thank you both for the feedback, i'll work on getting the fixes
implemented. The only one I have issues with is finding the git hash
for the dependency commit in mfd, since I don't see it merged up yet
to the maintainers staging branch at
https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/.

@Lee, sorry to tag you in but any chance you have the git hash for the
PR I did earlier that you accepted for 5.15? It was named: mfd:
lpc_ich: Enable GPIO driver for DH89xxCC.

Regards,
Chris Blake

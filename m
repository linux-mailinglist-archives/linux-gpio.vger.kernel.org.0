Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C34362F6E
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Apr 2021 13:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhDQLHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Apr 2021 07:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhDQLHA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Apr 2021 07:07:00 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B784C061574;
        Sat, 17 Apr 2021 04:06:33 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id g16so6734972pfq.5;
        Sat, 17 Apr 2021 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=udvnBQCOIu07yWW+bUwBhHLYQp2mwzlTeD1WKOrgd6k=;
        b=ZMPJjChLH1qNEDDMhyD+9Z92kzx3jDyn1UW6AJ4PxjnBFf2Q8xs1ZiLVQ+6QypaaC3
         p5sZTC2NBtC779PvxpB94IVX+t6EbtpI009kT4+D4MJ3S7ZpAQ/uFyFL2l0j8HFQOvfp
         GHZmEvnXdNgQD+tUfHJ97lUMtbKdwvz01Ghf/r7doBYUjwK66zj4cjbx3lfvS4pO6L6l
         dqUd7vO0/U1m/gHOR+OLUxdNyXZXokWScMZYDJ5crpOuWFuWR77zX9e73czxb6FNjBVU
         zzfWaTYSDS9C1A9ujJ3wCXlJVIoC2ouiioYutzlNEz6bnoDIe+Fn0PbJkBjRcYikz+Rn
         FTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udvnBQCOIu07yWW+bUwBhHLYQp2mwzlTeD1WKOrgd6k=;
        b=jiNGR3xPmzGFFGWx9YbRt+C/RLL1ME9ZtIiHxuy6tu91knbRcSPLxnC24osdWNL8RA
         6aEUJ+cNV1uWJW4E2h7IC1Bg4i1keK8LwoCD1QvSCb6ByI34qsMl2MW45TzNrWp1po6w
         M6uw6vKXFrERKHr5Yo5e4KjjjoSaYPHTA+LkmuUTO8KodjFHoSYDfh7gPPonfxKb/wUe
         eWGtG0KNHuKi+1lHOaIPQ5kQqVaY6vBWcc+eBxUjd1sbk7PyyVzYfAAghnuVwHRsrdrW
         aZms9dCjALKxGXCB8gfJXSthDp7GvOhZv73VkQbra5bY6ZJTm02jvvjJ1aKHr6g8NmbM
         0tMg==
X-Gm-Message-State: AOAM530/SqaPsfdIyDoJoGw74qm70MP2eR/30CfZV481lh+p678wGCus
        WceVzueJf2ABdcv1eM34uSCRAmQNUwW01tcIn/E=
X-Google-Smtp-Source: ABdhPJzDj9wKE80zsHpgEMqyFLgZtJTOkGjyjt5kWOPlD/EiyVZyLQw8rqgbg8xGIyuSkyNi54mSvxplpBHAsgKSWKw=
X-Received: by 2002:a63:c48:: with SMTP id 8mr3075120pgm.74.1618657592559;
 Sat, 17 Apr 2021 04:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
 <20210409140806.31824-2-srinivas.neeli@xilinx.com> <CAHp75Vddd6ygr4mJ9Z+SuGZmfLcgDLWLZaxby2XE2mX8War-qQ@mail.gmail.com>
 <CAMpxmJW=HWf_NxGpfBkX=utgOTs4+6RtypxnKGtpuYnX=t8rGQ@mail.gmail.com>
 <DM6PR02MB5386CADF5A10EF28A640AD76AF4E9@DM6PR02MB5386.namprd02.prod.outlook.com>
 <CAMpxmJV_CtFQpZvr_H0g3DvPMQZwqa-9z2FVxCLX=tF9Ytkj7Q@mail.gmail.com>
In-Reply-To: <CAMpxmJV_CtFQpZvr_H0g3DvPMQZwqa-9z2FVxCLX=tF9Ytkj7Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 17 Apr 2021 14:06:16 +0300
Message-ID: <CAHp75VcdXg+Z0Xz7X_cZSdbockvMO6YjdqxcWp9-_P85SPFKZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Srinivas Neeli <sneeli@xilinx.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 16, 2021 at 9:28 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, Apr 14, 2021 at 4:45 PM Srinivas Neeli <sneeli@xilinx.com> wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Sent: Tuesday, April 13, 2021 4:14 PM
> > > On Sat, Apr 10, 2021 at 12:08 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:

...

> > > Yep, this has been like this since the initial introduction of this driver.
> > > Unfortunately there's no documented reason so unless we can test it, it has
> > > to stay this way.
> > >
> > I tested driver, functionality wise everything working fine.
> > Based on below conversation, I moved driver to module driver.
> > https://lore.kernel.org/patchwork/patch/818202/
> >
>
> Andy: How about we give it a try then? If anyone yells, we'll just revert it.

Sounds like a plan!

-- 
With Best Regards,
Andy Shevchenko

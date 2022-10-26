Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D153860E136
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 14:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiJZMvd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 08:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbiJZMvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 08:51:32 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E79DD891
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:51:30 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id y129so7795827vkg.8
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MsB4qBPjpgcHYx8+lcYwIXJdnA7utXxH3W08banDjGA=;
        b=cUNXi01PsdzbRkMp5m1ITjc2gBs2EHihS/51UX4cHPIkUj1fpNEpEHKaBMn2m35GsU
         uzSPYP81x/0SLimTifYkmX6MTJ+++X4sDUoOllxjzcyBDFTB2V/sc227exQrVW7e39UH
         baUqytjfMAZpVFxGgqL52HXnZyJMoRhbLyF9qcYO5KApbotQoFDpoPI7qXlANSqWmS6c
         7Xma+cyEeGFm+xzEQs0wQgHY1p7Bqc4/qUpjJwYLJOkKi4892Oy2BVmglpD93Wx6YeW1
         06FV8bABkl+I0DrlaKDYEF9VnV4yg+BwxQ0QH2wJpG7Lbn6lMrIU1VkStIGge0XWy0qz
         mM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsB4qBPjpgcHYx8+lcYwIXJdnA7utXxH3W08banDjGA=;
        b=7gZEJEOpJyM/ap68gqcG6gp0p99xGX6MaVpdVPf5RijNkm/HY5y1+y1SDb+Ra/Xlvq
         m0DUD2zyeH2UOv/wq9TheVI6FMPtryXYOCvqG656YXjQn5nlS1bLIhAcVo4OTfUuajqH
         zZNiYOu1AbXPzLD6CG5DGyiRaqvIeQz5u78eZ/2KopjtV+9xEYsoCyzuyy8Wrf+jqH3/
         +Xs6D3QUv1ron7C5ktL5GoMFWgRhL9fJh+ntX6vxHNWXLApVle1hmGnlpTK5PK8v0gBd
         yThzHRgDMrvZpLvUx/rLj6F9vPi07ChyTimiBNNGy/F5iCfMub3nbe3p4OXesOa8jDdd
         l/XA==
X-Gm-Message-State: ACrzQf1PKw8eMXDKg6F41stQ1dmHaD7/y6HoL9F4AS7EAG72rzmGbZmx
        AQarhiJtojbxqfHFRrHffa/p2WLdEwcdmcnZ51SJ1AHgNoc=
X-Google-Smtp-Source: AMsMyM5GucTb1XadTqwakxDzlyW8r6GrVuewHRaRjn8hZX0HjTZCuTijjuXPgFxsmpOVQtP+q5ZH6O3f+Hfa0Ds0KCM=
X-Received: by 2002:a1f:2455:0:b0:3b7:88a4:c121 with SMTP id
 k82-20020a1f2455000000b003b788a4c121mr5738060vkk.1.1666788689808; Wed, 26 Oct
 2022 05:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
 <20220930102259.21918-3-shubhrajyoti.datta@amd.com> <CAMuHMdUAcA=4Xcgr9hHgT5cro=s0mvAQqHmco0-e-NvWKJmrCA@mail.gmail.com>
 <Y1keKRzBhSDi671j@smile.fi.intel.com>
In-Reply-To: <Y1keKRzBhSDi671j@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 26 Oct 2022 14:51:18 +0200
Message-ID: <CAMRc=MfR14_Pd57AgqyGTRsghb7OjyPNOyoWmvnae5i=Fnznug@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: pca9570: add a platform data structure
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-gpio@vger.kernel.org, git@amd.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 1:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 26, 2022 at 12:00:34PM +0200, Geert Uytterhoeven wrote:
> > Hi Shubhrajyoti,
> > On Fri, Sep 30, 2022 at 12:41 PM Shubhrajyoti Datta
> > <shubhrajyoti.datta@amd.com> wrote:
>
> ...
>
> > Thanks for your patch, which is now commit 35a4bc94a47f2ea6 ("gpio:
> > pca9570: add a platform data structure") in gpio/gpio/for-next
> > linux-next/master next-20221026
>
> Dunno if Bart rebases his tree...
>

I will back it out of next. Shubhrajyoti: can you send a fixed version
of this series?

Bart

> ...
>
> > >  static const struct of_device_id pca9570_of_match_table[] = {
> > > -       { .compatible = "nxp,pca9570", .data = (void *)4 },
> > > -       { .compatible = "nxp,pca9571", .data = (void *)8 },
> > > +       { .compatible = "nxp,pca9570", .data = &pca9570_gpio },
> > > +       { .compatible = "nxp,pca9571", .data = &pca9571_gpio },
> >
> > This breaks bisection, as .data is still considered to be the number
> > of GPIOs:
> >
> >     gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
>
> You beat me up to it, I have also noticed this.
>
> > >         { /* sentinel */ }
> > >  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

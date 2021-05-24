Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2087938E3D2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 12:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhEXKUf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 06:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbhEXKUf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 06:20:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68900C061574;
        Mon, 24 May 2021 03:19:07 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id q25so2418091pfn.1;
        Mon, 24 May 2021 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7P3rbw20QtIx2EZ/I5Mr6iPXXPT7ZlUKHnawyS02Flo=;
        b=RhqivdwEmZWNijDNmcq07SRQuMeVT/LKWaR1UdAItNS6PGGD2UOXMvh2CJNENYCqm9
         40tIg2Et2nRMQnbILw8C3x/1RsvkQLBzOrmRHJ05N+nQccfgYYYZ9jHBh4A6C8jxbfAV
         /vXPKq/QCuIlJLuZuXDkYBqLfI98RFls1t9ORJEY0WhkvF1GeBZIHA9EOs+nJciVlJQG
         zRTpV4INuoo8BX7tXIyz/VbZKkhx5qtZLasI/Cc+TeDgje5EiEh+3F49eZ8LgMcUp/WY
         aMIWBgFV0ZZLCg5yolEwJSvNvv4k5lfblV5eeQ7unFqkbtv6OBairw4D/9qdqScr+JfN
         6nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7P3rbw20QtIx2EZ/I5Mr6iPXXPT7ZlUKHnawyS02Flo=;
        b=JTkgSnJbi/FpxX2ntVu7vXGsqadukyJzl8dIhb5BlSBVwKnC/7+7xPsIoOXJgcswEQ
         YBnBhyLs13Ei2NpulRnmxWRsEozPOcinn/U4/EjPCj4E+DElIOzwIxim+2plq/U6+DGd
         friGMCJxldbpxQ6JnyVTz293n/A8d7gd2iT0l25rBIwS82FaFHQyD2pljEQkbL07pxjS
         O1zhy3xjrD8hT6xAtV6J8iQM1Jxu1H5dj6Cq1JSrOaSe4h0ojaV2oPYp6zY5b9ZWF7qn
         4eDhWJsIAnhMLRCHXsYkh0FuX3en8klX9SzjlzGPo09LvlKgfJgVON/Cr7sR6FtK68ER
         Ayeg==
X-Gm-Message-State: AOAM5312AsC1DqHcWYa0A2Pu2GsDIR915rpD370jbIujJcawyP2xtjmO
        RbV0Vfo/LJ/1QVwK71KCwswF4JJT2csLPMfpnE0=
X-Google-Smtp-Source: ABdhPJxgBLi5YvLSVwx0GwgcoKPWvL1t+1Uyu/4O7lPdzNvjMHnfPdtr+B5VevOc7ChDFnyA0QNB/7ipxUN9pRxzPlE=
X-Received: by 2002:a63:4145:: with SMTP id o66mr12921437pga.4.1621851546868;
 Mon, 24 May 2021 03:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621809029.git.sander@svanheule.net> <6d14b72bc545a818675d99c8e91e99c96cc3e286.1621809029.git.sander@svanheule.net>
 <CAHp75VcbRKGYSJZK_Rg969-Uck=h+8byWt0B3MtQJDqwbdf2sw@mail.gmail.com> <cb8593ab7a70528528bae3de45e33fae68a9ec1c.camel@svanheule.net>
In-Reply-To: <cb8593ab7a70528528bae3de45e33fae68a9ec1c.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 13:18:50 +0300
Message-ID: <CAHp75VfVNJSuiErRYNLvUrCytWXwzos5Uj87Hj+bSBee7p2YfQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mfd: Add RTL8231 core device
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 11:23 AM Sander Vanheule <sander@svanheule.net> wrote:
> On Mon, 2021-05-24 at 11:02 +0300, Andy Shevchenko wrote:
> > On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:

...

> > > +       usleep_range(1000, 10000);
> >
> > It's strange to see this big range of minimum and maximum sleep.
> > Usually the ratio should not be bigger than ~3-4 between the values.
>
> I could also change this from a usleep to a polling loop that checks (with a
> loop limit) if the reset bit has self-cleared already.
>
> The datasheet that I have doesn't mention how fast it should self-clear. So I
> checked, and it appears to be done after one loop iteration already. So,
> certainly faster than the current usleep.
>
> Would a polling loop (with maybe like max. 10 iterations) be a good alternative
> for you?

I guess it's the right way to go. Just check the iopoll.h for helpers.
Also regmap has regmap_read_poll_timeout().

-- 
With Best Regards,
Andy Shevchenko

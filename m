Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0DF59368F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Aug 2022 21:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240887AbiHOSmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Aug 2022 14:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241841AbiHOSkN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2022 14:40:13 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C87B3DBFF
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 11:24:12 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3321c2a8d4cso40503917b3.5
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=BJt/vOP9OHL0y+jrzm5cg2sCaG+27wsaXcgILhgn7lo=;
        b=p5i2uxjK2NzMF+6PIEOLJxbFor9NpM8loKbuBWNdYO5TWdrtkHdgD/du41IQW6+PjG
         AbEW1vxV3zYLc1nK4Er6j8q1ZlcyqWbgeHKCT8HBFBhFplvn+iSTAsGzFfS3Qk1YpWdH
         l70Fy/+CAa3SCs0eCx+hFGYG8vbueikjPrrZDuYi5VGHfeL/oDpaGwYwzF7U6d4mT3G4
         ZX1BI5kKPewL+vCx6YML/AQ46tisemqNuM/TLnprheAuNFkjoidWQ3BHdwR1o/WT+a9q
         AVF2DI5Nv3FWGggxRWvspruaWnDLJLPovT7bn/ehMNzJDYfIHV2wBuxYHNqtTxme5CQG
         2EfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BJt/vOP9OHL0y+jrzm5cg2sCaG+27wsaXcgILhgn7lo=;
        b=vmrZSVSE7VfQe7hy4eN5Mkx0RrBJxb6ML1PKYO8AazHKCOUehL3gAOQQKQfOp140rn
         5ixBowBG/inE5Y2dPUcWpThLqItzCm8bODhvjKl0qm+K+YnVItsDICONXExrxktd7qFF
         /1s0YdirodV87ZMaNk06/tTa2883FBH8j0A8eqeTnIMU9MPA7Ec1Eu6CTinsK2PckbQ8
         uuvkDcBUaw2O3Tsd0Zx0bd1oTm8FHii2kVBttflRB7GAT2jFFvZjYQvg/0DQ4lrbmBiu
         gHSpdj3L9TIV8UqsUhzcH2NtdOAVEQ5kQjueuUAx6ZBDrp75UoFsmNb68sUQJBYFUcJK
         15Xw==
X-Gm-Message-State: ACgBeo1OolnEd45Km6Rk6KVrVm0HzlGXIa9NRKGIku5GQW3tBJbJT57Y
        ORyG5XWIHzD3TprtBTuGwehoKlifqsZ2yvWmkcG0nQ==
X-Google-Smtp-Source: AA6agR45xoYO6Hu5/U+BI3ADwqpB9ej+KA64Yt7nhN1oYI2fH7yVe/vv25x6B4XIjaCcCmIdDBDKwXtcWBGPauCLrBc=
X-Received: by 2002:a81:998c:0:b0:326:5dab:df3f with SMTP id
 q134-20020a81998c000000b003265dabdf3fmr14329271ywg.126.1660587851957; Mon, 15
 Aug 2022 11:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220810060040.321697-1-saravanak@google.com> <YvonlAwXAoXTUTZe@linaro.org>
In-Reply-To: <YvonlAwXAoXTUTZe@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 15 Aug 2022 11:23:36 -0700
Message-ID: <CAGETcx8AApnpQOsKgGoC=WyLCWH4AzpQQ-qNpu41F+czxi=_pQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] fw_devlink improvements
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 15, 2022 at 4:01 AM Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 22-08-09 23:00:29, Saravana Kannan wrote:
> > This patch series improves fw_devlink in the following ways:
> >
> > 1. It no longer cares about a fwnode having a "compatible" property. It
> >    figures this our more dynamically. The only expectation is that
> >    fwnode that are converted to devices actually get probed by a driver
> >    for the dependencies to be enforced correctly.
> >
> > 2. Finer grained dependency tracking. fw_devlink will now create device
> >    links from the consumer to the actual resource's device (if it has one,
> >    Eg: gpio_device) instead of the parent supplier device. This improves
> >    things like async suspend/resume ordering, potentially remove the need
> >    for frameworks to create device links, more parallelized async probing,
> >    and better sync_state() tracking.
> >
> > 3. Handle hardware/software quirks where a child firmware node gets
> >    populated as a device before its parent firmware node AND actually
> >    supplies a non-optional resource to the parent firmware node's
> >    device.
> >
> > 4. Way more robust at cycle handling (see patch for the insane cases).
> >
> > 5. Stops depending on OF_POPULATED to figure out some corner cases.
> >
> > 6. Simplifies the work that needs to be done by the firmware specific
> >    code.
> >
> > This took way too long to get done due to typo bugs I had in my rewrite or
> > corner cases I had to find and handle. But it's fairly well tested at this
> > point and I expect this to work properly.
> >
> > Abel & Doug,
> >
> > This should fix your cyclic dependency issues with your display. Can you
> > give it a shot please?
>
> Tested the specific case we discussed about here:
> https://lore.kernel.org/all/CAGETcx8F0wP+RA0KpjOJeZfc=DVG-MbM_=SkRHD4UhD2ReL7Kw@mail.gmail.com/raw
>
> Thanks for fixing this.
>
> Tested-by: Abel Vesa <abel.vesa@linaro.org>

Thanks!

-Saravana

>
> >
> > Alexander,
> >
> > This should fix your issue where the power domain device not having a
> > compatible property. Can you give it a shot please?
> >
> > Tony,
> >
> > This should handle the odd case of the child being the supplier of the
> > parent. Can you please give this a shot? I want to make sure the cycle
> > detection code handles this properly and treats it like it's NOT a cycle.
> >
> > Geert,
> >
> > Can you test the renesas stuff I changed please? They should continue
> > working like before. Any other sanity test on other hardware would be
> > great too.
> >
> > Sudeep,
> >
> > I don't think there are any unfixed issues you had reported in my other
> > patches that this series might fix, but it'll be nice if you could give
> > this a sanity test.
> >
> > Guenter,
> >
> > I don't think this will fix the issue you reported in the amba patch, but
> > it's worth a shot because it improves a bunch of corner case handling. So
> > it might be better at handling whatever corner cases you might have in the
> > qemu platforms.
> >
> > Thanks,
> > Saravana
> >
> > Cc: Abel Vesa <abel.vesa@linaro.org>
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> >
> > Saravana Kannan (9):
> >   driver core: fw_devlink: Don't purge child fwnode's consumer links
> >   driver core: fw_devlink: Improve check for fwnode with no
> >     device/driver
> >   soc: renesas: Move away from using OF_POPULATED for fw_devlink
> >   gpiolib: Clear the gpio_device's fwnode initialized flag before adding
> >   driver core: fw_devlink: Add DL_FLAG_CYCLE support to device links
> >   driver core: fw_devlink: Allow marking a fwnode link as being part of
> >     a cycle
> >   driver core: fw_devlink: Consolidate device link flag computation
> >   driver core: fw_devlink: Make cycle detection more robust
> >   of: property: Simplify of_link_to_phandle()
> >
> >  drivers/base/core.c             | 437 +++++++++++++++++++++-----------
> >  drivers/gpio/gpiolib.c          |   6 +
> >  drivers/of/property.c           |  84 +-----
> >  drivers/soc/renesas/rcar-sysc.c |   2 +-
> >  include/linux/device.h          |   1 +
> >  include/linux/fwnode.h          |  12 +-
> >  6 files changed, 323 insertions(+), 219 deletions(-)
> >
> > --
> > 2.37.1.559.g78731f0fdb-goog
> >

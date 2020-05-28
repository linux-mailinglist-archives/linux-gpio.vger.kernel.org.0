Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DA01E658C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 17:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403927AbgE1PMD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 11:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403787AbgE1PMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 11:12:02 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCECC08C5C6;
        Thu, 28 May 2020 08:12:02 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 131so5283336pfv.13;
        Thu, 28 May 2020 08:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDrC7TuMBS0fUderfLWy0ZPmYWVYaYketmpnhrngbII=;
        b=s/02WXR7v0n63oFch1Skj3sXCKC7bA8ppEh+w1ZOuPPvUQkI1nAnZ+p4wcgUUaZ4J6
         m7rEvEmcvc5YdiIBLIWaYvJwNtPGE5z+8TIF2OHnjhnsXkQbHJNSy+GsILjqlxDULOF8
         lW4rGa73dFVD8CvysXsdpSZ0FbIPjPGSnGM6efOpn8dLUcyzvMhWE+83ZlxCAy0mIknm
         OkamKwTDgxVjd+dE5jW6UJ2IB1OUnYAsyAhjPewGRo9hEHoZ8guL5kGeBb9L2FN5JmpP
         EnPGFyUyRZizQQM/Wch7BoH8NFSNfYpK/aLHbGwGRaJ1lVps6UI0SM5XTYYyIdW3DGeq
         /TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDrC7TuMBS0fUderfLWy0ZPmYWVYaYketmpnhrngbII=;
        b=dbJdTeW1NEdttF9Pixn0dIVdzB0NkGoC1eo3YV/7XPObM0LvxH61duNASmVO+S+3FK
         mGmQVM9TuxQfiD9bu4EDeA/IlasSFDCEop2WrZ0WAfhOrW3LKAlzAUELyQ0QlNtncws/
         v71baIcOZ7isHi5Q9hfR6y07teAjCE4xdyzqo03SMne8Bv/AMHGifs0p0s4pWQV3CroY
         ovoZBSdmi5p6JZhGHpNgeLXw1b9zi0DNbB4dXtF8+c+KHdc1TZx59kTS/pibyOrMc0qw
         6HP5/o2cUVDZhVmaVInMPSnAj92bfvHLiThIRQ9eYNIqYZ+69yJV+3PEqxP1EQxucSs2
         fabw==
X-Gm-Message-State: AOAM531Rj2JyqDlNlUyDe/enhJY1soiyul12OekcOxQ6TQCyGFMPyNMJ
        aPqMW9i2/nPq1GvHYP/0ioUEml93VoMEY+s4uqc=
X-Google-Smtp-Source: ABdhPJytgvJpCnTZbqE9bOaBDLOlXm5Y+95Mn5rVk0O0vFdiwb2v0kV5m03s8JzyWXKOuLh3O4m4yCVJlSg3uaP7m7k=
X-Received: by 2002:a62:2f43:: with SMTP id v64mr3501221pfv.170.1590678721754;
 Thu, 28 May 2020 08:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200528145845.31436-1-michael@walle.cc>
In-Reply-To: <20200528145845.31436-1-michael@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 May 2020 18:11:50 +0300
Message-ID: <CAHp75VcMD9=rKcX=sdnvX4uLZu-8hk56sZEZ-rBv5YQNvm1xyg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] gpio: generic regmap implementation
To:     Michael Walle <michael@walle.cc>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 28, 2020 at 5:59 PM Michael Walle <michael@walle.cc> wrote:
>
> This series is a split off of the sl28cpld series:
> https://lore.kernel.org/linux-gpio/20200423174543.17161-1-michael@walle.cc/
>
> I wasn't sure if I should also include the gpiochip_irqchip_add_domain()
> patch here. So feel free to skip it. OTOH if you use interrupts with
> gpio-regmap it is quite handy.
>
> For an actual user see the patch 11/16 ("gpio: add support for the sl28cpld
> GPIO controller") of the series above.
>

v6 looks pretty much good to me, thanks!

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Changes since v5:
>  - add names property
>  - addressed Alex' remarks:
>    - moved header from i/l/gpio-regmap.h to i/l/gpio/regmap.h
>    - fixed kernel doc
>    - described rules how to use the register base offsets
>    - missing forward declarations
>    - style changes
>    - return -EOPNOTSUPP, in code path we should never reach
>  - added check to have input and output base regs if there is a direction
>    register
>  - added MAINTAINERS patch
>
> Changes since v4:
>  - add comment about can_sleep
>  - fix config->label typo
>  - add config->names property
>
> Changes since v3:
>  - set reg_dat_base, that was actually broken
>  - fix typo
>  - fix swapped reg_in_dir/reg_out_dir documentation
>  - use "goto err" in error path in gpio_regmap_register()
>
> Michael Walle (3):
>   gpiolib: Introduce gpiochip_irqchip_add_domain()
>   gpio: add a reusable generic gpio_chip using regmap
>   MAINTAINERS: Add gpio regmap section
>
>  MAINTAINERS                 |   6 +
>  drivers/gpio/Kconfig        |   4 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-regmap.c  | 349 ++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.c      |  20 +++
>  include/linux/gpio/driver.h |   3 +
>  include/linux/gpio/regmap.h |  86 +++++++++
>  7 files changed, 469 insertions(+)
>  create mode 100644 drivers/gpio/gpio-regmap.c
>  create mode 100644 include/linux/gpio/regmap.h
>
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko

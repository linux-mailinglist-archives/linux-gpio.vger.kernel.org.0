Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C261C316389
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhBJKRh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhBJKPq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:15:46 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF62AC061574;
        Wed, 10 Feb 2021 02:15:02 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id d2so866671pjs.4;
        Wed, 10 Feb 2021 02:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PVhJHa/rgaAmJAfvlPJfOaBn3MbkrcjvpDWK0tRQ/EQ=;
        b=DKVO8IBcFU2+FgXYqjp1Dx/v7yOULAP7DWqT+MrPb0vwwDnKZnpVpOQFW6DrUGyieu
         J5AJ6YBgBaAd6K1S3tIvKgvwcuiZMRQvS1Dh9U1x0o6HBV3UF4eLaRSE8vMDbPQgVDcD
         GBZnPsh4/Nqn61V4mTK+Re0yXoqs2drehzuLSzPt1HzGIa5/JiDSbzlk5ndgHz1q+hIP
         0wZvxLwC3zNohGUHeqAMK88AvntasQXBOQIIOaIpm2gIbDdF4dvsgXY6ejjqMeyPI4k/
         E+jI37XXHwn36BYRYziYPRxlzdwYvkL06susSE81W5TjJsmqfACEi8Hc7lI2j0cEqlwG
         nKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PVhJHa/rgaAmJAfvlPJfOaBn3MbkrcjvpDWK0tRQ/EQ=;
        b=PcDaaDTn9gda4dR32fZW9rmXB0UMvApAWoU5Gzjx2Ux4gkVlD715dwB/4xpM++8FVq
         1dQ0QLKAnxL99oYXfzfJeHQK0dNjM0zPzTKe1NWU5YiE3DL7n1zwncZK3+eH34T/qpNT
         l9l2fnFyAyaoJt/L7bWB1AmZXV1ceSQdYL320M4cjTV+XxJdTtLScASWsxL+TuKQaTtT
         YDkQdK0YqnmjJjL6MTG6XJHHQMh16KnFuBapEaTXn7bYLvRqY5kZ9zgC5yLDaXdQL/UJ
         kNXrcVYRj5YjjsmR7QV0xK+CofEAPbMD2R9wAvlN8N8MWQeYRT6mmXWalToEfwQqAuYB
         NkUA==
X-Gm-Message-State: AOAM533phtzAgTmR6Hh7q+BmoZOYKWtmDVvC1KvSmZxOrhjwYxtM0h52
        i0gjahTrtykNb6sLbdYGF9X4zjucadeVan2Rczo=
X-Google-Smtp-Source: ABdhPJxgT96R8Ttl9Gkk+YCtdDZ0uypM5drkjm8e0kjdqdvAG5lmIxgehpwtomgbAy7Mu9b7mZDMfzh+D8XW5YLRqpk=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr2460269pja.228.1612952102177;
 Wed, 10 Feb 2021 02:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20210210074946.155417-1-drew@beagleboard.org> <20210210074946.155417-2-drew@beagleboard.org>
 <CAMuHMdVdHb4LGpZY0T1OKEhAx0iqviqS587Fwm56UBv3-=1kTQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVdHb4LGpZY0T1OKEhAx0iqviqS587Fwm56UBv3-=1kTQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 12:14:46 +0200
Message-ID: <CAHp75Vf7HD-YwksrcUeqXqgOSCH08RywT1WgRBj48Hu4GvGtZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs files
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 10:31 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Feb 10, 2021 at 8:50 AM Drew Fustini <drew@beagleboard.org> wrote:

...

> > -       debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> > +       debugfs_create_file("pinctrl-devices", 0400,
>
> What about the loss of S_IFREG?

What do you mean?
https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L387

-- 
With Best Regards,
Andy Shevchenko

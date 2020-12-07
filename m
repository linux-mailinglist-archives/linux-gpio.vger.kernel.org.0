Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49482D0D7F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 10:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgLGJzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 04:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgLGJzl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 04:55:41 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74960C0613D0;
        Mon,  7 Dec 2020 01:55:01 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id m5so7138102pjv.5;
        Mon, 07 Dec 2020 01:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1ijwXEzq1R0G/4ZNI3/fhePYdLBTc+lajLyuEz2YUA=;
        b=uKCAswN8orDkk/9ArXT99bgGq9YbfSr2CYZlDHndf5XxHIHWtM3NBBtvCW+SjDNu8u
         XtEGLeizBhkVDpju/kSCp4aApXDkrlqPAoLtLrqpkIVc75TIxejZMgTiwUe4rxMnLnu8
         pqJx4sRyEQce9iZaeE03pjSD6jGh+4X1+FqxqYCkznJYSjSYheUS6rBI7rwKdOFw+dJr
         OS6I3VwTQkyxRHeufP9ExGOihDKn4rqrXPkmysWDkvtQNxRaL9Kfw2+6X8MSHtjc8X1w
         0p8F8ufzKvZ8FdZlFOIk+OTsoRGM7KRl+Ek7d6ZAz33PikOHJokFdA44u/qIafzzAt51
         CVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1ijwXEzq1R0G/4ZNI3/fhePYdLBTc+lajLyuEz2YUA=;
        b=d+LN+dGnL+hO+hzokXhvv2JaQjpZ0+i/pAdn0t1McQU+3LIVThOJSOxiZWIdfW+eg0
         sFUZx7DpsFq8DeZ2WlV55ni0w4d3irJSX0JxeznsnLvF7Y8TO3bugbj3OiwpIuP/1+tX
         9ZOngcSCeE44/LvWuMJTV62hC4KjDzqhn4gc2XX49FvM7WhIbCK9doaMNw0fdhPoXbdM
         XQwfSbvHA3w/01Z0HpVAtU8ubV7Ja1vPysrypF6KgpAi01TzdB1ivNSacAmANOxFCezC
         c27N8fNlIy9ffgJ7EtmA9Tt/h68GOZeyeG6Is4X58lMlEsc3Wt5qYGgGx1PW0+2jiJIk
         3u4Q==
X-Gm-Message-State: AOAM533bSFd2uu8IGds/A2eaUgQIGV1YZpYOMI4D76ZBWGIrbIyUE7qp
        2Cf0irCmHVJn/0ofERzPOYPb427aRYR4698EY9s=
X-Google-Smtp-Source: ABdhPJz/GBtiiv3mD5g76WW5o3RgzSnYQjU0y/kBGXP1kpjxGOA1HFRkaaFFh1hoKYOerS2jhHX73Xl3+YMDbw0l4EM=
X-Received: by 2002:a17:90b:a17:: with SMTP id gg23mr16092108pjb.129.1607334901092;
 Mon, 07 Dec 2020 01:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
In-Reply-To: <20201203191135.21576-1-info@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 11:55:49 +0200
Message-ID: <CAHp75VcwJw6Dgpi2Oou6eBkL2oO1vmPUYaU5z4V3gFYTCCQ7PQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their
 own submenu
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 3, 2020 at 9:22 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Since we already have a few virtual gpio devices, and more to come,

gpio -> GPIO

> this category deserves its own submenu.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3CB46EAFA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 16:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhLIPXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 10:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235352AbhLIPXG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 10:23:06 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C62C061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 07:19:32 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id o20so20744483eds.10
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 07:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kf7onAhGfcgO/824zD3wqaZMHSnbXFG6AwqXdqjuyVs=;
        b=JQbOpJrrXFSA/AAGIhZtbuNuko0SpQeRgX0a3W8q6nGczcYeald/Jw/g9CUjBTul6O
         V8Joo6XrlaWdZz/KZFmqsP3+ng7EITjXSOW98t2RYZRUq9CQdWAYO4E9Oo321wGfQLmu
         jPnPcAEL4vh8pKH3j/+4wVs0WsVQWPv5ZbTIrv2w0oy2bF134CiPcHhGBn3nLB4DMWjp
         ZY0NlNpV419A3blyr2jeD/IHx1vc6S2guokczk4JP7yhEfpiSb/O8+xxrkCj4dnvCcAw
         VEWzfr1BndIuiXlo4HuD19xQ4EkTn/hLPBgdcQVaE9wnSivfyJPZ13djRF/NR5yMpW08
         tpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kf7onAhGfcgO/824zD3wqaZMHSnbXFG6AwqXdqjuyVs=;
        b=6G8QXCfNaY2v1r7/IaMMv5WGulzyfn433/8sTWL2u2hhr3jI4WKq8zwCelI0CmszcT
         zaAj/yhQpgXhpSQ+7HgoZggrrGZ4AXpFkt7F1Qck3HOM/homX39G2BSk5Hgfmu47tlX0
         7CMa8cV3TH8FDIaQ8Wp1eJnDL3wo1VmLq/U2LylYQKMPyoWZ1lW5CdbGS3xUaBKrjUe+
         /yyifVhGWx5CP2H7EiKujvmkK8fwz4B+UdHHAZn5iz7lFuxy3TUlfP6P+to2NnM6Ztax
         J8ScZjRqFUYO/rLpuSfQUjjOYyIrWJjHEnG7XzWUaya0AKzJ4vrDfdm/Xagn9hdx/FYy
         UPsQ==
X-Gm-Message-State: AOAM532jGVOCqmKHFBp9Aa3XcxHdRAA74IrS31CI0ayl3E926dcgYN6M
        lgQWoiXVhq0Xwq9z28UeOkdIfK6MEs/G2Z8/veTkYAr9i50fdA==
X-Google-Smtp-Source: ABdhPJw887B+9FZnnZYtZMApU0LvTxLGkpMQLbrhukUnitEPh8MM3gwIuRvwDXkUJpcD2rUixnvHWlw7+FjEwi0PgYo=
X-Received: by 2002:a17:907:869e:: with SMTP id qa30mr15474989ejc.356.1639063075971;
 Thu, 09 Dec 2021 07:17:55 -0800 (PST)
MIME-Version: 1.0
References: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
In-Reply-To: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Dec 2021 17:16:23 +0200
Message-ID: <CAHp75VdwQjcrQLHh49WV5e95KCsyqVyoFO=VeNfK4LC0mEZvNw@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: Fix build failure with musl
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 9, 2021 at 5:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Musl defines the _IO*() macros in the files included via <sys/ioctl.h>
> and hence we get redefinition errors during build as <linux/ioctl.h>,
> included via <uapi/gpio.h>, defines them again.
>
> Fix this by undefining the macros between both the includes, document it
> all in musl-compat.h as well.

Is it only me who wonders why it should be fixed here?

-- 
With Best Regards,
Andy Shevchenko

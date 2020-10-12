Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633B028B615
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 15:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgJLNWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 09:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgJLNWu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 09:22:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB4DC0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 06:22:50 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o9so8565536plx.10
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fUeVLC9cYxOn9RahTZ6DfnJMAyMvslD7/O6X0pGp96w=;
        b=B/TqMCBFsnTFUj280pqZexsR9dg1wdh3gDQ1ZIk4lkwjnrFNVkawmmvqqDUzmVDlFz
         s/PfgIMIn1hML1Mkx/bhr5nMLI404J9fbGIkdvAWfnOJF8lcI4ySZ2JUgM1HWuhTwKR9
         jQ3fZHTIaA6bNq6qkjSGxZFUu3CUBpk70tJhE4klQytM0GDTJP0/QNTZyVsmGb75qxrE
         2yfIsVMrEhth7jUgq+euG2Nij1gvJMyoLg+Kctl0eTB3kDcSY332AZkBSHrRuparo3Ow
         /yGH9cGJTk+qTHL1eYE16kSNfSyeaBfXqoHTmT20DXAtZ4+yQ4ZYBQiIUL9W1ttf5iv2
         T9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fUeVLC9cYxOn9RahTZ6DfnJMAyMvslD7/O6X0pGp96w=;
        b=oxEowyamRGMB6WnSekoaiZR8PbyEvVV0jwU7jfYH9SMxHkfZ9xPltOEKDXD9n66cw0
         3foMEhoWmilJCthNlFVCxi0UJ5XOVJ1Q+En0t++1mkeHRml/yOLVcbKsfhWgYDF9xaoF
         uYkJJczii93aNBROy4Ztw7zqKdYU83vjVN5ZPuYtj3ZjjSz+fWUCEgTvnr1orgdIktD4
         07EdwgDHrLgrUoYIZvpXg8ZvXoiDLC+qWW5Qss17YnHY7TGspI/Xmvxq0tvnnpx3kFMO
         o3wtODdVgVYMICR64ePV/cNeuZYEFzGKDEuWBWOA5GvY78hMPNKpenN1X6M0KgBrQbFN
         x3Ww==
X-Gm-Message-State: AOAM530CdBlrBsnRVWGmI+UeB6GTz9mZjeDFdOT1XHFd79mssutlDEhc
        heVgRPQu0rMwIi6Ao367KIyVsSeJIJ7z7sKJSorNsQpjf0nw9A==
X-Google-Smtp-Source: ABdhPJz3F1wDDaVCefg89pC+syP70tkTSngT6eeeX7roqE5efHkONz2n4iKBW1a16tMI2c6hxwp01l6RVZ6lKFXuKGY=
X-Received: by 2002:a17:902:ea8c:b029:d2:8abd:c8de with SMTP id
 x12-20020a170902ea8cb02900d28abdc8demr24275857plb.21.1602508969747; Mon, 12
 Oct 2020 06:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com> <dadaf399-03cc-1512-8208-76565ab257a7@geanix.com>
In-Reply-To: <dadaf399-03cc-1512-8208-76565ab257a7@geanix.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Oct 2020 16:23:39 +0300
Message-ID: <CAHp75Vd-Hw8Ewa+F-tOuxdadL7BhfC5HDSvMFuwuZzq2MwVcnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: mcp23s08: Use full chunk of memory for
 regmap configuration
To:     =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 2:56 PM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> Hi Linus,
>
> You can add my
> Tested-by: Martin Hundeb=C3=B8ll <martin@geanix.com>

Thank you!
Linus, below more typo fixes, but I'm not going to send a new version
(until you explicitly require), so please take them into consideration
when applying.

> Thanks,
> Martin
>
> On 09/10/2020 20.08, Andy Shevchenko wrote:
> > It appears that simplification of mcp23s08_spi_regmap_init() made
> > a regression due to wrong size calculation for dev_kmemdup() call.

> > It mises the fact that config variable is already a pointer, thus

mises -> misses

> > the sizeof() calculation is wrong and only 4 or 8 bytes were copied.
> >
> > Fix the parameters to devm_kmemdup() to copy full chunk of memory.

copy full -> copy a full

> >
> > Fixes: 0874758ecb2b ("pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_i=
nit()")
> > Reported-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: fixed few typos in the commit message
> >   drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/p=
inctrl-mcp23s08_spi.c
> > index 1f47a661b0a7..7c72cffe1412 100644
> > --- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> > +++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> > @@ -119,7 +119,7 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08=
 *mcp, struct device *dev,
> >               return -EINVAL;
> >       }
> >
> > -     copy =3D devm_kmemdup(dev, &config, sizeof(config), GFP_KERNEL);
> > +     copy =3D devm_kmemdup(dev, config, sizeof(*config), GFP_KERNEL);
> >       if (!copy)
> >               return -ENOMEM;
> >
> >



--=20
With Best Regards,
Andy Shevchenko

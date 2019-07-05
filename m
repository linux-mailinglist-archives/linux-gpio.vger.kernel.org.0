Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892E060635
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 14:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbfGEM4M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 08:56:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35420 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbfGEM4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 08:56:12 -0400
Received: by mail-oi1-f195.google.com with SMTP id a127so7089598oii.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2019 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZVUzhjENRbcMH6LKQ742ijO+uYUVhO5dqzkVPaeVrdI=;
        b=AUl149XSHoo0htyvS+BOmPZG6sm5El6IDSsGcn5VL3E7i/ECKJnu2XSdOdBZoJ/ClB
         AJZ/o+YRp19SZmGRZQh8lwv9EbWE7ebjda7kdYpLHu/02F9leVWKqXQ+GF4pXCDxXH4H
         //4rTnhY6JS52+zQHj7n4jd/9Tp48sCuxZ7TC1YMPfXjLTpMTVFbh9THkr9BSep9g9XZ
         H28S90W7MBAGEF2Ln7tOqFUp9SlxU/DXOm1Jm6NBJ6QL/+QAYFSNof5tv42c9uOihQcf
         WaA5DKZ0HcF5jibu3t9p4hNpo9BZ1Z078beJhy2+LLkWaavctzWr0jbfXKvhnuusHvsI
         8+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZVUzhjENRbcMH6LKQ742ijO+uYUVhO5dqzkVPaeVrdI=;
        b=pFSX4dUJO7u5Q6TTNy2bkg1pvMsSBBr5OM5E7vLUe+Gk/60TqcryJi7TUfbvcr50MF
         7tl4TMIO5nkxKwPF81j2dYyVIN4jHVUkwVprWAfg9HGod9dIMh95wS5aDJ2Sw5yIYAnW
         ejHGwNO/GH3OaaZhWX8PcLi5WCkv7OO++6NsPxukRPF+JQHrQNZcd01EUJmV2hqAUVzf
         Pnxj6W3HDSa2y6VlYimTf4oLzKOkY4z0hbBux8W/QtaIwWGzDokpHS0BGoLW00gSoTeW
         9l1MHEgidT8gdo8cEl6FPCqdzBNFxJQQS2TJ/QU7OcB0abIBysPjbr+5WRAecwtQPOD5
         A1uQ==
X-Gm-Message-State: APjAAAU1Jm5CXhqqu9JKhQS2t6KX66xEE0b4RMJWmFVpkE6qmu0GjWbm
        nGc/Jw/HwBx1LZ2PfxwFdNM0I7OpO7Jd6nKy7XWQlBzA
X-Google-Smtp-Source: APXvYqyp/b+9+uoKtwgR3TxNlvy7riZCn5ATRPMVNkP5COZH0IpMSoTniDYcDyP7sm+ICKpetCkjEDDdhp+m6tpFoxs=
X-Received: by 2002:aca:b06:: with SMTP id 6mr1955935oil.175.1562331371427;
 Fri, 05 Jul 2019 05:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190705123220.54008-1-yuehaibing@huawei.com> <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
 <74ffe8ea-e6fb-bd2a-42bd-08392eb27c69@huawei.com>
In-Reply-To: <74ffe8ea-e6fb-bd2a-42bd-08392eb27c69@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Jul 2019 14:56:00 +0200
Message-ID: <CAMpxmJUeg1jVZdCeiRqTZykBZNPGAeQkaNfA7qc1zt+sL9HPjA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
To:     Yuehaibing <yuehaibing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 5 lip 2019 o 14:44 Yuehaibing <yuehaibing@huawei.com> napisa=C5=82(a):
>
> On 2019/7/5 20:40, Bartosz Golaszewski wrote:
> > pt., 5 lip 2019 o 14:34 YueHaibing <yuehaibing@huawei.com> napisa=C5=82=
(a):
> >>
> >> If CONFIG_DEBUG_FS is not set, building fails:
> >>
> >> drivers/gpio/gpio-tegra.c: In function tegra_gpio_probe:
> >> drivers/gpio/gpio-tegra.c:665:2: error: implicit declaration of functi=
on debugfs_create_file;
> >>  did you mean bus_create_file? [-Werror=3Dimplicit-function-declaratio=
n]
> >>   debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
> >>   ^~~~~~~~~~~~~~~~~~~
> >>   bus_create_file
> >> drivers/gpio/gpio-tegra.c:666:9: error: tegra_dbg_gpio_fops undeclared=
 (first use in this function);
> >>  did you mean tegra_gpio_pm_ops?
> >>         &tegra_dbg_gpio_fops);
> >>          ^~~~~~~~~~~~~~~~~~~
> >>          tegra_gpio_pm_ops
> >>
> >> Reported-by: Hulk Robot <hulkci@huawei.com>
> >> Fixes: a4de43049a1d ("gpio: tegra: Clean-up debugfs initialisation")
> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >> ---
> >>  drivers/gpio/gpio-tegra.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> >> index 59b99d8..40fd6bd 100644
> >> --- a/drivers/gpio/gpio-tegra.c
> >> +++ b/drivers/gpio/gpio-tegra.c
> >> @@ -662,8 +662,10 @@ static int tegra_gpio_probe(struct platform_devic=
e *pdev)
> >>                 }
> >>         }
> >>
> >> +#ifdef CONFIG_DEBUG_FS
> >>         debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
> >>                             &tegra_dbg_gpio_fops);
> >> +#endif
> >>
> >>         return 0;
> >>  }
> >> --
> >> 2.7.4
> >>
> >>
> >
> > Nack, there are inline stubs for all debugfs functions in
> > ./include/linux/debugfs.h if CONFIG_DEBUG_FS is not selected. Just
> > move the #include <linux/debugfs.h> to the top of the source file.
>
> yes, agree this, but 'tegra_dbg_gpio_fops' is still undeclared.
>
> >
> > Bart
> >
> > .
> >
>

Can you attach the config you're using?

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1690C643F7E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 10:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiLFJMO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 04:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiLFJMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 04:12:13 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600E31DF3E
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 01:12:12 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id 128so13550142vsz.12
        for <linux-gpio@vger.kernel.org>; Tue, 06 Dec 2022 01:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlN2+7DweJBI+0ZbyELLqp7L8/wV+kOEIdMWGeIWMSU=;
        b=so5DaPIRVAiN9c1JbsjUx3p1OP2bOsJ6Hr8q3aw1h8syCFLSOZbTa/zyVay/QBmcFm
         7nKAC+7Ze+KQsyj/c8XzEw8QlNtyvIe2KZ0/Qd5diK/N2t1LOcCDC1VrveQyTjOMl0CP
         8CPz7/uj3W0aFSICrYAwKFlJ/LIvSV5nM8GmqyuPipRi40y+wBrroVKDj7u7XiVaBMfg
         G1JVLbzwC2+u/4/zczKeME8UDb8V0a/LhRM7l3HQCCWI71zyGVoUjCrQ458N337qPXZx
         GmCH5GqIasjDpR33GGVM3hUDQ6qcMuEg2MiKyLn2ZzjjFQ3NG7fP2XD9hBg338movnXN
         aL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlN2+7DweJBI+0ZbyELLqp7L8/wV+kOEIdMWGeIWMSU=;
        b=Ybs8cYnsbhwHTLAp/F0mEceOrOjIxQu+rJgLvXWDnYbitvIsr5lvilalTkNnNv0AGN
         8Sl9wnvirEPgB+fKD/+77Q9glBc+v7DDE07xxdJO3WP6DqMrHbXKmgpWvG38OJEnXfGN
         8NWIesam/THqwaHdD3VzcIU5y6xe2NqG2ugNqdwT9VwxflVbWmaeiJdhL08A3Q5x6U9p
         R1kkPGGN3HvYwYb37l9e9HKM74kUUSwTBV2hOtLDFEzpNORcFoH5jxCtkYfPdGRUA30j
         L5FpLDX16iJ9nlIfRK2Zc0oK4TJA6NeZ6kY7oKTWJuJK7bjpJ3FkFwoP6z63Qx9pp4Wb
         VxLw==
X-Gm-Message-State: ANoB5pkMLvHA07prImL1EoxuNG9j5gbVaFY0OJS4C4V+b6OtUbI2g+s+
        4r8kSboTH73Vnz6p3QZjZvXiPixXrdC792KeW7P2kw==
X-Google-Smtp-Source: AA0mqf64L2iAbcP0f1MrVQ32b22AN+Wz2W2Xrz+41KFrZyKe4/D5r81yqMAPZseq06oTlN5EtVtJtWjHqVkIjzJ+4nc=
X-Received: by 2002:a67:ca86:0:b0:3b1:33bd:7fc7 with SMTP id
 a6-20020a67ca86000000b003b133bd7fc7mr5729196vsl.13.1670317931506; Tue, 06 Dec
 2022 01:12:11 -0800 (PST)
MIME-Version: 1.0
References: <1670221196-36806-1-git-send-email-wangyufen@huawei.com>
 <f6bab0d1-008d-c5c0-ef29-28a61df91e65@huawei.com> <CAMRc=MfD84WstmUO+qnkrAYviq_ESwvk554TGCjZq0P9JAG24w@mail.gmail.com>
 <ff96aac6-d5e5-222a-307a-d17ccc8b3201@huawei.com>
In-Reply-To: <ff96aac6-d5e5-222a-307a-d17ccc8b3201@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Dec 2022 10:12:00 +0100
Message-ID: <CAMRc=MdoCwMWxPoybZ_fDfcMJcoen=j=tgoFELCGFdBB2CzbSQ@mail.gmail.com>
Subject: Re: [PATCH] gpio/rockchip: fix refcount leak in rockchip_gpiolib_register()
To:     wangyufen <wangyufen@huawei.com>
Cc:     linus.walleij@linaro.org, heiko@sntech.de,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, jay.xu@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 6, 2022 at 2:42 AM wangyufen <wangyufen@huawei.com> wrote:
>
>
>
> =E5=9C=A8 2022/12/5 18:26, Bartosz Golaszewski =E5=86=99=E9=81=93:
> > On Mon, Dec 5, 2022 at 7:21 AM wangyufen <wangyufen@huawei.com> wrote:
> >>
> >>
> >>
> >> =E5=9C=A8 2022/12/5 14:19, Wang Yufen =E5=86=99=E9=81=93:
> >>> The node returned by of_get_parent() with refcount incremented,
> >>> of_node_put() needs be called when finish using it. So add it in the
> >>> end of of_pinctrl_get().
> >>>
> >>> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> >>> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> >>> ---
> >>>    drivers/gpio/gpio-rockchip.c | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchi=
p.c
> >>> index 870910b..200e43a 100644
> >>> --- a/drivers/gpio/gpio-rockchip.c
> >>> +++ b/drivers/gpio/gpio-rockchip.c
> >>> @@ -610,6 +610,7 @@ static int rockchip_gpiolib_register(struct rockc=
hip_pin_bank *bank)
> >>>                        return -ENODATA;
> >>>
> >>>                pctldev =3D of_pinctrl_get(pctlnp);
> >>> +             of_node_put(pctlnp);
> >>>                if (!pctldev)
> >>>                        return -ENODEV;
> >>>
> >
> > Something went wrong when sending the patch? Did you use git send-email=
?
> >
>
> The patch itself is fine, but I forgot to Cc the author of the patch I
> fixed, so I added a Cc.
>
> Thanks,
> Wang
>
> > Bart
> >

I don't have it in my inbox, not even in spam. I fetched the patch
from patchwork and applied it for fixes, thanks.

Bart

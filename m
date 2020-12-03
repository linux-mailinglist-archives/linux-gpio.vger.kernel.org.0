Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A5C2CD0B5
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 09:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbgLCICa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 03:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgLCICa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 03:02:30 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF69C061A4E
        for <linux-gpio@vger.kernel.org>; Thu,  3 Dec 2020 00:01:49 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id d18so1080512edt.7
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2020 00:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RuHOe2Akk+J2QlLhyukacf2T9N/gwVrROTnJh+LYhs4=;
        b=EkMCF9aat7r8j0C4i0IhP/4yixIPCsHiv4aS8xJM37D5skQz6JTOvy00LnNj26hCOH
         vo0L2AC8XvXwGaaBsknW6dYFSEasyMyaqJywrTUGK144dfeal6MA5GPI5qn4G6KTBc99
         po5whjHpThY7nFCifXlSMSYB4Mv2JRVvrO2yPvx/e2yRWlbf3aPtDDjKH9PY7LAzvtOg
         jz9TixThxbFD4y8RBCPlRXrU6rEQZMKOS5ic1vc+VfHlEoRWXRwg//Nzhs5D2ew0UeQF
         JQreqGwNEj78/0qKi4+vFIk5J6N6BDkH1ozDeBqxDKVKmfBcGjOHFolgMm3Ecs5ptIBK
         JAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuHOe2Akk+J2QlLhyukacf2T9N/gwVrROTnJh+LYhs4=;
        b=XZbSrf4oe+5Hz/M61M0kNCc0K3J8uS0bXgvfGqf8WVxa1eWXWityVuE+50M+K3B6FO
         E62+inwhFYrHoqtU5a5P4b08UDTdyMok3Ccqv/GguPKSWpVUtYRB/oDFLWy3HLcdXO7I
         bVHLSfXlfvf0q3OJOQsgG6HB086lmOllqer3w8W6jpx62O5e7HSKwhLGBPSoGS2W0bPw
         JTKnElwug1Ca36UfwUbYU0TqrIWj07rdLCIntE0iKcnm8nah5iXHlr1ebX/INgrxYVdE
         M8R3uIZrKwGh9hkRgrmv7snaRWiGOv40dpuN4EoCGjypzGymgx7yNvV5g2MpYYKJ09j6
         JyJw==
X-Gm-Message-State: AOAM5303Jmc+t+JQtk8aF4eig+ESijeZwwItTVpvc/Xm453DN6TGM8RP
        SGvBhgWZmQKTcemyfmDZsbyTbUeu2yR7iTrJplWG4g==
X-Google-Smtp-Source: ABdhPJxPRhOJ0mVusBf7DGxwNYxazF+B0dm42xTTpebRsIgCx4qZcDu8yl6pTQtVn0Q3Ma+cXndWRbx6dbfXdcasMYc=
X-Received: by 2002:aa7:d54b:: with SMTP id u11mr1694134edr.341.1606982508208;
 Thu, 03 Dec 2020 00:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20201203073910.20113-1-biwen.li@oss.nxp.com>
In-Reply-To: <20201203073910.20113-1-biwen.li@oss.nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 3 Dec 2020 09:01:37 +0100
Message-ID: <CAMpxmJV97uexBKK3zHuOWfBQ77uorgxadUcrieBP2fLPs0dPeA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: resolve coverity warnings
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     Li Yang <leoyang.li@nxp.com>, aisheng.dong@nxp.com,
        LKML <linux-kernel@vger.kernel.org>, jiafei.pan@nxp.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Biwen Li <biwen.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 3, 2020 at 8:31 AM Biwen Li <biwen.li@oss.nxp.com> wrote:
>
> From: Biwen Li <biwen.li@nxp.com>
>
> Resolve coverity warnings as follows,
>     cond_at_most: Checking gpio >= 28U implies that gpio may be up
>     to 27 on the false branch.
>     overrun-call: Overrunning callees array of size 3 by passing
>     argument gpio (which evaluates to 27)
>     in call to *mpc8xxx_gc->direction_output
>
>     cond_at_least: Checking gpio <= 3U implies that gpio is at least 4 on
>     the false branch.
>     overrun-call: Overrunning callee's array of size 3 by passing argument
>     gpio (which evaluates to 4) in call to *mpc8xxx_gc->direction_output
>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index a6c2bbdcaa10..12c9a91d87b7 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -3,6 +3,7 @@
>   *
>   * Copyright (C) 2008 Peter Korsgaard <jacmet@sunsite.dk>
>   * Copyright (C) 2016 Freescale Semiconductor Inc.
> + * Copyright 2020 NXP

A copyright notice on a two-line change is a bit too much, don't you think?

>   *
>   * This file is licensed under the terms of the GNU General Public License
>   * version 2.  This program is licensed "as is" without any warranty of any
> @@ -80,7 +81,7 @@ static int mpc5121_gpio_dir_out(struct gpio_chip *gc,
>  {
>         struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
>         /* GPIO 28..31 are input only on MPC5121 */
> -       if (gpio >= 28)
> +       if (gpio >= 28U)
>                 return -EINVAL;

I don't really understand the commit message but looking at the code
is even more confusing. What are you fixing here actually?

Bartosz

>
>         return mpc8xxx_gc->direction_output(gc, gpio, val);
> @@ -91,7 +92,7 @@ static int mpc5125_gpio_dir_out(struct gpio_chip *gc,
>  {
>         struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
>         /* GPIO 0..3 are input only on MPC5125 */
> -       if (gpio <= 3)
> +       if (gpio <= 3U)
>                 return -EINVAL;
>
>         return mpc8xxx_gc->direction_output(gc, gpio, val);
> --
> 2.17.1
>

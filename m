Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFAE316391
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhBJKTR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhBJKRL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:17:11 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113DAC061756;
        Wed, 10 Feb 2021 02:16:30 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id z9so863459pjl.5;
        Wed, 10 Feb 2021 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3EZcIx57dtjwbSL1k7C+oZwjaz0Cw8Ii9+YuvFCjbVA=;
        b=gaULwByFe/mfO9pwL9gb+FcVy5zdJg886jB9vnJ6fRPEgV+C0x11tj/AxvRZRF64Yq
         Q1e3AXQTH8QnmHSbyiBh9LD+v8+XGKIVkVj5oXVH0F8YVtZbTSi+viqVNEZxReUrbbY4
         xJaF1judKEK97aO00g7FoqvR0mK069NEuJ9teEU7E8mLDlPO0ibTb5Bw5ypBYPGTwTRS
         ZJ3Mvt6uk0q+DpC+btiJcHYuNAvg5PXuYVSUS2PVxkoAfYKZVHj/h3gcspp2stkvaxrW
         iqjQGa7THS2Iy/ZC25TxtnA2l6hDoSGKT0371HsYzbHTjUlDhdmEBq4alNGoS+c+0/i6
         UJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EZcIx57dtjwbSL1k7C+oZwjaz0Cw8Ii9+YuvFCjbVA=;
        b=oV4GjHrWnJ0Sl68EyOK0ExEv0v0My2A8MSdUXO1FAeTrYOoFKVD3FRF1vNLPIeiYzt
         Ac7ogLL8z3rQbTbdUg5AQxLW486SUl5AM/M8C68XS7/aWoHf64egfx/aR9bsJVkPNXiQ
         GnYND82fbrwUW3B9Q+NPPicn+2TOtt1vItyk5nqtrCdXHadCJEmpPDclQimbqf+t68WP
         RSZ1UZL/uG0FULlGisxi5S0KXxuQOjyZdLjhIwBHFjXR+L7fhFSMOo14KyFXk60SJ1nQ
         aNt7IOu4LthmR92AiCrJGLnATUVdLEN8Y+5ZtJ0uPH0YvnqSFkEOWsi34myrkWJAIcKw
         kYTg==
X-Gm-Message-State: AOAM530jhSX34oL6NnCYMlsFJGC7QX2V6uEmpqyDfkOKRC31S3L1QjYB
        MqyHkGvVTdKr9de3kGx/RImGvFHEmEvqwUqLgTs=
X-Google-Smtp-Source: ABdhPJw1tkmd9nLtYipQAI+RUTZ5u9yoBC2AGMveFdXe3f/LFcDY7zY9IDtiYmH6giHr8l/pRW/AzV7b3zu8uqE/GR4=
X-Received: by 2002:a17:90a:644a:: with SMTP id y10mr2519617pjm.129.1612952189609;
 Wed, 10 Feb 2021 02:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20210210074946.155417-1-drew@beagleboard.org> <20210210074946.155417-2-drew@beagleboard.org>
In-Reply-To: <20210210074946.155417-2-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 12:16:13 +0200
Message-ID: <CAHp75Vfw0Y-hLgsx4v0pX2F4yFd3YfW91DJy8rtJKT_S883FRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs files
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 9:50 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Switch over pinctrl debugfs files to use octal permissions as they are
> preferred over symbolic permissions. Refer to commit f90774e1fd27
> ("checkpatch: look for symbolic permissions and suggest octal instead").

You forgot:
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

LGTM after addressing what Geert noticed.

> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/core.c    | 6 +++---
>  drivers/pinctrl/pinconf.c | 4 ++--
>  drivers/pinctrl/pinmux.c  | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 3663d87f51a0..c9c28f653799 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
>                 return;
>         }
>
> -       debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinctrl-devices", 0400,
>                             debugfs_root, NULL, &pinctrl_devices_fops);
> -       debugfs_create_file("pinctrl-maps", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinctrl-maps", 0400,
>                             debugfs_root, NULL, &pinctrl_maps_fops);
> -       debugfs_create_file("pinctrl-handles", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinctrl-handles", 0400,
>                             debugfs_root, NULL, &pinctrl_fops);
>  }
>
> diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
> index 02c075cc010b..f005921bb49e 100644
> --- a/drivers/pinctrl/pinconf.c
> +++ b/drivers/pinctrl/pinconf.c
> @@ -370,9 +370,9 @@ DEFINE_SHOW_ATTRIBUTE(pinconf_groups);
>  void pinconf_init_device_debugfs(struct dentry *devroot,
>                          struct pinctrl_dev *pctldev)
>  {
> -       debugfs_create_file("pinconf-pins", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinconf-pins", 0400,
>                             devroot, pctldev, &pinconf_pins_fops);
> -       debugfs_create_file("pinconf-groups", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinconf-groups", 0400,
>                             devroot, pctldev, &pinconf_groups_fops);
>  }
>
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index bab888fe3f8e..7f6190eaedbb 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -676,9 +676,9 @@ DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
>  void pinmux_init_device_debugfs(struct dentry *devroot,
>                          struct pinctrl_dev *pctldev)
>  {
> -       debugfs_create_file("pinmux-functions", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinmux-functions", 0400,
>                             devroot, pctldev, &pinmux_functions_fops);
> -       debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinmux-pins", 0400,
>                             devroot, pctldev, &pinmux_pins_fops);
>  }
>
> --
> 2.25.1
>


--
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976AB31AB6B
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Feb 2021 13:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhBMM5m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Feb 2021 07:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhBMM5i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Feb 2021 07:57:38 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4D1C061574;
        Sat, 13 Feb 2021 04:56:58 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so1430422pgl.10;
        Sat, 13 Feb 2021 04:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qWsg69klgTq0z5peBmz3Nu2NfWKwsbvB2uqhVC/C6s4=;
        b=NEWkRNaiKUDw4mfcStj5Cc1nf4lZFfhPpwDmoryH157v3eMuAY1TeUsNXdOvGNwzQP
         ma65G8berz4a0XRW8OdojSkUDOAPOReNRU2Un0lctBFlQYmG6lCuI4LQeq71juWqZNm5
         KxhnxkbH4tX6VCKVjWoZWQauu9y2JIGK2TmoaeDPBB6PChH2mYO7LAG04Bh1xujIBJ/O
         b75H4y4sogPjTIFzcRND+oWoUXNTyryfs0Nxtm+K99tl2+lSVjUvKcCK+kHQVQvB+K/r
         kSRkjO2rr/JfdRVFV6omCoamdvBJPNEZ+OT5SdA/Esrr14AHWMbYoXgDVQRj8VZ8FoNj
         HTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qWsg69klgTq0z5peBmz3Nu2NfWKwsbvB2uqhVC/C6s4=;
        b=Vzy6k3oYt7iAAJQIadTjvwrIwtiLqRqaJFpg3o8/yInOr2pAJyiHzy1k+NXVOYLFJQ
         CSZZCfLWSrmHsBja59pvw/qH6ZhQWnQNWZXeSJtVoFxaB3uoYYNt/7/KxWIjmlB1xCNE
         D40dz/iPIbcdRn3z75LOrsgsmGGF1TQkwg8eVOSzalbjt9v/M9mVXuHd7ABD0pppLWZG
         7bqOJ9jws8EQ2JwUBwruX65cE5naAhDD9yql+dpaS8uFJPVtiCY90Ir/rltAUue5ICZh
         K7qCPtTDyeWWd/adSwrBGOHxJJlcNkPWgOWxK8I5sETxyB74GhCBPiQJO+BrCc+Xcv43
         he6Q==
X-Gm-Message-State: AOAM530pe+IQ2sy1K3iNN2p9C0N8ltvAzXLxvEhVc0BfEZTYAkmd1CwW
        fxqtceSDuCEpZvifkDzhRXXUyMOJO3YLv7FHAM8=
X-Google-Smtp-Source: ABdhPJxOAeI9XvercNV8R3F3WRxSBZlUmQgnkCELR0fva9tLJx+AkX3phlZ54ZU7zT4ZArZHy7OM3xl03XwWv2tB+hs=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr7505905pfk.73.1613221017699; Sat, 13
 Feb 2021 04:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20210212223015.727608-1-drew@beagleboard.org> <20210212223015.727608-2-drew@beagleboard.org>
In-Reply-To: <20210212223015.727608-2-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 Feb 2021 14:56:41 +0200
Message-ID: <CAHp75VdzbX7=n17xcdK6_fLwv5OmOePUkf3b0VZvpLDSZ947qQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: use to octal permissions for debugfs files
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 13, 2021 at 12:30 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Switch over pinctrl debugfs files to use octal permissions as they are
> preferred over symbolic permissions. Refer to commit f90774e1fd27
> ("checkpatch: look for symbolic permissions and suggest octal instead").
>
> Note: S_IFREG flag is added to the mode by __debugfs_create_file()
> in fs/debugfs/inode.c

I guess it also needs Suggested-by: Joe (IIRC he proposed to convert the rest).
Nevertheless,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!


> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/core.c    | 12 ++++++------
>  drivers/pinctrl/pinconf.c |  4 ++--
>  drivers/pinctrl/pinmux.c  |  4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 3663d87f51a0..07458742bc0f 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1888,11 +1888,11 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
>                         dev_name(pctldev->dev));
>                 return;
>         }
> -       debugfs_create_file("pins", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pins", 0444,
>                             device_root, pctldev, &pinctrl_pins_fops);
> -       debugfs_create_file("pingroups", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pingroups", 0444,
>                             device_root, pctldev, &pinctrl_groups_fops);
> -       debugfs_create_file("gpio-ranges", S_IFREG | S_IRUGO,
> +       debugfs_create_file("gpio-ranges", 0444,
>                             device_root, pctldev, &pinctrl_gpioranges_fops);
>         if (pctldev->desc->pmxops)
>                 pinmux_init_device_debugfs(device_root, pctldev);
> @@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
>                 return;
>         }
>
> -       debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinctrl-devices", 0444,
>                             debugfs_root, NULL, &pinctrl_devices_fops);
> -       debugfs_create_file("pinctrl-maps", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinctrl-maps", 0444,
>                             debugfs_root, NULL, &pinctrl_maps_fops);
> -       debugfs_create_file("pinctrl-handles", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinctrl-handles", 0444,
>                             debugfs_root, NULL, &pinctrl_fops);
>  }
>
> diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
> index 02c075cc010b..d9d54065472e 100644
> --- a/drivers/pinctrl/pinconf.c
> +++ b/drivers/pinctrl/pinconf.c
> @@ -370,9 +370,9 @@ DEFINE_SHOW_ATTRIBUTE(pinconf_groups);
>  void pinconf_init_device_debugfs(struct dentry *devroot,
>                          struct pinctrl_dev *pctldev)
>  {
> -       debugfs_create_file("pinconf-pins", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinconf-pins", 0444,
>                             devroot, pctldev, &pinconf_pins_fops);
> -       debugfs_create_file("pinconf-groups", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinconf-groups", 0444,
>                             devroot, pctldev, &pinconf_groups_fops);
>  }
>
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index bab888fe3f8e..c651b2db0925 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -676,9 +676,9 @@ DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
>  void pinmux_init_device_debugfs(struct dentry *devroot,
>                          struct pinctrl_dev *pctldev)
>  {
> -       debugfs_create_file("pinmux-functions", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinmux-functions", 0444,
>                             devroot, pctldev, &pinmux_functions_fops);
> -       debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pinmux-pins", 0444,
>                             devroot, pctldev, &pinmux_pins_fops);
>  }
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko

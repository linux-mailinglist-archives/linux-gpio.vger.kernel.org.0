Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187D631D753
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 11:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhBQKLS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 05:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbhBQKLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 05:11:07 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19C6C061574;
        Wed, 17 Feb 2021 02:10:27 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id p21so2526804pgl.12;
        Wed, 17 Feb 2021 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R3amEnqTrjGlEFPrUrxJ7Z//9UhhhB9TemZrGckJqHM=;
        b=TU/BX86zcPFQR6S97iGcuO6njJeSDGcshoUuZh5eO9HC6Z1NoN5a2ZTImcOesOlecU
         mWqpTcSNrgJau1QV9BGlfPNw+veBEpeHC1u0tEKPecCo0BXyxRhZlNwEmiPShgprhuTi
         tZywy1OPG3oKGYTV6JACfSTkyxBGeh1hOGowA5B8jHUr3eDtynXS79tXHDuIf3+oJ0gm
         OoBh92WgZJnDIgOg/b4UDrqgRIXs6T9KDK7BSipFHPXta3AFt5sPoNLy+JgfXDe1YViR
         JMmLQIRtmnp4+NMeVBxm3DeynmY9kUx9BJcyUP8p+UPdVrfud+xX/ZwZlCaCxD3yrTLo
         s2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3amEnqTrjGlEFPrUrxJ7Z//9UhhhB9TemZrGckJqHM=;
        b=B8GSu077ynUMuaOnMhm8EVAvkiHH4TX9XXiylCePUFaF9FvDLfQu9UO7Z70DXAg9e+
         nI78J/XZS0r4YwobZJ6+FybBWB+vInf1YxlKpStAWgXgOG+i08SvaqtVK3im59hqU0hw
         rCc0yxVXVGXMpCYqkvr2bTqV4ReWw0aFTwnTTv+IJ3xoPz9N4PlaFS7JhydOzgQoMOW+
         HsCi0kaflupCc4yiLbHDBxLcMARcn6SWtl+UiR9tpxBYkbDZxPU/qYVDm1tDdY/Yto7G
         E7PAfk9Zvgoy+i7klF64nCRsxgyaoVYMvb8/YrfdaK6J6yfem1/i33me7x1su5jr2y1A
         bYKg==
X-Gm-Message-State: AOAM532ip9PaceOhzmyoSMgSs6dNlSuOOV3gVkmpwVGm75WnklkrEFYj
        V6s0og6bqNNmlOMlYLvKgXXXcjLaaV8VmbTF/OE=
X-Google-Smtp-Source: ABdhPJwEBAgNhwsFu4aMsZ75JMBNPMOgIt6H8qFNOv4fGBTUXzQaNROd8mU25Zke9Ql5c2KJRABHqAgKD8OkN+haAg0=
X-Received: by 2002:a63:3d0:: with SMTP id 199mr23357594pgd.4.1613556626978;
 Wed, 17 Feb 2021 02:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20210216224455.1504008-1-drew@beagleboard.org> <20210216224455.1504008-3-drew@beagleboard.org>
In-Reply-To: <20210216224455.1504008-3-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Feb 2021 12:10:10 +0200
Message-ID: <CAHp75VekJC4mTvKndNvQMgLM5x5pY40swYaduRQE2s1TZvtR6A@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] pinctrl: pinmux: Add pinmux-select debugfs file
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
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 17, 2021 at 12:45 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add "pinmux-select" to debugfs which will activate a function and group:
>
>   echo "<function-name group-name>" > pinmux-select
>
> The write operation pinmux_select() handles this by checking that the
> names map to valid selectors and then calling ops->set_mux().
>
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
>
>   function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
>   function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
>   function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
>   function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
>   function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
>   function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
>
> To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
>
>   echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select

Thanks, looks almost good to me (few nit-picks below)
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/pinmux.c | 102 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index c651b2db0925..08f336e4246c 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -23,6 +23,7 @@
>  #include <linux/string.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> +#include <linux/ctype.h>

Perhaps squeeze it to look slightly more ordered?

>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinmux.h>
>  #include "core.h"
> @@ -673,6 +674,105 @@ void pinmux_show_setting(struct seq_file *s,
>  DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
>  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);

> +#define PINMUX_SELECT_MAX 50

Why suddenly this number? Maybe 64 for the sake of good power of 2?

> +static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> +                                  size_t len, loff_t *ppos)
> +{
> +       struct seq_file *sfile = file->private_data;
> +       struct pinctrl_dev *pctldev = sfile->private;
> +       const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
> +       const char *const *groups;
> +       char *buf, *fname, *gname;
> +       unsigned int num_groups;
> +       int fsel, gsel, ret;
> +
> +       if (len > PINMUX_SELECT_MAX)
> +               return -ENOMEM;
> +
> +       buf = kzalloc(PINMUX_SELECT_MAX, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       ret = strncpy_from_user(buf, user_buf, PINMUX_SELECT_MAX);
> +       if (ret < 0)
> +               goto exit_free_buf;
> +       buf[len-1] = '\0';
> +
> +       /* remove leading and trailing spaces of input buffer */
> +       fname = strstrip(buf);
> +       if (*fname == '\0') {
> +               ret = -EINVAL;
> +               goto exit_free_buf;
> +       }
> +
> +       /* find a separator like a space character */

"find a separator which is a spacelike character" ?

> +       for (gname = fname; !isspace(*gname); gname++) {
> +               if (*gname == '\0') {
> +                       ret = -EINVAL;
> +                       goto exit_free_buf;
> +               }
> +       }
> +       *gname = '\0';
> +
> +       /* drop extra spaces between function and group name */

names

> +       gname = skip_spaces(gname + 1);
> +       if (*gname == '\0') {
> +               ret = -EINVAL;
> +               goto exit_free_buf;
> +       }
> +
> +       fsel = pinmux_func_name_to_selector(pctldev, fname);
> +       if (fsel < 0) {
> +               dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
> +               ret = fsel;
> +               goto exit_free_buf;
> +       }

Here and below you could do other way around, i.e.

ret = ...
if (ret < 0) {
 ...
}
fsel = ret;

> +       ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
> +       if (ret) {
> +               dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
> +               goto exit_free_buf;
> +       }
> +
> +       ret = match_string(groups, num_groups, gname);
> +       if (ret < 0) {
> +               dev_err(pctldev->dev, "invalid group %s", gname);
> +               goto exit_free_buf;
> +       }
> +
> +       gsel = pinctrl_get_group_selector(pctldev, gname);
> +       if (gsel < 0) {
> +               dev_err(pctldev->dev, "failed to get group selector for %s", gname);
> +               ret = gsel;
> +               goto exit_free_buf;
> +       }
> +
> +       ret = pmxops->set_mux(pctldev, fsel, gsel);
> +       if (ret) {
> +               dev_err(pctldev->dev, "set_mux() failed: %d", ret);
> +               goto exit_free_buf;
> +       }
> +       ret = len;
> +
> +exit_free_buf:
> +       kfree(buf);
> +
> +       return ret;
> +}
> +
> +static int pinmux_select_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, NULL, inode->i_private);
> +}
> +
> +static const struct file_operations pinmux_select_ops = {
> +       .owner = THIS_MODULE,
> +       .open = pinmux_select_open,
> +       .write = pinmux_select,
> +       .llseek = no_llseek,
> +       .release = single_release,
> +};
> +
>  void pinmux_init_device_debugfs(struct dentry *devroot,
>                          struct pinctrl_dev *pctldev)
>  {
> @@ -680,6 +780,8 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
>                             devroot, pctldev, &pinmux_functions_fops);
>         debugfs_create_file("pinmux-pins", 0444,
>                             devroot, pctldev, &pinmux_pins_fops);
> +       debugfs_create_file("pinmux-select", 0200,
> +                           devroot, pctldev, &pinmux_select_ops);
>  }
>
>  #endif /* CONFIG_DEBUG_FS */
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko

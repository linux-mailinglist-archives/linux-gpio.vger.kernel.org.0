Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FB131861B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 09:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbhBKIJ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 03:09:58 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:44236 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhBKIJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 03:09:55 -0500
Received: by mail-oi1-f179.google.com with SMTP id r75so5151679oie.11;
        Thu, 11 Feb 2021 00:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SNAwIXjIQ9eB3Qc3bo7k/zXUOGRML/0pvKDnfyOi4gM=;
        b=Pf9SLwNO8ILxdDr54amsau/Tl199tPukwlsdTa2jfatioTKUNjF/oQimNUt6vD/Tbk
         HGCo67wtlle6vgbcOKxu3VB4To77DlASidu+P73x+o9pL1+v3ZBzdpwyRWlKC/yBjVjE
         0uSeWRdjPrWw/dohccq5cf90PfxXwwJqjeiMBxJuRA1E9GaQTX3URF0eQzIzuVJW34Cn
         6ZEvufQzpZ0mOMqCkt3BH41YotwjDdGsd+qG3wEFsQnvhTqHJde/e1BOrAxfyUmxoHSC
         HHbbmBhKDyWaUJSL8tPBM3LrCSqq2RHCofygFdCPDhZzDAZCShBN19OddGotrPG8lp8t
         FXvA==
X-Gm-Message-State: AOAM533kHUoDEcWci/J2/yYRIFFzb5vy8Jp4uT7VWcqHQSscXsvSXQAC
        hDbjP4wfjRpXjDoPSzhgDmhRvF8XQV3vqKPCSek=
X-Google-Smtp-Source: ABdhPJxueOY23XUZE8gH+kzMOHj3YciCIHRuLE/bJKanBFyqpMFB1Zr9R0PJubNf2MDofP000P9ebIKX3GSZSpdUeos=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr1985706oig.54.1613030954688;
 Thu, 11 Feb 2021 00:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20210210222851.232374-1-drew@beagleboard.org> <20210210222851.232374-3-drew@beagleboard.org>
In-Reply-To: <20210210222851.232374-3-drew@beagleboard.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Feb 2021 09:09:03 +0100
Message-ID: <CAMuHMdW3dZWEbHzXZ-62S-bb3WKbrfwR_EKf7b_fQ6z913SX1A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

On Wed, Feb 10, 2021 at 11:33 PM Drew Fustini <drew@beagleboard.org> wrote:
> Add "pinmux-select" to debugfs which will activate a function and group
> when "<function-name group-name>" are written to the file. The write
> operation pinmux_select() handles this by checking that the names map to
> valid selectors and then calling ops->set_mux().
>
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
>
> function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
>
> To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
>
> echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Thanks for your patch!

> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -673,6 +673,111 @@ void pinmux_show_setting(struct seq_file *s,
>  DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
>  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
>
> +#define PINMUX_MAX_NAME 64
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
> +       if (len > (PINMUX_MAX_NAME * 2)) {
> +               dev_err(pctldev->dev, "write too big for buffer");
> +               return -EINVAL;
> +       }
> +
> +       buf = kzalloc(PINMUX_MAX_NAME * 2, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       fname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> +       if (!fname) {
> +               ret = -ENOMEM;
> +               goto free_buf;
> +       }
> +
> +       gname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> +       if (!buf) {
> +               ret = -ENOMEM;
> +               goto free_fname;
> +       }
> +
> +       ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);

While this guarantees buf is not overflowed...

> +       if (ret < 0) {
> +               dev_err(pctldev->dev, "failed to copy buffer from userspace");
> +               goto free_gname;
> +       }
> +       buf[len-1] = '\0';
> +
> +       ret = sscanf(buf, "%s %s", fname, gname);

... one of the two strings can still be longer than PINMUX_MAX_NAME,
thus overflowing fname or gname.

As buf is already a copy, it may be easier to just find the strings in
buf, write the NUL terminators into buf, and set up fname and gname
to point to the strings inside buf.

> +       if (ret != 2) {
> +               dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> +               goto free_gname;
> +       }

> +static const struct file_operations pinmux_select_ops = {
> +       .owner = THIS_MODULE,
> +       .open = pinmux_select_open,
> +       .read = seq_read,

I don't think you need to fill in .read for a write-only file.

> +       .write = pinmux_select,
> +       .llseek = no_llseek,
> +       .release = single_release,
> +};
> +
>  void pinmux_init_device_debugfs(struct dentry *devroot,
>                          struct pinctrl_dev *pctldev)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

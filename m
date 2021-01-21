Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC122FE999
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 13:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbhAUMEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 07:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbhAULSv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 06:18:51 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A50C061575
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 03:18:10 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id b5so1472101pjl.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 03:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bes0Vw1DdLxpip5g3W45HIxF4+WZ+UV5UhGxiPjs0I=;
        b=MR7GaeLVkAhV3oMbuL8TEsC/xgsfYj7jSyxa2ixGUNnCflU9ZS/dyyYQkdfQoFhPBH
         wFlNqs/44oyeaQ4JhBaos0vkpnlqmfIX3lY9yJfUoqAiWODoMJ39xUYaWeLCxOsXOM2L
         /PZ94jM1E7Wn8FP3hhNBNpjvG/Q/c8bWZTSR0GXh/xWDQvKgkrJb0jImkv12MVahsbei
         WdnGbETOC9Pe3m4POk431hCEustuvCMCpdCrhiVbDS9TnpNhbZIQi3YqNFSgBi/6FuXu
         b2j96aYO6AY8rpOu6r1lP1eEvocfGc+l1oxGfBcwl5kIUK7wF4Rbe2bC1k4rzhg0awGt
         0wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bes0Vw1DdLxpip5g3W45HIxF4+WZ+UV5UhGxiPjs0I=;
        b=VUOUGhYMuogJTjmpJU8DPXbghzJrZKTNj8kpAqmHTARs9qSjHc1+exFHMwG9U5wYTW
         GirOcCSAL3MItuhhilVQbCcTeqD4qihRihuFimgC7V/ElF6EKs+bHTm6D5M7B++EckvQ
         zSUpVZ7ZvcxgHx9GJeoEYQaRYvBnYujZhpH72d+fgT1sZuctljn6dXWSg/M313WUERsl
         Ta5PgRj2qK8LZSz8n51yQl5AWSF9GObC5D9Z2oYgrY36CdovdmBFcw/txsnAId2lgQOP
         qyZnwwhhdT264f4YvkB2wOwMvl0SMsZStPki6/6x131Khz5sL32Pxbuq9VTeQP/WH//6
         klig==
X-Gm-Message-State: AOAM5333cGx/suCscFyQMt3/xtsxrwTP8TPPnDS6xQ9/fF+KBVVp43GI
        AKXTa1YhzXzSaNu7GaRzeXY7v6dQu73MT4t+ymyJc6lEZjZhnMm4
X-Google-Smtp-Source: ABdhPJwguUuh+DVlHmVuTVjNoKlOMc216AEmX/Kk6Nf8b1aTlvxxy3DX+nkmI/6GqF/FpKCIhe6WQ9Nxd+N+ZzkQwlE=
X-Received: by 2002:a17:902:758b:b029:df:d1f6:9af9 with SMTP id
 j11-20020a170902758bb02900dfd1f69af9mr2518795pll.21.1611227888965; Thu, 21
 Jan 2021 03:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20210121051806.623743-1-drew@beagleboard.org>
In-Reply-To: <20210121051806.623743-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 21 Jan 2021 13:18:58 +0200
Message-ID: <CAHp75Vd5M0kyNzq+5gcZEd=6hK_7Y5_dEJ39-yQO7WuYRM4KWw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: pinmux: Add pinmux-set debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 7:18 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> This RFC is a change in approach from my previous RFC patch [1]. It adds
> "pinnux-set" to debugfs. A function and group on the pin control device
> will be activated when 2 integers "<function-selector> <group-selector>"
> are written to the file. The debugfs write operation pinmux_set_write()
> handles this by calling ops->set_mux() with fsel and gsel.

s/ops//

> RFC question: should pinmux-set take function name and group name
> instead of the selector numbers?

I would prefer names and integers (but from user p.o.v. names are
easier to understand, while numbers are good for scripting).

The following is better to include in documentation and remove from
the commit message.

> The following is an example on the PocketBeagle [2] which has the AM3358
> SoC and binds to pinctrl-single. I added this to the device tree [3] to
> represent two of the pins on the expansion header as an example: P1.36
> and P2.01. Both of these header pins are designed to be set to PWM mode
> by default [4] but can now be set back to gpio mode through pinmux-set.

...

> The following shows the pin functions registered for the pin controller:
>
> root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# cat pinmux-functions

Shorter is better, what about simply

# cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pinmux-functions
?

Btw  in reST format you may create a nice citation of this. And yes,
this should also go to the documentation.

> function: pinmux_P1_36_default_pin, groups = [ pinmux_P1_36_default_pin ]
> function: pinmux_P2_01_default_pin, groups = [ pinmux_P2_01_default_pin ]
> function: pinmux_P1_36_gpio_pin, groups = [ pinmux_P1_36_gpio_pin ]
> function: pinmux_P1_36_gpio_pu_pin, groups = [ pinmux_P1_36_gpio_pu_pin ]
> function: pinmux_P1_36_gpio_pd_pin, groups = [ pinmux_P1_36_gpio_pd_pin ]
> function: pinmux_P1_36_gpio_input_pin, groups = [ pinmux_P1_36_gpio_input_pin ]
> function: pinmux_P1_36_pwm_pin, groups = [ pinmux_P1_36_pwm_pin ]
> function: pinmux_P2_01_gpio_pin, groups = [ pinmux_P2_01_gpio_pin ]
> function: pinmux_P2_01_gpio_pu_pin, groups = [ pinmux_P2_01_gpio_pu_pin ]
> function: pinmux_P2_01_gpio_pd_pin, groups = [ pinmux_P2_01_gpio_pd_pin ]
> function: pinmux_P2_01_gpio_input_pin, groups = [ pinmux_P2_01_gpio_input_pin ]
> function: pinmux_P2_01_pwm_pin, groups = [ pinmux_P2_01_pwm_pin ]
> function: pinmux-uart0-pins, groups = [ pinmux-uart0-pins ]
> function: pinmux-mmc0-pins, groups = [ pinmux-mmc0-pins ]
> function: pinmux-i2c0-pins, groups = [ pinmux-i2c0-pins ]
>
> Activate the pinmux_P1_36_gpio_pin function (fsel 2):
>
> root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# echo '2 2' > pinmux-set
>
> Extra debug output that I added shows that pinctrl-single's set_mux()
> has set the register correctly for gpio mode:
>
> pinmux core: DEBUG pinmux_set_write(): returned 0
> pinmux core: DEBUG pinmux_set_write(): buf=[2 2]
> pinmux core: DEBUG pinmux_set_write(): sscanf(2,2)
> pinmux core: DEBUG pinmux_set_write(): call ops->set_mux(fsel=2, gsel=2)
> pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): call pinmux_generic_get_function() on fselector=2
> pinctrl-single 44e10800.pinmux: enabling (null) function2
> pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): func->nvals=1
> pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): offset=0x190 old_val=0x21 val=0x2f
>
> Activate the pinmux_P1_36_pwm_pin function (fsel 6):
>
> root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# echo '6 6' > pinmux-set
>
> pinctrl-single set_mux() is able to set register correctly for pwm mode:
>
> pinmux core: DEBUG pinmux_set_write(): returned 0
> pinmux core: DEBUG pinmux_set_write(): buf=[6 6]
> pinmux core: DEBUG pinmux_set_write(): sscanf(6,6)
> pinmux core: DEBUG pinmux_set_write(): call ops->set_mux(fsel=6, gsel=6)
> pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): call pinmux_generic_get_function() on fselector=6
> pinctrl-single 44e10800.pinmux: enabling (null) function6
> pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): func->nvals=1
> pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): offset=0x190 old_val=0x2f val=0x21

This and above is still part of documentation, and not a commit message thingy.

...

> +static ssize_t pinmux_set_write(struct file *file, const char __user *user_buf,
> +                                  size_t cnt, loff_t *ppos)
> +{
> +       int err;
> +       int fsel;
> +       int gsel;
> +       int ret;
> +       char *buf;
> +       struct seq_file *sfile;
> +       struct pinctrl_dev *pctldev;
> +       const struct pinmux_ops *ops;

Reversed xmas tree order please, and you may group some of them, like

   int fsel, gsel;

> +       if (*ppos != 0)
> +               return -EINVAL;

> +       if (cnt == 0)
> +               return 0;

Has it ever happened here?

> +       buf = memdup_user_nul(user_buf, cnt);
> +       if (IS_ERR(buf))
> +               return PTR_ERR(buf);
> +
> +       if (buf[cnt - 1] == '\n')
> +               buf[cnt - 1] = '\0';

Shouldn't you rather use strndup_from_user() (or how is it called?)

> +       ret = sscanf(buf, "%d %d", &fsel, &gsel);
> +       if (ret != 2) {
> +               pr_warn("%s: sscanf() expects '<fsel> <gsel>'", __func__);

No __func__ and instead use dev_err() (it is strange you are using
warn level for errors).

> +               err = -EINVAL;
> +               goto err_freebuf;
> +       }

> +       sfile = file->private_data;
> +       pctldev = sfile->private;

These can be applied directly in the definition block above.

> +       ops = pctldev->desc->pmxops;
> +       ret = ops->set_mux(pctldev, fsel, gsel);

> +       if (ret != 0) {

if (ret)

> +               pr_warn("%s(): set_mux() failed: %d", __func__, ret);

As above.

> +               err = -EINVAL;
> +               goto err_freebuf;
> +       }

> +       kfree(buf);
> +       return cnt;
> +
> +err_freebuf:
> +       kfree(buf);
> +       return err;

Can be simply

 err_freebuf:
        kfree(buf);
        return err ?: cnt;

> +}
> +

...

> +       debugfs_create_file("pinmux-set", S_IFREG | S_IWUSR,
> +                           devroot, pctldev, &pinmux_set_ops);

I would rather call it 'pinmux-select'.

Overall since it's a debugfs I do not much care about interfaces and
particular implementation details, but in general looks good to me,
thanks for doing this!

-- 
With Best Regards,
Andy Shevchenko

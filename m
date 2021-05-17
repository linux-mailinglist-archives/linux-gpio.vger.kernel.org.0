Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63195386503
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 22:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237289AbhEQUDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 16:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236917AbhEQUDe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 16:03:34 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A751FC061573;
        Mon, 17 May 2021 13:02:16 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id q2so5699559pfh.13;
        Mon, 17 May 2021 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IVIyPTZ6w0h3Ret1w2E/pdnyUaIbFCtkLZj+hGFpk4s=;
        b=X/xKCa7K0LvTnwJIilIzC4PbSZ3Jyv4ccdvzbTeTE1jp0CSwvEaJQoa1aIQ4US9wBD
         5ZtZlpz4h1vu4DczOH0/dLUQGjRsDmU2T/CBSvqNcJTN1dU6oOfQi/1kdHfyIHPloic4
         z4OURolq6UZCMn5Y3kZx9BjxlS8+eKZFJ3FyHhqtu6vnRC6riDhJbJngl2CcLUL1ezJi
         YJfU0bHExh3fUT7JbgrX4jaswiDvuYPqx+IX934+03pywURe+kHy907p0RAlmWJFXd5h
         QTiwfoA90u9TXBs2NOIozH0xeippZ3xxIKSkh5Jj8cbgvCZotga6xoR/OCkBMxGMk5Ro
         crNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IVIyPTZ6w0h3Ret1w2E/pdnyUaIbFCtkLZj+hGFpk4s=;
        b=joxXkp8WJzcTIP72NbLwKT9UuNy6no86l5jXXfQa7RnaQRT+5QOfkeHUPCj2OL29DW
         dhNIEGSAae96agA6nO3n4OL/houNj9sYU9BOOtuZDrYDLg0YaTh51RTGj7VlXFdd/Ssp
         rK1B4eORQ1Ug/NQSrOvTOdO5FzguhI6uyiVIFpDtXifnxuZDjA4cnUf0EoeXGaAFIYPM
         WEL0UXxQ3PXJ07pmP8/TNBSEuBMxGPWHao2VJEggtyXNp8apeNbUiwvW6rCvGmJ9coIk
         6jVwONWpbY2bSnBLDJJORL4CAq3rhlpNyhE7Ji1/pOLsN8bHMvk5Quktpd0wzsmIwaqR
         eMyQ==
X-Gm-Message-State: AOAM5303MBDunb9eW+9FIrj2oee8A3mLnLhmpBipnUfbUP5aKTOk6eth
        x9SQt+Xr0b8oPBaKJyxHXVE+B8I2PoOby8clWl8=
X-Google-Smtp-Source: ABdhPJyKujI6A2w3oQvR+CotMActckhkR3dfYYFSs/2V4ykIDzqEZ/woudBpJQNuYj/9hQYzcMDzkPsIbMmhXKJZ01E=
X-Received: by 2002:a05:6a00:1591:b029:2d9:369a:b846 with SMTP id
 u17-20020a056a001591b02902d9369ab846mr1390908pfk.40.1621281736214; Mon, 17
 May 2021 13:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210516135531.2203-1-dariobin@libero.it> <20210516135531.2203-2-dariobin@libero.it>
In-Reply-To: <20210516135531.2203-2-dariobin@libero.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 May 2021 23:02:00 +0300
Message-ID: <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug file
To:     Dario Binacchi <dariobin@libero.it>,
        Drew Fustini <drew@beagleboard.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 16, 2021 at 7:43 PM Dario Binacchi <dariobin@libero.it> wrote:
>
> The MPUs of some architectures (e.g AM335x) must be in privileged
> operating mode to write on the pinmux

pinmux is not pin configuration. You need to rethink the approach.

> registers. In such cases, where
> writes will not work from user space, now it can be done from the pins
> debug file if the platform driver exports the pin_dbg_set() helper among
> the registered operations.

Drew, is it similar to what you are trying to achieve?

...

> +static ssize_t pinctrl_pins_write(struct file *file,
> +                                 const char __user *user_buf, size_t count,
> +                                 loff_t *ppos)
> +{
> +       struct seq_file *s = file->private_data;
> +       struct pinctrl_dev *pctldev = s->private;
> +       const struct pinctrl_ops *ops = pctldev->desc->pctlops;
> +       char buf[32];
> +       char *c = &buf[0];
> +       char *token;
> +       int ret, buf_size;
> +       unsigned int i, pin;
> +
> +       if (!ops->pin_dbg_set)
> +               return -EFAULT;
> +
> +       /* Get userspace string and assure termination */
> +       buf_size = min(count, sizeof(buf) - 1);
> +       if (copy_from_user(buf, user_buf, buf_size))
> +               return -EFAULT;
> +
> +       buf[buf_size] = 0;

Can't you use strncpy_from_user() ?


> +       token = strsep(&c, " ");

> +       if (kstrtouint(token, 0, &pin))
> +               return -EINVAL;

Don't shadow an error code.

> +       for (i = 0; i < pctldev->desc->npins; i++) {
> +               if (pin != pctldev->desc->pins[i].number)
> +                       continue;

Hmm... I don't get this. Why is it needed?

> +               ret = ops->pin_dbg_set(pctldev, pin, c);
> +               if (ret)
> +                       return ret;
> +
> +               return count;
> +       }
> +
> +       return -EINVAL;
> +}

...

> -       debugfs_create_file("pins", 0444,
> +       debugfs_create_file("pins", 0644,
>                             device_root, pctldev, &pinctrl_pins_fops);

Why is it in this file?



-- 
With Best Regards,
Andy Shevchenko

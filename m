Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAECA387A81
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 15:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245648AbhERN7M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 09:59:12 -0400
Received: from smtp-34-i2.italiaonline.it ([213.209.12.34]:56384 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349687AbhERN7D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 09:59:03 -0400
Received: from oxapps-15-086.iol.local ([10.101.8.96])
        by smtp-34.iol.local with ESMTPA
        id j0EAlzpEt5WrZj0EAlFIwH; Tue, 18 May 2021 15:57:42 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621346262; bh=FOfLt10TiVeFqvn1BJZhsE1iqcFUNQB5NLaFkxVKwVA=;
        h=From;
        b=lv2X90aUi2sKd8HFgWQFQkl3E9rShMmXYo1Ghvv5h3yrUcggkbcIF0OGqJUSG7sLa
         EeZzeI/jYFAfwR6yg333GRYGeUZFRYxTWZlYVi9Q+ZjCH6GKZrLdsHmnxViCV/7NkR
         +mOjzN5g8SbC1nxzknr8MZ9T/N/Y9lOyTcGsCKtSTHnY2VbJBwu8/qyCuB/xZiGVSY
         7IaYmE/LVckCc8KhvuOf7G1eIcfZu9uTEYeq+p48x5oYBYdn9Ig4Dqftww6bnmaCBx
         yTPhmJycCzywr0ZaIH1gjPylClOppNaE1f3EIsTgrG6mxRefJYxTuisPAsby0AXYZr
         RnkKBPQsGVIPw==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a3c7d6 cx=a_exe
 a=v+7NFWUWLAxl90LcUtT8lA==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=pGLkceISAAAA:8 a=L547Ubht33J7g4M119MA:9 a=QEXdDO2ut3YA:10
Date:   Tue, 18 May 2021 15:57:42 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Drew Fustini <drew@beagleboard.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <1735504854.166374.1621346262270@mail1.libero.it>
In-Reply-To: <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
References: <20210516135531.2203-1-dariobin@libero.it>
 <20210516135531.2203-2-dariobin@libero.it>
 <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug
 file
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: vSw5ATWRP9oT0Qm6yB5B4Ld4Nh24bik/
x-libjamv: WOw4sxia8EU=
X-CMAE-Envelope: MS4xfIGqIQFtXe9VbPscHiVEg1wVgwd9KALqR6oww1JdTJpem7gLAUeeXckAiFXJ9+RUz0TXIF6fXViM9EgLgxgSczwan9tqRLcmRgHuxwqvDsKbHG0QZR+4
 4OKnrihaxNp9nNCNzKngEA5JTVXEDzQP0faTfrDnCDlA3Cmvz6zBnD+ppGdvlveWlGaxUNUiLB42tKo1gaBl+gsLr/zfsrexUol+xJryHO5JdF6iAYGSzhJ0
 +QS2F6+Mcw3lJSHQCHJ/wVym8nsuGRL20f2ATJ1N40xNUC2X+1BqUIv+1cglh1Dels+SzaiBQk7Ec6Qocq8wE0yEeVA/1sYTMZBpU9cJiUIGTWBWm5rp2r+D
 RBMScHxO
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

> Il 17/05/2021 22:02 Andy Shevchenko <andy.shevchenko@gmail.com> ha scritto:
> 
>  
> On Sun, May 16, 2021 at 7:43 PM Dario Binacchi <dariobin@libero.it> wrote:
> >
> > The MPUs of some architectures (e.g AM335x) must be in privileged
> > operating mode to write on the pinmux
> 
> pinmux is not pin configuration. You need to rethink the approach.
> 
> > registers. In such cases, where
> > writes will not work from user space, now it can be done from the pins
> > debug file if the platform driver exports the pin_dbg_set() helper among
> > the registered operations.
> 
> Drew, is it similar to what you are trying to achieve?
> 
> ...
> 
> > +static ssize_t pinctrl_pins_write(struct file *file,
> > +                                 const char __user *user_buf, size_t count,
> > +                                 loff_t *ppos)
> > +{
> > +       struct seq_file *s = file->private_data;
> > +       struct pinctrl_dev *pctldev = s->private;
> > +       const struct pinctrl_ops *ops = pctldev->desc->pctlops;
> > +       char buf[32];
> > +       char *c = &buf[0];
> > +       char *token;
> > +       int ret, buf_size;
> > +       unsigned int i, pin;
> > +
> > +       if (!ops->pin_dbg_set)
> > +               return -EFAULT;
> > +
> > +       /* Get userspace string and assure termination */
> > +       buf_size = min(count, sizeof(buf) - 1);
> > +       if (copy_from_user(buf, user_buf, buf_size))
> > +               return -EFAULT;
> > +
> > +       buf[buf_size] = 0;
> 
> Can't you use strncpy_from_user() ?

Ok, I'll use strncpy_from_user() in the next version of the patch

> 
> 
> > +       token = strsep(&c, " ");
> 
> > +       if (kstrtouint(token, 0, &pin))
> > +               return -EINVAL;
> 
> Don't shadow an error code.

You are right

> 
> > +       for (i = 0; i < pctldev->desc->npins; i++) {
> > +               if (pin != pctldev->desc->pins[i].number)
> > +                       continue;
> 
> Hmm... I don't get this. Why is it needed?

I want to make sure the pin is managed

Thanks and regards,
Dario
> 
> > +               ret = ops->pin_dbg_set(pctldev, pin, c);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               return count;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> 
> ...
> 
> > -       debugfs_create_file("pins", 0444,
> > +       debugfs_create_file("pins", 0644,
> >                             device_root, pctldev, &pinctrl_pins_fops);
> 
> Why is it in this file?
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

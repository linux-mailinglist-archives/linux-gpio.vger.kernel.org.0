Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467D23049A3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 21:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732729AbhAZF0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbhAYPd4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 10:33:56 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8973C0698C1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 07:31:51 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id p15so8615060pjv.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 07:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8RUmVN1e7jNEdIFdoDs64qYblcmQVq1Z57kgFV644U=;
        b=pnQgeEoCMqKln2chSr4ZSiMYlc+nOvbs0fAaz+ErtOdvLvsMapHSkt41VkWAt6lnzo
         dryivxyeUAhiuZeoZIcxrmI5iOhy1Mv/VT7x8nBYnEQgEUDF895VA05HwePXWbyj9xhp
         kINWLeTJVj01C0ZmxRmKV8tR/N2T3PaBkk6Qmp34RAuO+5CqsEN6bOm8JV7nkT2xROCl
         wcKRa+CL/BRntRWNHeAxBvvVYTGSCfWtKCHq6ZyrADx2y8/Gb5jfmObiwvZ5yDTKI7v9
         ZEai+TGMaof+qGM/x9qOi3xTkuFsNWEriCsKRoPbO55ZGMejvTKwzXbiRHH2YOPzNuzu
         A8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8RUmVN1e7jNEdIFdoDs64qYblcmQVq1Z57kgFV644U=;
        b=sJb3HLKNvUHdzLYMtbcrBdlmKQC46G8qerVIF5CtTyw/5L3ySXqDpbhQyPCdZ9hLSj
         TXHCm98mgw1M1mpcq4ZEvcS37PuZdNNObKGf1lZwT9r8GLbdSLOEkPdTtGlDRFdms3qG
         Ep9t8cReoZ21A35XlLQ+QDL9AuI8vAx69Onz/tSlMMad1BsbPhbiOp70wISTvnPP0/ps
         wycYCaRNQcowfv6gr92I5mFyInWRZzuWtioZkavQVnJ1Znxhx3960JAdDNKiJf+wfbu9
         nk/JvzjVMySC/XkcWKEFTh+OvP9lzZdCwziW2xdtiI1HS+V/Sm8WWc0X3HuTNXyD8ddT
         07cw==
X-Gm-Message-State: AOAM532iC5D4RMSAu6vh5IdkUQAhdpJusmhu8/YHZQy2XT2X4RZptnYd
        SBzgd8xXbFsJk5NMmgVuZIiewTIduDCWXeXWh4ArN7pmT3AIZzu2
X-Google-Smtp-Source: ABdhPJycZpecYKinoKfrz8S3TywVFHPwuTcjyxRyJW017PLM33zKj3ZqVNYEXa+amkEJyZzoarDWt2aTJW01BQBwdkw=
X-Received: by 2002:a17:90a:644a:: with SMTP id y10mr760731pjm.129.1611588711189;
 Mon, 25 Jan 2021 07:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20210123064909.466225-1-drew@beagleboard.org>
In-Reply-To: <20210123064909.466225-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jan 2021 17:32:39 +0200
Message-ID: <CAHp75VeOB7ORsq0OWKHCyGy8ouUyQSoC85-F7RCdQ2WK_5R1UA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] pinctrl: pinmux: Add pinmux-select debugfs file
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

On Sat, Jan 23, 2021 at 9:29 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> This RFC is a change in approach from my previous RFC patch [1]. It adds
> "pinnux-select" to debugfs. Function and group on the pin control device
> will be activated when 2 integers "<function-selector> <group-selector>"
> are written to the file. The debugfs write operation pinmux_select()
> handles this by calling ops->set_mux() with fsel and gsel.

...

> RFC notes:

Please, move below to reST formatted document.

...

> +static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> +                                  size_t cnt, loff_t *ppos)
> +{
> +       struct seq_file *sfile = file->private_data;
> +       struct pinctrl_dev *pctldev = sfile->private;
> +       const struct pinmux_ops *ops = pctldev->desc->pmxops;
> +       int fsel, gsel, ret;
> +       // RFC note: two integers separated by a space should never exceed 16
> +       char buf[16];

> +       if (*ppos != 0)
> +               return -EINVAL;

But why? Do we really care about it? Moreover, you have no_llseek() below.

> +       ret = strncpy_from_user(buf, user_buf, cnt);

Potential buffer overflow.

  cnt -> sizeof(buf)

> +       if (ret < 0)
> +               return ret;

> +       buf[cnt] = '\0';

Not sure, shouldn't be

  buf[sizeof(buf) - 1] = '\0';

?

> +       if (buf[cnt - 1] == '\n')
> +               buf[cnt - 1] = '\0';

strstrip() ?

> +       ret = sscanf(buf, "%d %d", &fsel, &gsel);
> +       if (ret != 2) {

> +               dev_err(pctldev->dev, "%s: sscanf() expects '<fsel> <gsel>'", __func__);

__func__ is useless, please drop it. And below as well.

> +               return -EINVAL;
> +       }

> +       ret = ops->set_mux(pctldev, fsel, gsel);
> +       if (ret != 0) {

I thought I gave you a comment on this...

if (ret)

> +               dev_err(pctldev->dev, "%s(): set_mux() failed: %d", __func__, ret);
> +               return -EINVAL;
> +       }
> +
> +       return cnt;
> +}

...

>         debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
>                             devroot, pctldev, &pinmux_pins_fops);
> +       debugfs_create_file("pinmux-select", 0200,
> +                           devroot, pctldev, &pinmux_set_ops);

Consider to add another (prerequisite) patch to get rid of symbolic permissions.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CEF3198DC
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 04:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhBLDik (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 22:38:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhBLDik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 22:38:40 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D060EC061756
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 19:37:59 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u15so4440952plf.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 19:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ax9j7JpnwX2aHngFLHm4pofQY/NwW/wb9UVqk+4OdiA=;
        b=CRqpWozflkom32qIUXsfAivIflqvx6/ETRU0gKrlPX0bcAFVHMleAFzBDC1RtGwdRX
         TlGaD8FOFcijWiUdntOrIPLX7CA7sMcftmyY7WK0YcJhkrWLNBjID+TU/IHHq2hWVQTc
         EkGeBd4nv1YzQs/2JalDYnDpBzl5JPDR9kidM9aShFmkxnuyeLth1EkGItotpX7vFlXj
         YF8UcOwhMrCmicItxGYlne70LhDE7kPUPx/k1utsMk+RZ0cxmnJ6GxIr5IGp9zv9mPeL
         qW2jF0YwX1lM0vKkoZxCGeOwMUmdbvw2AIId+VMcr6oGdlbEStr/4HI8c4WuhVVSbKS2
         diqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ax9j7JpnwX2aHngFLHm4pofQY/NwW/wb9UVqk+4OdiA=;
        b=l0A8jfx2q6LEOxzxaHESGCWehH53t+hZcLDg86mB/cDy2865T5V2lXilyUyZeX5fBI
         P0/7QznqWW16t7xziwznE+Fr8lprUSdoxYgZ2VToY8u8imKciPOw1NdURiVE/BRXgLX6
         TwRKAyVgw4rSVfSCa3BYWNLwwqX4/TWwQmVQIHM8uflS1IkzJhjG/TLOiLjHcZkZ/1Rv
         tRw36NVBj2lppbzkbdPeIejOE5QiJ1V5LJW3BrarJTyeLTzx1/T6U38UPO5ykrLjfq0n
         /JY2bfMLdBOphEqnbpkzYorGnkA7ggIyHs6WmggxG8ysLozOEyXacEgGgOj39W2wQYsO
         HNjw==
X-Gm-Message-State: AOAM533AFtX0zQPRUjK7VQ/vGqui0BYDYq1VQ0L8zEpyUv/Qra/zIMwg
        lo8Vg1iNkMyPu1tMRApRv+Wd1g==
X-Google-Smtp-Source: ABdhPJybn8U/86HF2EYJEFA8cNHJeFngsam5vQX12fVYKhNCP9Xq6m8qafpFcZGexkCY1O7fVaYSLA==
X-Received: by 2002:a17:90a:2b8c:: with SMTP id u12mr913586pjd.98.1613101079374;
        Thu, 11 Feb 2021 19:37:59 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:3a7f:bbfb:1664:2a63])
        by smtp.gmail.com with ESMTPSA id b62sm5989958pga.8.2021.02.11.19.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 19:37:58 -0800 (PST)
Date:   Thu, 11 Feb 2021 19:37:56 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210212033756.GB347396@x1>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-3-drew@beagleboard.org>
 <CAMuHMdW3dZWEbHzXZ-62S-bb3WKbrfwR_EKf7b_fQ6z913SX1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW3dZWEbHzXZ-62S-bb3WKbrfwR_EKf7b_fQ6z913SX1A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 09:09:03AM +0100, Geert Uytterhoeven wrote:
> Hi Drew,
> 
> On Wed, Feb 10, 2021 at 11:33 PM Drew Fustini <drew@beagleboard.org> wrote:
> > Add "pinmux-select" to debugfs which will activate a function and group
> > when "<function-name group-name>" are written to the file. The write
> > operation pinmux_select() handles this by checking that the names map to
> > valid selectors and then calling ops->set_mux().
> >
> > The existing "pinmux-functions" debugfs file lists the pin functions
> > registered for the pin controller. For example:
> >
> > function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> > function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> > function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> > function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> > function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> > function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
> >
> > To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
> >
> > echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select
> >
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> Thanks for your patch!
> 
> > --- a/drivers/pinctrl/pinmux.c
> > +++ b/drivers/pinctrl/pinmux.c
> > @@ -673,6 +673,111 @@ void pinmux_show_setting(struct seq_file *s,
> >  DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
> >  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
> >
> > +#define PINMUX_MAX_NAME 64
> > +static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> > +                                  size_t len, loff_t *ppos)
> > +{
> > +       struct seq_file *sfile = file->private_data;
> > +       struct pinctrl_dev *pctldev = sfile->private;
> > +       const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
> > +       const char *const *groups;
> > +       char *buf, *fname, *gname;
> > +       unsigned int num_groups;
> > +       int fsel, gsel, ret;
> > +
> > +       if (len > (PINMUX_MAX_NAME * 2)) {
> > +               dev_err(pctldev->dev, "write too big for buffer");
> > +               return -EINVAL;
> > +       }
> > +
> > +       buf = kzalloc(PINMUX_MAX_NAME * 2, GFP_KERNEL);
> > +       if (!buf)
> > +               return -ENOMEM;
> > +
> > +       fname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> > +       if (!fname) {
> > +               ret = -ENOMEM;
> > +               goto free_buf;
> > +       }
> > +
> > +       gname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> > +       if (!buf) {
> > +               ret = -ENOMEM;
> > +               goto free_fname;
> > +       }
> > +
> > +       ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> 
> While this guarantees buf is not overflowed...
> 
> > +       if (ret < 0) {
> > +               dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > +               goto free_gname;
> > +       }
> > +       buf[len-1] = '\0';
> > +
> > +       ret = sscanf(buf, "%s %s", fname, gname);
> 
> ... one of the two strings can still be longer than PINMUX_MAX_NAME,
> thus overflowing fname or gname.
> 
> As buf is already a copy, it may be easier to just find the strings in
> buf, write the NUL terminators into buf, and set up fname and gname
> to point to the strings inside buf.

Thank you for pointing this out.  I should have considered that one name
could be much larger than the other name.  I see Andy suggested
alternative to sscanf() that gets around having to allocate seperate
buffers for each name.

> > +       if (ret != 2) {
> > +               dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > +               goto free_gname;
> > +       }
> 
> > +static const struct file_operations pinmux_select_ops = {
> > +       .owner = THIS_MODULE,
> > +       .open = pinmux_select_open,
> > +       .read = seq_read,
> 
> I don't think you need to fill in .read for a write-only file.

Thanks, I'll remove it.
> 
> > +       .write = pinmux_select,
> > +       .llseek = no_llseek,
> > +       .release = single_release,
> > +};
> > +
> >  void pinmux_init_device_debugfs(struct dentry *devroot,
> >                          struct pinctrl_dev *pctldev)
> >  {
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

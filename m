Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD14E2FF8DA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 00:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbhAUX2E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 18:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbhAUX1z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 18:27:55 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A61C061788
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 15:26:57 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id c132so2413156pga.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 15:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xzJyEPE7zSDLy050TT9Or88eozzLdvFI37veg1QTV2I=;
        b=L8L7r0sN572q7K6ZDgDoxE+yeKd/nNFqveaPThThO6dpjBy1SL9AvtQuAfi/KA7lrm
         snJJKfdIGipx+ovcJMqCGlwwCsu7rOTL9W+H1VzIdPWiWgxdU1SUTfW1PrD/7yQXahYe
         CWh5q25BJQVWYq9zc9UWMeWMYc+rq0n4VXaEd/IaByCeCBU+3LC6Qc9kcV27MdkIbh8K
         E8BeJgYC9nu1fkbqNkSlMX7yUyHj8q/L22FZcY66kLhfANhRsIwz3Vm22ZXPYlZQ7NAZ
         KR0y3wQMDprQ9s34Wwl9SODMWnwWwQFmDZnqmvwcdcUMOJ487ZVJSFylkrqaLQ5LzbtV
         pmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xzJyEPE7zSDLy050TT9Or88eozzLdvFI37veg1QTV2I=;
        b=OmO6++MmWDQHEDsoShJ18JWWwoYyc94V3/C2/o49eks+tnlFuY3IR5csARav9/kx6Z
         CDVTwK0ZrgXXlWnwia49qtG2k77HXJlVUmBAxahQ7XAYAB44ov1xJQr9td4WDROzkr21
         9LtDcYWAEofJzbn3EcwjWUxIJQ9mYAPuPMizkmo6fJOd19mrlN5nHOOnyXnNLM5hlxlu
         TcAj4oSs7hpqiTs5fPyhfuJWYy3YAlKNYmxsG6/YuaLk77L49Y2/tC4F1v0+nglgymKI
         CZRGxTX2a4BsEnONuZZ30HlBXwEntTSHujZMAL1teJLOJI/x1x8kzoirelnt/pqv9zLy
         EqYw==
X-Gm-Message-State: AOAM530+REDAYFrllPZbM4/9hx9Tff+bkrN9JtUhpDFCyAHZyiPaM2PU
        EiWhu9zF48iLiriCYmaJ7flOSTlDc/uS4WMh
X-Google-Smtp-Source: ABdhPJyBIF+xEs337pHimckGOh/B0XizMv+TuPB+udXdItWTt1p7vxXq555xhQujgMxZ6QTxBG9OVA==
X-Received: by 2002:a63:ca49:: with SMTP id o9mr1675752pgi.421.1611271616368;
        Thu, 21 Jan 2021 15:26:56 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:d3db:62f3:9fcb:eb79])
        by smtp.gmail.com with ESMTPSA id u12sm6193926pgi.91.2021.01.21.15.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:26:55 -0800 (PST)
Date:   Thu, 21 Jan 2021 15:26:53 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] pinctrl: pinmux: Add pinmux-set debugfs file
Message-ID: <20210121232653.GA672978@x1>
References: <20210121051806.623743-1-drew@beagleboard.org>
 <CAHp75Vd5M0kyNzq+5gcZEd=6hK_7Y5_dEJ39-yQO7WuYRM4KWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd5M0kyNzq+5gcZEd=6hK_7Y5_dEJ39-yQO7WuYRM4KWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 01:18:58PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 21, 2021 at 7:18 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > This RFC is a change in approach from my previous RFC patch [1]. It adds
> > "pinnux-set" to debugfs. A function and group on the pin control device
> > will be activated when 2 integers "<function-selector> <group-selector>"
> > are written to the file. The debugfs write operation pinmux_set_write()
> > handles this by calling ops->set_mux() with fsel and gsel.
> 
> s/ops//

Ok, thanks.
> 
> > RFC question: should pinmux-set take function name and group name
> > instead of the selector numbers?
> 
> I would prefer names and integers (but from user p.o.v. names are
> easier to understand, while numbers are good for scripting).

I don't actually see any example of looking up the function name in the
existing pinctrl code. There is pin_function_tree in struct pinctrl_dev.
pinmux_generic_get_function_name() does radix_tree_lookup() with the
selector integer as the key, but there is no corresponding "get function
selector by name" function.

I think I would need to go through all the nodes in the radix tree to
find the name that matches. Although, I am just learning now about the
radix implementation in Linux so there might be a simpler way that I am
missing.

> 
> The following is better to include in documentation and remove from
> the commit message.
> 
> > The following is an example on the PocketBeagle [2] which has the AM3358
> > SoC and binds to pinctrl-single. I added this to the device tree [3] to
> > represent two of the pins on the expansion header as an example: P1.36
> > and P2.01. Both of these header pins are designed to be set to PWM mode
> > by default [4] but can now be set back to gpio mode through pinmux-set.
> 
> ...
> 
> > The following shows the pin functions registered for the pin controller:
> >
> > root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# cat pinmux-functions
> 
> Shorter is better, what about simply
> 
> # cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pinmux-functions
> ?
> 
> Btw  in reST format you may create a nice citation of this. And yes,
> this should also go to the documentation.

Good point, I'll shorten the example lines in v2.

> > function: pinmux_P1_36_default_pin, groups = [ pinmux_P1_36_default_pin ]
> > function: pinmux_P2_01_default_pin, groups = [ pinmux_P2_01_default_pin ]
> > function: pinmux_P1_36_gpio_pin, groups = [ pinmux_P1_36_gpio_pin ]
> > function: pinmux_P1_36_gpio_pu_pin, groups = [ pinmux_P1_36_gpio_pu_pin ]
> > function: pinmux_P1_36_gpio_pd_pin, groups = [ pinmux_P1_36_gpio_pd_pin ]
> > function: pinmux_P1_36_gpio_input_pin, groups = [ pinmux_P1_36_gpio_input_pin ]
> > function: pinmux_P1_36_pwm_pin, groups = [ pinmux_P1_36_pwm_pin ]
> > function: pinmux_P2_01_gpio_pin, groups = [ pinmux_P2_01_gpio_pin ]
> > function: pinmux_P2_01_gpio_pu_pin, groups = [ pinmux_P2_01_gpio_pu_pin ]
> > function: pinmux_P2_01_gpio_pd_pin, groups = [ pinmux_P2_01_gpio_pd_pin ]
> > function: pinmux_P2_01_gpio_input_pin, groups = [ pinmux_P2_01_gpio_input_pin ]
> > function: pinmux_P2_01_pwm_pin, groups = [ pinmux_P2_01_pwm_pin ]
> > function: pinmux-uart0-pins, groups = [ pinmux-uart0-pins ]
> > function: pinmux-mmc0-pins, groups = [ pinmux-mmc0-pins ]
> > function: pinmux-i2c0-pins, groups = [ pinmux-i2c0-pins ]
> >
> > Activate the pinmux_P1_36_gpio_pin function (fsel 2):
> >
> > root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# echo '2 2' > pinmux-set
> >
> > Extra debug output that I added shows that pinctrl-single's set_mux()
> > has set the register correctly for gpio mode:
> >
> > pinmux core: DEBUG pinmux_set_write(): returned 0
> > pinmux core: DEBUG pinmux_set_write(): buf=[2 2]
> > pinmux core: DEBUG pinmux_set_write(): sscanf(2,2)
> > pinmux core: DEBUG pinmux_set_write(): call ops->set_mux(fsel=2, gsel=2)
> > pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): call pinmux_generic_get_function() on fselector=2
> > pinctrl-single 44e10800.pinmux: enabling (null) function2
> > pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): func->nvals=1
> > pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): offset=0x190 old_val=0x21 val=0x2f
> >
> > Activate the pinmux_P1_36_pwm_pin function (fsel 6):
> >
> > root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# echo '6 6' > pinmux-set
> >
> > pinctrl-single set_mux() is able to set register correctly for pwm mode:
> >
> > pinmux core: DEBUG pinmux_set_write(): returned 0
> > pinmux core: DEBUG pinmux_set_write(): buf=[6 6]
> > pinmux core: DEBUG pinmux_set_write(): sscanf(6,6)
> > pinmux core: DEBUG pinmux_set_write(): call ops->set_mux(fsel=6, gsel=6)
> > pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): call pinmux_generic_get_function() on fselector=6
> > pinctrl-single 44e10800.pinmux: enabling (null) function6
> > pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): func->nvals=1
> > pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): offset=0x190 old_val=0x2f val=0x21
> 
> This and above is still part of documentation, and not a commit message thingy.

Is something I should add to Documentation/driver-api/pinctl.rst in a
seperate patch?

> 
> ...
> 
> > +static ssize_t pinmux_set_write(struct file *file, const char __user *user_buf,
> > +                                  size_t cnt, loff_t *ppos)
> > +{
> > +       int err;
> > +       int fsel;
> > +       int gsel;
> > +       int ret;
> > +       char *buf;
> > +       struct seq_file *sfile;
> > +       struct pinctrl_dev *pctldev;
> > +       const struct pinmux_ops *ops;
> 
> Reversed xmas tree order please, and you may group some of them, like
> 
>    int fsel, gsel;
> 

Ok, understood.

> > +       if (*ppos != 0)
> > +               return -EINVAL;
> 
> > +       if (cnt == 0)
> > +               return 0;
> 
> Has it ever happened here?

Good point, I guess there is no reason for userspace to write 0 bytes.

> > +       buf = memdup_user_nul(user_buf, cnt);
> > +       if (IS_ERR(buf))
> > +               return PTR_ERR(buf);
> > +
> > +       if (buf[cnt - 1] == '\n')
> > +               buf[cnt - 1] = '\0';
> 
> Shouldn't you rather use strndup_from_user() (or how is it called?)
> 
> > +       ret = sscanf(buf, "%d %d", &fsel, &gsel);
> > +       if (ret != 2) {
> > +               pr_warn("%s: sscanf() expects '<fsel> <gsel>'", __func__);
> 
> No __func__ and instead use dev_err() (it is strange you are using
> warn level for errors).
> 

Ok, that makes sense. I used warn because I wasn't sure if bad format in
a write to a debugfs file rises to the level of error.

> > +               err = -EINVAL;
> > +               goto err_freebuf;
> > +       }
> 
> > +       sfile = file->private_data;
> > +       pctldev = sfile->private;
> 
> These can be applied directly in the definition block above.

I'll clean that up.

> 
> > +       ops = pctldev->desc->pmxops;
> > +       ret = ops->set_mux(pctldev, fsel, gsel);
> 
> > +       if (ret != 0) {
> 
> if (ret)
> 
> > +               pr_warn("%s(): set_mux() failed: %d", __func__, ret);
> 
> As above.
> 
> > +               err = -EINVAL;
> > +               goto err_freebuf;
> > +       }
> 
> > +       kfree(buf);
> > +       return cnt;
> > +
> > +err_freebuf:
> > +       kfree(buf);
> > +       return err;
> 
> Can be simply
> 
>  err_freebuf:
>         kfree(buf);
>         return err ?: cnt;

Thanks, I didn't really like the duplication but was having trouble
thinking of a cleaner way to write it.  That is good to know it is ok to
use the ternary operator in a return statement.

> 
> > +}
> > +
> 
> ...
> 
> > +       debugfs_create_file("pinmux-set", S_IFREG | S_IWUSR,
> > +                           devroot, pctldev, &pinmux_set_ops);
> 
> I would rather call it 'pinmux-select'.

I think that makes sense, too.
> 
> Overall since it's a debugfs I do not much care about interfaces and
> particular implementation details, but in general looks good to me,
> thanks for doing this!

Thanks for the review.  I'll get a v2 posted.

-Drew

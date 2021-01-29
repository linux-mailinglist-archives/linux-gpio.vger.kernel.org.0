Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE02308AE4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jan 2021 18:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhA2RDW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jan 2021 12:03:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbhA2RBj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jan 2021 12:01:39 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ED9C061788
        for <linux-gpio@vger.kernel.org>; Fri, 29 Jan 2021 08:59:45 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d4so5531745plh.5
        for <linux-gpio@vger.kernel.org>; Fri, 29 Jan 2021 08:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4KmyypUu/Enr5yJV5OnrQVQHjBoFKFy2rET4JHdeCIo=;
        b=2IKZve9yr41FRyTY97Yqr0yQOG+Yl6mBXU/YJrvf3EHLx1bgLRyY5sv4bQv17PU09T
         7fMlI4QUpWgM97uKsVZ+LITT4wbb2WGMywkB97psWD9Vl6d0hg8H7G9a1jaSSYfDE8Am
         PeDxRtP6Ny5G2qPbrbu0zmHP6OhGabBfhLSH+CfZvC3RTrjHNWT/RKbZogY9vy/K7YYe
         Y+sP6W8FlmI4BW2m6wK38+r475+zGpZTiXvpBLYi7ImKsT0v5cQTCNpS2GQkhKCWFnxI
         0qP0WdxM0ImKImA4DZT3I3gtYyLp5HTViokZ2NvGnuYVjdkGUEYjN+7vd9eu3Gk67uBs
         BqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4KmyypUu/Enr5yJV5OnrQVQHjBoFKFy2rET4JHdeCIo=;
        b=HWKnUx2jxs9HgfPvRAFSfvhfKohliQGvSo5A8TI0FptE3mHzZYG+CxCnPZEcLKP8MB
         260Cozqh+FgqVmLYpbrODl6OrLz1EA7X0ZrbUcG2tWMHumUUOL5WRtYf2IYzTKPDQ1Bq
         FsW1PQM7XfDVGPUVFE+VJ5bfU8X30wGu7rFYG0hSqSAROox7Re7OOIeubU1Ryd9Pe/NP
         ioHKnBO1DVzc18l203dMjmklU+XiCzJkhi4PoS8XpZiE9+JlSCGbYyaduJS57BAqQe/4
         SVTddHMRbDFux6AEQLNJahK80tjtJIl13qu63pRl0i3l9rjkEiFbnidR1IvPSJEbsBlX
         zthw==
X-Gm-Message-State: AOAM533GZr/md7Zj//hyUj/+tMLhdYa2gGzcOmnG2OZDDsoBMBqjx6z2
        sfY4zoYFDhl4403HWi8tcZJH/orVGxbMwQ==
X-Google-Smtp-Source: ABdhPJyqjXTshEZgxmQg1PBr5uiJMvCVPBrL8UakzKunIhZ1y6tpbih9MAtzMuGCQ3IhLst5I4Cu+Q==
X-Received: by 2002:a17:902:c40b:b029:de:2f1e:825c with SMTP id k11-20020a170902c40bb02900de2f1e825cmr5093559plk.64.1611939584358;
        Fri, 29 Jan 2021 08:59:44 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:888f:e88:f361:5802])
        by smtp.gmail.com with ESMTPSA id r7sm9618953pfc.26.2021.01.29.08.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 08:59:43 -0800 (PST)
Date:   Fri, 29 Jan 2021 08:59:41 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210129165941.GB384703@x1>
References: <20210129084759.372658-1-drew@beagleboard.org>
 <CAMuHMdVnCmUSn5AgjqJr1TAvGtAAVR=K=ZeM3+GagHueXmZeeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVnCmUSn5AgjqJr1TAvGtAAVR=K=ZeM3+GagHueXmZeeQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 29, 2021 at 12:02:43PM +0100, Geert Uytterhoeven wrote:
> Hi Drew,
> 
> Thanks for your patch!
> 
> On Fri, Jan 29, 2021 at 9:49 AM Drew Fustini <drew@beagleboard.org> wrote:
> > Add "pinmux-select" to debugfs which will activate a function and group
> > when 2 integers "<function-selector> <group-selector>" are written to
> > the file. The write operation pinmux_select() handles this by checking
> > if fsel and gsel are valid selectors and then calling ops->set_mux().
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
> > To activate function pinmux-i2c1 (fsel 4) and group pinmux-i2c1-pins
> > (gsel 4):
> >
> > echo '4 4' > pinmux-select
> 
> Shouldn't gsel be "0" in your example, as "pinmux-i2c1-pins" is the
> first entry in the groups array?
> 
> [ /me actually tries this]
> 
> Oh, gsel is not the index inside the groups array, but the global index?
> 
> On R-Car M2-W, which does not use pinctrl-single, I have:
> 
>     function 0: audio_clk, groups = [ audio_clk_a audio_clk_b
> audio_clk_b_b audio_clk_c audio_clkout ]
>     function 1: avb, groups = [ avb_link avb_magic avb_phy_int
> avb_mdio avb_mii avb_gmii ]
>     function 2: can0, groups = [ can0_data can0_data_b can0_data_c
> can0_data_d can0_data_e can0_data_f can_clk can_clk_b can_clk_c
> can_clk_d ]
>     function 3: can1, groups = [ can1_data can1_data_b can1_data_c
> can1_data_d can_clk can_clk_b can_clk_c can_clk_d ]
>     function 4: can_clk, groups = [ can_clk can_clk_b can_clk_c can_clk_d ]
>     function 5: du, groups = [ du_rgb666 du_rgb888 du_clk_out_0
> du_clk_out_1 du_sync du_oddf du_cde du_disp ]
>     function 6: du0, groups = [ du0_clk_in ]
>     function 7: du1, groups = [ du1_clk_in du1_clk_in_b du1_clk_in_c ]
>     function 8: eth, groups = [ eth_link eth_magic eth_mdio eth_rmii ]
>     function 9: hscif0, groups = [ hscif0_data hscif0_clk hscif0_ctrl
> hscif0_data_b hscif0_ctrl_b hscif0_data_c hscif0_clk_c ]
>     function 10: hscif1, groups = [ hscif1_data hscif1_clk hscif1_ctrl
> hscif1_data_b hscif1_data_c hscif1_clk_c hscif1_ctrl_c hscif1_data_d
> hscif1_data_e hscif1_clk_e hscif1_ctrl_e ]
>     function 11: hscif2, groups = [ hscif2_data hscif2_clk hscif2_ctrl
> hscif2_data_b hscif2_ctrl_b hscif2_data_c hscif2_clk_c hscif2_data_d ]
>     function 12: i2c0, groups = [ i2c0 i2c0_b i2c0_c ]
>     function 13: i2c1, groups = [ i2c1 i2c1_b i2c1_c i2c1_d i2c1_e ]
>     function 14: i2c2, groups = [ i2c2 i2c2_b i2c2_c i2c2_d ]
>     [...]
> 
> Took me a few tries, crashes, and debug prints, to discover that I did
> not count wrong, but that names were de-duplicated (the "can_clk*" in
> functions 2 and 3 are not accessible by gsel), and that "75" not "83" is
> the right number to configure i2c2.
> 
> But then it works (on the Koelsch board):
> 
>     # cd /sys/kernel/debug/pinctrl/e6060000.pinctrl-sh-pfc/
>     # echo 14 289 > pinmux-select   # Configure i2c2 pins for ssi2_ctrl
>     # i2cdetect -y -a 2             # Fails
>     # echo 14 75 > pinmux-select    # Restore i2c2
>     # i2cdetect -y -a 2             # Works again
> 
> Nice!
> 
> So we definitely want to use the actual names, not error-prone numbers,
> at least for pinctrl drivers that use the concept of names.
> As we do specify the names in DT, cfr.
> arch/arm/boot/dts/r8a7791-koelsch.dts:
> 
>         i2c2_pins: i2c2 {
>                 groups = "i2c2";
>                 function = "i2c2";
>         };
> 
> the pinmux core already knows how to look them up.
> See pinmux_map_to_setting().
> 
> > --- a/drivers/pinctrl/pinmux.c
> > +++ b/drivers/pinctrl/pinmux.c
> > @@ -673,6 +673,65 @@ void pinmux_show_setting(struct seq_file *s,
> >  DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
> >  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
> >
> > +static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> > +                                  size_t len, loff_t *ppos)
> > +{
> > +       struct seq_file *sfile = file->private_data;
> > +       struct pinctrl_dev *pctldev = sfile->private;
> > +       const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
> > +       const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
> > +       int fsel, gsel, ret;
> > +       char buf[16];
> > +
> > +       if (len > sizeof(buf)) {
> > +               dev_err(pctldev->dev, "write too big for buffer");
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = strncpy_from_user(buf, user_buf, sizeof(buf));
> > +       if (ret < 0)
> > +               return ret;
> > +       buf[len-1] = '\0';
> > +
> > +       ret = sscanf(buf, "%d %d", &fsel, &gsel);
> > +       if (ret != 2) {
> > +               dev_err(pctldev->dev, "expected format: <function#> <group#>");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!pmxops->get_function_name(pctldev, fsel)) {
> 
> At least for the Renesas pinctrl driver, get_function_name() happily
> iterates beyond the end of the internal array, which may crash.
> Using pinmux_func_name_to_selector() would avoid that.
> 
> > +               dev_err(pctldev->dev, "function selector %u not valid\n", fsel);
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!pctlops->get_group_name(pctldev, gsel)) {
> 
> Likewise.
> 
> Use pmxops->get_function_groups() and match_string() instead?
> 
> > +               dev_err(pctldev->dev, "group selector %u not valid\n", gsel);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = pmxops->set_mux(pctldev, fsel, gsel);
> > +       if (ret) {
> > +               dev_err(pctldev->dev, "set_mux() failed: %d", ret);
> > +               return -EINVAL;
> > +       }
> > +
> > +       return len;
> > +}
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

Thanks very much for the comments, Geert. It is great to get feedback on
how it behaves on other pin control hardware.

I agree the selectors get confusing, and it does make more sense to use
the function and group names in 'pinmux-select'. I was initially
discouraged when I didn't see an efficient way to do a lookup in the
radix trees based on name. I'll take a look at the functions that you
mentioned as they look promising.

thanks,
drew

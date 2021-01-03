Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0692E8E0F
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 21:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbhACUYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 15:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbhACUYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 15:24:03 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D757AC0613C1
        for <linux-gpio@vger.kernel.org>; Sun,  3 Jan 2021 12:23:22 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id t8so15076612pfg.8
        for <linux-gpio@vger.kernel.org>; Sun, 03 Jan 2021 12:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e1xBR8UornTwqH6fVhOXEbzOOGDBOFbaaWz/gve1ZB4=;
        b=eAgQ/Hy8aNE92XFuJLB7JF8fLfZAZWcsb1P42ypm9pIxHWcoYtjFeKB37vbO8VcEn4
         7HN0q0c1G3HlSehM17AyTtNaovhaG5sSNkpHiaLUIkNG8Vi4PUImFdEvRPCCUF1jMyiq
         +SLSThbytPByKI0BBl5AQlTaPbghPdmOIUArRzEhwvebCJD3LCN7G4LmCNQeSi9tad57
         b8RJ3bGT/k64ySODuPRP96JdK9RaX58RxytLfu+n2P5RKTPSCuM3LllyUdiB/5d+soN9
         ZJ+5mciEhiSKW6obZ9B2qeMA1LE2Wmrk2M/Nbk99CNgSLyEMsBQJyUHhfROE577xpkyy
         HVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e1xBR8UornTwqH6fVhOXEbzOOGDBOFbaaWz/gve1ZB4=;
        b=R90V99MD0UFsAx9BggfyeFV2h4lMW0oJ9g/eTI+H+OVcTNmBLGkS5L3L/bCqXfTnGC
         3E51kq+uFyueELMySMfqtpqPjxUirsr5dgPJmI+Dt2YRCK8fpPmg+mHXZBnkREJILUyW
         HdFO6Cq1UEdZgfBYRt6gAsiEglOvJxb5yqOiaECUrd0lmqpcmffUMab4sQnEqD3N70ui
         N+Phf+UeOoCFXU0rnnPHrSdJF/+/W9inFNy++R2zxAh2owVZXNqcMPG+xmY5aR1RVxhk
         QkUs0AYm+KndEfXza9ppvtRGoRVL7ejJzvI5zHeE3mSUuiIXsDnApsaVeASKXN0+mFoz
         Ksjw==
X-Gm-Message-State: AOAM5328bgKC2os/hi5UudgJy5s45rl6jFZaGArOVJAKmgUUv4gVjPST
        vtLYNULX0zll6LIGX1eWQMBONg==
X-Google-Smtp-Source: ABdhPJyqVu2NCWCxorYPgh0U50FWU5nfkQ2WUDd8qg3Vg0EVXFLQgx70XG5MzHhfqblZyUpOxcBwvQ==
X-Received: by 2002:a63:520e:: with SMTP id g14mr20496306pgb.378.1609705402142;
        Sun, 03 Jan 2021 12:23:22 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:8efb:42a0:32b:a51d])
        by smtp.gmail.com with ESMTPSA id p9sm19446293pjb.3.2021.01.03.12.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 12:23:21 -0800 (PST)
Date:   Sun, 3 Jan 2021 12:23:19 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20210103202319.GA973266@x1>
References: <20201218045134.4158709-1-drew@beagleboard.org>
 <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
 <20201224203603.GA59600@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224203603.GA59600@x1>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 24, 2020 at 02:36:03PM -0600, Drew Fustini wrote:
> On Fri, Dec 18, 2020 at 06:01:25PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 18, 2020 at 6:52 AM Drew Fustini <drew@beagleboard.org> wrote:
> > >
> > > BeagleBoard.org [0] currently uses an out-of-tree driver called
> > > bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.
> > > The driver assists users of our BeagleBone and PocketBeagle boards in
> > > rapid prototyping by allowing them to change at run-time between defined
> > > set of pinctrl states [3] for each pin on the expansion connectors [4].
> > > This is achieved by exposing a 'state' file in sysfs for each pin which
> > > is used by our 'config-pin' utility [5].
> > >
> > > Our goal is to eliminate all out-of-tree drivers for BeagleBoard.org
> > > boards and thus I have been working to replace bone-pinmux-helper with a
> > > new driver that could be acceptable upstream. My understanding is that
> > > debugfs, unlike sysfs, could be the appropriate mechanism to expose such
> > > functionality.
> > 
> > No objections here.
> > 
> > > I used the compatible string "pinctrl,state-helper" but would appreciate
> > > advice on how to best name this. Should I create a new vendor prefix?
> > 
> > Here is the first concern. Why does this require to be a driver with a
> > compatible string?
> 
> I have not been able to figure out how to have different active pinctrl
> states for each header pins (for example P2 header pin 3) unless they
> are represented as DT nodes with their own compatible for this helper
> driver such as:
> 
> &ocp {
> 	P2_03_pinmux {
> 		compatible = "pinctrl,state-helper";
> 		pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pwm";
> 		pinctrl-0 = <&P2_03_default_pin>;
> 		pinctrl-1 = <&P2_03_gpio_pin>;
> 		pinctrl-2 = <&P2_03_gpio_pu_pin>;
> 		pinctrl-3 = <&P2_03_gpio_pd_pin>;
> 		pinctrl-4 = <&P2_03_gpio_input_pin>;
> 		pinctrl-5 = <&P2_03_pwm_pin>;
> 	};
> }
> 
> I can assign pinctrl states in the pin controller DT node which has
> compatible pinctrl-single (line 301 arch/arm/boot/dts/am33xx-l4.dtsi):
> 
> &am33xx_pinmux {
> 
>         pinctrl-names = "default", "gpio", "pwm";
>         pinctrl-0 =   < &P2_03_default_pin &P1_34_default_pin &P2_19_default_pin &P2_24_default_pin
>                         &P2_33_default_pin &P2_22_default_pin &P2_18_default_pin &P2_10_default_pin
>                         &P2_06_default_pin &P2_04_default_pin &P2_02_default_pin &P2_08_default_pin
>                         &P2_17_default_pin >;
>         pinctrl-1 =   < &P2_03_gpio_pin &P1_34_gpio_pin &P2_19_gpio_pin &P2_24_gpio_pin
>                         &P2_33_gpio_pin &P2_22_gpio_pin &P2_18_gpio_pin &P2_10_gpio_pin
>                         &P2_06_gpio_pin &P2_04_gpio_pin &P2_02_gpio_pin &P2_08_gpio_pin
>                         &P2_17_gpio_pin >;
>         pinctrl-2 =   < &P2_03_pwm &P1_34_pwm &P2_19_pwm &P2_24_pwm
>                         &P2_33_pwm &P2_22_pwm &P2_18_pwm &P2_10_pwm
>                         &P2_06_pwm &P2_04_pwm &P2_02_pwm &P2_08_pwm
>                         &P2_17_pwm >;
> 
> }
> 
> However, there is no way to later select "gpio" for P2.03 and select
> "pwm" for P1.34 at the same time.  Thus, I can not figure out a way to
> select independent states per pin unless I make a node for each pin that
> binds to a helper driver.
> 
> It feels like there may be a simpler soluation but I can't see to figure
> it out.  Suggestions welcome!
> 
> > 
> > > The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
> > > The driver would create the corresponding pinctrl state file in debugfs
> > > for the pin.  Here is an example of how the state can be read and
> > > written from userspace:
> > >
> > > root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> > > default
> > > root@beaglebone:~# echo pwm > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> > > root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> > > pwm
> > >
> > > I would very much appreciate feedback on both this general concept, and
> > > also specific areas in which the code should be changed to be acceptable
> > > upstream.
> > 
> > Two more concerns:
> >  - why is it OF only?
> 
> I am open to figuring out a more general solution but I am really only
> familiar with Device Tree.  Is there a way to represent the possible
> pinctrl states in ACPI?
> 
> >  - why has it been separated from pin control per device debug folder?
> 
> >From the v1 thread, I see what you mean that there could be a combined
> state file for each pinctrl device where one would echo '<pin>
> <state-name>' such as 'P2_03 pwm'.  I will attempt to implement that.

I have tried creating a single state file:
/sys/kernel/debug/pinctrl/pinctrl_state

where one can write into it:

<device-name> <pinctrl-state-name>

such as:

ocp:P9_14_pinmux gpio

However, I can not figure out a way for this to work.

I create the pinctrl_state file in pinctrl_state_helper_init() and store
the dentry in a global variable.

pinctrl_state_helper_probe() still runs for each Px_0y_pinmux device
tree entry with compatible "pinctrl,state-helper" but there is no
per-device file created.

The problem comes in pinctrl_state_write().  I use this to extract the
device_name and state_name:

	ret = sscanf(buf, "%s %s", device_name, state_name);

This does work okay but I don't know what to do with the device_name
string, such as "ocp:P9_14_pinmux".  Previously, the device was saved
in the private info:

        sfile = file->private_data;
        priv = sfile->private;
        p = devm_pinctrl_get(priv->dev); // use device_name instead?
	state = pinctrl_lookup_state(p, state_name);

But I don't know how to look up a device based on its name.

Any suggestions as to how to handle that?


Thanks and happy new year!
Drew

> 
> > 
> > 
> > > [0] http://beagleboard.org/latest-images
> > > [1] https://github.com/beagleboard/linux/blob/5.4/drivers/misc/cape/beaglebone/bone-pinmux-helper.c
> > > [2] https://github.com/RobertCNelson/linux-dev/blob/master/patches/drivers/ti/gpio/0001-BeagleBone-pinmux-helper.patch
> > > [3] https://github.com/beagleboard/BeagleBoard-DeviceTrees/blob/v5.4.x-ti-overlays/src/arm/am335x-bone-common-univ.dtsi#L2084
> > > [4] https://github.com/beagleboard/beaglebone-black/wiki/System-Reference-Manual#section-7-1
> > > [5] https://github.com/beagleboard/bb.org-overlays/blob/master/tools/beaglebone-universal-io/config-pin
> > 
> > --
> > With Best Regards,
> > Andy Shevchenko
> 
> Thanks for reviewing,
> Drew

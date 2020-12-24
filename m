Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE582E28CC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 21:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgLXUgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 15:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgLXUgr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2020 15:36:47 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19573C061575
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2020 12:36:07 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id n42so2593773ota.12
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2020 12:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QvZGdBjZYtotbDQftzil2CCyIVVf+A50G1X5HgounlU=;
        b=WL66wZNuYd/E0oTSq7Lntbyk/DvhHiTHeK3mVwserRtxQphqsw3dr5XuPmy869J3/J
         qH/6MkG+jf1va7rbLMMjHtpDQcqTC0rUzL7lRGIV4uf2oxZFDEHJxyM9KvKqE22tUT04
         V8gFjCf3rG6EKOokEsh8CQDtAdMvXgk1gIcC4bk0vKJYLPFfTzP/eTuSJrz/4ToreZqO
         fMDKqr5BmkjggkZq/3PTh7Ps+JJgZFUHa1NF42b4I2j7QhWIWvDiwFsBSkKOo8ueZ9nL
         KexHAfgut/w3KJGN39qcw2CO/WNYrqTd18Ev8IOD53UB8WeG9ERo4VC9/h0AxJUWSKGe
         lOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QvZGdBjZYtotbDQftzil2CCyIVVf+A50G1X5HgounlU=;
        b=Gg1Pxwr5TRCKiAVMl5044YtKwlq5Gs/Ot/Z9cEKNC0nCoB9Swnde+9XSmtFgVU5fu7
         V5eeTHpX+R6teDFLYoJ4GPcCaPbdi7ZrbdsrIZPMqAXTuXVVCLL6JrC0aNl65EuGTxQv
         RJg1QHmzP1QAOZGgL8yUhrBCX/b+sfvvgwQdeCyLSjN4O/nwOGZV7A93l2wRd/nZv2cd
         //C5LAJ+VzQbsZZApkSVQHq/D6ea+PdCRqiKfOMs0g97aidDrBCjlgq+2X/pPwlXLHxq
         cpMCXvPEQSqsiiW6LOTwq9JpZUPTxAQGicBNvFj/yE18DIA8pbzp2WBY/R/lRiBkS0TW
         MlGg==
X-Gm-Message-State: AOAM533+X0cjc/I7bmqwP9MrKi1ajGI4tdydwCjr1CroYpbIsyf78qYY
        xY6AB9y4NRWnk1wxokkue9yVTA==
X-Google-Smtp-Source: ABdhPJy5x5Ls7C7ERu2fcsPyiDFy6neu9jlWMWYJ9fi2gU5xjFUhYsIML5LoAKj/dOFsMwsc2EFkSw==
X-Received: by 2002:a9d:4c07:: with SMTP id l7mr23296576otf.318.1608842166109;
        Thu, 24 Dec 2020 12:36:06 -0800 (PST)
Received: from x1 ([2600:1702:da0:ff40:462a:45dd:442a:fb42])
        by smtp.gmail.com with ESMTPSA id j126sm3412611oif.8.2020.12.24.12.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 12:36:05 -0800 (PST)
Date:   Thu, 24 Dec 2020 14:36:03 -0600
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
Message-ID: <20201224203603.GA59600@x1>
References: <20201218045134.4158709-1-drew@beagleboard.org>
 <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 18, 2020 at 06:01:25PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 18, 2020 at 6:52 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > BeagleBoard.org [0] currently uses an out-of-tree driver called
> > bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.
> > The driver assists users of our BeagleBone and PocketBeagle boards in
> > rapid prototyping by allowing them to change at run-time between defined
> > set of pinctrl states [3] for each pin on the expansion connectors [4].
> > This is achieved by exposing a 'state' file in sysfs for each pin which
> > is used by our 'config-pin' utility [5].
> >
> > Our goal is to eliminate all out-of-tree drivers for BeagleBoard.org
> > boards and thus I have been working to replace bone-pinmux-helper with a
> > new driver that could be acceptable upstream. My understanding is that
> > debugfs, unlike sysfs, could be the appropriate mechanism to expose such
> > functionality.
> 
> No objections here.
> 
> > I used the compatible string "pinctrl,state-helper" but would appreciate
> > advice on how to best name this. Should I create a new vendor prefix?
> 
> Here is the first concern. Why does this require to be a driver with a
> compatible string?

I have not been able to figure out how to have different active pinctrl
states for each header pins (for example P2 header pin 3) unless they
are represented as DT nodes with their own compatible for this helper
driver such as:

&ocp {
	P2_03_pinmux {
		compatible = "pinctrl,state-helper";
		pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pwm";
		pinctrl-0 = <&P2_03_default_pin>;
		pinctrl-1 = <&P2_03_gpio_pin>;
		pinctrl-2 = <&P2_03_gpio_pu_pin>;
		pinctrl-3 = <&P2_03_gpio_pd_pin>;
		pinctrl-4 = <&P2_03_gpio_input_pin>;
		pinctrl-5 = <&P2_03_pwm_pin>;
	};
}

I can assign pinctrl states in the pin controller DT node which has
compatible pinctrl-single (line 301 arch/arm/boot/dts/am33xx-l4.dtsi):

&am33xx_pinmux {

        pinctrl-names = "default", "gpio", "pwm";
        pinctrl-0 =   < &P2_03_default_pin &P1_34_default_pin &P2_19_default_pin &P2_24_default_pin
                        &P2_33_default_pin &P2_22_default_pin &P2_18_default_pin &P2_10_default_pin
                        &P2_06_default_pin &P2_04_default_pin &P2_02_default_pin &P2_08_default_pin
                        &P2_17_default_pin >;
        pinctrl-1 =   < &P2_03_gpio_pin &P1_34_gpio_pin &P2_19_gpio_pin &P2_24_gpio_pin
                        &P2_33_gpio_pin &P2_22_gpio_pin &P2_18_gpio_pin &P2_10_gpio_pin
                        &P2_06_gpio_pin &P2_04_gpio_pin &P2_02_gpio_pin &P2_08_gpio_pin
                        &P2_17_gpio_pin >;
        pinctrl-2 =   < &P2_03_pwm &P1_34_pwm &P2_19_pwm &P2_24_pwm
                        &P2_33_pwm &P2_22_pwm &P2_18_pwm &P2_10_pwm
                        &P2_06_pwm &P2_04_pwm &P2_02_pwm &P2_08_pwm
                        &P2_17_pwm >;

}

However, there is no way to later select "gpio" for P2.03 and select
"pwm" for P1.34 at the same time.  Thus, I can not figure out a way to
select independent states per pin unless I make a node for each pin that
binds to a helper driver.

It feels like there may be a simpler soluation but I can't see to figure
it out.  Suggestions welcome!

> 
> > The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
> > The driver would create the corresponding pinctrl state file in debugfs
> > for the pin.  Here is an example of how the state can be read and
> > written from userspace:
> >
> > root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> > default
> > root@beaglebone:~# echo pwm > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> > root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> > pwm
> >
> > I would very much appreciate feedback on both this general concept, and
> > also specific areas in which the code should be changed to be acceptable
> > upstream.
> 
> Two more concerns:
>  - why is it OF only?

I am open to figuring out a more general solution but I am really only
familiar with Device Tree.  Is there a way to represent the possible
pinctrl states in ACPI?

>  - why has it been separated from pin control per device debug folder?

From the v1 thread, I see what you mean that there could be a combined
state file for each pinctrl device where one would echo '<pin>
<state-name>' such as 'P2_03 pwm'.  I will attempt to implement that.

> 
> 
> > [0] http://beagleboard.org/latest-images
> > [1] https://github.com/beagleboard/linux/blob/5.4/drivers/misc/cape/beaglebone/bone-pinmux-helper.c
> > [2] https://github.com/RobertCNelson/linux-dev/blob/master/patches/drivers/ti/gpio/0001-BeagleBone-pinmux-helper.patch
> > [3] https://github.com/beagleboard/BeagleBoard-DeviceTrees/blob/v5.4.x-ti-overlays/src/arm/am335x-bone-common-univ.dtsi#L2084
> > [4] https://github.com/beagleboard/beaglebone-black/wiki/System-Reference-Manual#section-7-1
> > [5] https://github.com/beagleboard/bb.org-overlays/blob/master/tools/beaglebone-universal-io/config-pin
> 
> --
> With Best Regards,
> Andy Shevchenko

Thanks for reviewing,
Drew

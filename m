Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC2F2DA2DE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 22:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgLNVwj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 16:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441080AbgLNVpD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 16:45:03 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276A5C0613D6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 13:44:23 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id t6so9639586plq.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PMXJLiKcXqOuq1fSx1dZKXuKwhly4eCplfXBPHcW2uo=;
        b=fMw42NK0Vv4AkVqZYjC8aVy3I+z6+B6jWHLNFGHqJZpsRmHB5PcS0GoQFrUqCMHBMf
         Yi8ZPM8RcbxHLc6X6t2HjSU/4abIVomNVcbrFjNiw8hhW/TUfCSei1PGQCbrUnP6QHCq
         ghbQhRHF7uc7YjTEYc23FLZZOvhUUkxb9sMjwQ0rmSc2gdGYffjtvDHoU1AUBQH7193+
         vVe/lsNoggmXDtQaN219ZUVQD2Z8YE349gyIEoiIHaxg31R+W8mFaPhgSH5X8k9XKR1N
         EH7n5mIKqQOBVqGqxx9entop+1WGk6/UvmstmAV82uYtlI0FgTDCV4nJBzAqGtUN64N5
         bg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PMXJLiKcXqOuq1fSx1dZKXuKwhly4eCplfXBPHcW2uo=;
        b=oHJTtlZHI69fVb5Y+e9+NGi0K586BMlXQPLdmF0Rrr7mWFNoYkpRnPMTUxAGYe1cZQ
         qPUOy10dxEVd95rqM9omg+i2qNnT1lUSJru9A9RyxVhvFfL1RevTqkYyFq6P7E3LZDh3
         sJrlJBj1fbKS6o05vfd47H7AfYJbYaSX5zzdeBeYqx63o8B0O3BoAZ4I1kxcHAThx9aw
         KIyOnwDeASiyzgMU9CoKPL4PI6m32SZ19Dx6tW9jwBdSV/3HaszY0wZYMY/U2DYeiv3H
         YVY52LcD6RRyvCuui8TDYDeFu6wtYdU5xaimx1oJSQQ7lU3dfIbhRh3YzXKqXeUCH46X
         NcYg==
X-Gm-Message-State: AOAM531SPtXeOLpILfkW/4Ep265rZvthi/Mb56AhNxKWfXgbhyKBO5O4
        Np7Qmkf7ZuMVRrDAKrkaMvfXOg==
X-Google-Smtp-Source: ABdhPJx6WDKMKNTg07/DKZXqVykrSNXKqqxEXbSIu+73dzQaCppft6CsvvmQiFErJW/bXxEiKXj/Zw==
X-Received: by 2002:a17:90b:217:: with SMTP id fy23mr27562416pjb.199.1607982262636;
        Mon, 14 Dec 2020 13:44:22 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:a12:934a:f94c:522c])
        by smtp.gmail.com with ESMTPSA id kb12sm18343417pjb.2.2020.12.14.13.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 13:44:21 -0800 (PST)
Date:   Mon, 14 Dec 2020 13:44:19 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20201214214419.GA1196223@x1>
References: <20201211042625.129255-1-drew@beagleboard.org>
 <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1>
 <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 07:55:12PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 12, 2020 at 1:43 AM Drew Fustini <drew@beagleboard.org> wrote:
> > On Fri, Dec 11, 2020 at 11:15:21PM +0200, Andy Shevchenko wrote:
> > > On Fri, Dec 11, 2020 at 1:54 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > >
> > > > BeagleBoard.org [0] currently uses an out-of-tree driver called
> > > > bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.
> > >
> > > And it looks like it's still using APIs from 2013.
> > > Needs quite a clean up.
> >
> > Thanks for taking a look at my RFC and responding. It is good to know
> > that it is using out-dated APIs. Would you be able to elaborate?
> >
> > It interacts with pinctrl core through devm_pinctrl_get(),
> > pinctrl_lookup_state() and pinctrl_select_state(). Is there newer way of
> > doing that?
> 
> No. I'm talking mostly about FS callbacks where some relatively old
> new APIs can be used, such as kasprintf().

Thanks for following up. I'll will take a look at that and update the code.

> > > > I used the compatible string "pinctrl,state-helper" but would appreciate
> > > > advice on how to best name this. Should I create a new vendor prefix?
> > >
> > > Since it's BB specific, it should have file name and compatible string
> > > accordingly.
> >
> > At first, I was thinking about this as a beaglebone specific solution
> > and had bone in the driver name and compatible string. But then I
> > realized it could used in other situations where it is beneficial to
> > to read and select a pinctrl state through debugfs.
> >
> > I'm happy to rebrand the naming as beaglebone if that would be more
> > acceptable.
> 
> See below.
> 
> > > But I'm wondering, why it requires this kind of thing and can't be
> > > simply always part of the kernel based on configuration option?
> >
> > Do you mean not having a new CONFIG option for this driver and just have
> > it be enabled by CONFIG_PINCTRL?
> 
> No, configuration option stays, but no compatible strings no nothing
> like that. Just probed always when loaded.

I first started down the route of implementing this inside of
pinctrl-single.  I found it didn't work because devm_pinctrl_get() would
fail.  I think was because it was happening too early for pinctrl to be
ready.

I do think it seems awkward to have to add this to dts and have the
driver get probed for each entry:

        P1_04_pinmux {
                compatible = "pinctrl,state-helper";
                status = "okay";
                pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pruout", "pruin";
                pinctrl-0 = <&P1_04_default_pin>;
                pinctrl-1 = <&P1_04_gpio_pin>;
                pinctrl-2 = <&P1_04_gpio_pu_pin>;
                pinctrl-3 = <&P1_04_gpio_pd_pin>;
                pinctrl-4 = <&P1_04_gpio_input_pin>;
                pinctrl-5 = <&P1_04_pruout_pin>;
                pinctrl-6 = <&P1_04_pruin_pin>;
        };

But I am having a hard time figuring out another way of doing it.

Any ideas as to what would trigger the probe() if there was not a match
on a compatible like "pinctrl,state-helper"?

> Actually not even sure we want to have it as a module.

And have just be a part of one of the existing pinctrl files like core.c?

> 
> ...
> 
> > > > The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
> > > > The driver would create the corresponding pinctrl state file in debugfs
> > > > for the pin.  Here is an example of how the state can be read and
> > > > written from userspace:
> > > >
> > > > root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > > > default
> > > > root@beaglebone:~# echo pwm > /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > > > root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > > > pwm
> > >
> > > Shouldn't it be rather a part of a certain pin control folder:
> > > debug/pinctrl/.../mux/...
> > > ?
> >
> > Yes, I think that would make sense, but I was struggling to figure out
> > how to do that. pinctrl_init_debugfs() in pinctrl/core.c does create the
> > "pinctrl" directory, but I could not figure out how to use this as the
> > parent dir when calling debugfs_create_dir() in this driver's probe().
> >
> > I thought there might be a way in debugfs API to use existing directory
> > path as a parent but I couldn't figure anything like that. I would
> > appreciate any advice.
> 
> If the option is boolean from the beginning then you just call it from
> the corresponding pin control instantiation chain.


Sorry, I am not sure I understand what you mean here.  What does
"option" mean in this context?  I don't think there is any value that is
boolean invovled.  The pinctrl states are strings.

With regards to parent directory, I did discover there is
debugfs_lookup(), so I can get the dentry for "pinctrl" and create new
subdirectory inside of it.  This is the structure now:

/sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_35_pinmux/state
/sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_34_pinmux/state
/sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_33_pinmux/state
/sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_32_pinmux/state
etc..

> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks for reviewing,
Drew

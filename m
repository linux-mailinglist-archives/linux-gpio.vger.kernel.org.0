Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13A52DB694
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 23:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgLOWib (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 17:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgLOWia (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 17:38:30 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C138C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 14:37:50 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id n3so582182pjm.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 14:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0adbEDIlGgsdZMwpeHsz68fadhy77HxizGrK/I/zuAw=;
        b=q29BeMk/EX9TIUtaX+v7VZEkfnWRuK6tLcFjPrUlsn4jSjyLKB2EhYxqP8D8b8+C0P
         HU87AVsEQS9XBhz0h0FGL7Kom4UCSsadGv75EWksBjE4l0TYdhHB37cV/kT2UqwnrSF3
         nRPYNZHjFZwDKUC2ADQRY6rBKcJI8QT0Bvv94dqaI7BxPBJBIeDGmTS33hWUh2ju/tF3
         emUqHpd13OToX3LyN44KZ0XHRbt8SJwNal5enRDCY8mt+Wqn/b+ahiUJBf37a1ExTjSW
         5Tz/wNxgkmxyHf3+GPdv8hnX8yuwJ6mhseFYhp2p2tpQs12UX6rxLFJtALQvKGogwYzB
         KWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0adbEDIlGgsdZMwpeHsz68fadhy77HxizGrK/I/zuAw=;
        b=tXCFJ/bLJSoUFhQOyUSRDiMvQjQtPlceghEM682gsHt4gzqDKSZOJRZO46Q0ql+9Gx
         qOYsEcoXtYutkm5TfbbDzaxSDPGxx2CfpQgB4EI/mfBd1/CcIG3hRpKHRMMOFptO8n1a
         f5MlgljZFqqFukazLWzDMscS7PjDqiZ12f3T9WfcScgxOXDRoVeIF+CKe1IL823OOrgg
         eD6ZQZ4RcY/1enmXwYZ9lwkd2aeW+rHp/3bVLpbLbcU3q0yOJ5xGVuKWE/bABxah9swU
         dMbAXEhcUfhR9bbI2Hmv8w4SkcKLUznWe2eBr4PepXmRhFocV0+B+abbFfRMuM6VTFRE
         TPug==
X-Gm-Message-State: AOAM531l/gfEO8+fO+V1qiuCcdCxATx+U6BOPgoxM1NjxUNcHUbEiNnN
        gKfGOPDNLy/ZqzuUDycY18SZOQ==
X-Google-Smtp-Source: ABdhPJzf1RUU5/LobL4l5O9iJtGdS8KcqS4MZKuYB06hGDDZLYO1Had9z9as4MCu4QwuBY8yUe5ynQ==
X-Received: by 2002:a17:90a:5894:: with SMTP id j20mr682847pji.107.1608071869691;
        Tue, 15 Dec 2020 14:37:49 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:d679:3889:5fae:ca68])
        by smtp.gmail.com with ESMTPSA id m77sm136746pfd.105.2020.12.15.14.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 14:37:48 -0800 (PST)
Date:   Tue, 15 Dec 2020 14:37:47 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20201215223747.GA2086329@x1>
References: <20201211042625.129255-1-drew@beagleboard.org>
 <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1>
 <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
 <20201214214419.GA1196223@x1>
 <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 15, 2020 at 09:36:33PM +0200, Andy Shevchenko wrote:
> On Mon, Dec 14, 2020 at 11:44 PM Drew Fustini <drew@beagleboard.org> wrote:
> > On Mon, Dec 14, 2020 at 07:55:12PM +0200, Andy Shevchenko wrote:
> > > On Sat, Dec 12, 2020 at 1:43 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > > On Fri, Dec 11, 2020 at 11:15:21PM +0200, Andy Shevchenko wrote:
> > > > > On Fri, Dec 11, 2020 at 1:54 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> ...
> 
> > > > > But I'm wondering, why it requires this kind of thing and can't be
> > > > > simply always part of the kernel based on configuration option?
> > > >
> > > > Do you mean not having a new CONFIG option for this driver and just have
> > > > it be enabled by CONFIG_PINCTRL?
> > >
> > > No, configuration option stays, but no compatible strings no nothing
> > > like that. Just probed always when loaded.
> >
> > I first started down the route of implementing this inside of
> > pinctrl-single.  I found it didn't work because devm_pinctrl_get() would
> > fail.  I think was because it was happening too early for pinctrl to be
> > ready.
> >
> > I do think it seems awkward to have to add this to dts and have the
> > driver get probed for each entry:
> >
> >         P1_04_pinmux {
> >                 compatible = "pinctrl,state-helper";
> >                 status = "okay";
> >                 pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pruout", "pruin";
> >                 pinctrl-0 = <&P1_04_default_pin>;
> >                 pinctrl-1 = <&P1_04_gpio_pin>;
> >                 pinctrl-2 = <&P1_04_gpio_pu_pin>;
> >                 pinctrl-3 = <&P1_04_gpio_pd_pin>;
> >                 pinctrl-4 = <&P1_04_gpio_input_pin>;
> >                 pinctrl-5 = <&P1_04_pruout_pin>;
> >                 pinctrl-6 = <&P1_04_pruin_pin>;
> >         };
> >
> > But I am having a hard time figuring out another way of doing it.
> 
> I'm not a DT expert and I have no clue why you need all this. To me it
> looks over engineered to engage DT for debugging things. OTOH, you may
> add a property to allow debug mux (but it prevent ACPI enabled
> platforms to utilize this).

There needs to be some mechanism through which to list the possible
valid pinctrl states for each pin on the expansion connectors (P1/P2 for
PocketBeagle and P8/P9 for BeagleBones).  For these ARM boards, device
tree pinctrl bindings are the only way I can see to do this.  I am not
familiar enough with ACPI to understand if this needs to be extended for
boards without device tree.

> 
> ...
> 
> > Any ideas as to what would trigger the probe() if there was not a match
> > on a compatible like "pinctrl,state-helper"?
> >
> > > Actually not even sure we want to have it as a module.
> >
> > And have just be a part of one of the existing pinctrl files like core.c?
> 
> Separate file, but in conjunction with core.c and pinmux and so on.
> 
> ...
> 
> > > > > Shouldn't it be rather a part of a certain pin control folder:
> > > > > debug/pinctrl/.../mux/...
> > > > > ?
> > > >
> > > > Yes, I think that would make sense, but I was struggling to figure out
> > > > how to do that. pinctrl_init_debugfs() in pinctrl/core.c does create the
> > > > "pinctrl" directory, but I could not figure out how to use this as the
> > > > parent dir when calling debugfs_create_dir() in this driver's probe().
> > > >
> > > > I thought there might be a way in debugfs API to use existing directory
> > > > path as a parent but I couldn't figure anything like that. I would
> > > > appreciate any advice.
> > >
> > > If the option is boolean from the beginning then you just call it from
> > > the corresponding pin control instantiation chain.
> >
> > Sorry, I am not sure I understand what you mean here.  What does
> > "option" mean in this context?  I don't think there is any value that is
> > boolean invovled.  The pinctrl states are strings.
> 
> config PINMUX_DEBUG
>  bool "..."
>  depends on PINMUX

Okay, thanks for califying.

There is already DEBUG_PINCTRL which just adds -DDEBUG compile option.
The existing debugfs logic in pinctrl core and drivers is gated by
CONFIG_DEBUG_FS.

It seems for this new capability to expose pinctrl state in debugfs that
I should use something like:

#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_PINMUX_DEBUG)

Does that seem reasonable?

> 
> 
> 
> >
> > With regards to parent directory, I did discover there is
> > debugfs_lookup(), so I can get the dentry for "pinctrl" and create new
> > subdirectory inside of it.  This is the structure now:
> >
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_35_pinmux/state
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_34_pinmux/state
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_33_pinmux/state
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_32_pinmux/state
> > etc..
> 
> 
> --
> With Best Regards,
> Andy Shevchenko

thanks,
drew

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B942D82DA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 00:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437138AbgLKXnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 18:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437310AbgLKXns (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 18:43:48 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D292CC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:43:07 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id c79so7975076pfc.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CWe3lT2KTKFUzGLUYEmf1fRhGjuRP6+tjVN05hf7ecQ=;
        b=GzKSdSfOqSug9KN8cGDhih/kriids7aLbt+tfe7zPOpwYUpHjFK1N7sMrAi8k53LSa
         N42djdMFEoUDVo9RZtrC530tioVo4q3YkEz1mROTNWRunLxOxKWXgRZ9BQAsj96Nhb9I
         339RUQtkFGXz7rlBwlPLhaHvT7Y1TON1NG+3ZpSCmpGFasOdL6iP07ob1cFuklk1dXst
         N3My3GM23rb6pWUmxXMl1BJyHt1JtLNWNM6Po612llvJB11QlaF2YFt7N0m250K0fjJp
         qOebzucXKL2SN2vAAgeAanTakY/VnMw6Sf5Wq3i1LWDoSwAocu4FiEz21UC5ucCYh6NT
         JzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CWe3lT2KTKFUzGLUYEmf1fRhGjuRP6+tjVN05hf7ecQ=;
        b=BEPhtUGQy3338SWH/0i6yaimBKkEM4Y+2fFxBmaUiVmkVmQwYe2newYnohd9ChXVtx
         AWwRjHnmGqBc6GZafhv5mhYT6Yg52oOZPoCfi2NVSKMArjnLzcOOSHmqw+cxPfdY5n8J
         sPEagOXqayT/I+ULe9riyqNeL/ewUEQzOpJ+tEJgots3QjRiIK3yQCF7WY+dFZbIR4K2
         DbUsrMaSLsROS234Dg/IcTT6Ut1T69GTb2BbRZCcSJkIQtaghqdWQrGPgNJ+/ZYzLKSr
         Oj75/PwphgyEtdqJC6skXpYAE0PbPDIB7MMUMaYzWGjY8wPZmar7TkKAuvR31VIypwFF
         8I/Q==
X-Gm-Message-State: AOAM530RQI+80Wj/8Ngjb0HEzyGN5D15VWAxZy0DYweowDkAfKa/l3/a
        WDlH6ciTk10+Xw/5HwSDhMKNGE65LIllnZdi
X-Google-Smtp-Source: ABdhPJzxn/MxBh4KLs+xJ8ujkjk/5JcaZEuzTNXOvI5kpA3VB1+upg/rRA6BEbvCvlgGI8hejf1KyQ==
X-Received: by 2002:a63:e24f:: with SMTP id y15mr4715442pgj.366.1607730187345;
        Fri, 11 Dec 2020 15:43:07 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:e96a:e062:3e2a:2534])
        by smtp.gmail.com with ESMTPSA id i7sm728629pgr.88.2020.12.11.15.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 15:43:06 -0800 (PST)
Date:   Fri, 11 Dec 2020 15:43:04 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <panto@antoniou-consulting.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20201211234304.GA189853@x1>
References: <20201211042625.129255-1-drew@beagleboard.org>
 <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 11:15:21PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 11, 2020 at 1:54 PM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > BeagleBoard.org [0] currently uses an out-of-tree driver called
> > bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.
> 
> And it looks like it's still using APIs from 2013.
> Needs quite a clean up.

Thanks for taking a look at my RFC and responding. It is good to know
that it is using out-dated APIs. Would you be able to elaborate?

It interacts with pinctrl core through devm_pinctrl_get(),
pinctrl_lookup_state() and pinctrl_select_state(). Is there newer way of
doing that?

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
> Yeah, for debugfs we don't require too much and esp. there is no
> requirement to keep backward compatibility thru interface.
> I.o.w. it's *not* an ABI.
> 
> ...
> 
> > I used the compatible string "pinctrl,state-helper" but would appreciate
> > advice on how to best name this. Should I create a new vendor prefix?
> 
> Since it's BB specific, it should have file name and compatible string
> accordingly.

At first, I was thinking about this as a beaglebone specific solution
and had bone in the driver name and compatible string. But then I 
realized it could used in other situations where it is beneficial to
to read and select a pinctrl state through debugfs.

I'm happy to rebrand the naming as beaglebone if that would be more
acceptable.

> But I'm wondering, why it requires this kind of thing and can't be
> simply always part of the kernel based on configuration option?

Do you mean not having a new CONFIG option for this driver and just have
it be enabled by CONFIG_PINCTRL?

> > The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
> > The driver would create the corresponding pinctrl state file in debugfs
> > for the pin.  Here is an example of how the state can be read and
> > written from userspace:
> >
> > root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > default
> > root@beaglebone:~# echo pwm > /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > pwm
> 
> Shouldn't it be rather a part of a certain pin control folder:
> debug/pinctrl/.../mux/...
> ?

Yes, I think that would make sense, but I was struggling to figure out
how to do that. pinctrl_init_debugfs() in pinctrl/core.c does create the
"pinctrl" directory, but I could not figure out how to use this as the
parent dir when calling debugfs_create_dir() in this driver's probe().

I thought there might be a way in debugfs API to use existing directory
path as a parent but I couldn't figure anything like that. I would
appreciate any advice.

> 
> > I would very much appreciate feedback on both this general concept, and
> > also specific areas in which the code should be changed to be acceptable
> > upstream.
> 
> I will give time for more discussion about concepts and so, because
> code (as stated above) is quite old and requires a lot of cleaning up.

Thanks for taking the time to comment. I'll look at other drivers to see
the ways in which this drivers is out-dated.

-Drew

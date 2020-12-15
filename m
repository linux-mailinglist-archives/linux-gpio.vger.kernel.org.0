Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB50D2DB69A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 23:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgLOWmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 17:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbgLOWmz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 17:42:55 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390C0C061793
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 14:42:15 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id f14so391961pju.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 14:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=amGTi8TGK9HfRVTaIVmXTcMq7K40buhHDFJsl3irODg=;
        b=1Ijzlu0gtMYIteWfJlrGTqGxpFM8GeTtaw9Ixcz/738lfyFBAxmwgBbszSo07sGLLl
         sta7WMs8zfp0VymA3y5ZnRkIIG70BGUiQtK67xUJ0SVmTLbbCK9jYaENPQ9Ff9Rhomv6
         OV/d05mt1l9HBJDEqxs3RFNYla0TdQHbBIhkiEY6QqBsKoHoxSGxhRGf7UX2YX0c/Rbm
         nI/pGFOpPdiM3vuqvSc4wmOvgN2YHY1D68+OXs3CZW8+MXvYKi+qpPnBRH/ky0KXVjer
         uilLQsMnvgIfDxlAuc4gjIA1XM3pC3AdMKiBihppRs6yWhvsq1mUG5dbVPGZIgLZ01NJ
         ySYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=amGTi8TGK9HfRVTaIVmXTcMq7K40buhHDFJsl3irODg=;
        b=cKHNihqI6S0xxryMUtXh8DYe2k97hXEPrFU9PApGLQVQZ4KcS3VdZu4egzqkAcNbmy
         ehpPB3TSE5Bfl8/QGGWKi0zdZOfYOwflKae6DylkJ0eD7pqpDMovYttuxdOUoTqzpS6U
         3x1nz2xBp5CX/2RsjrVh9hbxTVI1haQ+/StmBP8FszkIV2xEkmMOZIaAJNJr40FyIK7l
         uk8M2xq/bnQn2Iu35F//XVXusIwJfcwwbt+/3TK9KOAy4d18lpCHKDoV2NDqia4AE7mY
         Fz8NmgVCLWHG2crxQrxBW4ou7WgM6MgAYxx2zp+Eb4IvP88MxJp8eKViMs5zzjQzLF+r
         SMGQ==
X-Gm-Message-State: AOAM532uhzmxc2CE+j3TaDHZPASidPFvJHurqfYMIvpsU64dUY3YyKWc
        /WSFdN5m8B4MYwTUG+MV8sD3gQ==
X-Google-Smtp-Source: ABdhPJwtM/eom2yB/vW9daC3eeFKepVZQGcXfavkriL1kADjXWBV83LABOQ8uduZVB3h30Krkq+F/Q==
X-Received: by 2002:a17:90a:17e2:: with SMTP id q89mr662655pja.209.1608072134703;
        Tue, 15 Dec 2020 14:42:14 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:d679:3889:5fae:ca68])
        by smtp.gmail.com with ESMTPSA id y5sm161913pfp.45.2020.12.15.14.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 14:42:14 -0800 (PST)
Date:   Tue, 15 Dec 2020 14:42:12 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20201215224212.GB2086329@x1>
References: <20201211042625.129255-1-drew@beagleboard.org>
 <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1>
 <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
 <20201214214419.GA1196223@x1>
 <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
 <CAHp75VdGEe9F69=uzaDiCf9C8byh6ThuCJLMch1dBXEH4MA2Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdGEe9F69=uzaDiCf9C8byh6ThuCJLMch1dBXEH4MA2Sg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 15, 2020 at 09:39:18PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 15, 2020 at 9:36 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Dec 14, 2020 at 11:44 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > On Mon, Dec 14, 2020 at 07:55:12PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > With regards to parent directory, I did discover there is
> > > debugfs_lookup(), so I can get the dentry for "pinctrl" and create new
> > > subdirectory inside of it.  This is the structure now:
> > >
> > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_35_pinmux/state
> > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_34_pinmux/state
> > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_33_pinmux/state
> > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_32_pinmux/state
> > > etc..
> 
> Missed part to comment.
> 
> I was talking about
> 
> /sys/kernel/debug/pinctrl/<$PINCTRL>/mux/<$PIN> (maybe folder, maybe node)

Thanks for the example.

What would the value be "<$PINCTRL>"?  The name of the driver?

The "ocp:Px_yy_pinmux" directory name comes from dev_name(dev). Is that
the name you were referencing in "<$PIN>"?


thanks,
drew

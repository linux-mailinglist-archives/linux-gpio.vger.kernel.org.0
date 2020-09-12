Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC9B267A9D
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 15:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgILNbZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 09:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgILNbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 09:31:22 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF935C061573;
        Sat, 12 Sep 2020 06:31:19 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u8so8711701lff.1;
        Sat, 12 Sep 2020 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8nLk3sekrjFnDz3iYznJbS7ByYpbHuy0+9+SFQMlFto=;
        b=mxsW4AoOMo6Jx7q+zDI0Zalpzf4bsb4hnqIz2OqN/MnXa34Gx7Mtfj0tKAANekxrkA
         yUdupvGSO358WWcvaITyE6Ew8QhZvrtHDIyx1Y1dcotrOknCCyRZvUYSbSS+Un9sa9Gj
         i8qXTpxSIr9oOXYmVyA3Pho+SBgL/y/pdXcD519Miu0lexeo3QT4uY4BFSKm69yMLg2T
         DmOpH3rJv09XQD2rLyTEbhIR0KkHTP6rncVOYicjf37IxNK9GAKIipsh1RuEfSZa+z7A
         yPlto9m3zcwbitHo9x0yMXy3RISFBGX8HwXrj8VAYdw5sVYxhSDBBz3vNOONSGcboB/r
         YxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8nLk3sekrjFnDz3iYznJbS7ByYpbHuy0+9+SFQMlFto=;
        b=re80auLotB6eVW8/InM+hPbbjhY1lEpkTDFsTHj8PFiHk4NnPLvJM6pMnZDqfco6AY
         EUNSafGH4T1I8GIRXJfu7huCJ8a8d+ve25MjYt+q6SiKTk0hA+xZ6phB+0i98eP+1H3K
         1NUc0GvtBxlA9OL2BUO8DOUfZpKrFb+ivRWhyIv9CkfG3uKLa/DDjVirCDZQVHnCHu+1
         0WeyloRf1W4HWEktVWEHe5fp7uo+aJx/ULX30QhpaTj3owR13SL/6TgfL24PyhN2N1RB
         RMB7APlTfKN7mUbdYP1KS8KV5svxvKFv1moEnui5Sl4t6Y7WJujLN/mwUjioSiazYgmK
         0JTw==
X-Gm-Message-State: AOAM5316kyy8hPHTY29pduPYle/hMXEGvBSA1HFHJ6GFiLIfupxn9MLz
        YNHl3LmFYbbU4XqW4Chv1kY=
X-Google-Smtp-Source: ABdhPJyboeaBbTV2x7HtPLl76uVzaYiBa0W3ArFu+F9dT5KtbdEq1P/OFPWnJcsm0tZV3vJkrP8PeA==
X-Received: by 2002:a19:9cf:: with SMTP id 198mr2329692lfj.214.1599917478217;
        Sat, 12 Sep 2020 06:31:18 -0700 (PDT)
Received: from mobilestation ([95.79.127.85])
        by smtp.gmail.com with ESMTPSA id n62sm1330226lfa.82.2020.09.12.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 06:31:17 -0700 (PDT)
Date:   Sat, 12 Sep 2020 16:31:14 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Dingtianhong <dingtianhong@huawei.com>
Cc:     "hoan@os.amperecomputing.com" <hoan@os.amperecomputing.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel.openeuler" <kernel.openeuler@huawei.com>
Subject: Re: [PATCH] gpio: dwapb: add support for new hisilicon ascend soc
Message-ID: <20200912133114.uqhqgd7etfdt77zt@mobilestation>
References: <1598070473-46624-1-git-send-email-dingtianhong@huawei.com>
 <20200825095726.yvg34q74xy57qhrx@mobilestation>
 <856a6200-2bbb-9ffa-9233-53168bd7c49b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <856a6200-2bbb-9ffa-9233-53168bd7c49b@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 06, 2020 at 06:18:07AM +0000, Dingtianhong wrote:

[...]

> > On Sat, Aug 22, 2020 at 12:27:53PM +0800, Ding Tianhong wrote:
> >> The hisilicon ascend soc's gpio is based on the synopsys DW gpio,
> >> and expand the register to support for INTCOMB_MASK, the new
> >> register is used to enable/disable the interrupt combine features.
> > 
> > I am wondering what does the "Interrupt Combine" feature do? Is it the same as
> > the GPIO_INTR_IO pre-synthesize parameter of the DW_apb_gpio IP-core? Is it
> > possible to tune the DW APB GPIO controller at runtime sending up to the IRQ
> > controller either combined or individual interrupts?
> > 
> 
> looks like the same.
> 
> > If the later is true, then probably having the "Interrupt Combine" feature
> > enabled must depend on whether an individual or combined interrupts are supplied
> > in dts, etc...
> > 
> 
> needed.
> 
> > Could you explain the way the feature works and the corresponding layout
> > register in more details?
> > 
> 
> Ok
> The hisilicon chip use the register called GPIO_INTCOMB_MASK (offset is 0xffc) to enable the combien interrupt.
> it is very simple, if GPIO_INTCOMB_MASK.bit0 is 0, then all combine interrupte could not be used (default
> setting), otherwise if 1, then the 32 ports could use the same irq line, that is all.

The main question is whether your hardware is capable of working with both
combined and individual interrupts. Is your version of the DW APB GPIO
controller able to generate both types of them? How is it connected to the
parental interrupt controller?

So If the GPIO and IRQ controllers are attached to each other with a single lane
gpio_intr_flag, then indeed it's pure combined IRQ design and we'll have to make
sure that GPIO_INTCOMB_MASK.bit0 is set to one before using the DW GPIO block.
If they are also connected with each other by 32 individual GPIO-IRQ
gpio_intr{_n}N lanes, then setting or clearing of the GPIO_INTCOMB_MASK.bit0
flag will for example depend on the number IRQ lanes specified in a dts file. In
the later case the patch needs to be altered, but it would provide a better
support of the hisilicon ascend soc's GPIO capabilities.

-Sergey

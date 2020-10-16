Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4545F290E38
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Oct 2020 01:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411468AbgJPXie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 19:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405965AbgJPXia (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 19:38:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3E2C061755;
        Fri, 16 Oct 2020 16:39:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ds1so2177625pjb.5;
        Fri, 16 Oct 2020 16:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gj5mB7zre0Qc9f9Jrd5bfLteHJQmqeFuJ23/FF59rNQ=;
        b=JmH3Y7P5qKixFSi9ffYm03AL0mHYma37kKkoqc2GRKISoA47GVq0avN55zZXL0g4bY
         YflOWVjRy8k6V3zDItvo2oQSF856001ywzRjk35G5ydkh7hDRfzuKC0pgG/2zRQW6nxi
         VPY97bxfrlRdxKsDYko42rk4fGJrcXPefity0TKIVaWnV9IOPxAN13s5bQagnoNmsogn
         Rva+Ykx4NtiOHKZ0KY2//l1PjTQ6xXP/fufaitB4qvRVjCwyBaMwjC/r2mnh12Moudtm
         jNgxzRGETTs42L6enYFCIveE/U7QHQJShdpT8VmECHArYFjUPS7UTPi+SzZTPAbxK8Jr
         NcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gj5mB7zre0Qc9f9Jrd5bfLteHJQmqeFuJ23/FF59rNQ=;
        b=hrGlj31h5xiNP3A2dec3rac1xJgKWtdVud3LU0kM1n5TNDqX8rpF/HBc62CPpJf4NG
         qTMRtB6Ks3nCFh5zdr5XIhQCSz1xNHEJ694g9uchhWOHcf+RcrQumOx5t/IUMIFgXgr/
         EKDaoOIi4trcqYnQH0NKjPFPur+/6TBtVwBuQTvVEBbyv7qK0qfI7+zEZaE6J1zP44sR
         VE9wxkB46Y3LBdS1wcSWWNOppbq7ygTq3Po5pcuKr2VkkcTWEBA2IJyiJ8GGVCS/DrEH
         SJRgKAEDIhXgV14K/kKct6HUNkmoN6yqk0UiZ/sQPo3/rSYZBoq954hz8RSGk+QPh9s+
         1Tyw==
X-Gm-Message-State: AOAM531GHX5JkUvsbGUINJ8LORg3/uN3re6jRaRMYnao3g1F8/h04BIK
        QdpbsztNuTspAkxv6/FisDY=
X-Google-Smtp-Source: ABdhPJwzV3Xa0csfjBReEuaLorhV3G4Dg1bAoVup75nn9kjXrhL27eHATG6iPkWFVgcxPgxKPSG/tQ==
X-Received: by 2002:a17:90a:fa8c:: with SMTP id cu12mr6401417pjb.140.1602891558474;
        Fri, 16 Oct 2020 16:39:18 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id u65sm3839813pfc.11.2020.10.16.16.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 16:39:17 -0700 (PDT)
Date:   Sat, 17 Oct 2020 07:39:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: cdev: document that line eflags are shared
Message-ID: <20201016233913.GB5143@sol>
References: <20201014062921.79112-1-warthog618@gmail.com>
 <CAHp75Ve7TspiCredTu48AwstS4YUnfKTHzvuxvhq_-c9697igg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve7TspiCredTu48AwstS4YUnfKTHzvuxvhq_-c9697igg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 05:24:14PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 14, 2020 at 12:21 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > The line.eflags field is shared so document this fact and highlight it
> > throughout using READ_ONCE() and WRITE_ONCE() accessors.
> >
> > Also use a local copy of the eflags in edge_irq_thread() to ensure
> > consistent control flow even if eflags changes.  This is only a defensive
> > measure as edge_irq_thread() is currently disabled when the eflags are
> > changed.
> 
> > -       if (line->eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
> > -                            GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
> > +       eflags = READ_ONCE(line->eflags);
> > +       if (eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
> > +                      GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
> 
> Hmm... side note: perhaps at some point
> 
> #define GPIO_V2_LINE_FLAG_EDGE_BOTH  \
>         (GPIO_V2_LINE_FLAG_EDGE_RISING | GPIO_V2_LINE_FLAG_EDGE_FALLING)
> 
>        if (eflags == GPIO_V2_LINE_FLAG_EDGE_BOTH) {
> 
> ?

Yeah, that would make sense.  I think I used GPIO_V2_LINE_EDGE_FLAGS,
which is defined the same as your GPIO_V2_LINE_FLAG_EDGE_BOTH, here at
some point, but that just looked wrong.

The GPIO_V2_LINE_FLAG_EDGE_BOTH does read better.  I'll add it to the
todo list.

Cheers,
Kent.

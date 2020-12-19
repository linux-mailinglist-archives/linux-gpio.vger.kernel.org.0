Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777512DF183
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Dec 2020 21:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727475AbgLSUTd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Dec 2020 15:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgLSUTd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Dec 2020 15:19:33 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E9DC061282
        for <linux-gpio@vger.kernel.org>; Sat, 19 Dec 2020 12:18:51 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id i24so5863480edj.8
        for <linux-gpio@vger.kernel.org>; Sat, 19 Dec 2020 12:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tKCl0hm0vvH+bc+bs6mggnl10AKwI3SRXVyRLi1L6B0=;
        b=YkElHEyKIBezI2/M0lST03n4UaWAm+ZaGQtYuFO/ZLe6P8I4ePURUmGxXR4/v98UsM
         7bO8WF5a/2AzFsxnJMxy/eXfOwKvHzss6OI/TzUw6669P3OY7NpYN8ybfz8a+Cg7FG/J
         5WKhi7Y4B5ooPa4aBEV+8jv1QEE7Iq3blQveKUqPFkw7P758qToOX4lDIx0TAZmEHxoq
         y3utvAIUWihjq4MLQoOMVP6lFBtv29vY+y0o0faBgJM7VowajCXuk1ncUrTgL7lKROuD
         fJZq1ONhrvkRf9CdEDKqEOFM1f+DXnrMjVVdYbt3O0g1Gt35SvKLxbrikDxfwrdwwAdl
         HQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tKCl0hm0vvH+bc+bs6mggnl10AKwI3SRXVyRLi1L6B0=;
        b=CkitqKguVjHfKXSCdAu0nZLZX1RNUXG7AOvvdF4p858NYOIuzSvlliIoD2nuPCkQX/
         My5rLveRHP9OhQP9sI1mUA0raqf1/DIxzLjIF+JNSRRX9yTEF3aaeGgvvAKywxS8GiGX
         PQBfDK9MYjp0KPoXLIir349IcihW1vbHtbCMHtwXpk+YRC9jeOEG6fhZJ55+/e5nc4wY
         pC0NuIJNOvykomsa68q3vN/GbOt4q1LPtLmWIONUuxVv+MlaUc9aLwiuE/iWm5cDUbIU
         B0A4BbcD8kxqceiNSmoaaY5GR0E+3fcgBndkE9bQ47CWylH6g05oFDswLoXxXt0PwImm
         A7kQ==
X-Gm-Message-State: AOAM531/1oR3sulnBmkBkTNhJEb8j/mBRxAj30P78Smquvqte/BHMEtg
        NLM7DmWJF9dmrWwqsVUElXqKMw==
X-Google-Smtp-Source: ABdhPJw4eR6HmRiSxLwzn4C2F0zFfTelQ4QG6LgKw8DWmcXSI7zpMEB4aR3Y6ruvmi9uQ7O5LLLE7Q==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr10243116eds.78.1608409129551;
        Sat, 19 Dec 2020 12:18:49 -0800 (PST)
Received: from x1 ([37.235.97.56])
        by smtp.gmail.com with ESMTPSA id lr24sm7163904ejb.41.2020.12.19.12.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 12:18:48 -0800 (PST)
Date:   Sat, 19 Dec 2020 12:18:42 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20201219201842.GA30242@x1>
References: <20201211042625.129255-1-drew@beagleboard.org>
 <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1>
 <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
 <20201214214419.GA1196223@x1>
 <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
 <CAHp75VdGEe9F69=uzaDiCf9C8byh6ThuCJLMch1dBXEH4MA2Sg@mail.gmail.com>
 <20201215224212.GB2086329@x1>
 <CAHp75VfbEE0t2g=uzux5=dhgAHwv15OKpVr+xrF19VskO7HnTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfbEE0t2g=uzux5=dhgAHwv15OKpVr+xrF19VskO7HnTw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 18, 2020 at 06:00:49PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 16, 2020 at 12:42 AM Drew Fustini <drew@beagleboard.org> wrote:
> > On Tue, Dec 15, 2020 at 09:39:18PM +0200, Andy Shevchenko wrote:
> > > On Tue, Dec 15, 2020 at 9:36 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Dec 14, 2020 at 11:44 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > > > On Mon, Dec 14, 2020 at 07:55:12PM +0200, Andy Shevchenko wrote:
> > >
> > > ...
> > >
> > > > > With regards to parent directory, I did discover there is
> > > > > debugfs_lookup(), so I can get the dentry for "pinctrl" and create new
> > > > > subdirectory inside of it.  This is the structure now:
> > > > >
> > > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_35_pinmux/state
> > > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_34_pinmux/state
> > > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_33_pinmux/state
> > > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_32_pinmux/state
> > > > > etc..
> > >
> > > Missed part to comment.
> > >
> > > I was talking about
> > >
> > > /sys/kernel/debug/pinctrl/<$PINCTRL>/mux/<$PIN> (maybe folder, maybe node)
> >
> > Thanks for the example.
> >
> > What would the value be "<$PINCTRL>"?  The name of the driver?
> 
> The name of the device instance. This is already done in the pin control code.

Ah, so for the BeagleBone, that would be 44e10800.pinmux-pinctrl-single:

/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/

> 
> > The "ocp:Px_yy_pinmux" directory name comes from dev_name(dev). Is that
> > the name you were referencing in "<$PIN>"?
> 
> No, the <$PIN> is an actual pin on this controller. However, I think
> we probably don't need this, just supply it as tuple of the parameters
> to be set: like
> echo $PIN $STATE > .../<$PINCTRL>/mux or alike.

Do you mean not having a debugfs file for each pin, but instead just using the
existing combined file?

/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pinmux-pins

There is one line in there for each pin in the pinctrl-single instance.

For example:

pin 105 (PIN105): ocp:P2_34_pinmux (GPIO UNCLAIMED) function pinmux_P2_34_default_pin group pinmux_P2_34_default_pin

So maybe one solution to changing pinctrl state could to:

echo "105 gpio_pu" > /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pinmux-pins

I'll make an attempt at implementing that.

> 
> -- 
> With Best Regards,
> Andy Shevchenko

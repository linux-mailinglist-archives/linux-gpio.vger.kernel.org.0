Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03AFD38ECFD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 17:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhEXPck (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 11:32:40 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:35128 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbhEXPcD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 11:32:03 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id A19BD202FF0;
        Mon, 24 May 2021 17:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621870231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5MVM5bUeOBcoLoP3W/nxVP4OlAB5bSPoQyJKgckUz8I=;
        b=Hmt76Wx3Cn2CJMDd4/vkYSZjhlGEll5naZ+AkO0EURp37WRFFvQgim6ZFQ9EwiPDGmags3
        9IVFxsG7TCrGSMhThwoJqgjp6kUCbMxUh+izP9iLsySTh6L4HlF4cSVzDh9GnNVz+7A0gK
        mljJApeRhSZdiANKVcKSfEIdont1J8KcgVi+VZSb0c2bg6dT9CZ5rz7rOhHIaPKz6cWFzL
        W3hSGYMlsEL69aXJbGeHVpeVLKo83eir9rdGsR9qG8Jny63q5YiU+sG4RhERTY6zZWhlaS
        gJ4XQNgGMnrTHGCCWRdNnF6poHSTG3O2HKB8ORb6fnv68ZRApU7NliM3KXQ+2Q==
Message-ID: <867b81680fdf3076e8ce3fbc2dc36247d8e724a8.camel@svanheule.net>
Subject: Re: [PATCH v3 6/6] leds: Add support for RTL8231 LED scan matrix
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 24 May 2021 17:30:30 +0200
In-Reply-To: <CAHp75VfbdmHPsscHOAnH-WjGyWF-8V_00FjQu1PD+xFLcUytig@mail.gmail.com>
References: <cover.1621809029.git.sander@svanheule.net>
         <213ab7580a1d3229d32f7aac67bf4e828612153a.1621809029.git.sander@svanheule.net>
         <CAHp75VdoSfO3Y9Lf+fcoG2=Rb+SBJKq+B0tG+gS7TaHUmN-iYg@mail.gmail.com>
         <08375439546c04d32b158c20fb59446c3bbafb46.camel@svanheule.net>
         <CAHp75VfbdmHPsscHOAnH-WjGyWF-8V_00FjQu1PD+xFLcUytig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-24 at 15:47 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 3:04 PM Sander Vanheule <sander@svanheule.net> wrote:
> > On Mon, 2021-05-24 at 13:24 +0300, Andy Shevchenko wrote:
> > > On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net>
> > > wrote:
> 
> ...
> 
> > > > +       if (ret != 2)
> > > > +               return -ENODEV;
> > > 
> > > I would say -EINVAL, but -ENODEV is similarly okay.
> > 
> > Any specific reason you think EINVAL is more appropriate than ENODEV?
> 
> My logic is that the initial values (from resource provider) are incorrect.
> But as I said, I'm fine with either.

Ok, that makes sense. Actually, I'm already using "address invalid" in the error
messages when reading the address fails, so I'll change to EINVAL for
consistency.


> 
> > > > +       int err;
> > > 
> > > ret or err? Be consistent across a single driver.
> > 
> > I had first used 'err' for both fwnode_property_count_u32() and
> > fwnode_property_read_u32_array(). The former returns "actual count or error
> > code", while the latter is only "error code". And I found it weird to read
> > the
> > code as "does error code equal 2", if I used 'err' as variable name.
> > 
> > I've split this up:
> >  * addr_count for fwnode_property_count_u32's result
> >  * err for fwnode_property_read_u32_array's result
> > 
> > Since addr_count is only used before err is touched, I guess the compiler
> > will
> > optimize this out anyway?
> 
> Usually we do this pattern (and it seems you missed the point, name of
> variable is ret in some functions and err in the rest):
> 
> err /* ret */ = foo();
> if (err < 0)
>   return err;
> count = err;

I had only used 'ret' specifically in this one function, because I didn't like 
"if (err != 2)" (and I apparently decided that I disliked that more than the
inconsistency introduced by using 'ret'). I'll stick to calling the variable
'err', and change the clause to (err != ARRAY_SIZE(addr)) to make it more
obvious that 2 isn't just some random return value.


Best,
Sander


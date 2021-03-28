Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8EF34BD65
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Mar 2021 19:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhC1RAQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 13:00:16 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:39504 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhC1Q77 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 12:59:59 -0400
Received: by mail-lf1-f44.google.com with SMTP id b4so14880123lfi.6;
        Sun, 28 Mar 2021 09:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=VqWsmVV20pmyPWOLgx8iBIVx1eMwQKxx4/um6Q/v3Rw=;
        b=b8kXZYu7MkdMNQYjf0KzQCQ1u80ijVz5B96WCC6eG7mYp3TOYACpdFydRzzbfdpM3Y
         nT6de9SEkxbUEv4HCsT3FxppBATY47nae6pL82GNadhfSeTmsyjT2FSjzRHy6jZR2scO
         By2KGq+GUcB/TJ/FHKQTm1nAB2xxG9EkkxMthTiCQUDGdurPvGzV5fdvOpsGIXBiiGa7
         d6S9PbKdOnaB4bSDrn9CSFwHmDrJ6W0kNv8eCWbWoHm08MxrZ5DPlVBMwHNJZtHTYMTh
         mSHiGPBWqyN3vhtTj5u74brgTrWnruNB5mZpuQkWduwR02kZwxVv6f52kPzzoGYY3T+u
         cLyw==
X-Gm-Message-State: AOAM530rqTn1TzUicsNx6OyWJ/c/gHjQyIS0pKCiF3E/eb2AGmOQUi+Z
        AjHsPHTnTTRnlrWH3kZH3A8=
X-Google-Smtp-Source: ABdhPJwRCNBoEpZBLXi7LDmYiKYN3oplcPDsoktYd2fpu+skZMHLtozMc3ZPxx6m/M8mgxZvSavVPg==
X-Received: by 2002:a05:6512:504:: with SMTP id o4mr13404585lfb.438.1616950797804;
        Sun, 28 Mar 2021 09:59:57 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id r3sm2112236ljn.13.2021.03.28.09.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 09:59:57 -0700 (PDT)
Message-ID: <f988f635a9571eb9ee0a1eb08015cad3f751db8c.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 09/16] gpio: support ROHM BD71815 GPOs
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
In-Reply-To: <CAHp75VcXoTpKmT9qW61Ua=1KcN7GU_QeJU6ciFPGOetB0hQ3ZQ@mail.gmail.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdxRkX15Ts+L1UJdXbpoaTu3Ue6o9o=Yh2cRCXCEi1jwA@mail.gmail.com>
         <8853471c798ce3dbbbd939c05a58fa5ce40be605.camel@fi.rohmeurope.com>
         <CAHp75VcXoTpKmT9qW61Ua=1KcN7GU_QeJU6ciFPGOetB0hQ3ZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Sun, 28 Mar 2021 19:59:52 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Again Andy,

On Fri, 2021-03-26 at 19:51 +0200, Andy Shevchenko wrote:
> On Fri, Mar 26, 2021 at 3:33 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > On Fri, 2021-03-26 at 13:26 +0200, Andy Shevchenko wrote:
> > > On Wed, Mar 24, 2021 at 12:20 PM Matti Vaittinen
> > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> 
> 
> > > > +       if (!bd71815->e5_pin_is_gpo && offset)
> > > > +               return;
> > > 
> > > I wonder if you can use valid_mask instead of this.
> > 
> > Do you mean re-naming the e5_pin_is_gpo to valid_mask? Or do you
> > mean
> > some GPIO framework internal feature allowing to define valid pins?
> > (If
> > my memory serves me right one can set invalid pins from DT - but by
> > default all pins are valid and here we want to invalidate a pin by
> > default). For renaming I don't see the value - if internal feature
> > can
> > be used then there may be value. Thanks for the pointer, I'll look
> > what
> > I find.
> 
> I mean to utilize internal valid_mask bitmap. Yes, you may fill it as
> valid at the start of the driver and then simply call __clear_bit() /
> clear_bit() against one you wanted to disable. Then core will take
> care of the rest (AFAIR).

Right. I see there is the init_valid_mask callback which could be
populated. OTOH, I think this check is actually not needed at all if we
set the ngpios based on the DT flag. The check in set/get functions was
just a symptom of my paranoia. Anyways, I owe you as I just learned
something new :)

> > > > +       int ret;
> > > > +       struct bd71815_gpio *g;
> > > > +       struct device *dev;
> > > > +       struct device *parent;
> ...
> 
> > > > +       parent = dev->parent;
> > 
> > It is not always obvious (especially for someone not reading MFD
> > driver
> > code frequently) why we use parent device for some things and the
> > device being probed to some other stuff. Typically this is not
> > needed
> > if the device is not MFD sub-device. And again, the comments in the
> > middle of declaration block look confusing to me. I think removing
> > comments and moving these to declaration make readability _much_
> > worse.
> 
> I disagree with you here again. To me it's like completely unneeded
> churn.
> 

I've seen even experienced developers making mistakes by binding the
lifetime of sub-device stuff to parent device's lifetime. I've also
seen even experienced developers who haven't used to dealing with MFD
getting confused when they see parent device's dt-node or regmap being
used. My view on this is that if the comment helps next reader to avoid
a mistake or understand why something is done - then it is worthy. I
have rarely seen comments which make code less readable or
understandable.

> > > > +       g->chip.of_node = parent->of_node;
> > > 
> > > Redundant. GPIO library does it for you and even better.
> > 
> > So I can nowadays just omit this? Thanks!
> 
> For a long time. I haven't checked the date when it started like
> this,
> but couple of years sounds like a good approximation.

Ok. Thanks for pointing it out.


Best Regards
	Matti Vaittinen



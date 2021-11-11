Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56FD44D061
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 04:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhKKD2m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 22:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhKKD2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 22:28:41 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756FDC061766
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 19:25:53 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id t21so4657813plr.6
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 19:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pxRJP+oQdCrgdhmJZ5R9iabW8Rfkc8S03+llqZz5Ky4=;
        b=AP3/MSJOlUgAl7OxQZlBJ/hnYWOcytuj7MQitXc9Ql/aOiphrtlxX2KT5GTWI6rcZv
         l8CLoWnsomUKmlkiUSqLvy0jyORoBcFiob95v4aoHrLTSlrBmStgVNfCZBAi8SJ7C4zB
         BvKbpj4y820s6TJEhwRpWKiLQC4lbrOzjzghyekVi3AG2t8Q7YkGSB+DV4YZSOq2SY66
         KiKkoIwLSh9L452rpqEiEpSL1glvaWDG6DI3OuguYljjjpQto9cYTR9946f9u9ny5MOQ
         PJVA3cob8y1BhPhStevG5Kc1tJLSbS4msuyZffwpX5Qn2b9awwgM6Epjv8zXcgZ/KNlr
         Wf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pxRJP+oQdCrgdhmJZ5R9iabW8Rfkc8S03+llqZz5Ky4=;
        b=WXZ1zxmgeC6h/oUNMEdhKWc2hwyliw4ZbS/SX0z0rjtGleeVCHKFpzPAA+qdp7h//P
         6tuqT4vQ1i5m9cpvdKV8GFrVKsoS2jriKayddKmIfW94CVv4Tm19BbZMeRoKf90/ld0o
         R+vi5NhFY0Uz8YZNlV+TaohoKxawSwU4o7iTTVai4WaV7xB5bHxByq/aDsBwVSH1M3Am
         5KTQe6NezQWm5IuXo0qiAkinsD8h/K34yEKMFwyTMJi7JCRgZyx57cl5a6uCiF3Oia7q
         02vZx+NaP9E++4cGhc4+k/dxYMZIBP03nEjlVrZry1mNk7JS7MD2rf2KNlR8sSKy3d06
         hodw==
X-Gm-Message-State: AOAM5327RxgQUBHdSxzAA3mTLpycXTQBEUAH8w4OWrJ2/rxJTU2EcoEf
        2wE1u3HtuVW7iZoHnizIwY0=
X-Google-Smtp-Source: ABdhPJzTdLisiIuoR67tnRqTvp8fhaBdjCVOhHu/JfJ7Nfuewv8OFcV3VtGnQneUwaAVPEeJ3i53cQ==
X-Received: by 2002:a17:90b:1644:: with SMTP id il4mr4610471pjb.39.1636601152883;
        Wed, 10 Nov 2021 19:25:52 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id m12sm904863pjr.14.2021.11.10.19.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 19:25:52 -0800 (PST)
Date:   Thu, 11 Nov 2021 11:25:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v4 2/2] bindings: cxx: implement C++
 bindings for libgpiod v2.0
Message-ID: <20211111032547.GB7679@sol>
References: <20211104192252.21883-1-brgl@bgdev.pl>
 <20211104192252.21883-3-brgl@bgdev.pl>
 <20211108010438.GA6478@sol>
 <CAMRc=MeP-UYZw6z4=fVX4v9o7pacxFxVpKsK58xG1X8bF4fZbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeP-UYZw6z4=fVX4v9o7pacxFxVpKsK58xG1X8bF4fZbQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 02:42:09PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 8, 2021 at 2:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Nov 04, 2021 at 08:22:52PM +0100, Bartosz Golaszewski wrote:
> > > This is the bulk of work implementing C++ bindings for the new libgpiod
> > > API. The tests are not converted yet but the examples are fully
> > > functional. More details in the cover letter as this patch will be
> > > squashed with the one for the core C library anyway.
> > >
> >
> > I dislike the squashing approach.  I would rather accept that this branch
> > is unstable and keep the patches separate.
> > If you want stability at each commit then disable the building of any
> > unstable sections until they are fit to be included in the build again,
> > rather than squashing everything into one humungous patch.
> >
> 
> Ok, sounds good, will change the approach.
> 
> > I'd rather see working tests than working examples :-(, unless you
> > think your API is still in flux?  Separate patches for API,
> > implementation, tests, and examples would work for me.
> >
> 
> I'd love to start writing tests but I just can't get the gpio-sim
> upstream. :( I consider dropping the blocking configfs changes and
> just implementing the "committing" part locally with a dedicated
> attribute.
> 

I suspected that might be a sticking point.

That doesn't stop you writing tests - just publishing them.
Even then you could make the patch contingent on your configfs patch on
the assumption it will make it into mainline soon.

And it would be good to exercise both interfaces, to better demonstrate
the utility of the gpio-sim, and to test libgpiod2 as well the gpio-sim
itself.

<snip>

> > > +GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_config& config)
> > > +{
> > > +     out << "line_config(defaults=(direction=" << direction_names.at(config.direction()) <<
> > > +            "edge_detection=" << edge_names.at(config.edge_detection()) <<
> > > +            "bias=" << bias_names.at(config.bias()) <<
> > > +            "drive=" << drive_names.at(config.drive()) <<
> > > +            (config.active_low() ? "active-low" : "active-high") <<
> > > +            "debounce_period=" << config.debounce_period_us() << "us" <<
> > > +            "event_clock=" << clock_names.at(config.event_clock()) <<
> > > +            "default_output_value=" << config.output_value() <<
> > > +            ")";
> > > +
> > > +     if (config.num_overridden_offsets()) {
> > > +             out << "overrides=[";
> > > +
> > > +             for (const auto& offset: config.overridden_offsets()) {
> > > +                     out << "(offset=" << offset <<
> > > +                            "direction=" << direction_names.at(config.direction(offset)) <<
> > > +                            "edge_detection=" << edge_names.at(config.edge_detection(offset)) <<
> > > +                            "bias=" << bias_names.at(config.bias(offset)) <<
> > > +                            "drive=" << drive_names.at(config.drive(offset)) <<
> > > +                            (config.active_low(offset) ? "active-low" : "active-high") <<
> > > +                            "debounce_period=" << config.debounce_period_us(offset) <<
> > > +                            "event_clock=" << clock_names.at(config.event_clock(offset)) <<
> > > +                            "output_value=" << config.output_value(offset) <<
> > > +                            ")";
> > > +             }
> > > +
> > > +             out << "]";
> > > +     }
> > > +
> > > +     out << ")";
> > > +
> > > +     return out;
> > > +}
> > > +
> >
> > This stringification is both too verbose (reporting fields that may not
> > be overridden) and too terse (not reporting lines that are overridden
> > with the default value).
> >
> 
> Oh... I think I get it now. If we override the line with the current
> default value, then change the default value, the overridden line
> should keep it's overridden value. Is that it?
> 

Pretty much.  The general question is what the semantics of each
line_config function is and how they interact with each other.
Any reasonably sized command set is going to have some ambiguity - some
use case it handles badly that will require multiple function calls
to achieve the desired outcome.  e.g. in your current patch the only
way to clear an override is to start from scratch (or set it to the
default and assume the default wont change subsequently).
It is a question of how to minimise complexity and maximise utility.
Which is why I prefer a global "set all lines to this - and clear any
overrides".
But it is a corner case either way, and I don't have a compelling use
case either way, so not terribly fussed either way - just saying I'd do
it differently.

The specific problem here is the overridden_offsets() filters out useful
information, specifically which lines are overridden to the default, while
the streaming operator also doesn't filter other attributes which have NOT
been overridden. i.e. it reports ALL the attributes for a line if ANY
attribute is overridden from the default.
So problems in patch 1 as well as here.

> > What are you wanting to display here - the full state (what the user has
> > set) or the effective state (what the kernel will see)?
> > If the former then include the defaults and all overrides -
> > even when overridden to the default - but not attributes that are not
> > overridden.
> > If the latter then as per the full state but filter out overrides that
> > correspond to the default or that are ineffective (e.g. the default
> > edge_detection when all lines are outputs).  And maybe filter out the
> > defaults that match the kernel defaults?
> 
> The former of course, we don't want to expose the kernel logic to users.
> 

We do want to expose kernel functionality to users, and some kernel
logic tends to stick to that.
You don't think it would be useful to know what the actual effect of
your config will be?

But agreed - the streaming operator here should dump the contents of the
line_config so the user can see what they have set.  I see the other
as a nice to have.

Cheers,
Kent.


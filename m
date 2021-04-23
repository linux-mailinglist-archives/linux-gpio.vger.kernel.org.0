Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C557368A75
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 03:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhDWBjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 21:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhDWBjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Apr 2021 21:39:37 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E326FC061574
        for <linux-gpio@vger.kernel.org>; Thu, 22 Apr 2021 18:39:01 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t22so2671436pgu.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Apr 2021 18:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CFlNqCGTtUi0KjM5bulY8b6ykoC5eFaTQy5K/Y8W3l8=;
        b=c7tbUtjw1k3e7chjFVIDz56/Pp5qGyE0bFqEipLwT9Ih4GXFUkDO3QYsdE1fb0L+7n
         NPY0TE4FskETqdZ0BKo/gm+AXbOUU91kT7MBMFiYUk4lJZkpIeiN5XZQggnDBIPXqjgV
         IIljMafl4o5XajEIaNIoowskOYSRBeovo0Prjc5vpQhlW+WUUYZl31O9b7H/ihdgatC/
         Qoj7p7pOC88+oK0YWp822OnxSB5yqDu6x6uGXfI5Mq2FN+mXvz6PHr/cHcUXcwDq5xiQ
         1J/EYy9UUXvXAhiq36Oh2HzQzXnnd6j55EDd3GEIzQTvS6nWP27IScsiWIhqw1+bNnxf
         2IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CFlNqCGTtUi0KjM5bulY8b6ykoC5eFaTQy5K/Y8W3l8=;
        b=O2trSpDtHrEFnN9V26CAYbcpSD93m7tpxWOKGPWTFadhqjsGhvySLapAJ24FtXp6LJ
         WTWc3g4AJTtZE6irNaWukC7Ar3aY1DpbuiwRNsUE2jkPq9wU5gn+jHbIuhiPEk5iw1zc
         xxo3rkqzGLwv2YjtVEDA0eRd5mHeFLg+5pBIuNh6Doz29VeViC3cKBifd0iQnaIyRogu
         ob2ab9JRj2MXEzF1BiUSBloBcb7enrl1Ac99M7JxMLNdApEGqTKRX6ZB5a5XRYpNt5oD
         x/HzT+HndzYNvd6mPfESOcPDaNUim/s1b5URVxATuM5yOqZUGSeD+Pi55IBt1/f9zQO6
         Gmzg==
X-Gm-Message-State: AOAM530WwD/jwU7vnS0A5gIBaTWMSfo9hcrUar7HaIVaf24zwwMVrOcX
        znihHfogL77swFVSYlSdkGU=
X-Google-Smtp-Source: ABdhPJwF3pv+CZrcbdbaajVJ7hK/1BD51D/+piJ//SUmRmtM7XUn9bgM2NmETLw2TVyQClsfWJH2KQ==
X-Received: by 2002:a62:7642:0:b029:25c:7cdd:3cf4 with SMTP id r63-20020a6276420000b029025c7cdd3cf4mr1674677pfc.9.1619141940420;
        Thu, 22 Apr 2021 18:39:00 -0700 (PDT)
Received: from sol (106-69-187-97.dyn.iinet.net.au. [106.69.187.97])
        by smtp.gmail.com with ESMTPSA id r127sm3140911pfr.163.2021.04.22.18.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 18:38:59 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:38:55 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
Message-ID: <20210423013855.GA7321@sol>
References: <20210414141534.GA20266@sol>
 <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
 <20210417072326.GA12853@sol>
 <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
 <20210418034810.GA9261@sol>
 <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
 <20210419011746.GA4766@sol>
 <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
 <20210422023206.GA4994@sol>
 <CAMRc=Mfa2BbQx+C59vzeZ_JSLonFYVvfJhA8SuQbV2aGuvR9Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfa2BbQx+C59vzeZ_JSLonFYVvfJhA8SuQbV2aGuvR9Ow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 11:24:34AM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 22, 2021 at 4:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Apr 21, 2021 at 10:04:04PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Apr 19, 2021 at 3:17 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > > [snip -> long discussion on the libgpiod C API]
> > >
> > > Hi Kent,
> > >
> > > I was working on the next iteration of the code and I'm struggling
> > > with the implementation of some elements without the concept of
> > > attributes.
> > >
> > > So I initially liked the idea of variadic functions but they won't
> > > work for language bindings so that's a no go. On that note: I wanted
> > > to get some inspiration from your go library but your elegant API
> > > makes use of go features (like interfaces) we don't have in C.
> > >
> >
> > It is the functional options that is the big difference between my Go
> > implementation and what I would do in C.  I happen to use interfaces to
> > implement those options.  You could do something similar in C (cos what
> > can't you do in C) but it would be weird, so lets not go there.
> >
> > You can still provide the variadic forms for C users.
> > And couldn't the language bindings use the "v" variant, as libabc
> > suggests?:
> >
> > "Be careful with variadic functions
> >   - It's great if you provide them, but you must accompany them with
> >     "v" variants (i.e. functions taking a va_arg object), and provide
> >     non-variadic variants as well. This is important to get language
> >     wrappers right."
> >
> 
> The "v" functions do nothing for language bindings - you can't
> construct the required va_list out of thin air. What you do usually is
> this (example taken from GLib):
> 

You are right - I was thinking you could build and pass in the the va_list
like Python args and kwargs, but you can only use it to decode an
existing call stack :-|.

[snip]

> > So it should require the list of lines that you are setting the values
> > for. i.e. it is the mutator for a subset of lines, so the C case.
> >
> > And it implicitly sets those lines to outputs, so it can be more clearly
> > named set_output(value) (that is the A case, btw).
> >
> 
> I can imagine the B case like:
> 
> gpiod_line_config_set_output_value(config, offset, value);
> 
> But how would exactly the call for the A case look like? Two arrays
> with offset -> value mapping?
> 

No - the A case sets ALL lines to one value.
B is one line to one value.
C is a set of lines to one value.

A set of lines to a set of values is a new case.
And yes - two arrays as per your set_values() below.

> unsigned int offsets[] = { 0, 2, 5 }, values[] = { 0, 1 ,1 };
> gpiod_line_config_set_output_values_offsets(config, 3, offsets, values);
> 
> ?
> 
> > > One can imagine a simple request with the same config for all lines as:
> > >
> > > gpiod_chip_request_lines(chip, req_cfg, line_cfg);
> > >
> > > Where req_cfg configures request-specific options, and line_cfg
> > > contains the above line config. I'm still not convinced that
> > > gpiod_request_options is the better name, I think I prefer the
> > > juxtaposition of the two names: line_config and request_config.
> > >
> >
> > That's ok - I'm pretty sure you'll get there eventually ;-).
> >
> > > Now how do we pass a composite line config with overridden values in C
> > > without interfaces etc.?
> > >
> >
> > As above, the req_cfg is the composite line config, so
> >
> > req = gpiod_chip_request_lines(chip, req_options, req_cfg);
> >
> > Or if you were to merge the request config, and even the options, into the
> > request:
> >
> > unsigned int lines[] = { 0, 4, 12, 54 }, num_lines = 4;
> > req = gpiod_line_request_new(num_lines, lines); // also variadic forms??
> > // call req option and config mutators here...
> > gpiod_line_request_set_active_low(req);
> > gpiod_line_request_set_output(req, 1);
> > gpiod_line_request_set_line_input(req, 12);
> > gpiod_line_request_set_event_buffer_size(req, 42);
> > ...
> > // then actually request the lines...
> > err = gpiod_chip_request_lines(chip, req);
> >
> > which may error for various reasons, such as lines already being
> > requested or overly complex config.
> >
> > Merging everything into the request means fewer opaque objects and
> > interactions for the user to have to deal with, which is always a good
> > thing.
> > The downside is that changes to options and config, such as the
> > gpiod_line_request_set_active_low() etc here, are not applied until
> > either the gpiod_chip_request_lines() or the set_config() call, which
> > could be confusing.  Though the more I think about it the more I think
> > the resulting simplification of the API wins out.  i.e. these objects:
> >
> > struct gpiod_line_attr;
> > struct gpiod_line_config;
> > struct gpiod_request_config;
> > struct gpiod_request_handle;
> >
> > all get collapsed into:
> >
> > struct gpiod_line_request;
> >
> > which significantly reduces the cognitive load on the user.
> >
> > The set_config() would probably be called something like:
> >
> > err = gpiod_line_request_reconfigure(req)
> >
> 
> This lack of splitting of options into configurable and constant ones
> visually suggests that you can change all request options later on
> which is not true.

Yup, as I said, the semantics for the unified object are more confusing.

In the Go implementation, the request options can be passed to the
request_lines(), but not the set_config(), cos interfaces.

There is no good way to flag that in C at compile time. For a runtime
check you could add a return code to the option mutators and return an
error if the lines have already been requested.

> I think that at least for the C API, we should
> split the responsibilities of objects and keep the division into
> request config, line config *and* the line handle whose lifetime is
> from the moment the lines get requested until they're released.
> 
> > to distinguish it from the mutators which use the _set_ naming.
> > (and it would also align with my Go library ;-)
> >
> > > One idea I have is to add a new object called struct
> > > gpiod_line_config_ext (for extended) that would take one primary
> > > config and an arbitrary number of secondary configs with the following
> > > example use-case:
> > >
> > > struct gpiod_line_config_ext *ext_cfg = gpiod_line_config_ext_new();
> > > unsigned int offsets[] = { 2, 3 };
> > >
> > > /* Add the default config for this request. */
> > > gpiod_line_config_ext_set_primary_config(ext_cfg, line_cfg);
> > > /* Add a secondary config for 2 lines with offsets: 2 and 3. */
> > > gpiod_line_config_ext_add_secondary_config(ext_cfg, other_line_cfg, 2, offsets);
> > >
> > > gpiod_chip_request_lines_ext(chip, req_cfg, ext_cfg);
> > >
> >
> > Please, no _ext objects - that is an admission of failure right there.
> >
> 
> I wanted to protest but then realized that if you need _ext interfaces
> then it means your non-extended, initial design is already flawed. :)
> 
> Ok so let's try again.
> 
> How about:
> 
> Three structs:
> 
> struct gpiod_line_config;
> struct gpiod_request_config;
> struct gpiod_line_request;
> 

The user manages the lifecycle of all three?

I can live with that, though I would probably still lean towards the
unified object approach - with the option mutators getting return codes.

> The first one holds the composite of primary and secondary configs and
> is modified using mutators according to this scheme:
> 

Which is why it should be called request_config, not line_config.
line_config is misleading - it says line but its scope is request.

And of course request_config should be request_options ;-).

> gpiod_line_config_set_<attr>(config, attr);
> gpiod_line_config_set_<attr>_offset(config, attr, offset);
> gpiod_line_config_set_<attr>_offsets(config, attr, num_offsets, offsets);
> 

I personally prefer the _set_line_<attr> style as it reads better, but I
can live with this - I know you prefer suffixes for variants.

> With notable exceptions for:
> 
> gpiod_line_config_set_[input|active_low|active_high](config);
> gpiod_line_config_set_[input|active_low|active_high]_offset(config, offset);
> gpiod_line_config_set_[input|active_low|active_high]_offsets(config,
> num_offsets, offsets);
> 
> and:
> 
> gpiod_line_config_set_output(config, num_lines, offsets, values);
> gpiod_line_config_set_output_offset(config, offset, value);
> 
> The request function takes a single line config and a request config
> and returns a new gpiod_line_request like in the first iteration.
> 

Where are the set of requested lines specified?

Do null config ptrs result in something useful, but guaranteed harmless,
such as requesting lines as input?  Or are they required non-null?

> Then the lines can be set like this:
> 
> // num_lines refers to the number of lines to set, not the number of
> // lines in the request
> gpiod_line_request_set_values(req, num_lines, offsets, values);
> 

At first glance that feels a bit odd, being on the request while the
others all operate on the config, but it maps to the SET_VALUES ioctl(),
not the SET_CONFIG, so that makes sense.

There is a corresponding get_values(req, num_lines, offsets, values)?

And a reconfigure(req, cfg)?

Cheers,
Kent.


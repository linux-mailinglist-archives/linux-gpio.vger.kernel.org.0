Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B3336777E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 04:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhDVCcq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 22:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhDVCcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 22:32:46 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F66C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 19:32:12 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id c17so30666891pfn.6
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 19:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jZ64eGGynFFPQ8Miop+1dYIyfyVof86WbJVKrY076bQ=;
        b=Yuhk6pONXfs5On6J/0f3AzxoGgDvHWH+ZZW8EPrb7uLuxPfwmjzqhz/MDZD02X/fUu
         cBBgAg+bqTZKpj/cD5753L4hzjFh4u3Gwr5a1+w0XY+piwbphgGieu+U9NXCZh8VXEDE
         xQwDL2PFwrVG1X9Qt8IslOA5edYrY9XWlpCSDBAANl6cad7H0X2zBnXTwKT55kiLevSE
         qcCIFEy8e0P9QtiLjA83OqctwoIYTkdGC813roaXiMr4fkxUmMJ44rxaVa59i2uSbMhQ
         2MLJ7CPWLBHbMx0NDit6t42+aEEJy9ohMCKaP8dmC+V3mQOTOYaDHXDmi+Ol12rt4+Uq
         KdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jZ64eGGynFFPQ8Miop+1dYIyfyVof86WbJVKrY076bQ=;
        b=tL57sf4TEwdffeQ8rFQx4TVHWhCuWcyVKq5MEm++39Cckz9ZuO6nNyh4EsJvTuf9b/
         m8qD1IYUebUAadPwAcaQl46bdpXI37Nomc1undY+v0tKZvxvhQmTZl1lPaPj4B1GPt1H
         /nRxk27kNhRG2IILst7JkHEGt8nZ8fgDh3w4WqnNsPC/oD05l3HeWEJZF5QlkzjaCJf4
         BbYa/F/FCQjXMnnA97tVe8/oytGaAWd2Z8S9P+BwC3NoZYyjfgQz704TYFWscWV8uxq2
         AueCt3grp3WManEoHuXkCpnLLfmeOr+LL5KlDCVQeaovH3ELKuskAifkUQVW+X8hqNIl
         iKMQ==
X-Gm-Message-State: AOAM530j1tTq38YpeN0/sS7ZmokVohQDwg+ufTck2bxhe9xMBpbIOzRz
        hrx11PmdqBXfcqe2xZrhs+4TCXOLDng=
X-Google-Smtp-Source: ABdhPJwUZFfWUKjRshS41ASuvoqSzW1R8nMHEJBlLXaKIYYkh/O+8vNjV9YLpLCOnIYCtG+Uo/G+qg==
X-Received: by 2002:a65:68c2:: with SMTP id k2mr1164495pgt.357.1619058731689;
        Wed, 21 Apr 2021 19:32:11 -0700 (PDT)
Received: from sol (106-69-187-97.dyn.iinet.net.au. [106.69.187.97])
        by smtp.gmail.com with ESMTPSA id r18sm3209134pjo.30.2021.04.21.19.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 19:32:10 -0700 (PDT)
Date:   Thu, 22 Apr 2021 10:32:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
Message-ID: <20210422023206.GA4994@sol>
References: <20210410145157.30718-1-brgl@bgdev.pl>
 <20210414141534.GA20266@sol>
 <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
 <20210417072326.GA12853@sol>
 <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
 <20210418034810.GA9261@sol>
 <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
 <20210419011746.GA4766@sol>
 <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 10:04:04PM +0200, Bartosz Golaszewski wrote:
> On Mon, Apr 19, 2021 at 3:17 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip -> long discussion on the libgpiod C API]
> 
> Hi Kent,
> 
> I was working on the next iteration of the code and I'm struggling
> with the implementation of some elements without the concept of
> attributes.
> 
> So I initially liked the idea of variadic functions but they won't
> work for language bindings so that's a no go. On that note: I wanted
> to get some inspiration from your go library but your elegant API
> makes use of go features (like interfaces) we don't have in C.
> 

It is the functional options that is the big difference between my Go
implementation and what I would do in C.  I happen to use interfaces to
implement those options.  You could do something similar in C (cos what
can't you do in C) but it would be weird, so lets not go there.

You can still provide the variadic forms for C users.
And couldn't the language bindings use the "v" variant, as libabc
suggests?:

"Be careful with variadic functions
  - It's great if you provide them, but you must accompany them with
    "v" variants (i.e. functions taking a va_arg object), and provide
    non-variadic variants as well. This is important to get language
    wrappers right."

> The problem we have is basically about implementing primary and
> secondary line configuration objects - where the primary contains the
> default config for all requested lines and the secondary can override
> certain config options (should zeroed values for enumerated types mean
> - don't override?) for certain lines.
> 

Yep, use the 0 value to mean "defaulted".
For the secondary that means use the primary value.
For the primary that means use the kernel default, so the primary is
initialised with the kernel defaults.

Note that accessors, if provided, generally wouldn't return the 0 value to
the user - they follow the secondary -> primary chain and return the
effective setting.

> The basic line config structure (let's call it struct
> gpiod_line_config) can be very simple and have the following mutators:
> 

This is where you are immediately off into the weeds, so I obviously
didn't communicate my suggestion very well...
.
The opaque config object presented to the user is not the simple line
config object - it is the container for the whole request config (which
is different from the request options - which is exactly why I would like
the options not to be called request_config).

The user never sees the simple line config, which is internal, only the
request config.
The accessors always work on the request config at attribute level, and
there is never a need to apply or return the whole config for a particular
line. You could - but it is not necessary for core functionality, so for
now don't.

I realise this makes the internal modelling of config much more
complicated, but the goal is to provide a simplified interface for the
user - so it should be expected that the majority of the complexity will
end up in the library rather than user code.

In my Go implementation I merge the request config into the request
object itself. You could also do that, though the semantics might be
clearer if you keep them separate (more on that later).

> struct gpiod_line_config *cfg = gpiod_line_config_new();
> 
> gpiod_line_config_set_active_low(cfg, true);

I would provide two functions for active level - set_active_high() and
set_active_low().  Even if you don't, the function here should be
set_active_level(), in case you want to add them later.

> gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_OUTPUT);
> 

That is the A case, i.e. the whole request.  How would you name the B
and C cases?

_set_<attr>_line and _set_<attr>_lines?

or _set_line_<attr> and _set_lines_<attr>?

or something else?

It might be worthwhile providing separate set_input() and
set_output() functions - as the output case requires the initial value.
You could have the user call set_output_values(), but why force them to
make another call?

> and so on for for drive, bias, edge, debounce, realtime clock.
> 
> Output values would be set like this:
> 
> unsigned int values[] = { 0, 1, 1, 0 }, num_lines = 4;
> gpiod_line_config_set_output_values(cfg, num_lines, values);
> 

I don't like the implicit identification of lines based on request
ordering here.  I realise my Go API does that, but that is an option to
the request itself, so the requested lines are also present and visible
to the casual reader, whereas this is a standalone call.

So it should require the list of lines that you are setting the values
for. i.e. it is the mutator for a subset of lines, so the C case.

And it implicitly sets those lines to outputs, so it can be more clearly
named set_output(value) (that is the A case, btw).

> One can imagine a simple request with the same config for all lines as:
> 
> gpiod_chip_request_lines(chip, req_cfg, line_cfg);
> 
> Where req_cfg configures request-specific options, and line_cfg
> contains the above line config. I'm still not convinced that
> gpiod_request_options is the better name, I think I prefer the
> juxtaposition of the two names: line_config and request_config.
> 

That's ok - I'm pretty sure you'll get there eventually ;-).

> Now how do we pass a composite line config with overridden values in C
> without interfaces etc.?
>

As above, the req_cfg is the composite line config, so

req = gpiod_chip_request_lines(chip, req_options, req_cfg);

Or if you were to merge the request config, and even the options, into the
request:

unsigned int lines[] = { 0, 4, 12, 54 }, num_lines = 4;
req = gpiod_line_request_new(num_lines, lines); // also variadic forms??
// call req option and config mutators here...
gpiod_line_request_set_active_low(req);
gpiod_line_request_set_output(req, 1);
gpiod_line_request_set_line_input(req, 12);
gpiod_line_request_set_event_buffer_size(req, 42);
...
// then actually request the lines...
err = gpiod_chip_request_lines(chip, req);

which may error for various reasons, such as lines already being
requested or overly complex config.

Merging everything into the request means fewer opaque objects and
interactions for the user to have to deal with, which is always a good
thing.
The downside is that changes to options and config, such as the
gpiod_line_request_set_active_low() etc here, are not applied until
either the gpiod_chip_request_lines() or the set_config() call, which
could be confusing.  Though the more I think about it the more I think
the resulting simplification of the API wins out.  i.e. these objects:

struct gpiod_line_attr;
struct gpiod_line_config;
struct gpiod_request_config;
struct gpiod_request_handle;

all get collapsed into:

struct gpiod_line_request;

which significantly reduces the cognitive load on the user.

The set_config() would probably be called something like:

err = gpiod_line_request_reconfigure(req)

to distinguish it from the mutators which use the _set_ naming.
(and it would also align with my Go library ;-)

> One idea I have is to add a new object called struct
> gpiod_line_config_ext (for extended) that would take one primary
> config and an arbitrary number of secondary configs with the following
> example use-case:
> 
> struct gpiod_line_config_ext *ext_cfg = gpiod_line_config_ext_new();
> unsigned int offsets[] = { 2, 3 };
> 
> /* Add the default config for this request. */
> gpiod_line_config_ext_set_primary_config(ext_cfg, line_cfg);
> /* Add a secondary config for 2 lines with offsets: 2 and 3. */
> gpiod_line_config_ext_add_secondary_config(ext_cfg, other_line_cfg, 2, offsets);
> 
> gpiod_chip_request_lines_ext(chip, req_cfg, ext_cfg);
> 

Please, no _ext objects - that is an admission of failure right there.

> Does this make sense? I'm worried about the resource management here.
> Who should be responsible for freeing the config structures? Should
> the extended config take ownership? Should the user remain
> responsible? Back to reference counting for these objects? Is this
> even a good idea?
> 

The user is responsible for freeing the request config.
The request config is responsible for freeing the line configs, if there
are any - the user isn't even aware of them so they obviously can't.

Similarly if you merge the config into the request.

> Please let me know what you think, I could use some advice.

Hopefully I've communicated my meaning a little more clearly this time?

Cheers,
Kent.

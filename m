Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AB3367DA3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 11:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhDVJZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 05:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbhDVJZV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Apr 2021 05:25:21 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAF7C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 22 Apr 2021 02:24:46 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id n2so67705138ejy.7
        for <linux-gpio@vger.kernel.org>; Thu, 22 Apr 2021 02:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2e81hEXv+K5YgcGK4vhRop3HpjP39vbI5rgWVmdpJHE=;
        b=xUBv0MbBd71h9+FMRAOKxqO2/McJH33SGofAmZtW1RIRHFrHDj4QKyh4qassRYay07
         n+0xRergqCt0hLPzurSZeSGwbBuWz8Fs67SXHhyNKerISw3swg5ckyhji3jwy5hHLXHF
         77tcoqTgtQ1IKzLRSrOBrggFL6hR4pgA3Q6X4HsVCltmjPViyPTKyuswHJkuRcnEeFGh
         wiUkQhaB02UegbkE0wI6SerQ5ZhmH4f/MtyYAGKvl+0cISnF0YtRqBjX5IVZevEwNjsv
         YXqXYPWHP7lKuq4W9nKDXrZb8weHhN2dnkIymHOI597FLtcvr6Gjm5r7brCXWOCkqama
         +suQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2e81hEXv+K5YgcGK4vhRop3HpjP39vbI5rgWVmdpJHE=;
        b=nhcml2RuK5RkYBqCKG9ov9XBrYBxQZ/OtKWSqXqYbSgmjgOCJB8EoF66jcsZIF0AfD
         adL2iKA/Q/lmA9voYCv1Cn5VWyd+a9066PVk9Wz/v7PVC/BivJJvUTVFBd6Y36pEBEkR
         cIjYD0QEHNZ/3h9k5QMZcIjv1sR7EosxuGlmCpO837ml0wr2P7rwj01crI0WO+4/fORX
         r0u0zr9um8+4HnXlGWTiyVi+4/SKZ7ktR+OcZMeHWIPyoq416J1/gUNippBOjaY5HYRd
         bHlAMuwhYesSyuJgE8vWnTP5enM/rbIzMxJMerPzGQ45U+PdzP448SvWrNHyY5Enrcs3
         9zlg==
X-Gm-Message-State: AOAM532clEl4mGPRJ7lPY3UjXr5+lbEYNDonLm3XhhJ6bq5xGQbP0qhG
        1rJEs1387ILDbr/AsXBqPE2Rqap71tifscryVYVro0HFvV7/+378
X-Google-Smtp-Source: ABdhPJwVrQlLzwAtN8QUV1/ovUblmo5bM0l4TaCej2cHmDjkoVeJcpiWdthoH1GtKZ8JDMfu//CafVBzuULRt8zIE5E=
X-Received: by 2002:a17:906:1313:: with SMTP id w19mr2339303ejb.64.1619083484897;
 Thu, 22 Apr 2021 02:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210410145157.30718-1-brgl@bgdev.pl> <20210414141534.GA20266@sol>
 <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
 <20210417072326.GA12853@sol> <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
 <20210418034810.GA9261@sol> <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
 <20210419011746.GA4766@sol> <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
 <20210422023206.GA4994@sol>
In-Reply-To: <20210422023206.GA4994@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Apr 2021 11:24:34 +0200
Message-ID: <CAMRc=Mfa2BbQx+C59vzeZ_JSLonFYVvfJhA8SuQbV2aGuvR9Ow@mail.gmail.com>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 4:32 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Apr 21, 2021 at 10:04:04PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Apr 19, 2021 at 3:17 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> > [snip -> long discussion on the libgpiod C API]
> >
> > Hi Kent,
> >
> > I was working on the next iteration of the code and I'm struggling
> > with the implementation of some elements without the concept of
> > attributes.
> >
> > So I initially liked the idea of variadic functions but they won't
> > work for language bindings so that's a no go. On that note: I wanted
> > to get some inspiration from your go library but your elegant API
> > makes use of go features (like interfaces) we don't have in C.
> >
>
> It is the functional options that is the big difference between my Go
> implementation and what I would do in C.  I happen to use interfaces to
> implement those options.  You could do something similar in C (cos what
> can't you do in C) but it would be weird, so lets not go there.
>
> You can still provide the variadic forms for C users.
> And couldn't the language bindings use the "v" variant, as libabc
> suggests?:
>
> "Be careful with variadic functions
>   - It's great if you provide them, but you must accompany them with
>     "v" variants (i.e. functions taking a va_arg object), and provide
>     non-variadic variants as well. This is important to get language
>     wrappers right."
>

The "v" functions do nothing for language bindings - you can't
construct the required va_list out of thin air. What you do usually is
this (example taken from GLib):

gpointer
g_object_new(GType object_type,
             const gchar *first_property_name,
             ...);

has a non-variadic counterpart:

GObject *
g_object_new_with_properties(GType object_type,
                             guint n_properties,
                             const char *names[],
                             const GValue values[]);

I would prefer to simply not do variadic functions. The low-level API
should in general be wrapped in high-level languages. Most people that
mail me on libgpiod seem to use Python anyway.

> > The problem we have is basically about implementing primary and
> > secondary line configuration objects - where the primary contains the
> > default config for all requested lines and the secondary can override
> > certain config options (should zeroed values for enumerated types mean
> > - don't override?) for certain lines.
> >
>
> Yep, use the 0 value to mean "defaulted".
> For the secondary that means use the primary value.
> For the primary that means use the kernel default, so the primary is
> initialised with the kernel defaults.
>
> Note that accessors, if provided, generally wouldn't return the 0 value to
> the user - they follow the secondary -> primary chain and return the
> effective setting.
>
> > The basic line config structure (let's call it struct
> > gpiod_line_config) can be very simple and have the following mutators:
> >
>
> This is where you are immediately off into the weeds, so I obviously
> didn't communicate my suggestion very well...
> .
> The opaque config object presented to the user is not the simple line
> config object - it is the container for the whole request config (which
> is different from the request options - which is exactly why I would like
> the options not to be called request_config).
>
> The user never sees the simple line config, which is internal, only the
> request config.
> The accessors always work on the request config at attribute level, and
> there is never a need to apply or return the whole config for a particular
> line. You could - but it is not necessary for core functionality, so for
> now don't.
>
> I realise this makes the internal modelling of config much more
> complicated, but the goal is to provide a simplified interface for the
> user - so it should be expected that the majority of the complexity will
> end up in the library rather than user code.
>

Yeah, I understood this alright but I figured that this will bloat the
library interface with three variants of mutators per every config
option (or more if we provide two functions for direction and active
level) more than having simpler config objects and applying them
globally or per line.

> In my Go implementation I merge the request config into the request
> object itself. You could also do that, though the semantics might be
> clearer if you keep them separate (more on that later).
>

My goal was to logically split the config into elements that can be
reconfigured and those that cannot. More on that later.

> > struct gpiod_line_config *cfg = gpiod_line_config_new();
> >
> > gpiod_line_config_set_active_low(cfg, true);
>
> I would provide two functions for active level - set_active_high() and
> set_active_low().  Even if you don't, the function here should be
> set_active_level(), in case you want to add them later.
>
> > gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_OUTPUT);
> >
>
> That is the A case, i.e. the whole request.  How would you name the B
> and C cases?
>
> _set_<attr>_line and _set_<attr>_lines?
>
> or _set_line_<attr> and _set_lines_<attr>?
>
> or something else?
>

These are what I had in mind and also: _offset and _offsets.

> It might be worthwhile providing separate set_input() and
> set_output() functions - as the output case requires the initial value.
> You could have the user call set_output_values(), but why force them to
> make another call?
>
> > and so on for for drive, bias, edge, debounce, realtime clock.
> >
> > Output values would be set like this:
> >
> > unsigned int values[] = { 0, 1, 1, 0 }, num_lines = 4;
> > gpiod_line_config_set_output_values(cfg, num_lines, values);
> >
>
> I don't like the implicit identification of lines based on request
> ordering here.  I realise my Go API does that, but that is an option to
> the request itself, so the requested lines are also present and visible
> to the casual reader, whereas this is a standalone call.
>
> So it should require the list of lines that you are setting the values
> for. i.e. it is the mutator for a subset of lines, so the C case.
>
> And it implicitly sets those lines to outputs, so it can be more clearly
> named set_output(value) (that is the A case, btw).
>

I can imagine the B case like:

gpiod_line_config_set_output_value(config, offset, value);

But how would exactly the call for the A case look like? Two arrays
with offset -> value mapping?

unsigned int offsets[] = { 0, 2, 5 }, values[] = { 0, 1 ,1 };
gpiod_line_config_set_output_values_offsets(config, 3, offsets, values);

?

> > One can imagine a simple request with the same config for all lines as:
> >
> > gpiod_chip_request_lines(chip, req_cfg, line_cfg);
> >
> > Where req_cfg configures request-specific options, and line_cfg
> > contains the above line config. I'm still not convinced that
> > gpiod_request_options is the better name, I think I prefer the
> > juxtaposition of the two names: line_config and request_config.
> >
>
> That's ok - I'm pretty sure you'll get there eventually ;-).
>
> > Now how do we pass a composite line config with overridden values in C
> > without interfaces etc.?
> >
>
> As above, the req_cfg is the composite line config, so
>
> req = gpiod_chip_request_lines(chip, req_options, req_cfg);
>
> Or if you were to merge the request config, and even the options, into the
> request:
>
> unsigned int lines[] = { 0, 4, 12, 54 }, num_lines = 4;
> req = gpiod_line_request_new(num_lines, lines); // also variadic forms??
> // call req option and config mutators here...
> gpiod_line_request_set_active_low(req);
> gpiod_line_request_set_output(req, 1);
> gpiod_line_request_set_line_input(req, 12);
> gpiod_line_request_set_event_buffer_size(req, 42);
> ...
> // then actually request the lines...
> err = gpiod_chip_request_lines(chip, req);
>
> which may error for various reasons, such as lines already being
> requested or overly complex config.
>
> Merging everything into the request means fewer opaque objects and
> interactions for the user to have to deal with, which is always a good
> thing.
> The downside is that changes to options and config, such as the
> gpiod_line_request_set_active_low() etc here, are not applied until
> either the gpiod_chip_request_lines() or the set_config() call, which
> could be confusing.  Though the more I think about it the more I think
> the resulting simplification of the API wins out.  i.e. these objects:
>
> struct gpiod_line_attr;
> struct gpiod_line_config;
> struct gpiod_request_config;
> struct gpiod_request_handle;
>
> all get collapsed into:
>
> struct gpiod_line_request;
>
> which significantly reduces the cognitive load on the user.
>
> The set_config() would probably be called something like:
>
> err = gpiod_line_request_reconfigure(req)
>

This lack of splitting of options into configurable and constant ones
visually suggests that you can change all request options later on
which is not true. I think that at least for the C API, we should
split the responsibilities of objects and keep the division into
request config, line config *and* the line handle whose lifetime is
from the moment the lines get requested until they're released.

> to distinguish it from the mutators which use the _set_ naming.
> (and it would also align with my Go library ;-)
>
> > One idea I have is to add a new object called struct
> > gpiod_line_config_ext (for extended) that would take one primary
> > config and an arbitrary number of secondary configs with the following
> > example use-case:
> >
> > struct gpiod_line_config_ext *ext_cfg = gpiod_line_config_ext_new();
> > unsigned int offsets[] = { 2, 3 };
> >
> > /* Add the default config for this request. */
> > gpiod_line_config_ext_set_primary_config(ext_cfg, line_cfg);
> > /* Add a secondary config for 2 lines with offsets: 2 and 3. */
> > gpiod_line_config_ext_add_secondary_config(ext_cfg, other_line_cfg, 2, offsets);
> >
> > gpiod_chip_request_lines_ext(chip, req_cfg, ext_cfg);
> >
>
> Please, no _ext objects - that is an admission of failure right there.
>

I wanted to protest but then realized that if you need _ext interfaces
then it means your non-extended, initial design is already flawed. :)

Ok so let's try again.

How about:

Three structs:

struct gpiod_line_config;
struct gpiod_request_config;
struct gpiod_line_request;

The first one holds the composite of primary and secondary configs and
is modified using mutators according to this scheme:

gpiod_line_config_set_<attr>(config, attr);
gpiod_line_config_set_<attr>_offset(config, attr, offset);
gpiod_line_config_set_<attr>_offsets(config, attr, num_offsets, offsets);

With notable exceptions for:

gpiod_line_config_set_[input|active_low|active_high](config);
gpiod_line_config_set_[input|active_low|active_high]_offset(config, offset);
gpiod_line_config_set_[input|active_low|active_high]_offsets(config,
num_offsets, offsets);

and:

gpiod_line_config_set_output(config, num_lines, offsets, values);
gpiod_line_config_set_output_offset(config, offset, value);

The request function takes a single line config and a request config
and returns a new gpiod_line_request like in the first iteration.

Then the lines can be set like this:

// num_lines refers to the number of lines to set, not the number of
// lines in the request
gpiod_line_request_set_values(req, num_lines, offsets, values);

Bartosz

> > Does this make sense? I'm worried about the resource management here.
> > Who should be responsible for freeing the config structures? Should
> > the extended config take ownership? Should the user remain
> > responsible? Back to reference counting for these objects? Is this
> > even a good idea?
> >
>
> The user is responsible for freeing the request config.
> The request config is responsible for freeing the line configs, if there
> are any - the user isn't even aware of them so they obviously can't.
>
> Similarly if you merge the config into the request.
>
> > Please let me know what you think, I could use some advice.
>
> Hopefully I've communicated my meaning a little more clearly this time?
>
> Cheers,
> Kent.

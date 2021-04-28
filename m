Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DFE36D4A6
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 11:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237685AbhD1JUD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 05:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhD1JUC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Apr 2021 05:20:02 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1898C061574
        for <linux-gpio@vger.kernel.org>; Wed, 28 Apr 2021 02:19:17 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id h10so73310761edt.13
        for <linux-gpio@vger.kernel.org>; Wed, 28 Apr 2021 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ainBN4NoEbxjWR/87fxy5DFTHYrIGA8yKNuZfwdF5Dk=;
        b=ChNEBhYXa60xuaBUGpZAx4wmJQ/lJVyWCPRnNQqJq7+SVDkOHFLFezI8z2yQu++y1n
         imCgAkLCyb495MIEYZR04LZQuTDwJw0ovCRkNx1Jw5UirDYJi4Vc0ag7zJ2VasZNPEHC
         uNYRegW81EztrJbH7H2yLoJLriIK+KQ7dhNIP9QrOx86yY6t8xuio7omPKcr5Lk4NvCc
         kDIgWn01iTkjvo/yRJdGnb9RI3S9/twSi8nFhmJ2Ne67rW0LAXo1NrzX0/wGDJ/riFBu
         ZpDVgGZ4k0clCwNd9WzTBkSCbzNarwJZr6cxWHCCNuJMogWIYHqjIVEeSitFi0oDF1CD
         LWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ainBN4NoEbxjWR/87fxy5DFTHYrIGA8yKNuZfwdF5Dk=;
        b=WZrrlbswNIL6jWzUeryXnljFdoSgKtbs4m5JeiIkzOM9CLbWGGOtTfjq4w7f9CFqhk
         rLGRGhYiCFDVlU0URc7B8V7t6+UNWAJ9bkRA9Plf1uN7h9jXrqdeVds2oVRDLS6TTqWu
         OEGsS3rK2haISEZMwQb7NeURwvLnhQksWG1LeR2I90M//yyOUmgpyGfpcq4bF/YDqQuU
         7oDot91shdqT6X3mVtw8dtO1YH8a0uZLVIDEjFDW0qBVYbfqKo29gNoqli/caG6HRvKQ
         3qwr7uKlMEtjx5/elujm52CY32J1Y0j2MAVenAI7aPs522/8RJ2JVnjMSwYSlPxGSSud
         NjNQ==
X-Gm-Message-State: AOAM532m44IuQI18h1B+5Gz8mBsNFSFlcAZ1i1w2NR5F4Hit829V/RYt
        n5cbSWCetPKfjYlexb8n1FwRY/HU4Qy8AOMarcin7Wkyns4=
X-Google-Smtp-Source: ABdhPJxO+yFWNH3yGegDEJlbAhYyh4LqFKuUgpfzHbelyVEfpsgHWnEM4GnBTbZVv2pCSZaLSUCIBK0lyCPwI5ZJp5c=
X-Received: by 2002:aa7:d14e:: with SMTP id r14mr9688603edo.119.1619601556387;
 Wed, 28 Apr 2021 02:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210414141534.GA20266@sol> <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
 <20210417072326.GA12853@sol> <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
 <20210418034810.GA9261@sol> <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
 <20210419011746.GA4766@sol> <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
 <20210422023206.GA4994@sol> <CAMRc=Mfa2BbQx+C59vzeZ_JSLonFYVvfJhA8SuQbV2aGuvR9Ow@mail.gmail.com>
 <20210423013855.GA7321@sol>
In-Reply-To: <20210423013855.GA7321@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Apr 2021 11:19:05 +0200
Message-ID: <CAMRc=MfqshaNAZ653rOX1egyaiyC_LJhenskA8Zvq0YQSFOjYA@mail.gmail.com>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 23, 2021 at 3:39 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

>
> > > So it should require the list of lines that you are setting the values
> > > for. i.e. it is the mutator for a subset of lines, so the C case.
> > >
> > > And it implicitly sets those lines to outputs, so it can be more clearly
> > > named set_output(value) (that is the A case, btw).
> > >
> >
> > I can imagine the B case like:
> >
> > gpiod_line_config_set_output_value(config, offset, value);
> >
> > But how would exactly the call for the A case look like? Two arrays
> > with offset -> value mapping?
> >
>
> No - the A case sets ALL lines to one value.

Apart from a single line request - what could possibly be the use-case for that?

> B is one line to one value.
> C is a set of lines to one value.

This makes a bit more sense but ...

>
> A set of lines to a set of values is a new case.
> And yes - two arrays as per your set_values() below.
>

... to me this and B are the most sensible options. Do we really need
A & C for line reading and setting? Do you find use for that in your
Go lib?

> > unsigned int offsets[] = { 0, 2, 5 }, values[] = { 0, 1 ,1 };
> > gpiod_line_config_set_output_values_offsets(config, 3, offsets, values);
> >
> > ?
> >
> > > > One can imagine a simple request with the same config for all lines as:
> > > >
> > > > gpiod_chip_request_lines(chip, req_cfg, line_cfg);
> > > >
> > > > Where req_cfg configures request-specific options, and line_cfg
> > > > contains the above line config. I'm still not convinced that
> > > > gpiod_request_options is the better name, I think I prefer the
> > > > juxtaposition of the two names: line_config and request_config.
> > > >
> > >
> > > That's ok - I'm pretty sure you'll get there eventually ;-).
> > >
> > > > Now how do we pass a composite line config with overridden values in C
> > > > without interfaces etc.?
> > > >
> > >
> > > As above, the req_cfg is the composite line config, so
> > >
> > > req = gpiod_chip_request_lines(chip, req_options, req_cfg);
> > >
> > > Or if you were to merge the request config, and even the options, into the
> > > request:
> > >
> > > unsigned int lines[] = { 0, 4, 12, 54 }, num_lines = 4;
> > > req = gpiod_line_request_new(num_lines, lines); // also variadic forms??
> > > // call req option and config mutators here...
> > > gpiod_line_request_set_active_low(req);
> > > gpiod_line_request_set_output(req, 1);
> > > gpiod_line_request_set_line_input(req, 12);
> > > gpiod_line_request_set_event_buffer_size(req, 42);
> > > ...
> > > // then actually request the lines...
> > > err = gpiod_chip_request_lines(chip, req);
> > >
> > > which may error for various reasons, such as lines already being
> > > requested or overly complex config.
> > >
> > > Merging everything into the request means fewer opaque objects and
> > > interactions for the user to have to deal with, which is always a good
> > > thing.
> > > The downside is that changes to options and config, such as the
> > > gpiod_line_request_set_active_low() etc here, are not applied until
> > > either the gpiod_chip_request_lines() or the set_config() call, which
> > > could be confusing.  Though the more I think about it the more I think
> > > the resulting simplification of the API wins out.  i.e. these objects:
> > >
> > > struct gpiod_line_attr;
> > > struct gpiod_line_config;
> > > struct gpiod_request_config;
> > > struct gpiod_request_handle;
> > >
> > > all get collapsed into:
> > >
> > > struct gpiod_line_request;
> > >
> > > which significantly reduces the cognitive load on the user.
> > >
> > > The set_config() would probably be called something like:
> > >
> > > err = gpiod_line_request_reconfigure(req)
> > >
> >
> > This lack of splitting of options into configurable and constant ones
> > visually suggests that you can change all request options later on
> > which is not true.
>
> Yup, as I said, the semantics for the unified object are more confusing.
>
> In the Go implementation, the request options can be passed to the
> request_lines(), but not the set_config(), cos interfaces.
>
> There is no good way to flag that in C at compile time. For a runtime
> check you could add a return code to the option mutators and return an
> error if the lines have already been requested.
>

I agree that it doesn't map well to C and this is why I think it would
be less confusing if we went with two structs instead.

> > I think that at least for the C API, we should
> > split the responsibilities of objects and keep the division into
> > request config, line config *and* the line handle whose lifetime is
> > from the moment the lines get requested until they're released.
> >
> > > to distinguish it from the mutators which use the _set_ naming.
> > > (and it would also align with my Go library ;-)
> > >
> > > > One idea I have is to add a new object called struct
> > > > gpiod_line_config_ext (for extended) that would take one primary
> > > > config and an arbitrary number of secondary configs with the following
> > > > example use-case:
> > > >
> > > > struct gpiod_line_config_ext *ext_cfg = gpiod_line_config_ext_new();
> > > > unsigned int offsets[] = { 2, 3 };
> > > >
> > > > /* Add the default config for this request. */
> > > > gpiod_line_config_ext_set_primary_config(ext_cfg, line_cfg);
> > > > /* Add a secondary config for 2 lines with offsets: 2 and 3. */
> > > > gpiod_line_config_ext_add_secondary_config(ext_cfg, other_line_cfg, 2, offsets);
> > > >
> > > > gpiod_chip_request_lines_ext(chip, req_cfg, ext_cfg);
> > > >
> > >
> > > Please, no _ext objects - that is an admission of failure right there.
> > >
> >
> > I wanted to protest but then realized that if you need _ext interfaces
> > then it means your non-extended, initial design is already flawed. :)
> >
> > Ok so let's try again.
> >
> > How about:
> >
> > Three structs:
> >
> > struct gpiod_line_config;
> > struct gpiod_request_config;
> > struct gpiod_line_request;
> >
>
> The user manages the lifecycle of all three?

Yes.

>
> I can live with that, though I would probably still lean towards the
> unified object approach - with the option mutators getting return codes.
>
> > The first one holds the composite of primary and secondary configs and
> > is modified using mutators according to this scheme:
> >
>
> Which is why it should be called request_config, not line_config.
> line_config is misleading - it says line but its scope is request.
>

It depends on how you look at it really. Its scope are *the lines* in
the request, not the request itself (unlike the event buffer size or
line offsets). It says line because gpiod_lines_config would look
bizarre.

> And of course request_config should be request_options ;-).

I'm still not there yet.

>
> > gpiod_line_config_set_<attr>(config, attr);
> > gpiod_line_config_set_<attr>_offset(config, attr, offset);
> > gpiod_line_config_set_<attr>_offsets(config, attr, num_offsets, offsets);
> >
>
> I personally prefer the _set_line_<attr> style as it reads better, but I
> can live with this - I know you prefer suffixes for variants.
>
> > With notable exceptions for:
> >
> > gpiod_line_config_set_[input|active_low|active_high](config);
> > gpiod_line_config_set_[input|active_low|active_high]_offset(config, offset);
> > gpiod_line_config_set_[input|active_low|active_high]_offsets(config,
> > num_offsets, offsets);
> >
> > and:
> >
> > gpiod_line_config_set_output(config, num_lines, offsets, values);
> > gpiod_line_config_set_output_offset(config, offset, value);
> >
> > The request function takes a single line config and a request config
> > and returns a new gpiod_line_request like in the first iteration.
> >
>
> Where are the set of requested lines specified?
>

They map the uAPI in that the offsets are set in struct gpiod_request_config:

gpiod_request_config_set_line_offsets(config, num_lines, offsets); :)

or

gpiod_request_options_set_line_offsets(config, num_lines, offsets); :(

> Do null config ptrs result in something useful, but guaranteed harmless,
> such as requesting lines as input?  Or are they required non-null?
>

I normally expect users to pass a valid pointer and don't make the
functions null aware. In this case - it's a good question. I'm
wondering if it is useful at all? The user should IMO specify what
they want to do with the lines? I would lean towards non-null line
configfs.

> > Then the lines can be set like this:
> >
> > // num_lines refers to the number of lines to set, not the number of
> > // lines in the request
> > gpiod_line_request_set_values(req, num_lines, offsets, values);
> >
>
> At first glance that feels a bit odd, being on the request while the
> others all operate on the config, but it maps to the SET_VALUES ioctl(),
> not the SET_CONFIG, so that makes sense.
>
> There is a corresponding get_values(req, num_lines, offsets, values)?
>

Sure, just didn't include it in the example.

> And a reconfigure(req, cfg)?
>

Sure, just haven't decided on the name yet.
gpiod_line_request_reconfigure() would be what you're suggesting but
it sounds like it would reconfigure the request and not modify the
line configuration. I would prefer something closer to
gpiod_line_request_set_line_config() which is as verbose as it gets.
Maybe even gpiod_line_request_change_line_config()? Or
gpiod_line_request_modify_line_config()?

Bartosz

> Cheers,
> Kent.
>

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C290F3EA2F8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 12:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbhHLK3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 06:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234362AbhHLK3p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 06:29:45 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BEBC061765
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 03:29:20 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id n12so6024705plf.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+90VexfNyHZULMV2wCA3eSPej+sGkR7GR7eymjjbFuw=;
        b=pag8QWBSYzY4Cd9ib4o8kvsmYwOsGvCGRFKLCODj2tJUZ1ES45FQ6/q+ypj/Wqt74S
         nG3fHATfvmX60Mq79U2Jvbr1nF25RE2CejD3ak61ZKxihNhOqA4hpePlXSAK7shnE7IQ
         tP+AyI3Ar2brJxMeEalR8mtgcF4r7RenQR0ePlCk16Z6fv7WkH1j6AvwL0N8mYVbAn3m
         a9eiaTaruU3Il1DlKywGAUrwSPS6DHtkoMTWHS3C/hC5BMlvsGXjMMFBDVEvc+8vMaz0
         89ujgA5hl/xzSgQ/BbNqwYzRB4C32vMcL14gil60H133qabjQKvAdqveaBjae9Tg8hYM
         LCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+90VexfNyHZULMV2wCA3eSPej+sGkR7GR7eymjjbFuw=;
        b=XcwtDalI26fH/aungx6RKN5er2s1FPuJkTBFFXoI4aaxalGuJCZ0dFQ9JRns7mjHoc
         UMg32uUI6p0xykhfaW4+mCIMKZYLqoijskIgQTOtPavSwTblFlMjJefSUi9awvptzeUc
         WUL50W0eNw/1iAcVnF2K9sYiiRi2+GwgMxSKHWvaJIRmyp71Club8Z2arUvMLiavruSN
         qCS5Jglsv4zBAFBrGZPv3khqr3pFQR2BppTU4eUGb+WT1Y5iOaVHFNDlKw+vif7k98Lh
         iht/r4geR0RrgEROzHRV4IbBsbBhN1vnHGzIifdAhBDGXdRpNvOTjL/fkQPABbWAWz6V
         7VUw==
X-Gm-Message-State: AOAM533n1L/VLbNwjeUQ7Q8qG+2J4bhT1qgmuszw6yMUVrYHZAIDCtGU
        +cGB84u9+k+oYTh7YjhGDug=
X-Google-Smtp-Source: ABdhPJyQCbB8E3lCkIHU6v1S2umBSuxjSYThBQ4uxF5A9PLo2TAz7IeiuAFPZgh05YXgH8+vDKSrFw==
X-Received: by 2002:a65:450c:: with SMTP id n12mr3231535pgq.316.1628764160010;
        Thu, 12 Aug 2021 03:29:20 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id 11sm3052730pgh.52.2021.08.12.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 03:29:19 -0700 (PDT)
Date:   Thu, 12 Aug 2021 18:29:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210812102913.GA21938@sol>
References: <20210806132810.23556-1-brgl@bgdev.pl>
 <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol>
 <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol>
 <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 09:24:28AM +0200, Bartosz Golaszewski wrote:
> On Tue, Aug 10, 2021 at 12:31 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Aug 10, 2021 at 09:52:04AM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Aug 9, 2021 at 1:10 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Sun, Aug 08, 2021 at 09:11:14PM +0200, Bartosz Golaszewski wrote:
> > > > > On Sat, Aug 7, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Aug 06, 2021 at 03:28:10PM +0200, Bartosz Golaszewski wrote:
> > > > > > > Kent suggested that we may want to add getters for the config objects in
> > > > > > > his reviews under the C++ patches. Indeed when working on Python bindings
> > > > > > > I noticed it would be useful for implementing __str__ and __repr__
> > > > > > > callbacks. In C++ too we could use them for overloading stream operators.
> > > > > > >
> > > > > > > This extends the config objects with getters. They are straightforward for
> > > > > > > the request config but for the line config, they allow to only read
> > > > > > > per-offset values that would be used if the object was used in a request
> > > > > > > at this moment. We also add getters for the output values: both taking
> > > > > > > the line offset as argument as well as ones that take the index and allow
> > > > > > > to iterate over all configured output values.
> > > > > > >
> > > > > > > The sanitization of input for the getters has subsequently been changed
> > > > > > > so that we never return invalid values. The input values are verified
> > > > > > > immediately and if an invalid value is passed, it's silently replaced
> > > > > > > by the default value for given setting.
> > > > > > >
> > > > > > > This patch also adds the reset function for the line config object - it
> > > > > > > can be used to reset all stored configuration if - for example - the
> > > > > > > config has become too complex.
> > > > > > >
> > > > > > > As this patch will be squashed into the big v2 patch anyway, I allowed
> > > > > > > myself to include some additional changes: some variable renames and
> > > > > > > other minor tweaks.
> > > > > > >
> > > > > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > > > >
> > > > > > A few minor nit-picks in the gpiod.h documentation below...
> > > > > >
> > > > > > Cheers,
> > > > > > Kent.
> > > > > >
> > > > >
> > > > > Thanks,
> > > > >
> > > > > With that fixed, do you think it's good to be applied?
> > > > >
> > > >
> > > > Sure.
> > > >
> > > > I was also wondering if anything could be done to simplify the
> > > > structures in line-config.c, but that isn't specific to this patch.
> > > > Not having access to the offsets, or even num_lines, and doing the
> > > > allocation up-front makes it rather painful.  Especially if the most
> > > > common case is only one or two lines.
> > > > But, as long as you are happy with the external API, that is just
> > > > implementation detail that can be optimised later.
> > > >
> > > > Cheers,
> > > > Kent.
> > >
> > > I'm fine with how it works now for most part. I understand your
> > > concerns about splitting the output value configuration from the
> > > requested offsets but I think we can live with it. If anything: we can
> > > add a function to set an array of output values in line_config where
> > > the offsets would be assigned automatically based on the index in the
> > > array. Something like this:
> > >
> > > int values[] = { 0, 0, 1, 1, 0, 1 };
> > > unsigned int offsets[] = { 0, 3, 4, 7, 12, 13 };
> > >
> > > gpiod_line_config_set_output_values_auto(line_cfg, 6, values);
> > > gpiod_request_config_set_offsets(req_cfg, 6, offsets);
> > >
> > > request = gpiod_chip_request_lines(chip, line_cfg, req_cfg);
> > >
> > > This would result in the following mapping: 0 -> 0, 3 -> 0, 4 -> 1, 7
> > > -> 1, 12 -> 0, 13 -> 1.
> > >
> > > We could store the auto array as a separate array in line_config and
> > > the offset -> value mappings would take precedence. For
> > > reconfiguration we would do the same. Does this make sense?
> > >
> >
> > My preference would be for gpiod_line_config_set_output_value() and
> > variants to also set the direction for those lines to output.
> > And maybe rename it to gpiod_line_config_set_output().
> > And maybe add a set_input for symmetry.
> >
> 
> Any naming idea for setting the direction to "AS_IS"?
> 

Since as-is is vague you need to include the field name.
So I would remove set_direction and replace it with set_input, set_output
and set_direction_as_is (which I would expect to see used very rarely in
the wild, as the only use case I can think of for it is undoing a
set_input or set_output call).

> > But my concern above was actually the secondary array - that confused me.
> > And it's big - always. (OTOH it's on the heap so who cares?)
> > The array is of size GPIO_V2_LINE_NUM_ATTRS_MAX, yet each entry could
> > have multiple attributes set - so long as the offsets subsets match?
> > What happens if both debounce and flags are set for the same subset?
> > Looks like debounce wins and the flags get discarded in
> > gpiod_line_config_to_kernel().
> >
> 
> Yeah, I aimed at ironing it out when writing tests. You're probably right here.
> 

Same reason I hadn't paid much attention to the implementation.

> > What I had in mind for the config was an array of config for each line,
> > only performing the mapping to uAPI when the actual request or
> > reconfigure is performed, though that requires knowledge of the number
> > of lines in the request to be sized efficiently in the
> > gpiod_line_config_new().  Sizing it as GPIO_V2_LINES_MAX would be even
> > worse than your secondary array, so don't want that.
> 
> Or would it? Currently the full config structure is 3784 bytes on a 64
> bit arch. The base config is 32 bytes. If we added the default value
> to base_config that would make it 36 bytes x GPIO_V2_LINES_MAX = 2304
> bytes. We'd need another base_config for default settings.
> 
> Unless I'm missing something this does seem like the better option.
> 

Yikes, I overlooked the size of the offsets array in the secondary
config - that is a significant contributor to the config size as well.
For some reason I was thinking that was a bitmap, but that couldn't work.

In that case a GPIO_V2_LINES_MAX sized array is clearly a better way to
go, and that is a surprise.
Though those array elements will require the line offset as well as the
base_config, unless you have some other way to map offset to config?

> > My Go library uses a map, but that isn't an option here.
> > Resizing it dynamically is the option I was last pondering,
> > but my preference would be to add a num_lines parameter to the new.
> > Anyway, that was what I was wondering about...
> >
> 
> We could resize the array dynamically but we'd need to return error
> codes from getters.

Why? If there is no config for the requested line then you return the
global default value, right?
Why does that change if the array is resizable?
Btw, I'm assuming that the gpiod_line_config would contain a pointer to
the dynamic array, so the handle the user has would remain unchanged.
And the getters all return ints, not pointers to internal fields.
What am I missing?

Also, "global default value" is different from the primary, right?
Perhaps getters should return the primary value, which itself defaults
to the global defaults, if the line doesn't have specific config?

> We could also define the size when allocating the
> config but it's a sub-par approach too.
> 

Sure, it's a trade-off, but the alternative is requiring a 2-3k block
even for a one line request, which seems a wee bit excessive.

With the proposed API, the only other alternative I can see to give a
small footprint is dynamic resizing, which I'm not thrilled by either.
So just wanted to double check that you are content to lock in the
gpiod_line_config_new API, as that will constrain any optimisation later
on.

Cheers,
Kent.

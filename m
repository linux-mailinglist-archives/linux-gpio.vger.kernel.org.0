Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371D0370003
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 19:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhD3RxG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 13:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhD3RxG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 13:53:06 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670B4C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 10:52:17 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id j28so19580169edy.9
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Q/ObjJ04rS9N38sD7hDAvKkdcNclOZWSIkdfCaYrYU=;
        b=VPOSg1YAaO8y5TZyWuyoF++G84y6Oak7wHy3X8RpmY4ZUbW28A+TNO799ytASd1sCA
         U/P5uhNoxwKvE1QjoCikt2/nRT22iVtoQsr98Q5vFlr32gtNN75zL1TIHJcduuD0f7am
         svy4hXRat5I/3l6yzEVZrGB3T2hPOfxRoLqsWyOgS4pPD2eJBWkU0c8/SgnPDeH/VcgU
         8fhxZzx8h7JoTdk/gmQogiqeQkIUt4PjOML27Rd8k6ZzuwGYDslVKB/qpw1Ftj3X0UE7
         Y81VrqVyPw/vYwGVVqJAi2S0RczHBNp5EOGlJpWgrFDmSzR2ZiujYGhq3YPIP5S7M7mg
         Od4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Q/ObjJ04rS9N38sD7hDAvKkdcNclOZWSIkdfCaYrYU=;
        b=uUDVrYaKi3hxlExqxH9vkEhjFHA1v3bMQtq8ARhzQW9BZIx0Le8CaR2xBciEQ9EGue
         VSYnjM66CFXhEVw7s2/0qqOYi0CwhvsNzEDtIrniGaCqP74JyQ+lXhZJo4aa1tnbbJqZ
         SeSri7dp1sFCdpyhdA1GgqBw1ITFL7hpCgr4Fb7BrBrzO3fCJf/MSCrR7xE8WQKE4uAT
         wuw+Hq1x5ZZYBJJJyn5pFQPs0H6C2BPpDmtMpl2HuMh8XF+f7FwUsSufambpnWnVnixq
         /EIYOsbg94PrVxZ65NhoPc14fBDr9P2M+mKicEaiCn5SpjX7rRjdDYXTXbhJSx0zsigB
         4dOw==
X-Gm-Message-State: AOAM53064f0TWVBxm7jpDntZLyDl5gl0xWo+ZBVufUdy1LE8oSu7pbiR
        ev4UdfeEcRyYx3r1NTDS3Oumu1SjtG6S7mcaOAcjMg==
X-Google-Smtp-Source: ABdhPJxKx9M52u2RjOYpHJZQnJAh5PSbV5aec7i4oyvtYTsMkGmSgY9r3ys6vxIF3jZRasC+QdIfiqk2uE0ofyAN5xM=
X-Received: by 2002:aa7:d14e:: with SMTP id r14mr7351632edo.119.1619805136080;
 Fri, 30 Apr 2021 10:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210417072326.GA12853@sol> <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
 <20210418034810.GA9261@sol> <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
 <20210419011746.GA4766@sol> <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
 <20210422023206.GA4994@sol> <CAMRc=Mfa2BbQx+C59vzeZ_JSLonFYVvfJhA8SuQbV2aGuvR9Ow@mail.gmail.com>
 <20210423013855.GA7321@sol> <CAMRc=MfqshaNAZ653rOX1egyaiyC_LJhenskA8Zvq0YQSFOjYA@mail.gmail.com>
 <20210428103449.GA22814@sol>
In-Reply-To: <20210428103449.GA22814@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Apr 2021 19:52:05 +0200
Message-ID: <CAMRc=Mdg2+02CU3fhtzpG4wCVeFM9RK2tKovVKzct1JTTnewoA@mail.gmail.com>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 28, 2021 at 12:34 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Apr 28, 2021 at 11:19:05AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Apr 23, 2021 at 3:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> > [snip]
> >
> > >
> > > > > So it should require the list of lines that you are setting the values
> > > > > for. i.e. it is the mutator for a subset of lines, so the C case.
> > > > >
> > > > > And it implicitly sets those lines to outputs, so it can be more clearly
> > > > > named set_output(value) (that is the A case, btw).
> > > > >
> > > >
> > > > I can imagine the B case like:
> > > >
> > > > gpiod_line_config_set_output_value(config, offset, value);
> > > >
> > > > But how would exactly the call for the A case look like? Two arrays
> > > > with offset -> value mapping?
> > > >
> > >
> > > No - the A case sets ALL lines to one value.
> >
> > Apart from a single line request - what could possibly be the use-case for that?
> >
>
> The A, B, C nomenclature originated for attributes, for which blanket
> sets (A) make more sense.
>
> The case for using A for outputs would be if the vast majority of your
> lines default to one value.  You would then only have to use the other
> (B, C or whatever) for the non-default lines.
>
> > > B is one line to one value.
> > > C is a set of lines to one value.
> >
> > This makes a bit more sense but ...
> >
> > >
> > > A set of lines to a set of values is a new case.
> > > And yes - two arrays as per your set_values() below.
> > >
>
> For future reference, lets call this case D.
>
> >
> > ... to me this and B are the most sensible options. Do we really need
> > A & C for line reading and setting? Do you find use for that in your
> > Go lib?
> >
>
> No need for all four - two would be sufficient - probably B and D as you
> suggest.
>

Agreed.

[snip]

> > > >
> > > > This lack of splitting of options into configurable and constant ones
> > > > visually suggests that you can change all request options later on
> > > > which is not true.
> > >
> > > Yup, as I said, the semantics for the unified object are more confusing.
> > >
> > > In the Go implementation, the request options can be passed to the
> > > request_lines(), but not the set_config(), cos interfaces.
> > >
> > > There is no good way to flag that in C at compile time. For a runtime
> > > check you could add a return code to the option mutators and return an
> > > error if the lines have already been requested.
> > >
> >
> > I agree that it doesn't map well to C and this is why I think it would
> > be less confusing if we went with two structs instead.
> >
>
> I know.
>
> My concern is that the simplest get use case is 7 function calls:
> 1. create request_config
> 2. create line_config
> 3. request lines
> 4. do the actual work
> 5. release request
> 6. free line_config
> 7. free request_config
>
> And that is ignoring the chip open/close functions.
>

This doesn't bother me all that much. This is the low-level C API.
It's supposed to be a bit clunky. It'll get way simpler in the
high-level bindings.

In Python a simple case would look something like this:

with gpiod.Chip("/dev/gpiochip0") as chip:
    with chip.request_lines(gpiod.RequestConfig(offsets=( 0, 2, 3 )),

gpiod.LineConfig(direction=gpiod.DIRECTION_INPUT)) as req:
        values = req.get_values() # Read all values
        values = req.get_values(offsets=( 2, 3)) # Read values of specific lines

[snip]

> > >
> > > Where are the set of requested lines specified?
> > >
> >
> > They map the uAPI in that the offsets are set in struct gpiod_request_config:
> >
> > gpiod_request_config_set_line_offsets(config, num_lines, offsets); :)
> >
> > or
> >
> > gpiod_request_options_set_line_offsets(config, num_lines, offsets); :(
> >
>
> Alternatively it could be in one of the constructors -
> gpiod_request_config_new(), gpiod_line_config_new() or
> gpiod_chip_request_lines()?
>

I want to make the struct reusable/modifiable so setting it only in
the constructor would disallow it and having both would be redundant.
And the last one: the less function arguments the better IMO. So I'm
for having it in the request_config.

> > > Do null config ptrs result in something useful, but guaranteed harmless,
> > > such as requesting lines as input?  Or are they required non-null?
> > >
> >
> > I normally expect users to pass a valid pointer and don't make the
> > functions null aware. In this case - it's a good question. I'm
> > wondering if it is useful at all? The user should IMO specify what
> > they want to do with the lines? I would lean towards non-null line
> > configfs.
> >
>
> Sure doesn't if you have to set the offsets in the config.
> But might do if you provide them to the gpiod_chip_request_lines().
>
> The null case could then request the lines as-is?
>
> There seems to be a bit of interest in as-is of late, and the simplest
> case would then be three function calls.
>

Ok, makes sense. Null line-config -> request lines as is.

> > > > Then the lines can be set like this:
> > > >
> > > > // num_lines refers to the number of lines to set, not the number of
> > > > // lines in the request
> > > > gpiod_line_request_set_values(req, num_lines, offsets, values);
> > > >
> > >
> > > At first glance that feels a bit odd, being on the request while the
> > > others all operate on the config, but it maps to the SET_VALUES ioctl(),
> > > not the SET_CONFIG, so that makes sense.
> > >
> > > There is a corresponding get_values(req, num_lines, offsets, values)?
> > >
> >
> > Sure, just didn't include it in the example.
> >
> > > And a reconfigure(req, cfg)?
> > >
> >
> > Sure, just haven't decided on the name yet.
> > gpiod_line_request_reconfigure() would be what you're suggesting but
> > it sounds like it would reconfigure the request and not modify the
> > line configuration. I would prefer something closer to
> > gpiod_line_request_set_line_config() which is as verbose as it gets.
> > Maybe even gpiod_line_request_change_line_config()? Or
> > gpiod_line_request_modify_line_config()?
> >
>
> gpiod_line_request_reconfigure(req, cfg) is not modifying the line_config
> - it is modifying the request WITH the modified config.
>
> If gpiod_line_request_<splat>_line_config(req, cfg) works better for you
> then I'd prefer something along the lines of _apply_ or _commit_, as it is
> taking the line_config, modified by sets, and applying it to the
> requested lines.
>

How about gpiod_line_request_reconfigure_lines()?

Bart

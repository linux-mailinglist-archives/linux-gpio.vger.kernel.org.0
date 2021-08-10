Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42D03E585D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 12:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237013AbhHJKbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 06:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhHJKbm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 06:31:42 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E54C0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 03:31:21 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id nt11so9180887pjb.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ZgVN+5lmQK1uxebRZ1xSK+jOp1K9hdKIAadJk3DmnQ=;
        b=u5qG1FyG4aMAEcxKVSAF+aknIU9zruLkE2EBsYFhp6mE2SLvEr7EmxZ8AjkRrDd8Xo
         JnYTaosE1qQCowCND5AcNfWTfqkyU634hUCdud4OpBtbvhJSIXCZHyWaucjskHi+Tc8j
         J9bbIFdZgQq2wISPXAPT81RztApewxPY6yXurZIOvPFH0dpddVDxtvIWPGfqqs8vLipQ
         IfN6/SKeGAy7ZPdsBBFjsqkGH8lxx6VdSLDZBPLu1csYxy1BWcjACxKGhAYgQlBVAZnK
         ExsvPkhh/ccLFLjpT8dj1yk53on5F2WhkxJZ2bxtXxiiPwN0FMp8/M1dkq8LgXbHD9ZU
         BVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ZgVN+5lmQK1uxebRZ1xSK+jOp1K9hdKIAadJk3DmnQ=;
        b=benGhq9Vy1z/aFCBcQUIdRCvLqNI0QpJltQqvrCIzrXCB+tEaZyOyadLHS36VAJHed
         fVxXrHTCjNne/ypozlcMFj7tzUAEIP/wwH0EAhwpRIHPbxiJ+UcRpc6WWGV+apcoQp/E
         5k+OBFbtwmSNtnF4ZJvh4a5KvCyN1iBLBh1eE0+B81z60P+KFmypqfOUto7ngWMDMyhm
         EOEDSi8MpxS/GEfAuI+ghp14pkqL43NlrVQTtPQn5zwKQxH+iGpyRMSSe4wCNZbNlYUc
         sEBkBvx3BPrAosW631Q/kwZSzM91Hr7npsL+ncdhr8QscF94+AkpQKLgUOeswOucHgtE
         oM2g==
X-Gm-Message-State: AOAM533ZV9cUi022OioGh9BYbho4E9Y2q3pEmbzve0rHIb99fkl4S1uS
        vPfo6rukyEzbDhfkM55lPwHErJq9vD4T+Q==
X-Google-Smtp-Source: ABdhPJz2kz3LvXzXrr1ZIy/fP2xez8KY+lYdK5ehrGGZXTpiwkelWWhSyND2N8gxV40SOMC9Nkwv+A==
X-Received: by 2002:a63:1718:: with SMTP id x24mr128320pgl.416.1628591480536;
        Tue, 10 Aug 2021 03:31:20 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id f6sm22169445pfv.69.2021.08.10.03.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:31:19 -0700 (PDT)
Date:   Tue, 10 Aug 2021 18:31:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210810103113.GA6637@sol>
References: <20210806132810.23556-1-brgl@bgdev.pl>
 <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol>
 <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 10, 2021 at 09:52:04AM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 9, 2021 at 1:10 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Sun, Aug 08, 2021 at 09:11:14PM +0200, Bartosz Golaszewski wrote:
> > > On Sat, Aug 7, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Fri, Aug 06, 2021 at 03:28:10PM +0200, Bartosz Golaszewski wrote:
> > > > > Kent suggested that we may want to add getters for the config objects in
> > > > > his reviews under the C++ patches. Indeed when working on Python bindings
> > > > > I noticed it would be useful for implementing __str__ and __repr__
> > > > > callbacks. In C++ too we could use them for overloading stream operators.
> > > > >
> > > > > This extends the config objects with getters. They are straightforward for
> > > > > the request config but for the line config, they allow to only read
> > > > > per-offset values that would be used if the object was used in a request
> > > > > at this moment. We also add getters for the output values: both taking
> > > > > the line offset as argument as well as ones that take the index and allow
> > > > > to iterate over all configured output values.
> > > > >
> > > > > The sanitization of input for the getters has subsequently been changed
> > > > > so that we never return invalid values. The input values are verified
> > > > > immediately and if an invalid value is passed, it's silently replaced
> > > > > by the default value for given setting.
> > > > >
> > > > > This patch also adds the reset function for the line config object - it
> > > > > can be used to reset all stored configuration if - for example - the
> > > > > config has become too complex.
> > > > >
> > > > > As this patch will be squashed into the big v2 patch anyway, I allowed
> > > > > myself to include some additional changes: some variable renames and
> > > > > other minor tweaks.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > >
> > > > A few minor nit-picks in the gpiod.h documentation below...
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > >
> > > Thanks,
> > >
> > > With that fixed, do you think it's good to be applied?
> > >
> >
> > Sure.
> >
> > I was also wondering if anything could be done to simplify the
> > structures in line-config.c, but that isn't specific to this patch.
> > Not having access to the offsets, or even num_lines, and doing the
> > allocation up-front makes it rather painful.  Especially if the most
> > common case is only one or two lines.
> > But, as long as you are happy with the external API, that is just
> > implementation detail that can be optimised later.
> >
> > Cheers,
> > Kent.
> 
> I'm fine with how it works now for most part. I understand your
> concerns about splitting the output value configuration from the
> requested offsets but I think we can live with it. If anything: we can
> add a function to set an array of output values in line_config where
> the offsets would be assigned automatically based on the index in the
> array. Something like this:
> 
> int values[] = { 0, 0, 1, 1, 0, 1 };
> unsigned int offsets[] = { 0, 3, 4, 7, 12, 13 };
> 
> gpiod_line_config_set_output_values_auto(line_cfg, 6, values);
> gpiod_request_config_set_offsets(req_cfg, 6, offsets);
> 
> request = gpiod_chip_request_lines(chip, line_cfg, req_cfg);
> 
> This would result in the following mapping: 0 -> 0, 3 -> 0, 4 -> 1, 7
> -> 1, 12 -> 0, 13 -> 1.
> 
> We could store the auto array as a separate array in line_config and
> the offset -> value mappings would take precedence. For
> reconfiguration we would do the same. Does this make sense?
>

My preference would be for gpiod_line_config_set_output_value() and
variants to also set the direction for those lines to output.
And maybe rename it to gpiod_line_config_set_output().
And maybe add a set_input for symmetry.

But my concern above was actually the secondary array - that confused me.
And it's big - always. (OTOH it's on the heap so who cares?)
The array is of size GPIO_V2_LINE_NUM_ATTRS_MAX, yet each entry could
have multiple attributes set - so long as the offsets subsets match?
What happens if both debounce and flags are set for the same subset?
Looks like debounce wins and the flags get discarded in
gpiod_line_config_to_kernel().

What I had in mind for the config was an array of config for each line,
only performing the mapping to uAPI when the actual request or
reconfigure is performed, though that requires knowledge of the number
of lines in the request to be sized efficiently in the
gpiod_line_config_new().  Sizing it as GPIO_V2_LINES_MAX would be even
worse than your secondary array, so don't want that.
My Go library uses a map, but that isn't an option here.
Resizing it dynamically is the option I was last pondering,
but my preference would be to add a num_lines parameter to the new.
Anyway, that was what I was wondering about...

Cheers,
Kent.



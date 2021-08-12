Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0757A3E9F67
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 09:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbhHLHZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 03:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbhHLHZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 03:25:05 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26670C061765
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 00:24:40 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t1so8151073edd.6
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xIzc5Rbnmoef51Id8IwrCbUrgX2iNdA5JqsUWsgf16M=;
        b=eV4jZ7+eoa5iGcQXLnTVSLMCPuTzVKR7J6Y4J7kbBvL7k8kmXIQDA8D32fEAyRFLr4
         in5R835QtZC41zFb7FGX9I9sgUhNp1GS2p2S1CHe5jbmpJp38UHyOTQL8peFw3njj8I1
         XjFrpnLjIiisl7Wx0cj4iP6Il0NLAv/v5OqHAuZsjMDrCt89i9wPD759DfOEBIM+uTBH
         nzQzCw/yOfygCGE7ynIsoBxcmgoEVIoayS0wW1HlY+ZlHbnODzZY+jr4Bks6Cvq/Rm6g
         +54d82pRgrA0i0RmLhiqiwo1YGndcKjjWEQ6Lw4g33Jz3A54+6voYrBYtjUxI+scwyye
         kU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIzc5Rbnmoef51Id8IwrCbUrgX2iNdA5JqsUWsgf16M=;
        b=C2AaqHg8Ao67icrPRhslWOuQQR10UCQPnbC6W8+nzh2d13Az3vPIYVgP8uWHSut6He
         PZpssmQX720ZgMjAz+NvuThjFGnle7JBL1zGgwvZcGPV3CmvnhrUQe5XrHiS3iuBS5a+
         e0qEyD93Y5jrFFw1vCx8alUEBYxei7Nn7S6gP2iZG18AxBkUgqGAacEQIoCty2Eq59L5
         atmmImogLET++aVCJrbxVuW0K2lWmkiySpmzK4VmQ4FdS+pMwAoVMUX3t3aicnYMpq0E
         ptJJG+rRA5ePogn029nueCsLplVa80/eaehgmsvGf9/k20lOgwC5mi2+jPIJkoKA1u6P
         VV2A==
X-Gm-Message-State: AOAM530MDQskuOuywcAEULC7Zk+4EGrN4IdGr6sR1bWEDcPdC3cisBMA
        rSeRQE5rWy6voyRgw4iD+vhKQN0OHM71aUwdK8ZaHg==
X-Google-Smtp-Source: ABdhPJy2Mr3iJXaE8a+fjdyuOIqyJo3G9bKTU/BlAdGMeJPito7kt0cGVIje5FqjlVB8WxwUoiEWRIFd8uG0Yy6nNYY=
X-Received: by 2002:a05:6402:498:: with SMTP id k24mr3985619edv.25.1628753078647;
 Thu, 12 Aug 2021 00:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132810.23556-1-brgl@bgdev.pl> <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol> <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol>
In-Reply-To: <20210810103113.GA6637@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Aug 2021 09:24:28 +0200
Message-ID: <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 10, 2021 at 12:31 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Aug 10, 2021 at 09:52:04AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Aug 9, 2021 at 1:10 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Sun, Aug 08, 2021 at 09:11:14PM +0200, Bartosz Golaszewski wrote:
> > > > On Sat, Aug 7, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > On Fri, Aug 06, 2021 at 03:28:10PM +0200, Bartosz Golaszewski wrote:
> > > > > > Kent suggested that we may want to add getters for the config objects in
> > > > > > his reviews under the C++ patches. Indeed when working on Python bindings
> > > > > > I noticed it would be useful for implementing __str__ and __repr__
> > > > > > callbacks. In C++ too we could use them for overloading stream operators.
> > > > > >
> > > > > > This extends the config objects with getters. They are straightforward for
> > > > > > the request config but for the line config, they allow to only read
> > > > > > per-offset values that would be used if the object was used in a request
> > > > > > at this moment. We also add getters for the output values: both taking
> > > > > > the line offset as argument as well as ones that take the index and allow
> > > > > > to iterate over all configured output values.
> > > > > >
> > > > > > The sanitization of input for the getters has subsequently been changed
> > > > > > so that we never return invalid values. The input values are verified
> > > > > > immediately and if an invalid value is passed, it's silently replaced
> > > > > > by the default value for given setting.
> > > > > >
> > > > > > This patch also adds the reset function for the line config object - it
> > > > > > can be used to reset all stored configuration if - for example - the
> > > > > > config has become too complex.
> > > > > >
> > > > > > As this patch will be squashed into the big v2 patch anyway, I allowed
> > > > > > myself to include some additional changes: some variable renames and
> > > > > > other minor tweaks.
> > > > > >
> > > > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > > >
> > > > > A few minor nit-picks in the gpiod.h documentation below...
> > > > >
> > > > > Cheers,
> > > > > Kent.
> > > > >
> > > >
> > > > Thanks,
> > > >
> > > > With that fixed, do you think it's good to be applied?
> > > >
> > >
> > > Sure.
> > >
> > > I was also wondering if anything could be done to simplify the
> > > structures in line-config.c, but that isn't specific to this patch.
> > > Not having access to the offsets, or even num_lines, and doing the
> > > allocation up-front makes it rather painful.  Especially if the most
> > > common case is only one or two lines.
> > > But, as long as you are happy with the external API, that is just
> > > implementation detail that can be optimised later.
> > >
> > > Cheers,
> > > Kent.
> >
> > I'm fine with how it works now for most part. I understand your
> > concerns about splitting the output value configuration from the
> > requested offsets but I think we can live with it. If anything: we can
> > add a function to set an array of output values in line_config where
> > the offsets would be assigned automatically based on the index in the
> > array. Something like this:
> >
> > int values[] = { 0, 0, 1, 1, 0, 1 };
> > unsigned int offsets[] = { 0, 3, 4, 7, 12, 13 };
> >
> > gpiod_line_config_set_output_values_auto(line_cfg, 6, values);
> > gpiod_request_config_set_offsets(req_cfg, 6, offsets);
> >
> > request = gpiod_chip_request_lines(chip, line_cfg, req_cfg);
> >
> > This would result in the following mapping: 0 -> 0, 3 -> 0, 4 -> 1, 7
> > -> 1, 12 -> 0, 13 -> 1.
> >
> > We could store the auto array as a separate array in line_config and
> > the offset -> value mappings would take precedence. For
> > reconfiguration we would do the same. Does this make sense?
> >
>
> My preference would be for gpiod_line_config_set_output_value() and
> variants to also set the direction for those lines to output.
> And maybe rename it to gpiod_line_config_set_output().
> And maybe add a set_input for symmetry.
>

Any naming idea for setting the direction to "AS_IS"?

> But my concern above was actually the secondary array - that confused me.
> And it's big - always. (OTOH it's on the heap so who cares?)
> The array is of size GPIO_V2_LINE_NUM_ATTRS_MAX, yet each entry could
> have multiple attributes set - so long as the offsets subsets match?
> What happens if both debounce and flags are set for the same subset?
> Looks like debounce wins and the flags get discarded in
> gpiod_line_config_to_kernel().
>

Yeah, I aimed at ironing it out when writing tests. You're probably right here.

> What I had in mind for the config was an array of config for each line,
> only performing the mapping to uAPI when the actual request or
> reconfigure is performed, though that requires knowledge of the number
> of lines in the request to be sized efficiently in the
> gpiod_line_config_new().  Sizing it as GPIO_V2_LINES_MAX would be even
> worse than your secondary array, so don't want that.

Or would it? Currently the full config structure is 3784 bytes on a 64
bit arch. The base config is 32 bytes. If we added the default value
to base_config that would make it 36 bytes x GPIO_V2_LINES_MAX = 2304
bytes. We'd need another base_config for default settings.

Unless I'm missing something this does seem like the better option.

> My Go library uses a map, but that isn't an option here.
> Resizing it dynamically is the option I was last pondering,
> but my preference would be to add a num_lines parameter to the new.
> Anyway, that was what I was wondering about...
>

We could resize the array dynamically but we'd need to return error
codes from getters. We could also define the size when allocating the
config but it's a sub-par approach too.

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C413E549C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 09:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237614AbhHJHwi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 03:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237608AbhHJHwh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 03:52:37 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28CBC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 00:52:15 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y7so28871149eda.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KGEuCl0pghq8S4WIA0uqmn2UHJd0O7bfuv9kW0x2zuM=;
        b=HECo6yS4zJJ4sAMS6yHDhnMqA7RlFviyI3KNWs0F49/XnA63vBJmgrpgDQ9HC3XFzk
         /RuOgDBCIntDqyRanWRqMNhw7yTZPnsxB0XXPOe2IIvaMiTetPnCjMQ/9LHD2cdnh7LZ
         3TNDDRzv3I9DB8pt9KI+FC0Fi5+14zpFOLrUHhfJs1GzfWhSrUgoYd5haPpSmQt3Bpjc
         n4KhcnGBIAFjNEOQxHwS84yIHG0imYECzOpUcIN7K+VbfcWWuNOzWVtuYmJWLhfuKE/j
         aMVvf1PMFGU57dSYfQd74zsXYjx3OW02fr/1T1B0oup2bkt2gFo+DbeBa9IhOttf0a3b
         e5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KGEuCl0pghq8S4WIA0uqmn2UHJd0O7bfuv9kW0x2zuM=;
        b=CPPQq3Eja6YNtUKFcorGwJKcw3S9j0NzkpzJVFiWMCDHNo4PABL1TNs/p6oY4i+6JN
         TfYwE8ZdJUdKpePiFvsa4oXiUAy6gQNJ/23e1/ENhOBZY3VfIaisKgeQ9supxJ0C29ur
         3/ynE8WgM+KDvl3mE4s0TsSi8MITJStIFP/qf2QCuuG+Z+QxvlccEH2vm5pZgJUdhZrR
         lfOaqwzklFMQxR+T+foCKO4dTzEwRy+iRa0zZW0Xi6sCEMZewpciC9nCZQXohpbr71La
         /gmVXuGaNqiSBMUsMcfnW2hMhM0UKvbuodoxrKENw+GkiM45e9rzEESZ+OrGoO5EjQGX
         pCLg==
X-Gm-Message-State: AOAM531P/0OZ3jR5jxof/rG8+Ye0+JTyopvurimpFuFMaUZxYn6qB0+d
        5GJI9RDdAXEbUEmaQlpcDp9IrqtwN/H5GgDBRH6emA==
X-Google-Smtp-Source: ABdhPJyIEjIcIO1gXuJ5y1FD5ZMmxy7xrdNJy2n/2N6wu5712Z1o+5Imut6GRVq5vrKEzXnbphU+Y1hLIVYnVBmJybA=
X-Received: by 2002:a05:6402:1a3a:: with SMTP id be26mr3389014edb.232.1628581934592;
 Tue, 10 Aug 2021 00:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132810.23556-1-brgl@bgdev.pl> <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com> <20210808231012.GA6224@sol>
In-Reply-To: <20210808231012.GA6224@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Aug 2021 09:52:04 +0200
Message-ID: <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
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

On Mon, Aug 9, 2021 at 1:10 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Sun, Aug 08, 2021 at 09:11:14PM +0200, Bartosz Golaszewski wrote:
> > On Sat, Aug 7, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Fri, Aug 06, 2021 at 03:28:10PM +0200, Bartosz Golaszewski wrote:
> > > > Kent suggested that we may want to add getters for the config objects in
> > > > his reviews under the C++ patches. Indeed when working on Python bindings
> > > > I noticed it would be useful for implementing __str__ and __repr__
> > > > callbacks. In C++ too we could use them for overloading stream operators.
> > > >
> > > > This extends the config objects with getters. They are straightforward for
> > > > the request config but for the line config, they allow to only read
> > > > per-offset values that would be used if the object was used in a request
> > > > at this moment. We also add getters for the output values: both taking
> > > > the line offset as argument as well as ones that take the index and allow
> > > > to iterate over all configured output values.
> > > >
> > > > The sanitization of input for the getters has subsequently been changed
> > > > so that we never return invalid values. The input values are verified
> > > > immediately and if an invalid value is passed, it's silently replaced
> > > > by the default value for given setting.
> > > >
> > > > This patch also adds the reset function for the line config object - it
> > > > can be used to reset all stored configuration if - for example - the
> > > > config has become too complex.
> > > >
> > > > As this patch will be squashed into the big v2 patch anyway, I allowed
> > > > myself to include some additional changes: some variable renames and
> > > > other minor tweaks.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > >
> > > A few minor nit-picks in the gpiod.h documentation below...
> > >
> > > Cheers,
> > > Kent.
> > >
> >
> > Thanks,
> >
> > With that fixed, do you think it's good to be applied?
> >
>
> Sure.
>
> I was also wondering if anything could be done to simplify the
> structures in line-config.c, but that isn't specific to this patch.
> Not having access to the offsets, or even num_lines, and doing the
> allocation up-front makes it rather painful.  Especially if the most
> common case is only one or two lines.
> But, as long as you are happy with the external API, that is just
> implementation detail that can be optimised later.
>
> Cheers,
> Kent.

I'm fine with how it works now for most part. I understand your
concerns about splitting the output value configuration from the
requested offsets but I think we can live with it. If anything: we can
add a function to set an array of output values in line_config where
the offsets would be assigned automatically based on the index in the
array. Something like this:

int values[] = { 0, 0, 1, 1, 0, 1 };
unsigned int offsets[] = { 0, 3, 4, 7, 12, 13 };

gpiod_line_config_set_output_values_auto(line_cfg, 6, values);
gpiod_request_config_set_offsets(req_cfg, 6, offsets);

request = gpiod_chip_request_lines(chip, line_cfg, req_cfg);

This would result in the following mapping: 0 -> 0, 3 -> 0, 4 -> 1, 7
-> 1, 12 -> 0, 13 -> 1.

We could store the auto array as a separate array in line_config and
the offset -> value mappings would take precedence. For
reconfiguration we would do the same. Does this make sense?

Bart

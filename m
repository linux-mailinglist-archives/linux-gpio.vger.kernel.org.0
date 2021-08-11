Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C978F3E878F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 03:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhHKBQ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 21:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhHKBQz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 21:16:55 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF6CC061765
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 18:16:32 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d1so520224pll.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 18:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A5Kpk2VB/QdoA4olp4WmDDw/OLCyvpuIrooLcIZees4=;
        b=UW6VEzaQ71Dx/K5DzVKttt5fCIJGtyenkBrJ1mmVIQ/NBh7ZvhjuqHHRF3IWI5HKpW
         4f/mBL5ZkduRrz5p03ASmSoye0maOYAy/1ZH3sUcFMjWzlh8fuDAfl9qUTV9mWR/+uLr
         SBg9E4IvSaIHkbeGRNUHKNWepI2OvvWATCdIrJLTQGXAnuNqgEYYAEKSsAYe7Wa9Qc2j
         mlb6d3SOy06LsEw6fQBDPngTOsi9rJu5/RtzkPFROGtZmq7eDFe4LWzu9pyUx2osZJVL
         PndXdZA9PAr4EPHk7/3UzZsxQbkE/Z1F6t+mjBhifk3YlMwpvqye7JSjRcUBxYHnwnga
         o9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A5Kpk2VB/QdoA4olp4WmDDw/OLCyvpuIrooLcIZees4=;
        b=WLkQCTpOAGFDRAU12wMZEvaSjIIQjFmFtwQwrbBjKZ6vM+LfIbQtfVSkZbEg1vuwYU
         3S4mckeyg8YsurVMFtuRgHccf1TczIqMI0H51zLUhZ7TCQ5F53Sf1ErPR8wphwN7hXo3
         PNriA2d/HsMekmTqD9emwmhicg6bCf9aYC8IrhZ7eRswSRIEYQA+37ki1Y+i6nOK/gsx
         n9OxgBc9pqBckWZkHDTSfWPv7PVD5SUvoTWCqCRyBTshnoY9awiNWFFkLyr3wQF4hcBO
         ILY0CiK0LxtZF0YEyC1kkodCAuG00Q696yNtqnEiy0gSeiGopPIUYNUZfc4NQSoXSUyC
         7a+g==
X-Gm-Message-State: AOAM530JaQjIg90oJAo8MoCnuGnJfRIV948pCo0xFVGt9ZDPXkw+0OQg
        VazzWcx4uqb0vew+XoGuCyQ=
X-Google-Smtp-Source: ABdhPJw+SIzctuJ5HwnJ7zPeqNbzCo69DVEND2O8AKK6ii1yGyJpLQdNnW9JxeploPJ5aQTPo4NeFA==
X-Received: by 2002:aa7:870e:0:b029:3c2:f326:468b with SMTP id b14-20020aa7870e0000b02903c2f326468bmr32084483pfo.53.1628644591633;
        Tue, 10 Aug 2021 18:16:31 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id x8sm24064163pjn.10.2021.08.10.18.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 18:16:30 -0700 (PDT)
Date:   Wed, 11 Aug 2021 09:16:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210811011625.GA9440@sol>
References: <20210806132810.23556-1-brgl@bgdev.pl>
 <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol>
 <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810103113.GA6637@sol>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 10, 2021 at 06:31:13PM +0800, Kent Gibson wrote:
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
> But my concern above was actually the secondary array - that confused me.
> And it's big - always. (OTOH it's on the heap so who cares?)
> The array is of size GPIO_V2_LINE_NUM_ATTRS_MAX, yet each entry could
> have multiple attributes set - so long as the offsets subsets match?
> What happens if both debounce and flags are set for the same subset?
> Looks like debounce wins and the flags get discarded in
> gpiod_line_config_to_kernel().
> 
> What I had in mind for the config was an array of config for each line,
> only performing the mapping to uAPI when the actual request or
> reconfigure is performed, though that requires knowledge of the number
> of lines in the request to be sized efficiently in the
> gpiod_line_config_new().  Sizing it as GPIO_V2_LINES_MAX would be even
> worse than your secondary array, so don't want that.
> My Go library uses a map, but that isn't an option here.
> Resizing it dynamically is the option I was last pondering,
> but my preference would be to add a num_lines parameter to the new.
> Anyway, that was what I was wondering about...
> 

Also, what is the state of the config after this call sequence:

gpiod_line_config_set_active_high_offset(cfg,1)
gpiod_line_config_set_active_low(cfg)

Is line 1 active high or low?

The docs indicate that it should be active low, but the current
line-config.c implementation will leave it active high as the secondary
config is not changed by gpiod_line_config_set_active_low()?

Cheers,
Kent.

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8653544D060
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 04:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhKKD2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 22:28:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhKKD2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 22:28:22 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FBEC061766
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 19:25:33 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id p17so3998700pgj.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 19:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4xx5sK5PXomHApEkmCo5Gfi6Fwditfor/vPivjp2KNA=;
        b=XNEqJ9MoEh938V5OlQ2SUAloJhEkuIgyDBKdGkizv/L0erB2g/j/brSAtEM+BTTtXx
         cSumaQm6DIuLCBycGnYjweYikToKj7d+KuqQ1GYHUftxglqLCMaGzE3r/iMucPBSep0J
         wrFoUpXLSuzjZzSpwFnasOSCRCcvj03Y6R3nSbt8DEcZbT/rnOYa9szb4gf7dlGnESgx
         QoOsrZm21YW6QsC0UtsuTGI1xWKwXM6kE3+/aqiJJC9P2cVTOTxGlcQBaq+/VHvizK36
         k6zT7WzfVq9Hb+DJX46W4KgOJk87DC37fom7fYbGQzW0yrY90uhEZvjKssR2BgZjOxzv
         JJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4xx5sK5PXomHApEkmCo5Gfi6Fwditfor/vPivjp2KNA=;
        b=2410iFcoul2jDUS+tn0i8sLCeFIvqWHOnMPWULduWX+1SFa6x90NwSkqtLTJKXAB2p
         zIlkBbUInYNjdmFMaDiEqdTlm24oXxLa6hrs1fUf4bukI6KyBH3BUv7JTr4zQ7h9qr1K
         BVOKMKzydRizcJH0NrEWxJ2a6nDHnV0k0nwTgaUUPYSHVKJMuHoTEDg04KU+K/p9hD3f
         ugRYGtvK53UCyUnr6ZMXgl05Ac9jzEhYwUrosPXnef4kt5i0sLvs7SvBJZdZQnjmCYJ9
         XTLvbLB/DsyKjwUVxTDXb1Joe7cA4JTxztrMTzN3TEbx9wbS4iKnMI3duNmOGvwncyj9
         9gzg==
X-Gm-Message-State: AOAM5318aOqk3tNCS2JbYzG52q81VY3NLGav5HKT6qr0zWwrbGkG1TX8
        houmIe7Fg2Iq1qP1ZhmZv3k=
X-Google-Smtp-Source: ABdhPJwWDDNtjZ9XmFK7+9Rsa6sJLhE4Ae3R9bXp+J8J/YKQDB8RjCgwbJEpSuY6AOHHwqi3JNhHGA==
X-Received: by 2002:a05:6a00:cc9:b0:49f:b439:8930 with SMTP id b9-20020a056a000cc900b0049fb4398930mr3891189pfv.86.1636601133176;
        Wed, 10 Nov 2021 19:25:33 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id y7sm771297pge.44.2021.11.10.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 19:25:32 -0800 (PST)
Date:   Thu, 11 Nov 2021 11:25:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v4 1/2] line-config: rework the interface
 some more
Message-ID: <20211111032526.GA7679@sol>
References: <20211104192252.21883-1-brgl@bgdev.pl>
 <20211104192252.21883-2-brgl@bgdev.pl>
 <20211108010226.GA5156@sol>
 <CAMRc=MdnVrRho7wEv_SgRjoC4VKvXYpKBfdGCEkXQgR4bXhnYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdnVrRho7wEv_SgRjoC4VKvXYpKBfdGCEkXQgR4bXhnYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 02:15:46PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 8, 2021 at 2:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Nov 04, 2021 at 08:22:51PM +0100, Bartosz Golaszewski wrote:
> > > We've already added getters for line-config but without exposing some
> > > parts of the internal logic of the object, the user can't really get
> > > the full picture and inspect the contents. This patch reworks the
> > > accessors further by providing three flavors of each setter and two
> > > of each getter.
> > >
> > > Up until now, the setters that set the default (fall-back) value for
> > > various line settings didn't state explicitly that the values they set
> > > have a lower priority than the one coming from setters that take offsets
> > > as argument. The docs were vague too and suggested that the last call
> > > counts which is not true.
> > >
> > > We therefore expose a setter that explicitly sets the "default" value
> > > and make sure to stress that this will be used only by lines for which
> > > no "specific" override was defined.
> > >
> > > We also provide getters that allow to read both the default value as
> > > well as the actual value that would be used for each offset if the
> > > object was passed to a request call at this moment. We also complete
> > > the API by providing functions that allow to identify offsets for
> > > which at least one setting differs from the defaults.
> > >
> >
> > This command set is incomplete. There is no way to unset an attribute,
> > i.e. set it back to tracking the default.
> >
> > It is also difficult to determine if a line attribute is tracking the
> > default or has been overridden to the current default value.
> > This would be very useful to know for stringification.
> > (also see comment on gpiod_line_config_get_overridden_offsets())
> >
> 
> Actually the subsequent patch implements the stream insertion operator
> for the line_config class and does the stringification. You can always
> get the list of overridden offsets and compare the values of the
> default and per-offset attributes. I didn't want to add more functions
> to this struct but if you think it's a good idea then I can do it.
> 

I get the feeling you didn't read both reviews before responding here - 
I wrote this, at least in part, BECAUSE of that streaming operator.
Your proposed solution doesn't work as lines overridden to the default
are filtered out of the list of overridden offsets.
The user can only tell if a line has been overridden to the
default by changing the default and calling these functions again.

What I'm asking for here is to remove that filtering, which actually
simplifies these functions.
Adding extra functions to simplify the job of the caller to do their own
filtering is optional - see if it makes sense when you rework the
streaming operator.

> > Changing the default AFTER overriding particular lines should be
> > uncommon, so I would've gone with making the "default" setter remove any
> > overrides so ALL lines in the config are set to the new default.
> > Not that that doesn't also treat some use cases badly.
> >
> 
> Yeah, I disagree with this one. It's not very intuitive IMO. I prefer
> that the offsets be overridden one by one and the overrides have
> higher priority.
> 

The idea here is to provide some mechanism to clear the override
without having to add more methods or having to start over with a new
config.
I question the value of being able to change the default, after overrides
have been set, without clearing the overrides, hence my solution.
A global "set all lines to this, to hell with your overrides" is pretty
intuitive to me - even simpler and clearer than set_default.

I still prefer that over your suggestion to add a clear function as I
would like to keep the function count minimal.

But I don't have a compelling use case either way, this is all just gut
feel.

> > > This way the caller can fully inspect the line_config and high-level
> > > language bindings can provide stringification methods.
> 
> I already have that both for C++ and for Python (Work-in-Progress),
> but it can make it easier indeed.
> 

Are you replying to yourself here?

> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> > >  include/gpiod.h   | 255 ++++++++++++++++++++++++++++-----------
> > >  lib/line-config.c | 295 ++++++++++++++++++++++++++++++++--------------
> > >  tools/gpioget.c   |   6 +-
> > >  tools/gpiomon.c   |   6 +-
> > >  tools/gpioset.c   |   9 +-
> > >  5 files changed, 404 insertions(+), 167 deletions(-)
> > >
> > > diff --git a/include/gpiod.h b/include/gpiod.h
> > > index 2a41fca..ee4a067 100644
> > > --- a/include/gpiod.h
> > > +++ b/include/gpiod.h
> > > @@ -450,12 +450,38 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
> > >   *
> > >   * The line-config object stores the configuration for lines that can be used
> > >   * in two cases: when making a line request and when reconfiguring a set of
> > > - * already requested lines. The mutators for the line request don't return
> > > - * errors. If the set of options is too complex to be translated into kernel
> > > - * uAPI structures - the error will be returned at the time of the request or
> > > - * reconfiguration. If an invalid value was passed to any of the getters - the
> > > - * default value will be silently used instead. Each option can be set
> > > - * globally, for a single line offset or for multiple line offsets.
> > > + * already requested lines.
> > > + *
> > > + * A new line-config object is instantiated containing a set of sane defaults
> > > + * for all supported configuration settings. Those defaults can be modified by
> > > + * the caller. Default values can be overridden by applying different values
> > > + * for specific line offsets. When making a request or reconfiguring an
> > > + * existing one, the overridden settings for specific offsets will be taken
> > > + * into account first and for every other offset and setting the defaults will
> > > + * be used.
> > > + *
> > > + * For every setting, the mutators come in three flavors: one setting the
> > > + * default value (to which we fallback for every offset not explicitly
> > > + * overridden), one setting an override for a single offset and one that
> > > + * overrides settings for a subset of offsets.
> >
> > I prefer the term "line" over "offset" where referring to a line.
> > The offset is a unique identifer for a line, but is isn't a line, and you
> > are setting the config of a line, not an offset.
> >
> > Maybe add something about offsets being used as line identifiers if it
> > isn't already sufficiently clear.
> >
> > > + *
> > > + * The mutators don't return errors. If the set of options is too complex to
> > > + * be translated into kernel uAPI structures - the error will be returned at
> > > + * the time of the request or reconfiguration. If an invalid value was passed
> > > + * to any of the mutators - the default value will be silently used instead.
> > > + *
> > > + * We also expose getters - these come in two flavors for every settings: one
> > > + * that returns the value that would have been used for given offset if the
> > > + * request was made at this moment and one that always returns the default
> > > + * value.
> > > + *
> > > + * It's important to not think of the offsets used in the offset->value mapping
> > > + * as linked to actual hardware offsets of the lines exposed by a GPIO chip as
> > > + * config objects live separately from any chips and are only analyzed at the
> > > + * time the request is being made.
> > > + *
> >
> > I'm not sure what you are trying to say in this paragraph.
> > The offsets in the API are the hardware offsets, right?
> > You are saying that the config doesn't necessarily correspond to the
> > hardware setting unless is is unchanged since the last request or
> > reconfiguration call?
> >
> > Either way you might want to reword that paragraph.>
> 
> A line_config object contains configuration that can be reused across
> multiple chips. When you set an attribute for an offset, then use the
> config object on two different chips, it will affect two separate
> "real/physical" lines with the same offset on their chips. As long as
> you don't use the config, it only stores abstract mapping. That's why
> I chose to speak of offsets here and of lines in the chip docs. Does
> it make sense? If not, I'm open to change but it sounds more intuitive
> for me.
> 

That still comes back to what I said - the config doesn't correspond to
hardware settings except when it has been applied, in its current state,
via a request or reconfigure.

Getting into hardware offsets, multiple chips, abstract mapping etc is
just heading off into the weeds.

> > And gramatically it probably should be "important not to think".
> >
> 
> [snip]
> 
> > > +
> > > +/**
> > > + * @brief Get the number of offsets for which this config object contains
> > > + *        at least one setting that is different from the defaults.
> > > + * @param config Line config object.
> > > + * @return Number of offsets with at least one overridden setting.
> > > + */
> > > +unsigned int
> > > +gpiod_line_config_get_num_overridden_offsets(struct gpiod_line_config *config);
> > > +
> > > +/**
> > > + * @brief Get the offsets for which this config object contains at least one
> > > + *        setting that is different from the defaults.
> > > + * @param config Line config object.
> > > + * @param offsets Array to store the offsets. Must hold at least the number
> > > + *                of offsets returned by
> > > + *                ::gpiod_line_config_get_num_overridden_offsets.
> > > + */
> > > +void gpiod_line_config_get_overridden_offsets(struct gpiod_line_config *config,
> > > +                                           unsigned int *offsets);
> > >
> >
> > The "that is different from the defaults" filtering performed by these two
> > functions is premature and prevents the caller determining the actual
> > state of the current config.
> >
> 
> I'm not sure what you mean here. Could you give an example?
> 

I did - immediately below :-|.

> > It could also produce weird stringification.  Consider a set of output
> > lines. The stringification will vary wildly depending on the output
> > value of each line. Those with the default value are filtered, the
> > remainder displayed.  I would prefer the stringification to show all the
> > output lines being explicitly set, but the filtering makes that
> > impossible.
> >
> 
> So here's the deal: you can't speak of "all the lines" in the config
> object. You can have a config object that defines output values for
> offset 2, 3 and 8 and the default value of 1. Then you use it to
> export 64 lines from a chip that has 128 lines total. What are "all
> the lines" in this case? The stringification for the line_config
> should output the defaults + any explicitly overridden offset.
> 

The lines in my paragraph refer to the lines in the config, not the
lines in the request. I never mentioned a request.
They have all been overriden with an output value, yet half (on average)
get filtered here, as they have been overridden to the default.

I am well aware that the line_config is distinct from the request.
You wanted it that way so you could apply the same config to different
requests.  I prefer to unify them to simplify the interface, but you
prefer it this way, so we're covering old ground again here and I'll
leave it there.

Cheers,
Kent.


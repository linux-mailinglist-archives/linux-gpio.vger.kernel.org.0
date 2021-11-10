Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DD444C1FA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 14:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhKJNSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 08:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbhKJNSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 08:18:47 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B40CC061764
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 05:15:59 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id c8so10212442ede.13
        for <linux-gpio@vger.kernel.org>; Wed, 10 Nov 2021 05:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qThdRoxTTsJ1jSUbuNUnq1MT+b9FjCLNAX91b6gr1IY=;
        b=DLHGfmHlCKJRTuZWMx1e+Vg/lRHqUfcXdoMeJLamgKUCHtFNsprMC2vengF6tHPttU
         PuiB4y0ypbh4yxtoVPbQNPLEsESbvEezf+trylQrhI2/Oud+TenCNJtzxqX1i4Lpaq6J
         9h1m6gkeN8u1GuhDrHgPiheg5JyaFYi35LqyDvy/B7tUJ9m7e0zuC4Kjvk7DTZG2mqK9
         fk/59dP9wAyGqp7TbK25n/DrGQcePLw7SmnwsEXU2l1jh2IwF6ndMKRPU1FSSg662fOW
         N+GoUC5NWdLKfunaXKMSNctlhgfvUNyd8zIfndDZz075Y2DQ4jjVMhs6GzJ1m3N3t9n1
         IhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qThdRoxTTsJ1jSUbuNUnq1MT+b9FjCLNAX91b6gr1IY=;
        b=TrnaXdS52HmAzlmpbiwy6t3uN9/qhJuWpBmDKHQLpdpeXW9kx8wOj+S5m7qWMtSOO8
         nwz3liQRbtXTgtNhG0to6RE92JQSQJqQkOVsxMMXUXGDxqXlAyCcwW8trzUX1XHlc8IV
         puMp9o6tGht8b0+H5Xa3rC0JvFe9vqh1wkOQUPj07cxqy8wQxSqgQ8B2ZBfkWbGTMLT9
         eLxu2ZdqrwrR+5ilYQe7Yuqpn/vJZ9yvbTVOrgLThltNmV5x2YKoKEH46NY+a34PNXYJ
         VRMPp4R4FyNYaPneXqyf4ht8VRuLluogtMk2qbTM/pp4D3AQd+V+CIOaXyY5c5MZOFBH
         HDeg==
X-Gm-Message-State: AOAM53372g97s7pAiBPW27cDzd4gzZEJJjnwlJ9vaJBvu/7trHBmJvfk
        Z9u+pOFHz1NvvAbFVyxo/YhmukhAd6AyuD+SEo/dWaM3Ee5p4g==
X-Google-Smtp-Source: ABdhPJxG7gleP4tDo7jm4spIX187lG5tWiYeO+eZYw7Yu9VmCOEehY9NwX5ExVpS8a32ydIo6YjD5nZDqFPpbmdi5MQ=
X-Received: by 2002:a17:907:c15:: with SMTP id ga21mr20359691ejc.349.1636550156948;
 Wed, 10 Nov 2021 05:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20211104192252.21883-1-brgl@bgdev.pl> <20211104192252.21883-2-brgl@bgdev.pl>
 <20211108010226.GA5156@sol>
In-Reply-To: <20211108010226.GA5156@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 10 Nov 2021 14:15:46 +0100
Message-ID: <CAMRc=MdnVrRho7wEv_SgRjoC4VKvXYpKBfdGCEkXQgR4bXhnYQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v4 1/2] line-config: rework the interface
 some more
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

On Mon, Nov 8, 2021 at 2:02 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Nov 04, 2021 at 08:22:51PM +0100, Bartosz Golaszewski wrote:
> > We've already added getters for line-config but without exposing some
> > parts of the internal logic of the object, the user can't really get
> > the full picture and inspect the contents. This patch reworks the
> > accessors further by providing three flavors of each setter and two
> > of each getter.
> >
> > Up until now, the setters that set the default (fall-back) value for
> > various line settings didn't state explicitly that the values they set
> > have a lower priority than the one coming from setters that take offsets
> > as argument. The docs were vague too and suggested that the last call
> > counts which is not true.
> >
> > We therefore expose a setter that explicitly sets the "default" value
> > and make sure to stress that this will be used only by lines for which
> > no "specific" override was defined.
> >
> > We also provide getters that allow to read both the default value as
> > well as the actual value that would be used for each offset if the
> > object was passed to a request call at this moment. We also complete
> > the API by providing functions that allow to identify offsets for
> > which at least one setting differs from the defaults.
> >
>
> This command set is incomplete. There is no way to unset an attribute,
> i.e. set it back to tracking the default.
>
> It is also difficult to determine if a line attribute is tracking the
> default or has been overridden to the current default value.
> This would be very useful to know for stringification.
> (also see comment on gpiod_line_config_get_overridden_offsets())
>

Actually the subsequent patch implements the stream insertion operator
for the line_config class and does the stringification. You can always
get the list of overridden offsets and compare the values of the
default and per-offset attributes. I didn't want to add more functions
to this struct but if you think it's a good idea then I can do it.

> Changing the default AFTER overriding particular lines should be
> uncommon, so I would've gone with making the "default" setter remove any
> overrides so ALL lines in the config are set to the new default.
> Not that that doesn't also treat some use cases badly.
>

Yeah, I disagree with this one. It's not very intuitive IMO. I prefer
that the offsets be overridden one by one and the overrides have
higher priority.

> > This way the caller can fully inspect the line_config and high-level
> > language bindings can provide stringification methods.

I already have that both for C++ and for Python (Work-in-Progress),
but it can make it easier indeed.

> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  include/gpiod.h   | 255 ++++++++++++++++++++++++++++-----------
> >  lib/line-config.c | 295 ++++++++++++++++++++++++++++++++--------------
> >  tools/gpioget.c   |   6 +-
> >  tools/gpiomon.c   |   6 +-
> >  tools/gpioset.c   |   9 +-
> >  5 files changed, 404 insertions(+), 167 deletions(-)
> >
> > diff --git a/include/gpiod.h b/include/gpiod.h
> > index 2a41fca..ee4a067 100644
> > --- a/include/gpiod.h
> > +++ b/include/gpiod.h
> > @@ -450,12 +450,38 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
> >   *
> >   * The line-config object stores the configuration for lines that can be used
> >   * in two cases: when making a line request and when reconfiguring a set of
> > - * already requested lines. The mutators for the line request don't return
> > - * errors. If the set of options is too complex to be translated into kernel
> > - * uAPI structures - the error will be returned at the time of the request or
> > - * reconfiguration. If an invalid value was passed to any of the getters - the
> > - * default value will be silently used instead. Each option can be set
> > - * globally, for a single line offset or for multiple line offsets.
> > + * already requested lines.
> > + *
> > + * A new line-config object is instantiated containing a set of sane defaults
> > + * for all supported configuration settings. Those defaults can be modified by
> > + * the caller. Default values can be overridden by applying different values
> > + * for specific line offsets. When making a request or reconfiguring an
> > + * existing one, the overridden settings for specific offsets will be taken
> > + * into account first and for every other offset and setting the defaults will
> > + * be used.
> > + *
> > + * For every setting, the mutators come in three flavors: one setting the
> > + * default value (to which we fallback for every offset not explicitly
> > + * overridden), one setting an override for a single offset and one that
> > + * overrides settings for a subset of offsets.
>
> I prefer the term "line" over "offset" where referring to a line.
> The offset is a unique identifer for a line, but is isn't a line, and you
> are setting the config of a line, not an offset.
>
> Maybe add something about offsets being used as line identifiers if it
> isn't already sufficiently clear.
>
> > + *
> > + * The mutators don't return errors. If the set of options is too complex to
> > + * be translated into kernel uAPI structures - the error will be returned at
> > + * the time of the request or reconfiguration. If an invalid value was passed
> > + * to any of the mutators - the default value will be silently used instead.
> > + *
> > + * We also expose getters - these come in two flavors for every settings: one
> > + * that returns the value that would have been used for given offset if the
> > + * request was made at this moment and one that always returns the default
> > + * value.
> > + *
> > + * It's important to not think of the offsets used in the offset->value mapping
> > + * as linked to actual hardware offsets of the lines exposed by a GPIO chip as
> > + * config objects live separately from any chips and are only analyzed at the
> > + * time the request is being made.
> > + *
>
> I'm not sure what you are trying to say in this paragraph.
> The offsets in the API are the hardware offsets, right?
> You are saying that the config doesn't necessarily correspond to the
> hardware setting unless is is unchanged since the last request or
> reconfiguration call?
>
> Either way you might want to reword that paragraph.>

A line_config object contains configuration that can be reused across
multiple chips. When you set an attribute for an offset, then use the
config object on two different chips, it will affect two separate
"real/physical" lines with the same offset on their chips. As long as
you don't use the config, it only stores abstract mapping. That's why
I chose to speak of offsets here and of lines in the chip docs. Does
it make sense? If not, I'm open to change but it sounds more intuitive
for me.

> And gramatically it probably should be "important not to think".
>

[snip]

> > +
> > +/**
> > + * @brief Get the number of offsets for which this config object contains
> > + *        at least one setting that is different from the defaults.
> > + * @param config Line config object.
> > + * @return Number of offsets with at least one overridden setting.
> > + */
> > +unsigned int
> > +gpiod_line_config_get_num_overridden_offsets(struct gpiod_line_config *config);
> > +
> > +/**
> > + * @brief Get the offsets for which this config object contains at least one
> > + *        setting that is different from the defaults.
> > + * @param config Line config object.
> > + * @param offsets Array to store the offsets. Must hold at least the number
> > + *                of offsets returned by
> > + *                ::gpiod_line_config_get_num_overridden_offsets.
> > + */
> > +void gpiod_line_config_get_overridden_offsets(struct gpiod_line_config *config,
> > +                                           unsigned int *offsets);
> >
>
> The "that is different from the defaults" filtering performed by these two
> functions is premature and prevents the caller determining the actual
> state of the current config.
>

I'm not sure what you mean here. Could you give an example?

> It could also produce weird stringification.  Consider a set of output
> lines. The stringification will vary wildly depending on the output
> value of each line. Those with the default value are filtered, the
> remainder displayed.  I would prefer the stringification to show all the
> output lines being explicitly set, but the filtering makes that
> impossible.
>

So here's the deal: you can't speak of "all the lines" in the config
object. You can have a config object that defines output values for
offset 2, 3 and 8 and the default value of 1. Then you use it to
export 64 lines from a chip that has 128 lines total. What are "all
the lines" in this case? The stringification for the line_config
should output the defaults + any explicitly overridden offset.

> Let the caller do any filtering themselves.
> Maybe expose override_differs_from_defaults(), suitably renamed of
> course.
> A method to check if a line attribute is overridden or defaulted would
> be useful too.
>
> Cheers,
> Kent.

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A04084CA833
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Mar 2022 15:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiCBOdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Mar 2022 09:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243275AbiCBOdO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Mar 2022 09:33:14 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E23D6
        for <linux-gpio@vger.kernel.org>; Wed,  2 Mar 2022 06:32:30 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id s11so2067708pfu.13
        for <linux-gpio@vger.kernel.org>; Wed, 02 Mar 2022 06:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ua3lq+6SIIT/syPgrJU++KD6Iq/ZV5mgj+ESnQ3YN0E=;
        b=i5FMpIldX/HgW0q7HLE7RmjgWAupBAr5z1WmMM6l046Y5oxU17ruis1HZbw+ujIvSU
         u2tOHL7oE237q+KcwFnsQDeiM2f8RE84PBFak1E0yAKx41fW1nYFDf7w+Jr/qKEo4vl8
         Kd/kNb1pIh/D6frhkG6Msk83V7qdVZLdO8+/Q5RhEBOUUOYbgcXAgyP4uvKU0NRxxyqA
         86bTT8knr5rXbNvyWIpHyXAqNR1e+H9wn4soZhrrQBV2HKFlROo/c1gQeS+zoqZ+oHnl
         5S4i+6387Uoa8AFFTeib2yIDd7E5eujW/2srK8CTeinH1Z5GPoNueC200v9MIZfOGoo/
         0i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ua3lq+6SIIT/syPgrJU++KD6Iq/ZV5mgj+ESnQ3YN0E=;
        b=e98tY8uEjm8hXMCX7dc3RyaJ/fD79ef6DxxDJ5//pI9Q6bol0BboQ6KfWAe8zHucPm
         YCmddAk8yhgGA+ljTcJ/MWLf99mLOhG2jirkQjxz2gRYJQdD+7uSe+93VfHAEgHd2dFZ
         nU4RH5KPAgZKqnUNvYRWZ/teYi9xPUKpUxyYj3nRcK5YaBvSpjgJQSiKqeP6XcZMVKS+
         rQvD4k9WFlgbnbnaA4KPJ9RAFCTB7hQzTBH8mLODqwvq+m/pGxfKI9X/4lAKLPGDbbjc
         xZ604FGu99gcjaqDl6mkTUDZNT7xWDANLlR1W1uc6ittyIBkJD61XN786NVp3HxWlt5J
         9ZPg==
X-Gm-Message-State: AOAM532YW4ZV62AXpX9fTRM0MieEGFxFc8rLNGSmh2Ur7+1ToabsDAY+
        ECFnQlLxvKMs0mR/7EowjAzybMVJ0MUnfQ==
X-Google-Smtp-Source: ABdhPJwUrpQ9Pzms5LHw67o/9oe08Z71KnU0ngiOhsEGVQg52AAIYd1acSzIiOLbEkxm+f9otDYStQ==
X-Received: by 2002:a63:474f:0:b0:374:7607:e45 with SMTP id w15-20020a63474f000000b0037476070e45mr26787862pgk.234.1646231550147;
        Wed, 02 Mar 2022 06:32:30 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id h22-20020a056a001a5600b004f41a2a6cf9sm10286483pfv.134.2022.03.02.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 06:32:29 -0800 (PST)
Date:   Wed, 2 Mar 2022 22:32:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v2 1/2] line-config: expose the override
 logic to users
Message-ID: <20220302143224.GA93284@sol>
References: <20220221154055.654819-1-brgl@bgdev.pl>
 <20220221154055.654819-2-brgl@bgdev.pl>
 <20220222114044.GA37327@sol>
 <CAMRc=McgbWJnT=_ni8-zVL2Lo=6-CMUbBDrb8F12cPC_mKNNPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McgbWJnT=_ni8-zVL2Lo=6-CMUbBDrb8F12cPC_mKNNPA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 02, 2022 at 01:59:31PM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 22, 2022 at 12:40 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Feb 21, 2022 at 04:40:54PM +0100, Bartosz Golaszewski wrote:
> > > We've already added getters for line-config but without exposing some
> > > parts of the internal logic of the object, the user can't really get
> > > the full picture and inspect the contents. This patch reworks the
> > > accessors further by providing access to the underlying override
> > > mechanism.
> > >
> > > For every setting, we expose a getter and setter for the default value
> > > as well as a set of four functions for setting, getting, clearing and
> > > checking per-offset overrides.
> > >
> > > An override can initially have the same value as the defaults but will
> > > retain the overridden value should the defaults change.
> > >
> > > We also complete the API by providing functions that allow to identify
> > > offsets for which at least one setting is overriden.
> > >
> > > This way the caller can fully inspect the line_config and high-level
> > > language bindings can provide stringification methods.
> > >
> > > While at it: we fix a couple bugs in the implementation of struct
> > > line_config.
> > >
> >
> > TLDR: I've got a lot of nitpicks on the doco, but it might be simpler
> > for you to apply this patch as is and for me to submit a patch with doco
> > tweaks than for you to try to sort out my comments!
> >
> > The actual code looks good, so
> >
> > Reviewed-by: Kent Gibson <warthog618@gmail.com>
> >
> > with or without the suggested doco changes.
> >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> > >  include/gpiod.h   | 509 ++++++++++++++++++++-----------
> > >  lib/line-config.c | 752 +++++++++++++++++++++++++++++-----------------
> > >  tools/gpioget.c   |   6 +-
> > >  tools/gpiomon.c   |   6 +-
> > >  tools/gpioset.c   |   9 +-
> > >  5 files changed, 821 insertions(+), 461 deletions(-)
> > >

[snip]

> > >  /**
> > > @@ -480,329 +505,424 @@ void gpiod_line_config_free(struct gpiod_line_config *config);
> > >  void gpiod_line_config_reset(struct gpiod_line_config *config);
> > >
> > >  /**
> > > - * @brief Set the direction of all lines.
> > > + * @brief Set the default direction setting.
> >
> > Nitpick: "setting" feels redundant given the "Set".  Same thoughout,
> > including the "Get" cases.
> >
> 
> What would you prefer it to be? "@brief Direction of all lines"?
> Doesn't look right to me. It's normal for the doc to use a verb to say
> what the function does.
> 

"setting" is the redundant word to be removed:

@brief Set the default direction.

If you want to describe the scope as well then:

@brief Set the default direction for all requested lines.

Though the function scopes are described in the object documentation,
I'm good with the shorter version.

> > >   * @param config Line config object.
> > >   * @param direction New direction.
> > >   */
> > > -void gpiod_line_config_set_direction(struct gpiod_line_config *config,
> > > -                                  int direction);
> > > +void gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
> > > +                                          int direction);
> > >
> > >  /**
> > > - * @brief Set the direction for a single line at given offset.
> > > + * @brief Set the direction override at given offset.
> >
> > Nitpick: "at given offset" -> "for the line" throughout.
> > Similarly "at this offset" -> "for this line",
> > and "line at given offset" -> "line",
> > and "for a given offset" -> "for a line".
> >
> 
> I think that speaking of offsets makes it more explicit and switching
> to your alternatives dilutes the meaning here. This is still the
> configuration and we don't have any real lines yet. Just offset ->
> value mappings.
> 

Are you just winding me up ;-)?

You don't have any __requested__ lines yet, but the lines physically
exist and here you are specifying the config to be applied TO THE LINE
when it is requested.  So the config is most certainly for the line
- the offset is just a line identifier (as is the line name).

If the name were the identifier then your documentation would read:

@brief Set the direction override with the given name.

which makes no sense.

whereas mine would still read:

@brief Set the direction override for the line.

Perhaps rename the function and object "gpiod_offset_config" for clarity??
(being sarcastic - please don't).

Still prefer my suggestion, or even the previous version to the v2 version.

> >
> > >   * @param config Line config object.
> > >   * @param direction New direction.
> > > - * @param offset Offset of the line for which to set the direction.
> > > + * @param offset Offset of the line for which to set the override.
> > >   */
> > > -void gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
> > > -                                         int direction, unsigned int offset);
> > > +void gpiod_line_config_set_direction_override(struct gpiod_line_config *config,
> > > +                                           int direction,
> > > +                                           unsigned int offset);
> > >
> > >  /**
> > > - * @brief Set the direction for a subset of lines.
> > > + * @brief Clear the direction override at given offset.
> > >   * @param config Line config object.
> > > - * @param direction New direction.
> > > - * @param num_offsets Number of offsets in the array.
> > > - * @param offsets Array of line offsets for which to set the direction.
> > > + * @param offset Offset of the line for which to clear the override.
> > > + * @note Does nothing if no override is set for this line.
> > >   */
> > > -void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
> > > -                                         int direction,
> > > -                                         unsigned int num_offsets,
> > > -                                         const unsigned int *offsets);
> > > +void
> > > +gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
> > > +                                        unsigned int offset);
> > > +
> > > +/**
> > > + * @brief Check if the direction setting is overridden at given offset.
> > > + * @param config Line config object.
> > > + * @param offset Offset of the line for which to check the override.
> > > + * @return True if direction is overridden at this offset, false otherwise.
> > > + */
> > > +bool gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
> > > +                                            unsigned int offset);
> > >
> > >  /**
> > > - * @brief Get the direction setting for a given line.
> > > + * @brief Get the default direction setting.
> > > + * @param config Line config object.
> > > + * @return Direction setting that would have been used for any non-overridden
> > > + *         offset.
> > > + */
> > > +int gpiod_line_config_get_direction_default(struct gpiod_line_config *config);
> > > +
> > > +/**
> > > + * @brief Get the direction setting for a given offset.
> >
> > Preferred "given line".  The direction is an attribute of the line, not
> > the offset.  The offset is the line identifier.
> > Same throughout.
> 
> If I were consistent with my own previous docs, it would be "for the
> line at given offset".
> 

Sure, but I find the "at given offset" redundant in the function @brief
since you repeat it in the @param offset below.  Once is enough, and
if anywhere then in the @param.

> >
> > >   * @param config Line config object.
> > >   * @param offset Line offset for which to read the direction setting.
> >
> > Nitpick: "Line offset" -> "Offset of the line"
> 
> Sounds good.
> 

I was on the fence about suggesting adding the "The" as well, so "The
offset of the line" to make it more grammatically correct, but it is
frequently dropped from documentation and missing in so many other places
that I went without for consistency.

But again, this is all just documentation tweaks, so don't get hung up on
anything - looking forward to v3.

Cheers,
Kent.

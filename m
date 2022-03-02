Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4DA4CA9B2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Mar 2022 16:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiCBPz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Mar 2022 10:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiCBPzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Mar 2022 10:55:55 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68123CB91A
        for <linux-gpio@vger.kernel.org>; Wed,  2 Mar 2022 07:55:11 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id d10so4625108eje.10
        for <linux-gpio@vger.kernel.org>; Wed, 02 Mar 2022 07:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TVz/hmmSQx38DIsTswONzAwtDrhJRf2usHa+sxhIUzA=;
        b=a+lfJycuz6K6KG9PZk6+b2WscqP1Rdbe32JG4y0mkOONIwKxwsn65rqSWsiBewl7s2
         EvlXknFAEOJXsFZpzq/c39oIq9FCVvLydoofjGeGlFaXyIpQpyI/ddZmVkASN+RDEy96
         7RJT1q98PC+cFYpR5M63ppbsC9cSdF022b5E2L/7PDL6ryTpYRjz836PGQqXDfbLStbM
         lqpPtq/GJR+ehcB0SMTAkx7ufRf+O3mi85JyiuJAjbYbKe8xf+fASc1NHN/KauEWtd5t
         oAdtOP746sx8RH7Dq6ewde+QnwS024/rag6/+azb4tJhmoAbM5ZWm8b/MrO38nBftKUf
         Xfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TVz/hmmSQx38DIsTswONzAwtDrhJRf2usHa+sxhIUzA=;
        b=mLjq4dfe4+OTyGMwzBpTFmovvBpClRCjQjM+zZ4myxhB2klh9HKfzRrfrHn37NfM2d
         2Oesu9d/FPIw0BBHkoiTy61zRgLxTcqn5XdmMb08MO8rbFnQNffAk94ywbxY7CrS0KcE
         OxUuJAvzy/BMhiYUSnFfTH9hVtumAypLkcNAyBIg23f/PFlho6Mzoy6HXsdizljfan2O
         8BiHTjpxo7xY1+qXGDCAFiLFwonhUZ9u4XJjfRJ66Zm6xHbAAOk2zCjX7+JZLg6wG6oV
         yiKAhUgsVZJyYuZhAiCGqH3mAdQn92RNgy6emVG2yLzb8JimNwVdFL6n7iOOngE29oii
         k+Tw==
X-Gm-Message-State: AOAM532jAJGqcEG0GNtl24l+wGPcIT6hmmFWPZl+DzqHHQTzPvXrEpXf
        Ksuyb85FNBxIVIVPW33JELmzwimpTg6jX8PF5lrYw9YM0Tc=
X-Google-Smtp-Source: ABdhPJxSbd48oyiWr6Yt350mWM+4tuSdZw0q2Zj8zV/Iqq0U9Up3W41ZzbgMUm/GOgW3i9WEHYFVTzpaKGxVcW3MN/k=
X-Received: by 2002:a17:906:40c9:b0:6cf:1fb3:aca with SMTP id
 a9-20020a17090640c900b006cf1fb30acamr22868876ejk.101.1646236509903; Wed, 02
 Mar 2022 07:55:09 -0800 (PST)
MIME-Version: 1.0
References: <20220221154055.654819-1-brgl@bgdev.pl> <20220221154055.654819-2-brgl@bgdev.pl>
 <20220222114044.GA37327@sol> <CAMRc=McgbWJnT=_ni8-zVL2Lo=6-CMUbBDrb8F12cPC_mKNNPA@mail.gmail.com>
 <20220302143224.GA93284@sol>
In-Reply-To: <20220302143224.GA93284@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Mar 2022 16:54:59 +0100
Message-ID: <CAMRc=MfR8QuSsBK3_7TOdXBudGzm9HFNBEKwabaR1cctijBKxQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 1/2] line-config: expose the override
 logic to users
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 2, 2022 at 3:32 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Mar 02, 2022 at 01:59:31PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Feb 22, 2022 at 12:40 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Mon, Feb 21, 2022 at 04:40:54PM +0100, Bartosz Golaszewski wrote:
> > > > We've already added getters for line-config but without exposing some
> > > > parts of the internal logic of the object, the user can't really get
> > > > the full picture and inspect the contents. This patch reworks the
> > > > accessors further by providing access to the underlying override
> > > > mechanism.
> > > >
> > > > For every setting, we expose a getter and setter for the default value
> > > > as well as a set of four functions for setting, getting, clearing and
> > > > checking per-offset overrides.
> > > >
> > > > An override can initially have the same value as the defaults but will
> > > > retain the overridden value should the defaults change.
> > > >
> > > > We also complete the API by providing functions that allow to identify
> > > > offsets for which at least one setting is overriden.
> > > >
> > > > This way the caller can fully inspect the line_config and high-level
> > > > language bindings can provide stringification methods.
> > > >
> > > > While at it: we fix a couple bugs in the implementation of struct
> > > > line_config.
> > > >
> > >
> > > TLDR: I've got a lot of nitpicks on the doco, but it might be simpler
> > > for you to apply this patch as is and for me to submit a patch with doco
> > > tweaks than for you to try to sort out my comments!
> > >
> > > The actual code looks good, so
> > >
> > > Reviewed-by: Kent Gibson <warthog618@gmail.com>
> > >
> > > with or without the suggested doco changes.
> > >
> > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > > ---
> > > >  include/gpiod.h   | 509 ++++++++++++++++++++-----------
> > > >  lib/line-config.c | 752 +++++++++++++++++++++++++++++-----------------
> > > >  tools/gpioget.c   |   6 +-
> > > >  tools/gpiomon.c   |   6 +-
> > > >  tools/gpioset.c   |   9 +-
> > > >  5 files changed, 821 insertions(+), 461 deletions(-)
> > > >
>
> [snip]
>
> > > >  /**
> > > > @@ -480,329 +505,424 @@ void gpiod_line_config_free(struct gpiod_line_config *config);
> > > >  void gpiod_line_config_reset(struct gpiod_line_config *config);
> > > >
> > > >  /**
> > > > - * @brief Set the direction of all lines.
> > > > + * @brief Set the default direction setting.
> > >
> > > Nitpick: "setting" feels redundant given the "Set".  Same thoughout,
> > > including the "Get" cases.
> > >
> >
> > What would you prefer it to be? "@brief Direction of all lines"?
> > Doesn't look right to me. It's normal for the doc to use a verb to say
> > what the function does.
> >
>
> "setting" is the redundant word to be removed:
>

Sorry, it's my ESL.

> @brief Set the default direction.
>
> If you want to describe the scope as well then:
>
> @brief Set the default direction for all requested lines.
>
> Though the function scopes are described in the object documentation,
> I'm good with the shorter version.
>
> > > >   * @param config Line config object.
> > > >   * @param direction New direction.
> > > >   */
> > > > -void gpiod_line_config_set_direction(struct gpiod_line_config *config,
> > > > -                                  int direction);
> > > > +void gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
> > > > +                                          int direction);
> > > >
> > > >  /**
> > > > - * @brief Set the direction for a single line at given offset.
> > > > + * @brief Set the direction override at given offset.
> > >
> > > Nitpick: "at given offset" -> "for the line" throughout.
> > > Similarly "at this offset" -> "for this line",
> > > and "line at given offset" -> "line",
> > > and "for a given offset" -> "for a line".
> > >
> >
> > I think that speaking of offsets makes it more explicit and switching
> > to your alternatives dilutes the meaning here. This is still the
> > configuration and we don't have any real lines yet. Just offset ->
> > value mappings.
> >
>
> Are you just winding me up ;-)?
>
> You don't have any __requested__ lines yet, but the lines physically
> exist and here you are specifying the config to be applied TO THE LINE
> when it is requested.  So the config is most certainly for the line
> - the offset is just a line identifier (as is the line name).
>
> If the name were the identifier then your documentation would read:
>
> @brief Set the direction override with the given name.
>
> which makes no sense.
>
> whereas mine would still read:
>
> @brief Set the direction override for the line.
>
> Perhaps rename the function and object "gpiod_offset_config" for clarity??
> (being sarcastic - please don't).
>
> Still prefer my suggestion, or even the previous version to the v2 version.
>
> > >
> > > >   * @param config Line config object.
> > > >   * @param direction New direction.
> > > > - * @param offset Offset of the line for which to set the direction.
> > > > + * @param offset Offset of the line for which to set the override.
> > > >   */
> > > > -void gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
> > > > -                                         int direction, unsigned int offset);
> > > > +void gpiod_line_config_set_direction_override(struct gpiod_line_config *config,
> > > > +                                           int direction,
> > > > +                                           unsigned int offset);
> > > >
> > > >  /**
> > > > - * @brief Set the direction for a subset of lines.
> > > > + * @brief Clear the direction override at given offset.
> > > >   * @param config Line config object.
> > > > - * @param direction New direction.
> > > > - * @param num_offsets Number of offsets in the array.
> > > > - * @param offsets Array of line offsets for which to set the direction.
> > > > + * @param offset Offset of the line for which to clear the override.
> > > > + * @note Does nothing if no override is set for this line.
> > > >   */
> > > > -void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
> > > > -                                         int direction,
> > > > -                                         unsigned int num_offsets,
> > > > -                                         const unsigned int *offsets);
> > > > +void
> > > > +gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
> > > > +                                        unsigned int offset);
> > > > +
> > > > +/**
> > > > + * @brief Check if the direction setting is overridden at given offset.
> > > > + * @param config Line config object.
> > > > + * @param offset Offset of the line for which to check the override.
> > > > + * @return True if direction is overridden at this offset, false otherwise.
> > > > + */
> > > > +bool gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
> > > > +                                            unsigned int offset);
> > > >
> > > >  /**
> > > > - * @brief Get the direction setting for a given line.
> > > > + * @brief Get the default direction setting.
> > > > + * @param config Line config object.
> > > > + * @return Direction setting that would have been used for any non-overridden
> > > > + *         offset.
> > > > + */
> > > > +int gpiod_line_config_get_direction_default(struct gpiod_line_config *config);
> > > > +
> > > > +/**
> > > > + * @brief Get the direction setting for a given offset.
> > >
> > > Preferred "given line".  The direction is an attribute of the line, not
> > > the offset.  The offset is the line identifier.
> > > Same throughout.
> >
> > If I were consistent with my own previous docs, it would be "for the
> > line at given offset".
> >
>
> Sure, but I find the "at given offset" redundant in the function @brief
> since you repeat it in the @param offset below.  Once is enough, and
> if anywhere then in the @param.
>
> > >
> > > >   * @param config Line config object.
> > > >   * @param offset Line offset for which to read the direction setting.
> > >
> > > Nitpick: "Line offset" -> "Offset of the line"
> >
> > Sounds good.
> >
>
> I was on the fence about suggesting adding the "The" as well, so "The
> offset of the line" to make it more grammatically correct, but it is
> frequently dropped from documentation and missing in so many other places
> that I went without for consistency.
>
> But again, this is all just documentation tweaks, so don't get hung up on
> anything - looking forward to v3.
>

Yeah, I'll just resend what I have and let you handle the docs later.
I'm not a native English speaker so what am I even doing second
guessing you here. :)

> Cheers,
> Kent.

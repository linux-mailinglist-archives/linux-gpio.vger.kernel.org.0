Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65CCD4CE71E
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Mar 2022 21:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiCEU6a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Mar 2022 15:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiCEU6a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Mar 2022 15:58:30 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F723A3
        for <linux-gpio@vger.kernel.org>; Sat,  5 Mar 2022 12:57:37 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id kt27so24370260ejb.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Mar 2022 12:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G9eQvyTi3rW7p5HwohWwo2NvymTYr/c+fiJEGJ4c6RQ=;
        b=zIQC6wxJF+bcBFrCxXKC5TB4bKlFg389Ab3sU8tcXvYpZAYr8llcnzxwmt7yGFNUcZ
         3QgxX2MCElfGUFp+S2DjPul5qqHwL8c9SgcxXt9sLcHZupjQkfPgqPIg5WSVCCg+J95G
         DdlyEW1t27eu3cF8vSiMHiv2pYVc/iEjWjo0rb9HyXieCDEhSqi0YAbwZjeqdDfjHbYt
         G1brTygAqXIMu4CO4aE21qecM6FfvoDN6U7BTzUDWiZdNeYBYX79m3sFVpIojWCJGiBQ
         /hEdHFWt28smW1h7ePGlfY6cUl2Qqy/+WBs4k60XGBhaaDVrWoQ1i2EgQJBBH9Unl/rx
         soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G9eQvyTi3rW7p5HwohWwo2NvymTYr/c+fiJEGJ4c6RQ=;
        b=RBF91AzxmLAseQ2F7RDUkKAU8xuXZnlh59PTXHBabdYU/LqprMFluEkdHPAe7zpA2y
         ubMB/cAxrL09vPwIHbvEVFjnysJNc9NGGqoYpkQCN+SpZERPuVuGM5IJu+4pCIhLImts
         V8PTMRMOFJWxZYFZuv4xEkPWf+ZzMc0yWMathnjhtmeTccL5HikBrAaO2EiPH0Q/rZJA
         Ddqv000DCPwOcI8ijceTg7CIPMLYJrR5nrSKH/iGnXiV8w1+V3ZqIdyvrU4cDh5Slmk4
         O/e3KMQgpr7Ns4zjsK3xsQwA3lif+AdiqiS+4Z19Igxm3P+NWjmzawPwjuWBpYZDzexU
         GhQQ==
X-Gm-Message-State: AOAM532mHLUU1rHJsKaGmPxv1Ea9fRd2gKbsTmAS2G3cqzgh9Go4FeE8
        2Su4TAaffZ31SfJGmDX+AD926Z1Fxh9lAGSdedLpZQ==
X-Google-Smtp-Source: ABdhPJxnPFxJfrCecuSR7EDZgcB9LJVO+GuPLW08uFzjaSio1fIrtWPBELMzPetUkI6IfTGMvk1D+Wi6b6Uy2hWkRh8=
X-Received: by 2002:a17:907:72c3:b0:6ce:5256:1125 with SMTP id
 du3-20020a17090772c300b006ce52561125mr3947040ejc.697.1646513855632; Sat, 05
 Mar 2022 12:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20220303091836.168223-1-brgl@bgdev.pl> <20220303091836.168223-3-brgl@bgdev.pl>
 <20220305055107.GB9638@sol>
In-Reply-To: <20220305055107.GB9638@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 5 Mar 2022 21:57:25 +0100
Message-ID: <CAMRc=Mc0uLb5tOFsUiyTsOmHSduuhAqCoHNF8uNE9qnQaHmT2g@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 2/3] line-config: expose the override
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

On Sat, Mar 5, 2022 at 6:51 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Mar 03, 2022 at 10:18:35AM +0100, Bartosz Golaszewski wrote:
> > We've already added getters for line-config but without exposing some
> > parts of the internal logic of the object, the user can't really get
> > the full picture and inspect the contents. This patch reworks the
> > accessors further by providing access to the underlying override
> > mechanism.
> >
> > For every setting, we expose a getter and setter for the default value
> > as well as a set of four functions for setting, getting, clearing and
> > checking per-offset overrides.
> >
> > An override can initially have the same value as the defaults but will
> > retain the overridden value should the defaults change.
> >
> > We also complete the API by providing functions that allow to retrieve
> > the overridden offsets and their corresponding property types.
> >
> > This way the caller can fully inspect the line_config and high-level
> > language bindings can provide stringification methods.
> >
> > While at it: we fix a couple bugs in the implementation of struct
> > line_config and add new constructors that take a variable list of
> > arguments.
> >
>
> The variadic constructor is new for patch v3.
> It bundles default constructor + default mutators, so doesn't add
> functionality that wasn't already available - it just makes it
> accessible via a single function call.
> Is the variadic form beneficial for bindings, say Python, where you
> would prefer not to be making a bunch of C calls?
> Or is this just sugar?
>

No, there's no benefit for the bindings as they can't possibly
construct a va_list. I very much intend to have keyword arguments in
Python but the only reason I added the new constructors is to justify
adding the GPIOD_LINE_CONFIG_PROP_* enum because without them it would
only be used for retrieving the override list.

> No major objection, just curious about the rationale for adding it.
>

Actually looking at them now, I think they don't make much sense and I
think about dropping them from the next iteration. It's not like the
enum increases the executable size really.

> [snip]
>
> > +/**
> > + * @brief Get the total number of overridden settings currently stored by this
> > + *        line config object.
> > + * @param config Line config object.
> > + * @return Number of individual overridden settings.
> > + */
> > +unsigned int
> > +gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
> > +
> > +/**
> > + * @brief Get the list of overridden offsets and the corresponding types of
> > + *        overridden settings.
> > + * @param config Line config object.
> > + * @param offsets Array to store the overidden offsets. Must hold at least the
> > + *                number of unsigned integers returned by
> > + *                ::gpiod_line_config_get_output_value_offset.
> > + * @param props Array to store the types of overridden settings. Must hold at
> > + *              least the number of integers returned by
> > + *              gpiod_line_config_get_output_value_offset.
> > + */
>
> The purpose of the offsets and props arrays is not clear.
> Clarify that you are returning a list of (offset,prop), split across the
> two arrays.
> Replace them with a single array of (offset,prop) unless there is
> a good reason to keep them separate?

The only (but good) reason is to not introduce another data structure.
Especially a public one. This function is not going to be used a lot I
suppose so I don't care if it's awkward to use.

>
> Guessing it should be gpiod_line_config_get_num_overrides(), not
> gpiod_line_config_get_output_value_offset() which returns 0 or 1, or
> even better -1 for inputs?
>

Yep, just a wrong copy/paste.

> [snip]
>
> > +GPIOD_API unsigned int
> > +gpiod_line_config_get_num_overrides(struct gpiod_line_config *config)
> > +{
> > +     struct override_config *override;
> > +     unsigned int i, j, count = 0;
> >
> > -     errno = ENXIO;
> > +     for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
> > +             override = &config->overrides[i];
> > +
> > +             if (override_used(override)) {
> > +                     for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
> > +                             if (override->override_flags &
> > +                                 override_flag_list[j])
> > +                                     count++;
> > +                     }
> > +             }
> > +     }
> > +
> > +     return count;
> > +}
> > +
>
> Using GPIO_V2_LINES_MAX for the size of the overrides array is
> confusing, and the two should be de-coupled so you can more easily resize
> the array if necessary.
> Provide a NUM_OVERRIDES_MAX, or similar, and use that when referring
> to the size of the overrides array.
>

Makes sense.

> > +static int override_flag_to_prop(int flag)
> > +{
> > +     switch (flag) {
> > +     case OVERRIDE_FLAG_DIRECTION:
> > +             return GPIOD_LINE_CONFIG_PROP_DIRECTION;
> > +     case OVERRIDE_FLAG_EDGE:
> > +             return GPIOD_LINE_CONFIG_PROP_EDGE;
> > +     case OVERRIDE_FLAG_BIAS:
> > +             return GPIOD_LINE_CONFIG_PROP_BIAS;
> > +     case OVERRIDE_FLAG_DRIVE:
> > +             return GPIOD_LINE_CONFIG_PROP_DRIVE;
> > +     case OVERRIDE_FLAG_ACTIVE_LOW:
> > +             return GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW;
> > +     case OVERRIDE_FLAG_DEBOUNCE_PERIOD:
> > +             return GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD;
> > +     case OVERRIDE_FLAG_CLOCK:
> > +             return GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK;
> > +     case OVERRIDE_FLAG_OUTPUT_VALUE:
> > +             return GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE;
> > +     }
> > +
> > +     /* Can't happen. */
> >       return -1;
> >  }
> >
> > +GPIOD_API void
> > +gpiod_line_config_get_overrides(struct gpiod_line_config *config,
> > +                             unsigned int *offsets, int *props)
> > +{
> > +     struct override_config *override;
> > +     unsigned int i, j, count = 0;
> > +
> > +     for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
> > +             override = &config->overrides[i];
> > +
> > +             if (override_used(override)) {
> > +                     for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
> > +                             if (override->override_flags &
> > +                                 override_flag_list[j]) {
> > +                                     offsets[count] = override->offset;
> > +                                     props[count] = override_flag_to_prop(
> > +                                                     override_flag_list[j]);
> > +                                     count++;
> > +                             }
> > +                     }
> > +             }
> > +     }
> > +}
> > +
>
> Return the count?
> Would be a bit redundant, as the user needs to call
> gpiod_line_config_get_num_overrides() to size the offsets and props
> arrays beforehand, but the usual patten when writing into a passed array
> is to return the number of elements written.
>

So there are two typical approaches: take the size of the passed
buffer as argument and return the number of elements actually written
or define the required size of the buffer (in this case: the size
returned by the get_num_overrides func) and don't return that number.
I don't think it would be of any use so let's not return a value
nobody would check.

> Cheers,
> Kent.

Bart

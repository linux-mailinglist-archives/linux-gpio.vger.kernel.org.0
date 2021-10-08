Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F0F42714A
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 21:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhJHTRb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 15:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbhJHTRa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 15:17:30 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059B7C061570
        for <linux-gpio@vger.kernel.org>; Fri,  8 Oct 2021 12:15:35 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id p13so40675897edw.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Oct 2021 12:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bw3ds29XinXwW1KEBljx493lcjaPJSd3SSCdxWGuvg8=;
        b=FG/7crXKJQ1+RGfM2AebqtZIbOdrK6naSx3mxE1upBkMeJUEk/ZJA+mH4mQ8BUxpnu
         UpWtjOEjcct/b8g0MxKKlyu5DoPjQj7tNo17py6iOlmX3xYgU0bTAixoZFBXWzV0mtXs
         242qGhAe+UI+0DlvB67GdCOphlIy39x3lPENC5gFemcfslzr/9V+dXs2Sa8EwaRO14et
         b8jSyMYqruB23/RtkJwlLz/LPLVehNO5lXftc9VgrimwyiT088tKIhoxL5ktuiAixKDn
         ZPzEykEC3EEyD5r83aUldM0cDoehNjCyd9bgEgiI1uGzx97A1jhpmnN0h0GkwIqNrpPx
         wJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bw3ds29XinXwW1KEBljx493lcjaPJSd3SSCdxWGuvg8=;
        b=o/IbaJzlVXvt9T7hYIzAy/vXn7QQ3PpyHeRoDYRvsMb+ChMKNHsy2z3cl86xl2sjvG
         wYbc6QCsLfapXt5x3wZ5+os/fpuQqkWLBsRwkUhgETTNrkWTBKPMNzCk+EY6/1UX4RqV
         4IXBUl1owVVvBLHXw4cxaybd20aC1IopGT8D+1sg1JzKrFoEjqYtE3WXyhuJpmL+9gwv
         YL3Cc5yQGbws9qQI6hwvdNHuaiX6hy9v8PJkdnHGTCuXGC+l1AXsQDgzyGeBBXb/Svbd
         ui8FKl4rkoqnmPZsiwfGACk57ZNUtTuqqGEZBjOEnEOaS4AtBmJle9DZkymC24K7ItIg
         bL0g==
X-Gm-Message-State: AOAM5322q4hy2+OStQ0vD+j6ZaeIuLTrFXPvQrVCLgdbQ3MQtORZY1uf
        X59iAS/8GaeMelBvPhAe6ab63zR9hT3GABeQO5zAbA==
X-Google-Smtp-Source: ABdhPJwyRk3zCtdm0a0Mvm3CHn1BFMyhKDjNgDw/4sqwSCL8PtZV6KSgD2JURURpKihLbp0ZypdHiMCgpdm0uItioVY=
X-Received: by 2002:a50:e08c:: with SMTP id f12mr17368589edl.178.1633720533495;
 Fri, 08 Oct 2021 12:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210922081100.16753-1-brgl@bgdev.pl> <20211005042022.GA109255@sol>
In-Reply-To: <20211005042022.GA109255@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Oct 2021 21:15:22 +0200
Message-ID: <CAMRc=MfJVAB4day4Qvq1VdMcoqH6pLr7=FFjri=6VotxqtZ3Bg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] line-config: rework the internal implementation
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

On Tue, Oct 5, 2021 at 6:20 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Sep 22, 2021 at 10:11:00AM +0200, Bartosz Golaszewski wrote:
> > This reworks how the line config objects work internally. In order to reduce
> > the size of the gpiod_line_config objects, we switch from using a set number
> > of override config structures with each storing a list of line offsets to
> > storing a smaller override object for each of the maximum of 64 lines.
> > Additionally these internal config structures are now packed and only occupy
> > the minimum required amount of memory.
> >
> > The processing of these new overrides has become a bit more complicated but
> > should actually be more robust wrt corner cases.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> Given the level of rework the diff is harder work than looking at the
> resulting code, but it all looks good to me.
> A few minor comments scattered below.
>

[snip]

> >
> >  GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
>
> You don't have any change to gpiod_line_config_free() here, but
> isn't free() guaranteed to be NULL aware, so you can drop the NULL
> check?
> If not, couldn't it be flipped to:
>
>         if (config)
>                 free(config);
>
> Similarly gpiod_line_config_new() could have
>
>         if (config)
>                 gpiod_line_config_reset(config);
>
> and that "if" could be dropped if gpiod_line_config_reset() were NULL
> aware.
>

No, you're right, as long as we don't dereference the pointer, we can
drop the check. Here and elsewhere.

> But the general policy is that gpiod functions are not NULL aware?
>

In general yes, but various free functions are NULL-aware.

[snip]

> >  static struct base_config *
> > -get_base_config_for_offset(struct gpiod_line_config *config,
> > -                        unsigned int offset)
> > +get_base_config_for_reading(struct gpiod_line_config *config,
> > +                        unsigned int offset, unsigned int flag)
> >  {
> > -     struct secondary_config *secondary;
> > -     unsigned int i, j;
> > -
> > -     /*
> > -      * We're looking backwards as the settings get overwritten if set
> > -      * multiple times.
> > -      */
> > -     for (i = config->num_secondary; i > 0; i--) {
> > -             secondary = &config->secondary[i - 1];
> > +     struct override_config *override;
> >
> > -             for (j = 0; j < secondary->num_offsets; j++) {
> > -                     if (secondary->offsets[j] == offset)
> > -                             return &secondary->config;
> > -             }
> > -     }
> > +     override = get_override_by_offset(config, offset);
> > +     if (!override || !(override->override_flags & flag))
> > +             return &config->defaults;
> >
> > -     return NULL;
> > +     return &override->base;
> >  }
> >
>
> Maybe flip the logic around to make it easier to read:
>
>         if (override && (override->override_flags & flag))
>                 return &override->base;
>
>     return &config->defaults;
>
> Similarly in gpiod_line_config_get_output_value().
>

Done.

> >  static void set_direction(struct base_config *config, int direction)
>
> In set_direction() you have a specific case (GPIOD_LINE_DIRECTION_AS_IS)
> that matches the default behaviour.  I generally drop that case and let
> the default handle it, but that is just personal preference.
>
> Similarly in other set_XXX switches.
>

My personal preference is to be explicit and include those default
cases even if only to tell my future self what's happening here.

> > @@ -209,7 +170,7 @@ static void set_direction(struct base_config *config, int direction)
> >  GPIOD_API void
> >  gpiod_line_config_set_direction(struct gpiod_line_config *config, int direction)
> >  {
> > -     set_direction(&config->primary, direction);
> > +     set_direction(&config->defaults, direction);
> >  }
> >
> >  GPIOD_API void
> > @@ -224,13 +185,19 @@ gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
> >                                      int direction, unsigned int num_offsets,
> >                                      const unsigned int *offsets)
> >  {
> > -     struct secondary_config *secondary;
> > +     struct override_config *override;
> > +     unsigned int i, offset;
> >
> > -     secondary = get_secondary_config(config, num_offsets, offsets);
> > -     if (!secondary)
> > -             return;
> > +     for (i = 0; i < num_offsets; i++) {
> > +             offset = offsets[i];
> >
>
> Worth the effort given it is only used once?
>

Must have been a leftover, thanks.

[snip]

> >
> >  GPIOD_API void
> > @@ -464,20 +448,26 @@ gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
> >                                        unsigned int num_offsets,
> >                                        const unsigned int *offsets)
> >  {
> > -     struct secondary_config *secondary;
> > +     struct override_config *override;
> > +     unsigned int i, offset;
> >
> > -     secondary = get_secondary_config(config, num_offsets, offsets);
> > -     if (!secondary)
> > -             return;
> > +     for (i = 0; i < num_offsets; i++) {
> > +             offset = offsets[i];
> > +
> > +             override = get_override_config_for_writing(config, offset);
> > +             if (!override)
> > +                     return;
> >
> > -     secondary->config.active_low = false;
> > +             override->base.active_low = false;
> > +             override->override_flags |= OVERRIDE_FLAG_ACTIVE_LOW;
> > +     }
> >  }
> >
>
> gpiod_line_config_set_active_low_subset() and
> gpiod_line_config_set_active_high_subset() could call a common helper
> that accepts the active_low as a parameter?
>

Makes sense.

[snip]

> > +
> > +static bool override_config_debounce_period_is_equal(struct override_config *a,
> > +                                                  struct override_config *b)
> > +{
> > +     if (base_debounce_period_is_equal(&a->base, b) &&
> > +         ((a->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD) ==
> > +          (b->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD)))
> > +             return true;
> > +
> > +     return false;
> > +}
> > +
>
> To improve readability, flip the order here to test the flag equivalence
> first.
> Particularly wrt the "a" doesn't have debounce overridden case.
>

Done.

[snip]

>
> Don't see anything wrong here, but I'd like to see a bunch of tests to
> cover the corner cases you mentioned, as the bulk of the module complexity
> is here.
> Not that I expect that now.
>

Yes, definitely. Trying to get the gpio-sim module upstream for this
exact reason. Please take a look at this series if you can.

[snip]

>
> Overall it looks really good to me, so no problem with applying it,
> with or without my suggestions.

I've applied most of your suggestions and will squash this into the
big patch, thanks as usual!

Bart

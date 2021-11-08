Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4061B447825
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 02:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhKHBFY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Nov 2021 20:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhKHBFX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Nov 2021 20:05:23 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35788C061570
        for <linux-gpio@vger.kernel.org>; Sun,  7 Nov 2021 17:02:33 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id n11-20020a17090a2bcb00b001a1e7a0a6a6so7527010pje.0
        for <linux-gpio@vger.kernel.org>; Sun, 07 Nov 2021 17:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fi2NYQeytkcwRmtVNFzBAgCJCK81RcrQpg8fS3RDqEo=;
        b=KiowmtefTEWYuKIjkJPGvprImSfpEZZjxtVnU9tlAKZ+ej+B9EOAYhHWplCOC5J7FF
         heTr6H47siiLn6wC8PtIqCPHuuV0ImjjIJ9ZGvpYKhRlQal6nFxAQ/4mv1B5LsUTVJz2
         ErgKJ5Wn3oEFhfynGMzc/qd81ufpgq/PgLn8kzDJ1MkK8WPSNangVI3S/M3v1nBn4Ic1
         +D3Qpxcf/4L5ziptapgoU8Mh5RM7gBXMCDNTRA+2imwDPkocPfHSc1IsUWDro9ZV/cav
         DgTux4+MMLCKU+jlCVxY0dtG/Bru5HMIaUmeciy6UOtH/rWTuQB8p7Fl2eFJTJK5p0fK
         kGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fi2NYQeytkcwRmtVNFzBAgCJCK81RcrQpg8fS3RDqEo=;
        b=2U4REtvR86mij7Law9zgPR58/ZwCDD02jrW6DvjgfXkscxn7NGCHoCb/N20NFiEdw4
         Q1Kc5AMBx409WXP6Z6/6E2bqERuktg0LLMwBGm2grB4NG64m/XZlWcAVAqPz9G2GxK3J
         z3/CasmYbs3H6s78EdX9fm/uoYKCNMFy08mtDOdap4kPCOZLGb8LcHmg42va1awuxLil
         TY21+Shwucyj3Fmrc6jk4HV0OMK5zv7YWhOfexqYKKVYir2RvPsNn3C5t/4g0MlkSrag
         afJWNTeAGmYnc2AufZP5Mq8PHID6LZJt+vCBf8Koezn4mZCoe7dYoAiULNActoMpNkrw
         wadA==
X-Gm-Message-State: AOAM533BwVSoEDk85GJRiAlHlSRA5/bL5uAO3uHvU0BI2sFroOqArms0
        nSEO3yjryzDwZ800XcXQy4Q=
X-Google-Smtp-Source: ABdhPJzdw1R/eTIjG3fRpgASztguEm8g9w7qZqj9SL9GjvquM0zt45rWkHM6Yzz8H72MkMCKG9I1fA==
X-Received: by 2002:a17:902:dacb:b0:141:e931:3b49 with SMTP id q11-20020a170902dacb00b00141e9313b49mr47333301plx.45.1636333352209;
        Sun, 07 Nov 2021 17:02:32 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id h22sm2739765pgh.80.2021.11.07.17.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 17:02:31 -0800 (PST)
Date:   Mon, 8 Nov 2021 09:02:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 1/2] line-config: rework the interface
 some more
Message-ID: <20211108010226.GA5156@sol>
References: <20211104192252.21883-1-brgl@bgdev.pl>
 <20211104192252.21883-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104192252.21883-2-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 04, 2021 at 08:22:51PM +0100, Bartosz Golaszewski wrote:
> We've already added getters for line-config but without exposing some
> parts of the internal logic of the object, the user can't really get
> the full picture and inspect the contents. This patch reworks the
> accessors further by providing three flavors of each setter and two
> of each getter.
> 
> Up until now, the setters that set the default (fall-back) value for
> various line settings didn't state explicitly that the values they set
> have a lower priority than the one coming from setters that take offsets
> as argument. The docs were vague too and suggested that the last call
> counts which is not true.
> 
> We therefore expose a setter that explicitly sets the "default" value
> and make sure to stress that this will be used only by lines for which
> no "specific" override was defined.
> 
> We also provide getters that allow to read both the default value as
> well as the actual value that would be used for each offset if the
> object was passed to a request call at this moment. We also complete
> the API by providing functions that allow to identify offsets for
> which at least one setting differs from the defaults.
> 

This command set is incomplete. There is no way to unset an attribute,
i.e. set it back to tracking the default.

It is also difficult to determine if a line attribute is tracking the
default or has been overridden to the current default value.
This would be very useful to know for stringification.
(also see comment on gpiod_line_config_get_overridden_offsets())

Changing the default AFTER overriding particular lines should be
uncommon, so I would've gone with making the "default" setter remove any
overrides so ALL lines in the config are set to the new default.
Not that that doesn't also treat some use cases badly.

> This way the caller can fully inspect the line_config and high-level
> language bindings can provide stringification methods.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  include/gpiod.h   | 255 ++++++++++++++++++++++++++++-----------
>  lib/line-config.c | 295 ++++++++++++++++++++++++++++++++--------------
>  tools/gpioget.c   |   6 +-
>  tools/gpiomon.c   |   6 +-
>  tools/gpioset.c   |   9 +-
>  5 files changed, 404 insertions(+), 167 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 2a41fca..ee4a067 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -450,12 +450,38 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
>   *
>   * The line-config object stores the configuration for lines that can be used
>   * in two cases: when making a line request and when reconfiguring a set of
> - * already requested lines. The mutators for the line request don't return
> - * errors. If the set of options is too complex to be translated into kernel
> - * uAPI structures - the error will be returned at the time of the request or
> - * reconfiguration. If an invalid value was passed to any of the getters - the
> - * default value will be silently used instead. Each option can be set
> - * globally, for a single line offset or for multiple line offsets.
> + * already requested lines.
> + *
> + * A new line-config object is instantiated containing a set of sane defaults
> + * for all supported configuration settings. Those defaults can be modified by
> + * the caller. Default values can be overridden by applying different values
> + * for specific line offsets. When making a request or reconfiguring an
> + * existing one, the overridden settings for specific offsets will be taken
> + * into account first and for every other offset and setting the defaults will
> + * be used.
> + *
> + * For every setting, the mutators come in three flavors: one setting the
> + * default value (to which we fallback for every offset not explicitly
> + * overridden), one setting an override for a single offset and one that
> + * overrides settings for a subset of offsets.

I prefer the term "line" over "offset" where referring to a line.
The offset is a unique identifer for a line, but is isn't a line, and you
are setting the config of a line, not an offset.

Maybe add something about offsets being used as line identifiers if it
isn't already sufficiently clear.

> + *
> + * The mutators don't return errors. If the set of options is too complex to
> + * be translated into kernel uAPI structures - the error will be returned at
> + * the time of the request or reconfiguration. If an invalid value was passed
> + * to any of the mutators - the default value will be silently used instead.
> + *
> + * We also expose getters - these come in two flavors for every settings: one
> + * that returns the value that would have been used for given offset if the
> + * request was made at this moment and one that always returns the default
> + * value.
> + *
> + * It's important to not think of the offsets used in the offset->value mapping
> + * as linked to actual hardware offsets of the lines exposed by a GPIO chip as
> + * config objects live separately from any chips and are only analyzed at the
> + * time the request is being made.
> + *

I'm not sure what you are trying to say in this paragraph.
The offsets in the API are the hardware offsets, right?
You are saying that the config doesn't necessarily correspond to the
hardware setting unless is is unchanged since the last request or
reconfiguration call?

Either way you might want to reword that paragraph.

And gramatically it probably should be "important not to think".

> + * For simple cases the offsets can be entirely ignored when preparing the
> + * line configuration.
>   */
>  
>  /**
> @@ -480,12 +506,12 @@ void gpiod_line_config_free(struct gpiod_line_config *config);
>  void gpiod_line_config_reset(struct gpiod_line_config *config);
>  
>  /**
> - * @brief Set the direction of all lines.
> + * @brief Set the default direction setting.
>   * @param config Line config object.
>   * @param direction New direction.
>   */
> -void gpiod_line_config_set_direction(struct gpiod_line_config *config,
> -				     int direction);
> +void gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
> +					     int direction);
>  
>  /**
>   * @brief Set the direction for a single line at given offset.

Prefer "for a single line."

> @@ -497,7 +523,7 @@ void gpiod_line_config_set_direction_offset(struct gpiod_line_config *config,
>  					    int direction, unsigned int offset);
>  
>  /**
> - * @brief Set the direction for a subset of lines.
> + * @brief Set the direction for a subset of offsets.

Prefer "lines" here and elsewhere.

>   * @param config Line config object.
>   * @param direction New direction.
>   * @param num_offsets Number of offsets in the array.
> @@ -509,24 +535,31 @@ void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
>  					    const unsigned int *offsets);
>  
>  /**
> - * @brief Get the direction setting for a given line.
> + * @brief Get the default direction setting.
> + * @param config Line config object.
> + * @return Direction setting that would have been used for any offset not
> + *         assigned its own direction value.
> + */
> +int gpiod_line_config_get_direction_default(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the direction setting for a given offset.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the direction setting.
>   * @return Direction setting that would have been used for given offset if the
>   *         config object was used in a request at the time of the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
>   */
> -int gpiod_line_config_get_direction(struct gpiod_line_config *config,
> -				    unsigned int offset);
> +int gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
> +					   unsigned int offset);
>  
>  /**
> - * @brief Set the edge event detection for all lines.
> + * @brief Set the default edge event detection.
>   * @param config Line config object.
>   * @param edge Type of edge events to detect.
>   */
> -void gpiod_line_config_set_edge_detection(struct gpiod_line_config *config,
> -					  int edge);
> +void
> +gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
> +					     int edge);
>  
>  /**
>   * @brief Set the edge event detection for a single line at given offset.
> @@ -539,7 +572,7 @@ gpiod_line_config_set_edge_detection_offset(struct gpiod_line_config *config,
>  					    int edge, unsigned int offset);
>  
>  /**
> - * @brief Set the edge event detection for a subset of lines.
> + * @brief Set the edge event detection for a subset of offset.

offsets

or lines ;-)

>   * @param config Line config object.
>   * @param edge Type of edge events to detect.
>   * @param num_offsets Number of offsets in the array.
> @@ -551,24 +584,33 @@ gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
>  					    const unsigned int *offsets);
>  
>  /**
> - * @brief Get the edge event detection setting for a given line.
> + * @brief Get the default edge detection setting.
> + * @param config Line config object.
> + * @return Edge detection setting that would have been used for any offset not
> + *         assigned its own direction value.
> + */
> +int
> +gpiod_line_config_get_edge_detection_default(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the edge event detection setting for a given offset.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the edge event detection setting.
>   * @return Edge event detection setting that would have been used for given
>   *         offset if the config object was used in a request at the time of
>   *         the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
>   */
> -int gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
> -					 unsigned int offset);
> +int
> +gpiod_line_config_get_edge_detection_offset(struct gpiod_line_config *config,
> +					    unsigned int offset);
>  
>  /**
> - * @brief Set the bias of all lines.
> + * @brief Set the default bias setting.
>   * @param config Line config object.
>   * @param bias New bias.
>   */
> -void gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias);
> +void gpiod_line_config_set_bias_default(struct gpiod_line_config *config,
> +					int bias);
>  
>  /**
>   * @brief Set the bias for a single line at given offset.
> @@ -591,23 +633,30 @@ void gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
>  				       const unsigned int *offsets);
>  
>  /**
> - * @brief Get the bias setting for a given line.
> + * @brief Get the default bias setting.
> + * @param config Line config object.
> + * @return Bias setting that would have been used for any offset not assigned
> + *         its own direction value.
> + */
> +int gpiod_line_config_get_bias_default(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the bias setting for a given offset.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the bias setting.
>   * @return Bias setting that would have been used for given offset if the
>   *         config object was used in a request at the time of the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
>   */
> -int gpiod_line_config_get_bias(struct gpiod_line_config *config,
> +int gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
>  			       unsigned int offset);
>  
>  /**
> - * @brief Set the drive of all lines.
> + * @brief Set the default drive setting.
>   * @param config Line config object.
>   * @param drive New drive.
>   */
> -void gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive);
> +void gpiod_line_config_set_drive_default(struct gpiod_line_config *config,
> +					 int drive);
>  
>  /**
>   * @brief Set the drive for a single line at given offset.
> @@ -619,7 +668,7 @@ void gpiod_line_config_set_drive_offset(struct gpiod_line_config *config,
>  					int drive, unsigned int offset);
>  
>  /**
> - * @brief Set the drive for a subset of lines.
> + * @brief Set the drive for a subset of offsets.
>   * @param config Line config object.
>   * @param drive New drive.
>   * @param num_offsets Number of offsets in the array.
> @@ -630,22 +679,28 @@ void gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
>  					const unsigned int *offsets);
>  
>  /**
> - * @brief Get the drive setting for a given line.
> + * @brief Get the default drive setting.
> + * @param config Line config object.
> + * @return Drive setting that would have been used for any offset not assigned
> + *         its own direction value.
> + */
> +int gpiod_line_config_get_drive_default(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the drive setting for a given offset.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the drive setting.
>   * @return Drive setting that would have been used for given offset if the
>   *         config object was used in a request at the time of the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
>   */
> -int gpiod_line_config_get_drive(struct gpiod_line_config *config,
> -				unsigned int offset);
> +int gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
> +				       unsigned int offset);
>  
>  /**
> - * @brief Set all lines as active-low.
> + * @brief Set lines to active-low by default.
>   * @param config Line config object.
>   */
> -void gpiod_line_config_set_active_low(struct gpiod_line_config *config);
> +void gpiod_line_config_set_active_low_default(struct gpiod_line_config *config);
>  
>  /**
>   * @brief Set a single line as active-low.

Still using line here rather than offset (and I'd like to keep it that
way ;-).

> @@ -665,23 +720,30 @@ void gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
>  					     unsigned int num_offsets,
>  					     const unsigned int *offsets);
>  
> +/**
> + * @brief Check if active-low is the default setting.
> + * @param config Line config object.
> + * @return Active-low setting that would have been used for any offset not
> + *         assigned its own value.
> + */
> +bool gpiod_line_config_get_active_low_default(struct gpiod_line_config *config);
> +
>  /**
>   * @brief Check if the line at given offset was configured as active-low.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the active-low setting.
>   * @return Active-low setting that would have been used for given offset if the
>   *         config object was used in a request at the time of the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
>   */
> -bool gpiod_line_config_get_active_low(struct gpiod_line_config *config,
> -				      unsigned int offset);
> +bool gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
> +					     unsigned int offset);
>  
>  /**
> - * @brief Set all lines as active-high.
> + * @brief Set lines to active-high by default.
>   * @param config Line config object.
>   */
> -void gpiod_line_config_set_active_high(struct gpiod_line_config *config);
> +void
> +gpiod_line_config_set_active_high_default(struct gpiod_line_config *config);
>  
>  /**
>   * @brief Set a single line as active-high.
> @@ -702,12 +764,12 @@ void gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
>  					      const unsigned int *offsets);
>  
>  /**
> - * @brief Set the debounce period for all lines.
> + * @brief Set the default debounce period.
>   * @param config Line config object.
>   * @param period New debounce period. Disables debouncing if 0.
>   */
> -void gpiod_line_config_set_debounce_period_us(struct gpiod_line_config *config,
> -					      unsigned long period);
> +void gpiod_line_config_set_debounce_period_us_default(
> +		struct gpiod_line_config *config, unsigned long period);
>  
>  /**
>   * @brief Set the debounce period for a single line at given offset.
> @@ -722,7 +784,7 @@ gpiod_line_config_set_debounce_period_us_offset(
>  					unsigned int offset);
>  
>  /**
> - * @brief Set the debounce period for a subset of lines.
> + * @brief Set the debounce period for a subset of offsets.
>   * @param config Line config object.
>   * @param period New debounce period. Disables debouncing if 0.
>   * @param num_offsets Number of offsets in the array.
> @@ -736,25 +798,33 @@ gpiod_line_config_set_debounce_period_us_subset(
>  					const unsigned int *offsets);
>  
>  /**
> - * @brief Get the debounce period for a given line.
> + * @brief Get the default debounce period.
> + * @param config Line config object.
> + * @return Debounce period that would have been used for any offset not
> + *         assigned its own debounce period. 0 if not debouncing is disabled.
> + */
> +unsigned long gpiod_line_config_get_debounce_period_us_default(
> +					struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the debounce period for a given offset.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the debounce period.
>   * @return Debounce period that would have been used for given offset if the
> - *         config object was used in a request at the time of the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
> + *         config object was used in a request at the time of the call. 0 if
> + *         debouncing is disabled.
>   */
>  unsigned long
> -gpiod_line_config_get_debounce_us_period(struct gpiod_line_config *config,
> -					 unsigned int offset);
> +gpiod_line_config_get_debounce_period_us_offset(
> +			struct gpiod_line_config *config, unsigned int offset);
>  
>  /**
> - * @brief Set the event timestamp clock for all lines.
> + * @brief Set the default event timestamp clock.
>   * @param config Line config object.
>   * @param clock New clock to use.
>   */
> -void gpiod_line_config_set_event_clock(struct gpiod_line_config *config,
> -				       int clock);
> +void gpiod_line_config_set_event_clock_default(struct gpiod_line_config *config,
> +					       int clock);
>  
>  /**
>   * @brief Set the event clock for a single line at given offset.
> @@ -766,7 +836,7 @@ void gpiod_line_config_set_event_clock_offset(struct gpiod_line_config *config,
>  					      int clock, unsigned int offset);
>  
>  /**
> - * @brief Set the event clock for a subset of lines.
> + * @brief Set the event clock for a subset of offsets.
>   * @param config Line config object.
>   * @param clock New event clock to use.
>   * @param num_offsets Number of offsets in the array.
> @@ -778,16 +848,31 @@ void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
>  					      const unsigned int *offsets);
>  
>  /**
> - * @brief Get the event clock setting for a given line.
> + * @brief Get the default event clock setting.
> + * @param config Line config object.
> + * @return Event clock setting that would have been used for any offset not
> + *         assigned its own direction value.
> + */
> +int gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the event clock setting for a given offset.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the event clock setting.
>   * @return Event clock setting that would have been used for given offset if
>   *         the config object was used in a request at the time of the call.
> - * @note If an offset is used for which no config was provided, the function
> - *       will return the global default value.
>   */
> -int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
> -				      unsigned int offset);
> +int gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
> +					     unsigned int offset);
> +
> +/**
> + * @brief Set the default output value.
> + * @param config Line config object.
> + * @param value New value.
> + */
> +void
> +gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
> +					   int value);
>  
>  /**
>   * @brief Set the output value for a single offset.
> @@ -795,8 +880,8 @@ int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
>   * @param offset Offset of the line.
>   * @param value Output value to set.
>   */
> -void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
> -					unsigned int offset, int value);
> +void gpiod_line_config_set_output_value_offset(struct gpiod_line_config *config,
> +					       unsigned int offset, int value);
>  
>  /**
>   * @brief Set the output values for a set of offsets.
> @@ -811,14 +896,44 @@ void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
>  					 const unsigned int *offsets,
>  					 const int *values);
>  
> +/**
> + * @brief Get the default output value.
> + * @param config Line config object.
> + * @return Output value that would have been used for any offset not
> + *         assigned its own output value.
> + */
> +int
> +gpiod_line_config_get_output_value_default(struct gpiod_line_config *config);
> +
>  /**
>   * @brief Get the output value configured for a given line.
>   * @param config Line config object.
>   * @param offset Line offset for which to read the value.
> - * @return 1 or 0 if the value was configured for this line, -1 otherwise.
> + * @return Output value that would have been used for given offset if the
> + *         config object was used in a request at the time of the call.
>   */
> -int gpiod_line_config_get_output_value(struct gpiod_line_config *config,
> -				       unsigned int offset);
> +int gpiod_line_config_get_output_value_offset(struct gpiod_line_config *config,
> +					      unsigned int offset);
> +
> +/**
> + * @brief Get the number of offsets for which this config object contains
> + *        at least one setting that is different from the defaults.
> + * @param config Line config object.
> + * @return Number of offsets with at least one overridden setting.
> + */
> +unsigned int
> +gpiod_line_config_get_num_overridden_offsets(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the offsets for which this config object contains at least one
> + *        setting that is different from the defaults.
> + * @param config Line config object.
> + * @param offsets Array to store the offsets. Must hold at least the number
> + *                of offsets returned by
> + *                ::gpiod_line_config_get_num_overridden_offsets.
> + */
> +void gpiod_line_config_get_overridden_offsets(struct gpiod_line_config *config,
> +					      unsigned int *offsets);
>  

The "that is different from the defaults" filtering performed by these two
functions is premature and prevents the caller determining the actual
state of the current config.

It could also produce weird stringification.  Consider a set of output
lines. The stringification will vary wildly depending on the output
value of each line. Those with the default value are filtered, the
remainder displayed.  I would prefer the stringification to show all the
output lines being explicitly set, but the filtering makes that
impossible.

Let the caller do any filtering themselves.
Maybe expose override_differs_from_defaults(), suitably renamed of
course.
A method to check if a line attribute is overridden or defaulted would
be useful too.

Cheers,
Kent.

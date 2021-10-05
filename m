Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E28E421D30
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 06:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhJEEWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 00:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhJEEWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 00:22:19 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E84CC061745
        for <linux-gpio@vger.kernel.org>; Mon,  4 Oct 2021 21:20:29 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id b22so1406012pls.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Oct 2021 21:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9uduKlEUDMn6HCvkeYPIWSzoCZY3E1Gdo/0IuYDv2G4=;
        b=pAlL+KPziAcQ4S14T+hRaYOLc9dKFB9xOAHQbynPEq+NReFyyuIesdQGBC4Gy07St2
         LeBmk7GhTPv64XeTK6ujKBNIL1RObOQa0lA/E2UOQZAdinx/k3OeOKef/Q+IybH2GFxo
         83jNvliTHleXS4XDeJFpYHOtJ4kb0KgREzkcT2/0PWDHDzFJR4gaQdBBy2XGRvA4fhWQ
         u0UocxiNAbn5p+2XVNlsnTt74cjf59nyFGuucUwqdjietHYlYcZdbLbnFBSms4KW85ud
         z36PTUcEGOF81wluf0XVTdJPmri1CjalaRlwcanulhc1V4vhszjm1EjaVuhVAObxgcy7
         ZYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9uduKlEUDMn6HCvkeYPIWSzoCZY3E1Gdo/0IuYDv2G4=;
        b=IG0imQJNe6+kv9ZrVWBzt43WtssSzv7QQcCzNGmg0wTIHoxtLn9HjzRVLYQUbJvZH4
         CohRxcZ6xbnvZWAC8z7do4T0B71YbkZKwStKw2KF6VCRk/wBp3XA6HeE7PCckfh14V4Z
         eEA3QM1tDvtqfDpyIRfnzAcCDm4G2jQ45G5IZCxTUALI1fZ3neo5icPCO+rr+nYzos1D
         tiJkwidC3bf4u6bY9txXSnMD2CNW3fTRHHniCzZsXETP8uaTMLbCSePRdfiqWDAjCwBN
         6UNXu/WtqNWwrB4ovzXgPHgcNvOTv4rV79qvm5o6J2knOp05Mdy845jEVf3lMq4N3PKC
         EaHA==
X-Gm-Message-State: AOAM533rYUofn8Efy/JnN6rRcYDE6Q5QKdmBoqcb8eVoaK1hEF5cTZOo
        2sR0qahRCDKtgU4jrXWAnbM=
X-Google-Smtp-Source: ABdhPJzocjkd6KRGxEtrP0xsAkC+yqRGbIBArKytepucjonMZS3Cu/1rtUbk8dCdXdSSDhOvUvE1GQ==
X-Received: by 2002:a17:90a:5108:: with SMTP id t8mr1158433pjh.201.1633407628616;
        Mon, 04 Oct 2021 21:20:28 -0700 (PDT)
Received: from sol (106-69-170-56.dyn.iinet.net.au. [106.69.170.56])
        by smtp.gmail.com with ESMTPSA id b21sm17169727pfv.96.2021.10.04.21.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 21:20:28 -0700 (PDT)
Date:   Tue, 5 Oct 2021 12:20:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH] line-config: rework the internal
 implementation
Message-ID: <20211005042022.GA109255@sol>
References: <20210922081100.16753-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922081100.16753-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 10:11:00AM +0200, Bartosz Golaszewski wrote:
> This reworks how the line config objects work internally. In order to reduce
> the size of the gpiod_line_config objects, we switch from using a set number
> of override config structures with each storing a list of line offsets to
> storing a smaller override object for each of the maximum of 64 lines.
> Additionally these internal config structures are now packed and only occupy
> the minimum required amount of memory.
> 
> The processing of these new overrides has become a bit more complicated but
> should actually be more robust wrt corner cases.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Given the level of rework the diff is harder work than looking at the
resulting code, but it all looks good to me.
A few minor comments scattered below.

> ---
>  include/gpiod.h   |  42 +--
>  lib/internal.h    |   6 +-
>  lib/line-config.c | 748 ++++++++++++++++++++++++++--------------------
>  3 files changed, 439 insertions(+), 357 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 44deafc..2a41fca 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -674,8 +674,8 @@ void gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
>   * @note If an offset is used for which no config was provided, the function
>   *       will return the global default value.
>   */
> -bool gpiod_line_config_is_active_low(struct gpiod_line_config *config,
> -				     unsigned int offset);
> +bool gpiod_line_config_get_active_low(struct gpiod_line_config *config,
> +				      unsigned int offset);
>  
>  /**
>   * @brief Set all lines as active-high.
> @@ -811,15 +811,6 @@ void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
>  					 const unsigned int *offsets,
>  					 const int *values);
>  
> -/**
> - * @brief Get the number of line offsets for which this config object stores
> - *        output values.
> - * @param config Line config object.
> - * @return Number of output values currently configured for this object.
> - */
> -unsigned int
> -gpiod_line_config_num_output_values(struct gpiod_line_config *config);
> -
>  /**
>   * @brief Get the output value configured for a given line.
>   * @param config Line config object.
> @@ -829,35 +820,6 @@ gpiod_line_config_num_output_values(struct gpiod_line_config *config);
>  int gpiod_line_config_get_output_value(struct gpiod_line_config *config,
>  				       unsigned int offset);
>  
> -/**
> - * @brief Get the output value mapping (offset -> value) at given index.
> - * @param config Line config object.
> - * @param index Position of the mapping in the internal array.
> - * @param offset Buffer for storing the offset of the line.
> - * @param value Buffer for storing the value corresponding to the offset.
> - * @return Returns 0 on success, -1 if the index is out of range.
> - *
> - * This function together with ::gpiod_line_config_num_output_values allows to
> - * iterate over all output value mappings currently held by this object.
> - */
> -int gpiod_line_config_get_output_value_index(struct gpiod_line_config *config,
> -					     unsigned int index,
> -					     unsigned int *offset, int *value);
> -
> -/**
> - * @brief Get all output value mappings stored in this config object.
> - * @param config Line config object.
> - * @param offsets Buffer in which offsets will be stored.
> - * @param values Buffer in which values will be stored.
> - * @note Both the offsets and values buffers must be able to hold at least the
> - *       number of elements returned by ::gpiod_line_config_num_output_values.
> - *
> - * Each offset in the offsets array corresponds to the value in the values
> - * array at the same index.
> - */
> -void gpiod_line_config_get_output_values(struct gpiod_line_config *config,
> -					 unsigned int *offsets, int *values);
> -
>  /**
>   * @}
>   *
> diff --git a/lib/internal.h b/lib/internal.h
> index a5e47e3..32f36b5 100644
> --- a/lib/internal.h
> +++ b/lib/internal.h
> @@ -12,7 +12,11 @@
>  
>  /* For internal library use only. */
>  
> -#define GPIOD_API __attribute__((visibility("default")))
> +#define GPIOD_API	__attribute__((visibility("default")))
> +#define GPIOD_PACKED	__attribute__((packed))
> +#define GPIOD_UNUSED	__attribute__((unused))
> +
> +#define GPIOD_BIT(nr)	(1UL << (nr))
>  
>  struct gpiod_line_info *
>  gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf);
> diff --git a/lib/line-config.c b/lib/line-config.c
> index 5f356c3..b99aeef 100644
> --- a/lib/line-config.c
> +++ b/lib/line-config.c
> @@ -11,40 +11,40 @@
>  #include "internal.h"
>  
>  struct base_config {
> -	int direction;
> -	int edge;
> -	int drive;
> -	int bias;
> -	bool active_low;
> -	int clock;
> -	unsigned long debounce_period;
> -};
> -
> -struct secondary_config {
> -	struct base_config config;
> -	/* Offsets are sorted and duplicates are removed. */
> -	unsigned int offsets[GPIO_V2_LINES_MAX];
> -	unsigned int num_offsets;
> -};
> -
> -struct output_value {
> +	unsigned int direction : 2;
> +	unsigned int edge : 3;
> +	unsigned int drive : 2;
> +	unsigned int bias : 3;
> +	bool active_low : 1;
> +	unsigned int clock : 2;
> +	unsigned long debounce_period_us;
> +} GPIOD_PACKED;
> +
> +#define OVERRIDE_FLAG_DIRECTION		GPIOD_BIT(0)
> +#define OVERRIDE_FLAG_EDGE		GPIOD_BIT(1)
> +#define OVERRIDE_FLAG_DRIVE		GPIOD_BIT(2)
> +#define OVERRIDE_FLAG_BIAS		GPIOD_BIT(3)
> +#define OVERRIDE_FLAG_ACTIVE_LOW	GPIOD_BIT(4)
> +#define OVERRIDE_FLAG_CLOCK		GPIOD_BIT(5)
> +#define OVERRIDE_FLAG_DEBOUNCE_PERIOD	GPIOD_BIT(6)
> +
> +/*
> + * Config overriding the defaults for a single line offset. Only flagged
> + * settings are actually overriden for a line.
> + */
> +struct override_config {
> +	struct base_config base;
>  	unsigned int offset;
> -	int value;
> -};
> +	bool value_set : 1;
> +	unsigned int value : 1;
> +	unsigned int override_flags : 7;
> +} GPIOD_PACKED;
>  
>  struct gpiod_line_config {
>  	bool too_complex;
> -	struct base_config primary;
> -	struct secondary_config secondary[GPIO_V2_LINE_NUM_ATTRS_MAX];
> -	unsigned int num_secondary;
> -	struct output_value output_values[GPIO_V2_LINES_MAX];
> -	unsigned int num_output_values;
> -	/*
> -	 * Used to temporarily store sorted offsets when looking for existing
> -	 * configuration
> -	 */
> -	unsigned int sorted_offsets[GPIO_V2_LINES_MAX];
> -	unsigned int num_sorted_offsets;
> +	struct base_config defaults;
> +	struct override_config overrides[GPIO_V2_LINES_MAX];
> +	unsigned int num_overrides;
>  };
>  
>  static void init_base_config(struct base_config *config)
> @@ -55,7 +55,7 @@ static void init_base_config(struct base_config *config)
>  	config->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
>  	config->active_low = false;
>  	config->clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
> -	config->debounce_period = 0;
> +	config->debounce_period_us = 0;
>  }
>  
>  GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)

You don't have any change to gpiod_line_config_free() here, but
isn't free() guaranteed to be NULL aware, so you can drop the NULL
check?
If not, couldn't it be flipped to:

	if (config)
		free(config);

Similarly gpiod_line_config_new() could have

	if (config)
		gpiod_line_config_reset(config);

and that "if" could be dropped if gpiod_line_config_reset() were NULL
aware.

But the general policy is that gpiod functions are not NULL aware?

> @@ -84,112 +84,73 @@ GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
>  	int i;
>  
>  	memset(config, 0, sizeof(*config));
> -	init_base_config(&config->primary);
> +	init_base_config(&config->defaults);
>  	for (i = 0; i < GPIO_V2_LINE_NUM_ATTRS_MAX; i++)
> -		init_base_config(&config->secondary[i].config);
> -}
> -
> -static int offset_compare(const void *a_ptr, const void *b_ptr)
> -{
> -	unsigned int a = *((unsigned int *)a_ptr);
> -	unsigned int b = *((unsigned int *)b_ptr);
> -
> -	return a - b;
> +		init_base_config(&config->overrides[i].base);
>  }
>  
> -static void sanitize_offsets(struct gpiod_line_config *config,
> -			     unsigned int num_offsets,
> -			     const unsigned int *offsets)
> +static struct override_config *
> +get_override_by_offset(struct gpiod_line_config *config, unsigned int offset)
>  {
> -	unsigned int i, count, *sorted = config->sorted_offsets;
> -
> -	if (num_offsets == 0 || num_offsets == 1)
> -		return;
> -
> -	count = num_offsets > GPIO_V2_LINES_MAX ? GPIO_V2_LINES_MAX
> -						: num_offsets;
> -	config->num_sorted_offsets = num_offsets;
> +	struct override_config *override;
> +	unsigned int i;
>  
> -	memcpy(config->sorted_offsets, offsets, count);
> -	qsort(sorted, count, sizeof(*sorted), offset_compare);
> +	for (i = 0; i < config->num_overrides; i++) {
> +		override = &config->overrides[i];
>  
> -	for (i = 0; i < (count - 1); i++) {
> -		if (sorted[i] == sorted[i + 1]) {
> -			if (i < (count - 2))
> -				memmove(sorted + i + 1, sorted + i + 2,
> -					sizeof(*sorted) * num_offsets - i);
> -			config->num_sorted_offsets--;
> -		}
> +		if (override->offset == offset)
> +			return override;
>  	}
> +
> +	return NULL;
>  }
>  
> -static struct secondary_config *
> -find_matching_secondary_config(struct gpiod_line_config *config)
> +static struct override_config *
> +get_new_override(struct gpiod_line_config *config, unsigned int offset)
>  {
> -	unsigned int i, *offsets, num_offsets;
> -	struct secondary_config *secondary;
> +	struct override_config *override;
>  
> -	offsets = config->sorted_offsets;
> -	num_offsets = config->num_sorted_offsets;
> -
> -	for (i = 0; i < config->num_secondary; i++) {
> -		secondary = &config->secondary[i];
> -
> -		if (num_offsets != secondary->num_offsets)
> -			continue;
> -
> -		if (memcmp(secondary->offsets, offsets,
> -			   sizeof(*offsets) * num_offsets) == 0)
> -			return secondary;
> +	if (config->num_overrides == GPIO_V2_LINES_MAX) {
> +		config->too_complex = true;
> +		return NULL;
>  	}
>  
> -	return NULL;
> +	override = &config->overrides[config->num_overrides++];
> +	override->offset = offset;
> +
> +	return override;
>  }
>  
> -static struct secondary_config *
> -get_secondary_config(struct gpiod_line_config *config,
> -		     unsigned int num_offsets, const unsigned int *offsets)
> +static struct override_config *
> +get_override_config_for_writing(struct gpiod_line_config *config,
> +				unsigned int offset)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
>  
>  	if (config->too_complex)
>  		return NULL;
>  
> -	sanitize_offsets(config, num_offsets, offsets);
> -	secondary = find_matching_secondary_config(config);
> -	if (!secondary) {
> -		if (config->num_secondary == GPIO_V2_LINE_NUM_ATTRS_MAX) {
> -			config->too_complex = true;
> +	override = get_override_by_offset(config, offset);
> +	if (!override) {
> +		override = get_new_override(config, offset);
> +		if (!override)
>  			return NULL;
> -		}
> -
> -		secondary = &config->secondary[config->num_secondary++];
>  	}
>  
> -	return secondary;
> +	return override;
>  }
>  
>  static struct base_config *
> -get_base_config_for_offset(struct gpiod_line_config *config,
> -			   unsigned int offset)
> +get_base_config_for_reading(struct gpiod_line_config *config,
> +			   unsigned int offset, unsigned int flag)
>  {
> -	struct secondary_config *secondary;
> -	unsigned int i, j;
> -
> -	/*
> -	 * We're looking backwards as the settings get overwritten if set
> -	 * multiple times.
> -	 */
> -	for (i = config->num_secondary; i > 0; i--) {
> -		secondary = &config->secondary[i - 1];
> +	struct override_config *override;
>  
> -		for (j = 0; j < secondary->num_offsets; j++) {
> -			if (secondary->offsets[j] == offset)
> -				return &secondary->config;
> -		}
> -	}
> +	override = get_override_by_offset(config, offset);
> +	if (!override || !(override->override_flags & flag))
> +		return &config->defaults;
>  
> -	return NULL;
> +	return &override->base;
>  }
>  

Maybe flip the logic around to make it easier to read:

	if (override && (override->override_flags & flag))
		return &override->base;

    return &config->defaults;

Similarly in gpiod_line_config_get_output_value().

>  static void set_direction(struct base_config *config, int direction)

In set_direction() you have a specific case (GPIOD_LINE_DIRECTION_AS_IS)
that matches the default behaviour.  I generally drop that case and let
the default handle it, but that is just personal preference.

Similarly in other set_XXX switches.

> @@ -209,7 +170,7 @@ static void set_direction(struct base_config *config, int direction)
>  GPIOD_API void
>  gpiod_line_config_set_direction(struct gpiod_line_config *config, int direction)
>  {
> -	set_direction(&config->primary, direction);
> +	set_direction(&config->defaults, direction);
>  }
>  
>  GPIOD_API void
> @@ -224,13 +185,19 @@ gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
>  				       int direction, unsigned int num_offsets,
>  				       const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
>  

Worth the effort given it is only used once?

> -	set_direction(&secondary->config, direction);
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
> +
> +		set_direction(&override->base, direction);
> +		override->override_flags |= OVERRIDE_FLAG_DIRECTION;
> +	}
>  }
>  
>  GPIOD_API int gpiod_line_config_get_direction(struct gpiod_line_config *config,
> @@ -238,9 +205,8 @@ GPIOD_API int gpiod_line_config_get_direction(struct gpiod_line_config *config,
>  {
>  	struct base_config *base;
>  
> -	base = get_base_config_for_offset(config, offset);
> -	if (!base)
> -		return config->primary.direction;
> +	base = get_base_config_for_reading(config, offset,
> +					   OVERRIDE_FLAG_DIRECTION);
>  
>  	return base->direction;
>  }
> @@ -263,7 +229,7 @@ static void set_edge_detection(struct base_config *config, int edge)
>  GPIOD_API void
>  gpiod_line_config_set_edge_detection(struct gpiod_line_config *config, int edge)
>  {
> -	set_edge_detection(&config->primary, edge);
> +	set_edge_detection(&config->defaults, edge);
>  }
>  
>  GPIOD_API void
> @@ -278,13 +244,19 @@ gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
>  					    int edge, unsigned int num_offsets,
>  					    const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
>  
> -	set_edge_detection(&secondary->config, edge);
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
> +
> +		set_edge_detection(&override->base, edge);
> +		override->override_flags |= OVERRIDE_FLAG_EDGE;
> +	}
>  }
>  
>  GPIOD_API int
> @@ -293,9 +265,7 @@ gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
>  {
>  	struct base_config *base;
>  
> -	base = get_base_config_for_offset(config, offset);
> -	if (!base)
> -		return config->primary.edge;
> +	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_EDGE);
>  
>  	return base->edge;
>  }
> @@ -318,7 +288,7 @@ static void set_bias(struct base_config *config, int bias)
>  GPIOD_API void
>  gpiod_line_config_set_bias(struct gpiod_line_config *config, int bias)
>  {
> -	set_bias(&config->primary, bias);
> +	set_bias(&config->defaults, bias);
>  }
>  
>  GPIOD_API void
> @@ -333,13 +303,19 @@ gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
>  				  int bias, unsigned int num_offsets,
>  				  const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
>  
> -	set_bias(&secondary->config, bias);
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
> +
> +		set_bias(&override->base, bias);
> +		override->override_flags |= OVERRIDE_FLAG_BIAS;
> +	}
>  }
>  
>  GPIOD_API int gpiod_line_config_get_bias(struct gpiod_line_config *config,
> @@ -347,9 +323,7 @@ GPIOD_API int gpiod_line_config_get_bias(struct gpiod_line_config *config,
>  {
>  	struct base_config *base;
>  
> -	base = get_base_config_for_offset(config, offset);
> -	if (!base)
> -		return config->primary.bias;
> +	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_BIAS);
>  
>  	return base->bias;
>  }
> @@ -371,7 +345,7 @@ static void set_drive(struct base_config *config, int drive)
>  GPIOD_API void
>  gpiod_line_config_set_drive(struct gpiod_line_config *config, int drive)
>  {
> -	set_drive(&config->primary, drive);
> +	set_drive(&config->defaults, drive);
>  }
>  
>  GPIOD_API void
> @@ -386,13 +360,19 @@ gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
>  				   int drive, unsigned int num_offsets,
>  				   const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
>  
> -	set_drive(&secondary->config, drive);
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
> +
> +		set_drive(&override->base, drive);
> +		override->override_flags |= OVERRIDE_FLAG_DRIVE;
> +	}
>  }
>  
>  GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
> @@ -400,9 +380,7 @@ GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
>  {
>  	struct base_config *base;
>  
> -	base = get_base_config_for_offset(config, offset);
> -	if (!base)
> -		return config->primary.drive;
> +	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_DRIVE);
>  
>  	return base->drive;
>  }
> @@ -410,7 +388,7 @@ GPIOD_API int gpiod_line_config_get_drive(struct gpiod_line_config *config,
>  GPIOD_API void
>  gpiod_line_config_set_active_low(struct gpiod_line_config *config)
>  {
> -	config->primary.active_low = true;
> +	config->defaults.active_low = true;
>  }
>  
>  GPIOD_API void
> @@ -425,23 +403,29 @@ gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
>  					unsigned int num_offsets,
>  					const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
> +
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
>  
> -	secondary->config.active_low = true;
> +		override->base.active_low = true;
> +		override->override_flags |= OVERRIDE_FLAG_ACTIVE_LOW;
> +	}
>  }
>  
> -GPIOD_API bool gpiod_line_config_is_active_low(struct gpiod_line_config *config,
> -					       unsigned int offset)
> +GPIOD_API bool
> +gpiod_line_config_get_active_low(struct gpiod_line_config *config,
> +				 unsigned int offset)
>  {
>  	struct base_config *base;
>  
> -	base = get_base_config_for_offset(config, offset);
> -	if (!base)
> -		return config->primary.active_low;
> +	base = get_base_config_for_reading(config, offset,
> +					   OVERRIDE_FLAG_ACTIVE_LOW);
>  
>  	return base->active_low;
>  }
> @@ -449,7 +433,7 @@ GPIOD_API bool gpiod_line_config_is_active_low(struct gpiod_line_config *config,
>  GPIOD_API void
>  gpiod_line_config_set_active_high(struct gpiod_line_config *config)
>  {
> -	config->primary.active_low = false;
> +	config->defaults.active_low = false;
>  }
>  
>  GPIOD_API void
> @@ -464,20 +448,26 @@ gpiod_line_config_set_active_high_subset(struct gpiod_line_config *config,
>  					 unsigned int num_offsets,
>  					 const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
> +
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
>  
> -	secondary->config.active_low = false;
> +		override->base.active_low = false;
> +		override->override_flags |= OVERRIDE_FLAG_ACTIVE_LOW;
> +	}
>  }
>  

gpiod_line_config_set_active_low_subset() and
gpiod_line_config_set_active_high_subset() could call a common helper
that accepts the active_low as a parameter?

>  GPIOD_API void
>  gpiod_line_config_set_debounce_period_us(struct gpiod_line_config *config,
>  				      unsigned long period)
>  {
> -	config->primary.debounce_period = period;
> +	config->defaults.debounce_period_us = period;
>  }
>  
>  GPIOD_API void
> @@ -497,13 +487,19 @@ gpiod_line_config_set_debounce_period_us_subset(
>  					unsigned int num_offsets,
>  					const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
> +
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
>  
> -	secondary->config.debounce_period = period;
> +		override->base.debounce_period_us = period;
> +		override->override_flags |= OVERRIDE_FLAG_DEBOUNCE_PERIOD;
> +	}
>  }
>  
>  GPIOD_API unsigned long
> @@ -512,11 +508,10 @@ gpiod_line_config_get_debounce_us_period(struct gpiod_line_config *config,
>  {
>  	struct base_config *base;
>  
> -	base = get_base_config_for_offset(config, offset);
> -	if (!base)
> -		return config->primary.debounce_period;
> +	base = get_base_config_for_reading(config, offset,
> +					   OVERRIDE_FLAG_DEBOUNCE_PERIOD);
>  
> -	return base->debounce_period;
> +	return base->debounce_period_us;
>  }
>  
>  static void set_event_clock(struct base_config *config, int clock)
> @@ -535,7 +530,7 @@ static void set_event_clock(struct base_config *config, int clock)
>  GPIOD_API void
>  gpiod_line_config_set_event_clock(struct gpiod_line_config *config, int clock)
>  {
> -	set_event_clock(&config->primary, clock);
> +	set_event_clock(&config->defaults, clock);
>  }
>  
>  GPIOD_API void
> @@ -550,43 +545,42 @@ gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
>  					 int clock, unsigned int num_offsets,
>  					 const unsigned int *offsets)
>  {
> -	struct secondary_config *secondary;
> +	struct override_config *override;
> +	unsigned int i, offset;
>  
> -	secondary = get_secondary_config(config, num_offsets, offsets);
> -	if (!secondary)
> -		return;
> +	for (i = 0; i < num_offsets; i++) {
> +		offset = offsets[i];
>  
> -	set_event_clock(&secondary->config, clock);
> -}
> +		override = get_override_config_for_writing(config, offset);
> +		if (!override)
> +			return;
>  
> -GPIOD_API void
> -gpiod_line_config_set_output_value(struct gpiod_line_config *config,
> -				   unsigned int offset, int value)
> -{
> -	gpiod_line_config_set_output_values(config, 1, &offset, &value);
> +		set_event_clock(&override->base, clock);
> +	}
>  }
>  
> -static int output_value_find_offset(struct gpiod_line_config *config,
> -				    unsigned int offset)
> +GPIOD_API int
> +gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
> +				  unsigned int offset)
>  {
> -	unsigned int i;
> +	struct base_config *base;
>  
> -	for (i = 0; i < config->num_output_values; i++) {
> -		if (config->output_values[i].offset == offset)
> -			return i;
> -	}
> +	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_CLOCK);
>  
> -	return -1;
> +	return base->clock;
>  }
>  
> -static void set_output_value(struct gpiod_line_config *config, unsigned int idx,
> -			     unsigned int offset, int value, bool inc)
> +static void set_output_value(struct override_config *override, int value)
>  {
> -	config->output_values[idx].offset = offset;
> -	config->output_values[idx].value = value;
> +	override->value = !!value;
> +	override->value_set = true;
> +}
>  
> -	if (inc)
> -		config->num_output_values++;
> +GPIOD_API void
> +gpiod_line_config_set_output_value(struct gpiod_line_config *config,
> +				   unsigned int offset, int value)
> +{
> +	gpiod_line_config_set_output_values(config, 1, &offset, &value);
>  }
>  
>  GPIOD_API void
> @@ -595,82 +589,40 @@ gpiod_line_config_set_output_values(struct gpiod_line_config *config,
>  				    const unsigned int *offsets,
>  				    const int *values)
>  {
> -	unsigned int i;
> -	int pos;
> -
> -	if (config->too_complex)
> -		return;
> +	struct override_config *override;
> +	unsigned int i, offset, val;
>  
>  	for (i = 0; i < num_values; i++) {
> -		pos = output_value_find_offset(config, offsets[i]);
> -		if (pos < 0) {
> -			if (config->num_output_values == GPIO_V2_LINES_MAX) {
> -				/* Too many output values specified. */
> -				config->too_complex = true;
> -				return;
> -			}
> +		offset = offsets[i];
> +		val = values[i];
>  
> -			/* Add new output value. */
> -			set_output_value(config, config->num_output_values,
> -					 offsets[i], values[i], true);
> -		} else {
> -			/* Overwrite old value for this offset. */
> -			set_output_value(config, pos,
> -					 offsets[i], values[i], false);
> +		override = get_override_by_offset(config, offset);
> +		if (!override) {
> +			override = get_new_override(config, offset);
> +			if (!override)
> +				return;
>  		}
> -	}
> -}
>  
> -GPIOD_API unsigned int
> -gpiod_line_config_num_output_values(struct gpiod_line_config *config)
> -{
> -	return config->num_output_values;
> +		set_output_value(override, val);
> +	}
>  }
>  
>  GPIOD_API int
>  gpiod_line_config_get_output_value(struct gpiod_line_config *config,
>  				   unsigned int offset)
>  {
> -	unsigned int i;
> -
> -	for (i = 0; i < config->num_output_values; i++) {
> -		if (config->output_values[i].offset == offset)
> -			return config->output_values[i].value;
> -	}
> +	struct override_config *override;
>  
> -	errno = ENXIO;
> -	return -1;
> -}
> -
> -GPIOD_API int
> -gpiod_line_config_get_output_value_index(struct gpiod_line_config *config,
> -					 unsigned int index,
> -					 unsigned int *offset, int *value)
> -{
> -	if (index >= config->num_output_values) {
> -		errno = EINVAL;
> +	override = get_override_by_offset(config, offset);
> +	if (!override || !override->value_set) {
> +		errno = ENXIO;
>  		return -1;
>  	}
>  
> -	*offset = config->output_values[index].offset;
> -	*value = config->output_values[index].value;
> -
> -	return 0;
> -}
> -
> -GPIOD_API void
> -gpiod_line_config_get_output_values(struct gpiod_line_config *config,
> -				    unsigned int *offsets, int *values)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < config->num_output_values; i++) {
> -		offsets[i] = config->output_values[i].offset;
> -		values[i] = config->output_values[i].value;
> -	}
> +	return override->value;
>  }
>  
> -static uint64_t gpiod_make_kernel_flags(struct base_config *config)
> +static uint64_t make_kernel_flags(const struct base_config *config)
>  {
>  	uint64_t flags = 0;
>  
> @@ -753,48 +705,205 @@ static int set_kernel_output_values(uint64_t *mask, uint64_t *vals,
>  				    unsigned int num_lines,
>  				    const unsigned int *offsets)
>  {
> -	struct output_value *outval;
> +	struct override_config *override;
>  	unsigned int i;
>  	int idx;
>  
>  	gpiod_line_mask_zero(mask);
>  	gpiod_line_mask_zero(vals);
>  
> -	for (i = 0; i < config->num_output_values; i++) {
> -		outval = &config->output_values[i];
> +	for (i = 0; i < config->num_overrides; i++) {
> +		override = &config->overrides[i];
> +
> +		if (override->value_set) {
> +			idx = find_bitmap_index(override->offset,
> +						num_lines, offsets);
> +			if (idx < 0) {
> +				errno = EINVAL;
> +				return -1;
> +			}
> +
> +			gpiod_line_mask_set_bit(mask, idx);
> +			gpiod_line_mask_assign_bit(vals, idx,
> +						   !!override->value);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static bool base_config_flags_are_equal(struct base_config *base,
> +					struct override_config *override)
> +{
> +	if (((override->override_flags & OVERRIDE_FLAG_DIRECTION) &&
> +	     base->direction != override->base.direction) ||
> +	    ((override->override_flags & OVERRIDE_FLAG_EDGE) &&
> +	     base->edge != override->base.edge) ||
> +	    ((override->override_flags & OVERRIDE_FLAG_DRIVE) &&
> +	     base->drive != override->base.drive) ||
> +	    ((override->override_flags & OVERRIDE_FLAG_BIAS) &&
> +	     base->bias != override->base.bias) ||
> +	    ((override->override_flags & OVERRIDE_FLAG_ACTIVE_LOW) &&
> +	     base->active_low != override->base.active_low) ||
> +	    ((override->override_flags & OVERRIDE_FLAG_CLOCK) &&
> +	     base->clock != override->base.clock))
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool override_config_flags_are_equal(struct override_config *a,
> +					    struct override_config *b)
> +{
> +	if (base_config_flags_are_equal(&a->base, b) &&
> +	    ((a->override_flags & ~OVERRIDE_FLAG_DEBOUNCE_PERIOD) ==
> +	     (b->override_flags & ~OVERRIDE_FLAG_DEBOUNCE_PERIOD)))
> +		return true;
> +
> +	return false;
> +}
> +
> +static void set_base_config_flags(struct gpio_v2_line_attribute *attr,
> +				  struct override_config *override,
> +				  struct gpiod_line_config *config)
> +{
> +	struct base_config base;
> +
> +	memcpy(&base, &config->defaults, sizeof(base));
> +
> +	if (override->override_flags & OVERRIDE_FLAG_DIRECTION)
> +		base.direction = override->base.direction;
> +	if (override->override_flags & OVERRIDE_FLAG_EDGE)
> +		base.edge = override->base.edge;
> +	if (override->override_flags & OVERRIDE_FLAG_BIAS)
> +		base.bias = override->base.bias;
> +	if (override->override_flags & OVERRIDE_FLAG_DRIVE)
> +		base.drive = override->base.drive;
> +	if (override->override_flags & OVERRIDE_FLAG_ACTIVE_LOW)
> +		base.active_low = override->base.active_low;
> +	if (override->override_flags & OVERRIDE_FLAG_CLOCK)
> +		base.clock = override->base.clock;
> +
> +	attr->id = GPIO_V2_LINE_ATTR_ID_FLAGS;
> +	attr->flags = make_kernel_flags(&base);
> +}
> +
> +static bool base_debounce_period_is_equal(struct base_config *base,
> +					  struct override_config *override)
> +{
> +	if ((override->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD) &&
> +	    base->debounce_period_us != override->base.debounce_period_us)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool override_config_debounce_period_is_equal(struct override_config *a,
> +						     struct override_config *b)
> +{
> +	if (base_debounce_period_is_equal(&a->base, b) &&
> +	    ((a->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD) ==
> +	     (b->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD)))
> +		return true;
> +
> +	return false;
> +}
> +

To improve readability, flip the order here to test the flag equivalence
first.
Particularly wrt the "a" doesn't have debounce overridden case.

> +static void
> +set_base_config_debounce_period(struct gpio_v2_line_attribute *attr,
> +				struct override_config *override,
> +				struct gpiod_line_config *config GPIOD_UNUSED)
> +{
> +	attr->id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
> +	attr->debounce_period_us = override->base.debounce_period_us;
> +}
> +
> +static int set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
> +				unsigned int num_lines,
> +				const unsigned int *offsets,
> +				const struct gpiod_line_config *config)
> +{
> +	unsigned int i, j;
> +	int off;
> +
> +	gpiod_line_mask_zero(out);
> +
> +	for (i = 0; i < config->num_overrides; i++) {
> +		if (!gpiod_line_mask_test_bit(in, i))
> +			continue;
> +
> +		for (j = 0, off = -1; j < num_lines; j++) {
> +			if (offsets[j] == config->overrides[i].offset) {
> +				off = j;
> +				break;
> +			}
> +		}
>  
> -		idx = find_bitmap_index(outval->offset, num_lines, offsets);
> -		if (idx < 0) {
> +		if (off < 0) {
>  			errno = EINVAL;
>  			return -1;
>  		}
>  
> -		gpiod_line_mask_set_bit(mask, idx);
> -		gpiod_line_mask_assign_bit(vals, idx, !!outval->value);
> +		gpiod_line_mask_set_bit(out, off);
>  	}
>  
>  	return 0;
>  }
>  
> -static int set_secondary_mask(uint64_t *mask,
> -			      struct secondary_config *sec_cfg,
> -			      unsigned int num_lines,
> -			      const unsigned int *offsets)
> +static int process_overrides(struct gpiod_line_config *config,
> +			     struct gpio_v2_line_config *cfgbuf,
> +			     unsigned int *attr_idx,
> +			     unsigned int num_lines,
> +			     const unsigned int *offsets,
> +			     bool (*defaults_equal_func)(struct base_config *,
> +						struct override_config *),
> +			     bool (*override_equal_func)(
> +						struct override_config *,
> +						struct override_config *),
> +			     void (*set_func)(struct gpio_v2_line_attribute *,
> +					      struct override_config *,
> +					      struct gpiod_line_config *))
>  {
> -	unsigned int i;
> -	int idx;
> +	struct gpio_v2_line_config_attribute *attr;
> +	uint64_t processed = 0, marked = 0, mask;
> +	struct override_config *current, *next;
> +	unsigned int i, j;
>  
> -	gpiod_line_mask_zero(mask);
> +	for (i = 0; i < config->num_overrides; i++) {
> +		if (gpiod_line_mask_test_bit(&processed, i))
> +			continue;
>  
> -	for (i = 0; i < sec_cfg->num_offsets; i++) {
> -		idx = find_bitmap_index(sec_cfg->offsets[i],
> -					num_lines, offsets);
> -		if (idx < 0) {
> -			errno = EINVAL;
> +		current = &config->overrides[i];
> +		gpiod_line_mask_set_bit(&processed, i);
> +
> +		if (defaults_equal_func(&config->defaults, current))
> +			continue;
> +
> +		marked = 0;
> +		gpiod_line_mask_set_bit(&marked, i);
> +
> +		for (j = i + 1; j < config->num_overrides; j++) {
> +			if (gpiod_line_mask_test_bit(&processed, j))
> +				continue;
> +
> +			next = &config->overrides[j];
> +
> +			if (override_equal_func(current, next)) {
> +				gpiod_line_mask_set_bit(&marked, j);
> +				gpiod_line_mask_set_bit(&processed, j);
> +			}
> +		}
> +
> +		attr = &cfgbuf->attrs[(*attr_idx)++];
> +		if (*attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX) {
> +			errno = E2BIG;
>  			return -1;
>  		}
>  
> -		gpiod_line_mask_set_bit(mask, idx);
> +		set_kernel_attr_mask(&mask, &marked,
> +				     num_lines, offsets, config);
> +		attr->mask = mask;
> +		set_func(&attr->attr, current, config);
>  	}
>  
>  	return 0;

Don't see anything wrong here, but I'd like to see a bunch of tests to
cover the corner cases you mentioned, as the bulk of the module complexity
is here.
Not that I expect that now.

> @@ -806,7 +915,7 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
>  				const unsigned int *offsets)
>  {
>  	struct gpio_v2_line_config_attribute *attr;
> -	struct secondary_config *sec_cfg;
> +	struct override_config *override;
>  	unsigned int attr_idx = 0, i;
>  	uint64_t mask, values;
>  	int ret;
> @@ -819,59 +928,66 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
>  	if (config->too_complex)
>  		goto err_2big;
>  
> -	if (config->num_output_values) {
> -		if (config->num_output_values > num_lines)
> -			goto err_2big;
> +	/*
> +	 * First check if we have at least one default output value configured.
> +	 * If so, let's take one attribute for the default values.
> +	 */
> +	for (i = 0; i < config->num_overrides; i++) {
> +		override = &config->overrides[i];
>  
> -		attr = &cfgbuf->attrs[attr_idx++];
> -		attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
> +		if (override->value_set) {
> +			attr = &cfgbuf->attrs[attr_idx++];
> +			attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
>  
> -		ret = set_kernel_output_values(&mask, &values, config,
> -					       num_lines, offsets);
> -		if (ret)
> -			return ret;
> +			ret = set_kernel_output_values(&mask, &values, config,
> +						       num_lines, offsets);
> +			if (ret)
> +				return ret;
>  
> -		attr->attr.values = values;
> -		attr->mask = mask;
> +			attr->attr.values = values;
> +			attr->mask = mask;
> +
> +			break;
> +		}
>  	}
>  
> -	if (config->primary.debounce_period) {
> +	/* If we have a default debounce period - use another attribute. */
> +	if (config->defaults.debounce_period_us) {
>  		attr = &cfgbuf->attrs[attr_idx++];
>  		attr->attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
> -		attr->attr.debounce_period_us = config->primary.debounce_period;
> +		attr->attr.debounce_period_us =
> +				config->defaults.debounce_period_us;
>  		gpiod_line_mask_fill(&mask);
>  		attr->mask = mask;
>  	}
>  
> -	for (i = 0; i < config->num_secondary; i++, attr_idx++) {
> -		if (attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX)
> -			goto err_2big;
> -
> -		sec_cfg = &config->secondary[i];
> -		attr = &cfgbuf->attrs[attr_idx];
> -
> -		if (sec_cfg->num_offsets > num_lines)
> -			goto err_2big;
> -
> -		if (sec_cfg->config.debounce_period) {
> -			attr->attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
> -			attr->attr.debounce_period_us =
> -					sec_cfg->config.debounce_period;
> -		} else {
> -			attr->attr.id = GPIO_V2_LINE_ATTR_ID_FLAGS;
> -
> -			attr->attr.flags = gpiod_make_kernel_flags(
> -							&sec_cfg->config);
> -		}
> +	/*
> +	 * The overrides are processed independently for regular flags and the
> +	 * debounce period. We iterate over the configured line overrides. We
> +	 * first check if the given set of options is equal to the global
> +	 * defaults. If not, we mark it and iterate over the remaining
> +	 * overrides looking for ones that have the same config as the one
> +	 * currently processed. We mark them too and at the end we create a
> +	 * single kernel attribute with the translated config and the mask
> +	 * corresponding to all marked overrides. Those are now excluded from
> +	 * further processing.
> +	 */
>  
> -		ret = set_secondary_mask(&mask, sec_cfg, num_lines, offsets);
> -		if (ret)
> -			return -1;
> +	ret = process_overrides(config, cfgbuf, &attr_idx, num_lines, offsets,
> +				base_config_flags_are_equal,
> +				override_config_flags_are_equal,
> +				set_base_config_flags);
> +	if (ret)
> +		return -1;
>  
> -		attr->mask = mask;
> -	}
> +	ret = process_overrides(config, cfgbuf, &attr_idx, num_lines, offsets,
> +				base_debounce_period_is_equal,
> +				override_config_debounce_period_is_equal,
> +				set_base_config_debounce_period);
> +	if (ret)
> +		return -1;
>  
> -	cfgbuf->flags = gpiod_make_kernel_flags(&config->primary);
> +	cfgbuf->flags = make_kernel_flags(&config->defaults);
>  	cfgbuf->num_attrs = attr_idx;
>  
>  	return 0;
> -- 
> 2.30.1
> 

Overall it looks really good to me, so no problem with applying it,
with or without my suggestions.

Cheers,
Kent.


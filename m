Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DAD3E3429
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Aug 2021 10:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhHGIsf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Aug 2021 04:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhHGIse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Aug 2021 04:48:34 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19F6C0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  7 Aug 2021 01:48:16 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id lw7-20020a17090b1807b029017881cc80b7so146059pjb.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Aug 2021 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tKdAcbVVZmkchOYJFAx87mvOne0ix+Ln92JkyD3Dfl8=;
        b=cnj/lItWmb95e4oobz6ZcY7MOgGEMgZG9HkFTeLKW6CofZpsxAytFq+6jveaFImV4f
         qBRCj1J+v1IGNcXe4T7RXBmWxZDj7GiAcZ9VPsv0wjRDfHB69J6MuFOxWyNmflVEr6qI
         tE+bk19E9L8SU4weGDOZ7n07v9hzLhSvnDyzpoe5ZHQTJMNlyVKvd5R+abMQte8ZcbR+
         e0P8XMwPCqlh5YxEtWF9f5IDwe+aGrpOyqrmuq3YfBud12amJYGy3vutCDyuTFUnGE31
         jjUz3AefsIM2A8DsUPDFXbK5KomOxM0pNdrelWycEmc75j5I53r+li7oeRnHmdNLCAjO
         ncOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tKdAcbVVZmkchOYJFAx87mvOne0ix+Ln92JkyD3Dfl8=;
        b=gvLdq7Msna8+DGIvedv07cDvwVX+oEO2bHXGdidyGaPcqf22lW6UiC51O+KZjjvkgd
         jL+3oI2MZmPyQTBEdODHaUC7/TqaJTe5pS+fEYPOgHFOegYdl8fwZZKWelflvcI1ZfzV
         klEyRTxXYyP9rdL65EmhROu1W8jX7UmFi9mFEpb4dcjHRs4R834phvQqj615bNHb846t
         w1nwi2ob2i0BKTOeNe2zOCK9CFLO/Kcs206c+fa2LKVJarjWGrM6jmfDAHZo66RhZmG4
         j/dmekPmg1eToI5zuYo2l4SVtkpmM5gyd0qVTXmZJl2u9Cv2Kik7YYLtS9kYbfdAhU3k
         BByw==
X-Gm-Message-State: AOAM532cjZ5OxoWMN69Vjg75rUxAx3SaTftA8lxf3GQp0t7C4WgB3agS
        amRTcIcSPsLEDlCMOKYfbPM=
X-Google-Smtp-Source: ABdhPJxSC5H6+OqMFxM5S21IQY8Oe5lfq+bAalEzfbkDKr3Sllymrq3RAjjjbmMjmrBYT2LA++xs+A==
X-Received: by 2002:a17:90a:a78d:: with SMTP id f13mr14321861pjq.206.1628326095969;
        Sat, 07 Aug 2021 01:48:15 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id c12sm14904372pjm.16.2021.08.07.01.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 01:48:15 -0700 (PDT)
Date:   Sat, 7 Aug 2021 16:48:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210807084809.GA17852@sol>
References: <20210806132810.23556-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806132810.23556-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 06, 2021 at 03:28:10PM +0200, Bartosz Golaszewski wrote:
> Kent suggested that we may want to add getters for the config objects in
> his reviews under the C++ patches. Indeed when working on Python bindings
> I noticed it would be useful for implementing __str__ and __repr__
> callbacks. In C++ too we could use them for overloading stream operators.
> 
> This extends the config objects with getters. They are straightforward for
> the request config but for the line config, they allow to only read
> per-offset values that would be used if the object was used in a request
> at this moment. We also add getters for the output values: both taking
> the line offset as argument as well as ones that take the index and allow
> to iterate over all configured output values.
> 
> The sanitization of input for the getters has subsequently been changed
> so that we never return invalid values. The input values are verified
> immediately and if an invalid value is passed, it's silently replaced
> by the default value for given setting.
> 
> This patch also adds the reset function for the line config object - it
> can be used to reset all stored configuration if - for example - the
> config has become too complex.
> 
> As this patch will be squashed into the big v2 patch anyway, I allowed
> myself to include some additional changes: some variable renames and
> other minor tweaks.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

A few minor nit-picks in the gpiod.h documentation below...

Cheers,
Kent.

> ---
>  include/gpiod.h      | 189 +++++++++++++++++++++++-
>  lib/line-config.c    | 340 ++++++++++++++++++++++++++++++++++---------
>  lib/request-config.c |  42 +++++-
>  3 files changed, 487 insertions(+), 84 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 885b472..d186df7 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -451,11 +451,11 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
>   * The line-config object stores the configuration for lines that can be used
>   * in two cases: when making a line request and when reconfiguring a set of
>   * already requested lines. The mutators for the line request don't return
> - * errors. If the configuration is invalid - the set of options is too complex
> - * to be translated into kernel uAPI structures or invalid values have been
> - * passed to any of the functions - the error will be returned at the time of
> - * the request or reconfiguration. Each option can be set globally, for
> - * a single line offset or for multiple line offsets.
> + * errors. If the set of options is too complex to be translated into kernel
> + * uAPI structures - the error will be returned at the time of the request or
> + * reconfiguration. If an invalid value was passed to any of the getters - the
> + * default value will be silently used instead. Each option can be set
> + * globally, for a single line offset or for multiple line offsets.
>   */
>  
>  /**
> @@ -470,6 +470,15 @@ struct gpiod_line_config *gpiod_line_config_new(void);
>   */
>  void gpiod_line_config_free(struct gpiod_line_config *config);
>  
> +/**
> + * @brief Reset the line config object.
> + * @param config Line config object to free.
> + *
> + * Resets the entire configuration stored in this object. This is useful if
> + * the user wants to reuse the object without reallocating it.
> + */
> +void gpiod_line_config_reset(struct gpiod_line_config *config);
> +
>  /**
>   * @brief Set the direction of all lines.
>   * @param config Line config object.
> @@ -499,6 +508,18 @@ void gpiod_line_config_set_direction_subset(struct gpiod_line_config *config,
>  					    unsigned int num_offsets,
>  					    const unsigned int *offsets);
>  
> +/**
> + * @brief Get the direction setting for the line at given offset.

"for a given line" reads better for me, especially when combined with a
minor tweak to the offset description below.

> + * @param config Line config object.
> + * @param offset Line offset for which to read the direction setting.

"Offset of the line from which to read".  Throughout.

> + * @return Direction setting that would have been used for given offset if the
> + *         config object was used in a request at the time of the call.
> + * @note If an offset is used for which no config was provided, the function
> + *       will return the global, default value.
> + */

No comma necessary - "global default value" is fine. Throughout.

> +int gpiod_line_config_get_direction(struct gpiod_line_config *config,
> +				    unsigned int offset);
> +
>  /**
>   * @brief Set the edge event detection for all lines.
>   * @param config Line config object.
> @@ -529,6 +550,19 @@ gpiod_line_config_set_edge_detection_subset(struct gpiod_line_config *config,
>  					    int edge, unsigned int num_offsets,
>  					    const unsigned int *offsets);
>  
> +/**
> + * @brief Get the edge event detection setting for the line at given offset.
> + * @param config Line config object.
> + * @param offset Line offset for which to read the edge event detection setting.
> + * @return Edge event detection setting that would have been used for given
> + *         offset if the config object was used in a request at the time of
> + *         the call.
> + * @note If an offset is used for which no config was provided, the function
> + *       will return the global, default value.
> + */
> +int gpiod_line_config_get_edge_detection(struct gpiod_line_config *config,
> +					 unsigned int offset);
> +
>  /**
>   * @brief Set the bias of all lines.
>   * @param config Line config object.
> @@ -556,6 +590,18 @@ void gpiod_line_config_set_bias_subset(struct gpiod_line_config *config,
>  				       int bias, unsigned int num_offsets,
>  				       const unsigned int *offsets);
>  
> +/**
> + * @brief Get the bias setting for the line at given offset.
> + * @param config Line config object.
> + * @param offset Line offset for which to read the bias setting.
> + * @return Bias setting that would have been used for given offset if the
> + *         config object was used in a request at the time of the call.
> + * @note If an offset is used for which no config was provided, the function
> + *       will return the global, default value.
> + */
> +int gpiod_line_config_get_bias(struct gpiod_line_config *config,
> +			       unsigned int offset);
> +
>  /**
>   * @brief Set the drive of all lines.
>   * @param config Line config object.
> @@ -583,6 +629,18 @@ void gpiod_line_config_set_drive_subset(struct gpiod_line_config *config,
>  					int drive, unsigned int num_offsets,
>  					const unsigned int *offsets);
>  
> +/**
> + * @brief Get the drive setting for the line at given offset.
> + * @param config Line config object.
> + * @param offset Line offset for which to read the drive setting.
> + * @return Drive setting that would have been used for given offset if the
> + *         config object was used in a request at the time of the call.
> + * @note If an offset is used for which no config was provided, the function
> + *       will return the global, default value.
> + */
> +int gpiod_line_config_get_drive(struct gpiod_line_config *config,
> +				unsigned int offset);
> +
>  /**
>   * @brief Set all lines as active-low.
>   * @param config Line config object.
> @@ -607,6 +665,18 @@ void gpiod_line_config_set_active_low_subset(struct gpiod_line_config *config,
>  					     unsigned int num_offsets,
>  					     const unsigned int *offsets);
>  
> +/**
> + * @brief Check if the line at given offset was configured as active-low.
> + * @param config Line config object.
> + * @param offset Line offset for which to read the active-low setting.
> + * @return Active-low setting that would have been used for given offset if the
> + *         config object was used in a request at the time of the call.
> + * @note If an offset is used for which no config was provided, the function
> + *       will return the global, default value.
> + */
> +bool gpiod_line_config_is_active_low(struct gpiod_line_config *config,
> +				     unsigned int offset);
> +
>  /**
>   * @brief Set all lines as active-high.
>   * @param config Line config object.
> @@ -663,6 +733,19 @@ gpiod_line_config_set_debounce_period_subset(struct gpiod_line_config *config,
>  					     unsigned int num_offsets,
>  					     const unsigned int *offsets);
>  
> +/**
> + * @brief Get the debounce period for the line at given offset.
> + * @param config Line config object.
> + * @param offset Line offset for which to read the debounce period.
> + * @return Debounce period that would have been used for given offset if the
> + *         config object was used in a request at the time of the call.
> + * @note If an offset is used for which no config was provided, the function
> + *       will return the global, default value.
> + */
> +unsigned long
> +gpiod_line_config_get_debounce_period(struct gpiod_line_config *config,
> +				      unsigned int offset);
> +
>  /**
>   * @brief Set the event timestamp clock for all lines.
>   * @param config Line config object.
> @@ -692,6 +775,18 @@ void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
>  					      unsigned int num_offsets,
>  					      const unsigned int *offsets);
>  
> +/**
> + * @brief Get the event clock setting for the line at given offset.
> + * @param config Line config object.
> + * @param offset Line offset for which to read the event clock setting.
> + * @return Event clock setting that would have been used for given offset if
> + *         the config object was used in a request at the time of the call.
> + * @note If an offset is used for which no config was provided, the function
> + *       will return the global, default value.
> + */
> +int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
> +				      unsigned int offset);
> +
>  /**
>   * @brief Set the output value for a single offset.
>   * @param config Line config object.
> @@ -704,16 +799,63 @@ void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
>  /**
>   * @brief Set the output values for a set of offsets.
>   * @param config Line config object.
> - * @param num_offsets Number of offsets for which to set values.
> + * @param num_values Number of offsets for which to set values.
>   * @param offsets Array of line offsets to set values for.
>   * @param values Array of output values associated with the offsets passed in
>   *               the previous argument.
>   */
>  void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
> -					 unsigned int num_offsets,
> +					 unsigned int num_values,
>  					 const unsigned int *offsets,
>  					 const int *values);
>  
> +/**
> + * @brief Get the number of line offsets for which this config object stores
> + *        output values.
> + * @param config Line config object.
> + * @return Number of output values currently configured for this object.
> + */
> +unsigned int
> +gpiod_line_config_num_output_values(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the output value configured for the line at given offset.
> + * @param config Line config object.
> + * @param offset Line offset for which to read the value.
> + * @return 1 or 0 if the value was configured for this line, -1 otherwise.
> + */
> +int gpiod_line_config_get_output_value(struct gpiod_line_config *config,
> +				       unsigned int offset);
> +
> +/**
> + * @brief Get the output value mapping (offset -> value) at given index.
> + * @param config Line config object.
> + * @param index Position of the mapping in the internal array.
> + * @param offset Buffer for storing the offset of the line.
> + * @param value Buffer for storing the value mapped for the offset.

"value corresponding to the offset"

> + * @return Returns 0 on success, -1 if the index is out of range.
> + *
> + * This function together with ::gpiod_line_config_num_output_values allows to
> + * iterate over all output value mappings currently held by this object.
> + */
> +int gpiod_line_config_get_output_value_index(struct gpiod_line_config *config,
> +					     unsigned int index,
> +					     unsigned int *offset, int *value);
> +
> +/**
> + * @brief Get all output value mappings stored in this config object.
> + * @param config Line config object.
> + * @param offsets Buffer in which offsets will be stored.
> + * @param values Buffer in which values will be stored.
> + * @note Both the offsets and values buffers must be able to hold at least the
> + *       number of elements returned by ::gpiod_line_config_num_output_values.
> + *
> + * Each offset in the offsets array corresponds with the value in the values
> + * array at the same index.
> + */

"corresponds to", not with.

> +void gpiod_line_config_get_output_values(struct gpiod_line_config *config,
> +					 unsigned int *offsets, int *values);
> +
>  /**
>   * @}
>   *
> @@ -750,6 +892,14 @@ void gpiod_request_config_free(struct gpiod_request_config *config);
>  void gpiod_request_config_set_consumer(struct gpiod_request_config *config,
>  				       const char *consumer);
>  
> +/**
> + * @brief Get the consumer string.
> + * @param config Request config object.
> + * @return Current consumer string stored in this request config.
> + */
> +const char *
> +gpiod_request_config_get_consumer(struct gpiod_request_config *config);
> +
>  /**
>   * @brief Set line offsets for this request.
>   * @param config Request config object.
> @@ -762,6 +912,23 @@ void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
>  				      unsigned int num_offsets,
>  				      const unsigned int *offsets);
>  
> +/**
> + * @brief Get the number of offsets configured in this request config.
> + * @param config Request config object.
> + * @return Number of line offsets in this request config.
> + */
> +unsigned int
> +gpiod_request_config_get_num_offsets(struct gpiod_request_config *config);
> +
> +/**
> + * @brief Get the hardware offsets of lines in this request config.
> + * @param config Request config object.
> + * @param offsets Array to store offsets in. Must hold at least the number of
> + *                lines returned by ::gpiod_request_config_get_num_offsets.
> + */

"Array to store offsets."

> +void gpiod_request_config_get_offsets(struct gpiod_request_config *config,
> +				      unsigned int *offsets);
> +
>  /**
>   * @brief Set the size of the kernel event buffer.
>   * @param config Request config object.
> @@ -773,6 +940,14 @@ void
>  gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
>  					   unsigned int event_buffer_size);
>  
> +/**
> + * @brief Get the edge event buffer size from this request config.
> + * @param config Request config object.
> + * @return Current edge event buffer size setting.
> + */
> +unsigned int
> +gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
> +
>  /**
>   * @}
>   *

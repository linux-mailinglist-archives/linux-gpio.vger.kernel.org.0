Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773C44CE32F
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Mar 2022 06:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiCEFwC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Mar 2022 00:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiCEFwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Mar 2022 00:52:02 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62FC1D3AC6
        for <linux-gpio@vger.kernel.org>; Fri,  4 Mar 2022 21:51:12 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id z3so1078843plg.8
        for <linux-gpio@vger.kernel.org>; Fri, 04 Mar 2022 21:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HiS1DwKkkW15JJBv3lH2tIpdaYFb1fSTqXSyamdq5HM=;
        b=Yx8n4HwGljkh5ediBWRa8zAOf/b3x+ehgIAMgYpFanAETQELZIvhag67fRM6OTzGBR
         5vBljBsrIux2XiQo8ykRLr/Rin9rYXGKFEyASKtO9IDJgfMir7fcCqlZUsqIog2bS24r
         MOulhiGhQMqX155f4VwixbJd0YuBk94wAgCRmWr8Y9FxwLNsM83sViCLCr2XAtjOpDru
         67yYcPC2xrhT9NrOc6MB1QKnYt1Q/8OQXpMWJ9pGy5r4ltLn4tJBLBwOOWmFAhW6CX/g
         LywYMLle7bgCu897OPsV37N1XjNGgOtWQuINO3wVf3vSEne0eAzYj71Z+HHUzcP/ZtOp
         3yUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HiS1DwKkkW15JJBv3lH2tIpdaYFb1fSTqXSyamdq5HM=;
        b=0eKv/vRCbrRJpuCCmPPR097AkI3Oija7yy++AWtR2s4eU4Owvk/h9HtCFDaECbhOqt
         6Xj5Vj6JFrivmR6EvNHhKSnogV2/MfgDeN3bx+Fgoh4jpIqeXyiVdYQN/PZVDXxxKSdi
         VtAmiX+DXEDgU39PVYpiVyTx5au6URtRwhrbNOR7fcZYwaEx2dyS1KU5SLo0JNfYsJ5t
         ks3wCC2NklKHiYeDuwurUnf/FJaRQFShHfnCaHtsG3nNN2JqPEK7PggRNS0EmgmcADuu
         Auck8S7fhzwAZPGZu8bsfwyzUoUGLKjYMbiM04YO5cBNB3kX0GVc+Y0UdzAEcicEVka8
         zbmg==
X-Gm-Message-State: AOAM530d5qNbFSJANL1cMKQioOs1KOIMmkcTTiRJ2ZvkI13yJcYQufu6
        pWa0+Dtm9dwwwo0SWf4oE+TJ9Ky8U3ArQw==
X-Google-Smtp-Source: ABdhPJxsv7fw69kqltvjcSQXvKP407FHZAT+zUUDL6YC7n5S/sE/8/WI63mUScOid4D5qXZa4W0UtQ==
X-Received: by 2002:a17:902:a9cb:b0:151:7aa6:85cb with SMTP id b11-20020a170902a9cb00b001517aa685cbmr1845310plr.76.1646459472207;
        Fri, 04 Mar 2022 21:51:12 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id b14-20020a056a000cce00b004e19bc1e81bsm8015703pfv.18.2022.03.04.21.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 21:51:11 -0800 (PST)
Date:   Sat, 5 Mar 2022 13:51:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/3] line-config: expose the override
 logic to users
Message-ID: <20220305055107.GB9638@sol>
References: <20220303091836.168223-1-brgl@bgdev.pl>
 <20220303091836.168223-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303091836.168223-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 03, 2022 at 10:18:35AM +0100, Bartosz Golaszewski wrote:
> We've already added getters for line-config but without exposing some
> parts of the internal logic of the object, the user can't really get
> the full picture and inspect the contents. This patch reworks the
> accessors further by providing access to the underlying override
> mechanism.
> 
> For every setting, we expose a getter and setter for the default value
> as well as a set of four functions for setting, getting, clearing and
> checking per-offset overrides.
> 
> An override can initially have the same value as the defaults but will
> retain the overridden value should the defaults change.
> 
> We also complete the API by providing functions that allow to retrieve
> the overridden offsets and their corresponding property types.
> 
> This way the caller can fully inspect the line_config and high-level
> language bindings can provide stringification methods.
> 
> While at it: we fix a couple bugs in the implementation of struct
> line_config and add new constructors that take a variable list of
> arguments.
> 

The variadic constructor is new for patch v3.
It bundles default constructor + default mutators, so doesn't add
functionality that wasn't already available - it just makes it
accessible via a single function call.
Is the variadic form beneficial for bindings, say Python, where you
would prefer not to be making a bunch of C calls?
Or is this just sugar?

No major objection, just curious about the rationale for adding it.

[snip]

> +/**
> + * @brief Get the total number of overridden settings currently stored by this
> + *        line config object.
> + * @param config Line config object.
> + * @return Number of individual overridden settings.
> + */
> +unsigned int
> +gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
> +
> +/**
> + * @brief Get the list of overridden offsets and the corresponding types of
> + *        overridden settings.
> + * @param config Line config object.
> + * @param offsets Array to store the overidden offsets. Must hold at least the
> + *                number of unsigned integers returned by
> + *                ::gpiod_line_config_get_output_value_offset.
> + * @param props Array to store the types of overridden settings. Must hold at
> + *              least the number of integers returned by
> + *              gpiod_line_config_get_output_value_offset.
> + */

The purpose of the offsets and props arrays is not clear.
Clarify that you are returning a list of (offset,prop), split across the
two arrays.
Replace them with a single array of (offset,prop) unless there is
a good reason to keep them separate?

Guessing it should be gpiod_line_config_get_num_overrides(), not
gpiod_line_config_get_output_value_offset() which returns 0 or 1, or
even better -1 for inputs?

[snip]

> +GPIOD_API unsigned int
> +gpiod_line_config_get_num_overrides(struct gpiod_line_config *config)
> +{
> +	struct override_config *override;
> +	unsigned int i, j, count = 0;
>  
> -	errno = ENXIO;
> +	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
> +		override = &config->overrides[i];
> +
> +		if (override_used(override)) {
> +			for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
> +				if (override->override_flags &
> +				    override_flag_list[j])
> +					count++;
> +			}
> +		}
> +	}
> +
> +	return count;
> +}
> +

Using GPIO_V2_LINES_MAX for the size of the overrides array is
confusing, and the two should be de-coupled so you can more easily resize
the array if necessary.
Provide a NUM_OVERRIDES_MAX, or similar, and use that when referring
to the size of the overrides array.

> +static int override_flag_to_prop(int flag)
> +{
> +	switch (flag) {
> +	case OVERRIDE_FLAG_DIRECTION:
> +		return GPIOD_LINE_CONFIG_PROP_DIRECTION;
> +	case OVERRIDE_FLAG_EDGE:
> +		return GPIOD_LINE_CONFIG_PROP_EDGE;
> +	case OVERRIDE_FLAG_BIAS:
> +		return GPIOD_LINE_CONFIG_PROP_BIAS;
> +	case OVERRIDE_FLAG_DRIVE:
> +		return GPIOD_LINE_CONFIG_PROP_DRIVE;
> +	case OVERRIDE_FLAG_ACTIVE_LOW:
> +		return GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW;
> +	case OVERRIDE_FLAG_DEBOUNCE_PERIOD:
> +		return GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD;
> +	case OVERRIDE_FLAG_CLOCK:
> +		return GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK;
> +	case OVERRIDE_FLAG_OUTPUT_VALUE:
> +		return GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE;
> +	}
> +
> +	/* Can't happen. */
>  	return -1;
>  }
>  
> +GPIOD_API void
> +gpiod_line_config_get_overrides(struct gpiod_line_config *config,
> +				unsigned int *offsets, int *props)
> +{
> +	struct override_config *override;
> +	unsigned int i, j, count = 0;
> +
> +	for (i = 0; i < GPIO_V2_LINES_MAX; i++) {
> +		override = &config->overrides[i];
> +
> +		if (override_used(override)) {
> +			for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
> +				if (override->override_flags &
> +				    override_flag_list[j]) {
> +					offsets[count] = override->offset;
> +					props[count] = override_flag_to_prop(
> +							override_flag_list[j]);
> +					count++;
> +				}
> +			}
> +		}
> +	}
> +}
> +

Return the count?
Would be a bit redundant, as the user needs to call 
gpiod_line_config_get_num_overrides() to size the offsets and props
arrays beforehand, but the usual patten when writing into a passed array
is to return the number of elements written.

Cheers,
Kent.

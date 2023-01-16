Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44EAB66B4EB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 01:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbjAPAPS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Jan 2023 19:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbjAPAPQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Jan 2023 19:15:16 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D1A14489
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 16:15:15 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso32345682pjt.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 16:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdQNb4cRYjo/qTzsmvAYUp2XK032fBMeHD1oDcHdUbk=;
        b=kmQDXybG/nf3B33/EJ1QJpPV59Icd1khs/R6/HCWg0ctr+Mwd9BB2bz+1aHv1Xt5fY
         g6RQvwYXNsDVL7a+kBD8B8/xo9Wn4xCIPjfgjiYh+1G07nVBgZ1tkytl4lYBXOx6OMUR
         v4TZ4RxMY9pYIuojd3beuGAdvu42FcSFYsgvj8xkqsi4S+fnccBjsX205toejuTpOAP8
         kHFuNovrG0hv6suhivfeqHafWB7BMR8v5ka1vMnYCPIi72GygoOu9sypl3uhenuukGgI
         LiPOdra7Mt8gJV/B7iG1/lMHbsTbtVclp+Jie8i/vMZZDViHcwdzH+rEbKGwBNS7q1A1
         XkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdQNb4cRYjo/qTzsmvAYUp2XK032fBMeHD1oDcHdUbk=;
        b=jAAkz9CxkqnjL/2PifIznWiR+D5eOM6CtYqhLNU9mGKs6LSe047FoPoEsRH3+UrwKv
         7dVVapRBjWH2/p9JAIoUPQCIfyLXNMBUjQPoUk6obIg3TV4n8/QiFMD/rTSUs1difUVE
         ORxtzgn6aerBSPgaN1o/4BY+Houb2Rm5aj0hjWIRsyDP31SlexOccgzb4LQOukGwlIaW
         yj/Zge7NSDmBdYLy/W+KLN1RQuVCISa0h/euMFKGumNR9KkREp1BPugNpMZwYhmEm9YS
         DuBDUbbo+crQUJCy7fJgWSjGJxYZiv+QS4mn58nyr4pbF5CYQCCDkIuS5V6WZSrmHrND
         j/CA==
X-Gm-Message-State: AFqh2koKQzF/6ITU1WSyc4leGVVXEvvVf7jCKA7sIeGyxnSzMKrkrOpZ
        PmGawmFgSX8P1fqMLzna6Gg=
X-Google-Smtp-Source: AMrXdXuRJAEW09z5SBV3okEosKb+yS2gW6VqKE7ZKI6/XBg4G8xfR2Irf6n2KHdmLh08pI/yUrI2mQ==
X-Received: by 2002:a17:902:b70f:b0:194:98f0:108e with SMTP id d15-20020a170902b70f00b0019498f0108emr650618pls.13.1673828115168;
        Sun, 15 Jan 2023 16:15:15 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902eb8b00b00189c93ce5easm17882181plg.166.2023.01.15.16.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 16:15:14 -0800 (PST)
Date:   Mon, 16 Jan 2023 08:15:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 10/16] core: provide
 gpiod_line_config_set_output_values()
Message-ID: <Y8SXDmyq4kp8iRoX@sol>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-11-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-11-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2023 at 10:52:04PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Currently if user wants to use the same settings for a set of requested
> lines with the exception of the output value - they need to go through
> hoops by updating the line settings object and adding it one by one to
> the line config. Provide a helper function that allows to set a global
> list of output values that override the settings. For details on the
> interface: see documentation in this commit.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/gpiod.h            | 27 +++++++++++++++
>  lib/line-config.c          | 60 +++++++++++++++++++++++++++++++---
>  tests/gpiod-test-helpers.h | 10 ++++++
>  tests/tests-line-config.c  | 67 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 160 insertions(+), 4 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 8cede47..c552135 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -785,6 +785,33 @@ struct gpiod_line_settings *
>  gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
>  				    unsigned int offset);
>  
> +/**
> + * @brief Set output values for a number of lines.
> + * @param config Line config object.
> + * @param values Buffer containing the output values.
> + * @param num_values Number of values in the buffer.
> + * @return 0 on success, -1 on error.
> + *
> + * This is a helper that allows users to set multiple (potentially different)
> + * output values at once while using the same line settings object. Instead of
> + * modifying the output value in the settings object and calling
> + * ::gpiod_line_config_add_line_settings multiple times, we can specify the
> + * settings, add them for a set of offsets and then call this function to
> + * set the output values.
> + *

A helper such as this did cross my mind when updating gpioset, but I
didn't consider it worth the effort then, and still don't.

So the user has to set ALL output values, or more correctly the first num_values,
right? i.e. it is the block form.

This helper is only helpful if the user already has ALL the values in the
required array format, as is the case for gpioset, else they need to build
the array to pass - in which case they may as well call
gpiod_line_config_add_line_settings() for each line.
So is it really that helpful?

The sparse form would be more generally useful, particularly in the
bindings. i.e. they should accept a mapping from offsets to values rather
than the ordered list.  Though, again, those may be best implemented with
multiple calls to ::gpiod_line_config_add_line_settings rather than
jumping through the hoops of constructing the parameters for another helper
like this one.

> + * Values set by this function override whatever values were specified in the
> + * regular line settings.
> + *
> + * The order of the output values in the array corresponds with the order in
> + * which offsets were added by ::gpiod_line_config_add_line_settings. For
> + * example calling add_settings([1, 3]) and add_settings([2, 4]) and then
> + * calling this function with the following logicall values : [0, 1, 0, 1]
> + * will result in the following offset->value mapping: 1->0, 2->0, 3->1, 4->1.
> + */
> +int gpiod_line_config_set_output_values(struct gpiod_line_config *config,
> +					const enum gpiod_line_value *values,
> +					size_t num_values);
> +

But if you do keep it...

Use documentation from gpiod_line_request_set_values(), suitably modified,
to describe ordering - it is clearer and does not imply that the user has
to independently know the order lines were added - it is in the order
provided by gpiod_line_config_get_offsets().

Cheers,
Kent.

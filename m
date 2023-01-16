Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17B366B4EA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 01:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjAPAPC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Jan 2023 19:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbjAPAPA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Jan 2023 19:15:00 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A248CEC7D
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 16:14:59 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id v23so23780086plo.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jhhkxr6nGDHLhJnhJYRQFZmQoFtVwqIRZEflTyfBdk=;
        b=O0b0eFpD1V8XyTLAGJEVSYBsCjeNdb8cc9BYWW2ggiNBe6ykU7cMrbhAEoPpaNh8pt
         QVW+fBWB9gG7pUWuJ3DWJRUaX7bL9ehpjk1se+PLPrGAcH01leq0mtWRJJ79naciwKbh
         JZ3CnPN59k9M/7hRH1yo++yjA8gfqspAb//YsPJhgOAV5433thHZuU58t8CejRCJWIDf
         0LkUHlqKzpzdXczmGw1Dc8nDy1x6V+Af+ATsFVfavs4ds/l32a0TFLGiTeu4y1LnCe14
         4ILwrVLWq8Nxh4MBUH0kmzmkOF6lf0D90Gt8NkzbcJGAlfAl6CB3fkKDo4kdRJg376+J
         cVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jhhkxr6nGDHLhJnhJYRQFZmQoFtVwqIRZEflTyfBdk=;
        b=OsUTboPN7a+nxNMp7Q/zDZztdhpqBGMQJzC7Jn+W7gJMDqRjHtrt03w7QQNiYOgFkj
         weIjHF9OwOvOLzwT0Uyht771BGbanP67+cp91mB4L0R4YJTf3QxvnTEbXIz/48+lX4G1
         x3/HO6pyi6d3lHXyVLMpvUDdvmWcC5fGU2M+EunBZzFNjGB1tN8OIpWG9sJftxuIcf/9
         yzFCVoVoKSY78mX8D6zNQiVfFS7E+bz2iGdE+ntNL3EPVzgELOBhyJ1QgmgpjVbLnFRg
         uvmrqL1H9jZYXFevrLyl9HJ73Ns/DCD/c5lo27y/qpcQvw1UZwyN8sBPawOBrNXfYyGh
         NyQA==
X-Gm-Message-State: AFqh2kpndT0kLpk/exEFSLPHIdCPWGvX2YckOqrKTNHp8fJl7t9CO4PL
        KgcRD6bIwclPEVtDU6R9lZRQrsIhyncG/g==
X-Google-Smtp-Source: AMrXdXucJKQKnHH6Dm1KQzbu+DrPXtjU5GpBCt3IR1xW8kopurXs/v/zYhRHr4OdXthTKACrX8IoBw==
X-Received: by 2002:a05:6a20:4c85:b0:af:a896:850e with SMTP id fq5-20020a056a204c8500b000afa896850emr95969207pzb.58.1673828099042;
        Sun, 15 Jan 2023 16:14:59 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id b20-20020aa79514000000b0058d91fb2239sm1887752pfp.63.2023.01.15.16.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 16:14:58 -0800 (PST)
Date:   Mon, 16 Jan 2023 08:14:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <Y8SW/frUy16O67Kb@sol>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-5-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2023 at 10:51:58PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We have two functions in the C API that allow users to retrieve a list
> of offsets from objects: gpiod_line_request_get_offsets() and
> gpiod_line_config_get_offsets(). Even though they serve pretty much the
> same purpose, they have different signatures and one of them also
> requires the user to free the memory allocated within the libgpiod
> library with a non-libgpiod free() function.
> 

They differ because they operate in different circumstances.
Requests are immutable, wrt lines/offsets, while configs are not.
More on this below.

> Unify them: make them take the array in which to store offsets and the
> size of this array. Make them return the number of offsets actually
> stored in the array and make them impossible to fail. Change their names
> to be more descriptive and in the case of line_config: add a new function
> that allows users to get the number of configured offsets.
> 

Not sure symmetry => beauty in this case.

> Update the entire tree to use the new interfaces.
> 
> For rust bindings: also unify the line config interface to return a map
> of line settings like C++ bindings do instead of having a function to
> get settings by offset. A map returned from a single call is easier to
> iterate over with a for loop than using an integer and calling the
> previous line_settings() method.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

<snip>
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -780,19 +780,29 @@ struct gpiod_line_settings *
>  gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
>  				    unsigned int offset);
>  
> +/**
> + * @brief Get the number of configured line offsets.
> + * @param config Line config object.
> + * @return Number of offsets for which line settings have been added.
> + */
> +size_t
> +gpiod_line_config_get_num_configured_offsets(struct gpiod_line_config *config);
> +
              ^^^^^^         ^^^^^^^^^^
Not a fan of the stuttering.
What other kinds of lines are there in the config?
Similarly requested lines in the request.

>  /**
>   * @brief Get configured offsets.
>   * @param config Line config object.
> - * @param num_offsets Pointer to a variable in which the number of line offsets
> - *                    will be stored.
> - * @param offsets Pointer to a pointer which will be set to point to an array
> - *                containing the configured offsets. The array will be allocated
> - *                using malloc() and must be freed using free().
> - * @return 0 on success, -1 on failure.
> + * @param offsets Array to store offsets.
> + * @param max_offsets Number of offsets that can be stored in the offsets array.
> + * @return Number of offsets stored in the offsets array.
> + *
> + * If max_offsets is lower than the number of lines actually requested (this
> + * value can be retrieved using ::gpiod_line_config_get_num_configured_offsets),
> + * then only up to max_lines offsets will be stored in offsets.
>   */
> -int gpiod_line_config_get_offsets(struct gpiod_line_config *config,
> -				  size_t *num_offsets,
> -				  unsigned int **offsets);
> +size_t
> +gpiod_line_config_get_configured_offsets(struct gpiod_line_config *config,
> +					 unsigned int *offsets,
> +					 size_t max_offsets);
>  

So, to be sure that they have all the offsets, the user needs to call 
gpiod_line_config_get_num_configured_offsets() before every call to
gpiod_line_config_get_configured_offsets()?
Unless they can be sure no lines have been added subsequently?

Another way of looking at it is that the old API combines those two
functions in one, hence the difference from the request equivalent.
The old way you got them all, no matter what and no questions asked.
That seems simpler to me, so I'm not sure this is a step forward.

Cheers,
Kent.

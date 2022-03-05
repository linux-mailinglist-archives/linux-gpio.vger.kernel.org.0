Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CC54CE32D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Mar 2022 06:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiCEFvi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Mar 2022 00:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiCEFvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Mar 2022 00:51:36 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C6F143460
        for <linux-gpio@vger.kernel.org>; Fri,  4 Mar 2022 21:50:47 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id e6so9234112pgn.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Mar 2022 21:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VetRuunZF7s2ygOaW+yAt2rtXlOHX2MU6GC84hOHtdE=;
        b=H3FSMqrKVjGvuOCNB3QImq/k+Kwcy5C3g/H7kyC2rhbUpQ7/DTwSjIdgjhfLyDJvjv
         Rmcfk/TU3WIAxj/xg4G7/SBtDctFUd/NRwOrTRIrHFmdAhXo8sKWrumfUDp+DL+SERA6
         UMCHH8IzM/54SuAqRc8+1kjILwukXm5tem/GVh0Tx6jDQqibwKY4DdTfPVcWamK3x9+P
         4XH4OYj+oGqwbD/kcRe4HRp9w1Zm/8lrqHUoYG8K24NkVXW3nIanGU/zurZfU4OnQUe/
         B0fajt7coPuWUEWZO0ZX5GtHSqAQ0jB5+uWj4BiQxMDyNd2jqsdU0aDZd2bxZJb966gV
         Fy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VetRuunZF7s2ygOaW+yAt2rtXlOHX2MU6GC84hOHtdE=;
        b=iVWN3gEWakhJJTHjYRIkd+tTo5mBZHtdRDo3FMTObZBvnbS/03mGULT6SsFX3PSKlV
         gKvzPrQcYMCAOipTy0DK4OmwEqFWHQgqWt4DyxJStbNxn48vgk/S9ZJuloY9FGIUVh07
         WzHZdQl3/YHERkYjVHPRI0aNEosEflTOAGPpkr7dRGvqEt/7hUZN7svTm3XTKmFnzAR2
         euxxaXeVhD1Z+QIuZAZXFR0HtGGypfo8vhLAFCUyPD9Gb3PrZVlJReLQDnwRucV9KxNE
         hxzbZLE1eLaV6iAgCL8/WiA/TEWiPuo1KqiIO/AH0vOnTQvC7KppWFEiSCB4BXjuw31/
         C9qg==
X-Gm-Message-State: AOAM533HTRtk6dXzYznL/QSYT1MxZKiu5HEwi+iXjaEliPuC8dhZJG4B
        nmT4D7sYtViKphj54GM8nos1s54vqBN+jA==
X-Google-Smtp-Source: ABdhPJxZwAi4b58inuGWZo9hl/uWMGpMHMv/MxSIXy7l/t8JSFYzmpVfikxmn8LZ+dmM75d4DyQMuQ==
X-Received: by 2002:a63:d74f:0:b0:374:5bda:909d with SMTP id w15-20020a63d74f000000b003745bda909dmr1594745pgi.215.1646459446813;
        Fri, 04 Mar 2022 21:50:46 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79588000000b004e1dc67ead3sm7518847pfj.126.2022.03.04.21.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 21:50:45 -0800 (PST)
Date:   Sat, 5 Mar 2022 13:50:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 1/3] API: add an enum for line values
Message-ID: <20220305055040.GA9638@sol>
References: <20220303091836.168223-1-brgl@bgdev.pl>
 <20220303091836.168223-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303091836.168223-2-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 03, 2022 at 10:18:34AM +0100, Bartosz Golaszewski wrote:
> In order to explicitly stress that line values as understood by libgpiod
> are logical values, expose a two-value enum with values called: ACTIVE
> and INACTIVE that should be used whenever referring to the state of GPIO
> lines.
> 
> The value of INACTIVE is set to 0 while that of ACTIVE to 1 so that users
> can still use integers in C (where no scoped enums exist).
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Works for me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>


> ---
>  include/gpiod.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 074e395..34fdad6 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -185,12 +185,20 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
>  /**
>   * @}
>   *
> - * @defgroup line_settings Line settings
> + * @defgroup line_settings Line definitions
>   * @{
>   *
> - * These defines are used both by gpiod_line_info and gpiod_line_config.
> + * These defines are used across the API.
>   */
>  
> +/**
> + * @brief Logical line state.
> + */
> +enum {
> +	GPIOD_LINE_VALUE_INACTIVE = 0,
> +	GPIOD_LINE_VALUE_ACTIVE = 1,
> +};
> +
>  /**
>   * @brief Direction settings.
>   */
> -- 
> 2.30.1
> 

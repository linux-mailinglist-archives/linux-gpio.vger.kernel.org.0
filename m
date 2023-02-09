Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3886914DC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Feb 2023 00:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjBIXra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Feb 2023 18:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBIXr3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2023 18:47:29 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BEF37F0F
        for <linux-gpio@vger.kernel.org>; Thu,  9 Feb 2023 15:47:28 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id s89-20020a17090a2f6200b0023125ebb4b1so3882886pjd.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Feb 2023 15:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QxET9Yp8cuppZnEs5o3Ww6UE0KLQp1sqSSekmXMh6v4=;
        b=YQkFHBAcFt46nhq17iDNKYIAxYZPNg8cWS90ikL08FD+fxTJGDAIoMHDBR0Ly2H5EK
         wlCz2rwt6kuTbgbfnKtLtBONm6n8YyQeItFg5wmngH4ec/OK+EenStf5Bl2wc/Pi0mpQ
         LcvvLi/odCQqwHhKbRMDR5pPZZ1rFCMk657oNvywk1Rx22BnywIh4WuNkYc7Jm5P1+7h
         usRSA/7J+yN1+M57nvpLd4htn0GWIdJA5hU4dJKDyDfXB1MFYCuRaBRyhs0jsVq9Zrjm
         W8ITUyQ6pYMFOch59yvWjssCEo7lKi8hDk3Vh3R+OBwP3JG+i4DYIFXtRXxaTUKc9RAc
         Q/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxET9Yp8cuppZnEs5o3Ww6UE0KLQp1sqSSekmXMh6v4=;
        b=x1993p9q84hblcMzkvebC+XNi4UMtLpM8aobZaTipr2RPZmcEMNSXgOVs71dOnuFh7
         OrJgEY+G5qCJPrqjZItU7Sjjte8LSEXeMTEUnQa//gF0+ph6E/cCghaiLW2iXUOTbHyA
         XPxUPhS2evBJBay+CmXWldmn9mwd1q8wwwA+VT38BugyNqAuNj3LFE3Iz8OxROBgWFA+
         B3ht8EzJknDRxDUTY+24s71lqGIqBQA/Hw2NgQNgCSUa9Pj6lsngh0IEiccz8QQHBzxT
         WqEqjJiV56L/aVM+655X4GtAsmdEp3WtyQhUGKli9oV0rximT0fxCU1H9V9WmKkfJK4X
         AuDg==
X-Gm-Message-State: AO0yUKWLvwmicQPQWPVPY3rB1ZdYQPbIlxBhi2EhYOx0Izwn6ZSLVfFy
        TsGok4NuFPoK8b8gqk7G7vg=
X-Google-Smtp-Source: AK7set9Ad8KdoE2OYZY9AyksLEEZw7ZrUOTdaQm6evwZZPzqGKGOZCfJX1KxnOBPv4HTzLMNj6R3nw==
X-Received: by 2002:a17:90a:19ce:b0:22c:d44:5669 with SMTP id 14-20020a17090a19ce00b0022c0d445669mr57005pjj.22.1675986447799;
        Thu, 09 Feb 2023 15:47:27 -0800 (PST)
Received: from sol (14-201-52-182.tpgi.com.au. [14.201.52.182])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090a728c00b00230e41e98desm3928607pjg.32.2023.02.09.15.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 15:47:27 -0800 (PST)
Date:   Fri, 10 Feb 2023 07:47:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: use 'unsigned int' instead of 'uint'
Message-ID: <Y+WGCdb7tJOKDQ6u@sol>
References: <20230209185312.635613-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209185312.635613-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 09, 2023 at 07:53:12PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> uint is an old compatibility name that GCC still provides but clang
> doesn't. Use unsigned int instead.
> 
> Fixes: 8ffb6489286f ("tools: line name focussed rework")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tools/tools-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/tools-common.h b/tools/tools-common.h
> index efbeeb8..5d39170 100644
> --- a/tools/tools-common.h
> +++ b/tools/tools-common.h
> @@ -43,7 +43,7 @@ struct resolved_line {
>  	int chip_num;
>  
>  	/* offset of line on chip */
> -	uint offset;
> +	unsigned int offset;
>  
>  	/* line value for gpioget/set */
>  	int value;
> -- 
> 2.37.2
> 

Oops, my bad.

Reviewed-by: Kent Gibson <warthog618@gmail.com>


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58934E444E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 17:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239141AbiCVQic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 12:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239140AbiCVQi2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 12:38:28 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E613403D5
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:37:00 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so2633651pjl.4
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZKrnjoApOUJc24j2RFmEi+ZBalfnrFmD1Hv6iHOYMuA=;
        b=kRz5q8w86kP8PdHwbszQIzXkDo5128BQ7ErpfSOMge6JBThEcW9We/nYyORBsmD5Mh
         5m4VM7nVCwunljZkTDDLdU0Gzz6P8FlkfvnybyKO606zOaLFTa87tNJnrScS/aD8HJMc
         fLllW0SPYUvIw1oHwRGKJGyk31WrfG4emJp4JHYRartq8Ek6fYVBoLvWCNjMtSv/cYKd
         YBSB9DwrN786kjT+H8cuPZq693vJAW6nDw2qz4adQ28HJSypk5Q/mWj/UWvbi3ZohCJa
         Ngv5/Gugsco7Gl0SnynCPMWcEYt5ss2fifADfxKWlU9/PTdI8SOk5t0elvZ68DdPpqJN
         ns1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZKrnjoApOUJc24j2RFmEi+ZBalfnrFmD1Hv6iHOYMuA=;
        b=DP9XLfvobHyOL151mCOQKHmD7iQ9SHdgPwD3bKjoJ4CtwIGxvKcOuTOcz3wcm1cEYk
         KgV4pL9MOHetz+AVOqrggXyI3G39ZWZ3LhlPClfgQyxRhVYHk8BoeUw91NXh8X//SNVu
         H8u7c1pymMzAHQvncm8cEdR2CqC1E3MvlMwdlnx6j+Ls8qnWYge9wSJdjbDb6PkQ1R1P
         q8Vz1Zn+J+UCjTwNJ8zoOFtZ4SBwhe746JAAAesR7+xZWZ/BVlYtWX/RktMiWj8ovQ4+
         9Q9dWBr7u6CSi6gufYmZT7Dq3C4NATxrnV0zuR8pjc8jMKF7TEDGoLF5s9rbtHXQr6RG
         2MlQ==
X-Gm-Message-State: AOAM5318oyT1+K5nvd1iYKIJqzOB35CLrC6J+9FWxTv7oPpmuasxM4a4
        4CiD7IEPG0nxkby7YjqrPrA=
X-Google-Smtp-Source: ABdhPJxtETrJ8aQY5uFJRjVEZGuKlKblVAAQ/J9d1wXAOHyRvJIm6PoSV6hjgbrtvasUqnNsgaOWCQ==
X-Received: by 2002:a17:90b:1a8a:b0:1c5:f707:93a6 with SMTP id ng10-20020a17090b1a8a00b001c5f70793a6mr6037141pjb.110.1647967019556;
        Tue, 22 Mar 2022 09:36:59 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id h2-20020a056a00218200b004f66d50f054sm23321239pfi.158.2022.03.22.09.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 09:36:58 -0700 (PDT)
Date:   Wed, 23 Mar 2022 00:36:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH] API: suffix the time unit to get_timestamp
 functions
Message-ID: <20220322163653.GA179380@sol>
References: <20220322130636.318032-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322130636.318032-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 02:06:36PM +0100, Bartosz Golaszewski wrote:
> In order to make it clear what unit we're using - add the _ns suffix
> to timestamp getters for both the edge and info events.
> 

Makes sense.

A couple of minor tweaks below, but assuming those:

Signed-off-by: Kent Gibson <warthog618@gmail.com>

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  include/gpiod.h          | 4 ++--
>  lib/edge-event.c         | 2 +-
>  lib/info-event.c         | 2 +-
>  tests/tests-edge-event.c | 4 ++--
>  tests/tests-info-event.c | 6 +++---
>  tools/gpiomon.c          | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index eaf6334..c605da8 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -493,7 +493,7 @@ int gpiod_info_event_get_event_type(struct gpiod_info_event *event);
>   * @param event Line status watch event.
>   * @return Timestamp in nanoseconds, read from the monotonic clock.
>   */
> -uint64_t gpiod_info_event_get_timestamp(struct gpiod_info_event *event);
> +uint64_t gpiod_info_event_get_timestamp_ns(struct gpiod_info_event *event);
>  
>  /**
>   * @brief Get the snapshot of line-info associated with the event.
> @@ -1401,7 +1401,7 @@ int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event);
>   * @note The source clock for the timestamp depends on the event_clock
>   *	 setting for the line.
>   */
> -uint64_t gpiod_edge_event_get_timestamp(struct gpiod_edge_event *event);
> +uint64_t gpiod_edge_event_get_timestamp_ns(struct gpiod_edge_event *event);
>  
>  /**
>   * @brief Get the offset of the line which triggered the event.
> diff --git a/lib/edge-event.c b/lib/edge-event.c
> index 661754e..48a0f95 100644
> --- a/lib/edge-event.c
> +++ b/lib/edge-event.c
> @@ -55,7 +55,7 @@ GPIOD_API int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event)
>  }
>  
>  GPIOD_API uint64_t
> -gpiod_edge_event_get_timestamp(struct gpiod_edge_event *event)
> +gpiod_edge_event_get_timestamp_ns(struct gpiod_edge_event *event)
>  {
>  	return event->timestamp;
>  }

Shouldn't that field be timestamp_ns?

> diff --git a/lib/info-event.c b/lib/info-event.c
> index 4abed57..73a3d6d 100644
> --- a/lib/info-event.c
> +++ b/lib/info-event.c
> @@ -67,7 +67,7 @@ GPIOD_API int gpiod_info_event_get_event_type(struct gpiod_info_event *event)
>  }
>  
>  GPIOD_API uint64_t
> -gpiod_info_event_get_timestamp(struct gpiod_info_event *event)
> +gpiod_info_event_get_timestamp_ns(struct gpiod_info_event *event)
>  {
>  	return event->timestamp;
>  }

Ditto.

> diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
> index 28502a8..306383f 100644
> --- a/tests/tests-edge-event.c
> +++ b/tests/tests-edge-event.c
> @@ -145,7 +145,7 @@ GPIOD_TEST_CASE(read_both_events)
>  	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
>  			==, GPIOD_EDGE_EVENT_RISING_EDGE);
>  	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
> -	ts_rising = gpiod_edge_event_get_timestamp(event);
> +	ts_rising = gpiod_edge_event_get_timestamp_ns(event);
>  
>  	/* Second event. */
>  
> @@ -165,7 +165,7 @@ GPIOD_TEST_CASE(read_both_events)
>  	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
>  			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
>  	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
> -	ts_falling = gpiod_edge_event_get_timestamp(event);
> +	ts_falling = gpiod_edge_event_get_timestamp_ns(event);
>  
>  	g_thread_join(thread);
>  
> diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
> index 0640d66..3f18784 100644
> --- a/tests/tests-info-event.c
> +++ b/tests/tests-info-event.c
> @@ -184,9 +184,9 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
>  
>  	g_thread_join(thread);
>  
> -	request_ts = gpiod_info_event_get_timestamp(request_event);
> -	reconfigure_ts = gpiod_info_event_get_timestamp(reconfigure_event);
> -	release_ts = gpiod_info_event_get_timestamp(release_event);
> +	request_ts = gpiod_info_event_get_timestamp_ns(request_event);
> +	reconfigure_ts = gpiod_info_event_get_timestamp_ns(reconfigure_event);
> +	release_ts = gpiod_info_event_get_timestamp_ns(release_event);
>  
>  	g_assert_cmpuint(request_ts, <, reconfigure_ts);
>  	g_assert_cmpuint(reconfigure_ts, <, release_ts);
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index 4769e62..f6a0dba 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -299,7 +299,7 @@ int main(int argc, char **argv)
>  
>  			handle_event(gpiod_edge_event_get_line_offset(event),
>  				     gpiod_edge_event_get_event_type(event),
> -				     gpiod_edge_event_get_timestamp(event),
> +				     gpiod_edge_event_get_timestamp_ns(event),
>  				     &ctx);
>  
>  			events_done++;
> -- 
> 2.30.1
> 

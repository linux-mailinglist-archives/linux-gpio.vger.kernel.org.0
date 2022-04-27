Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33E05110C9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Apr 2022 08:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242834AbiD0GEl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Apr 2022 02:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357949AbiD0GEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Apr 2022 02:04:40 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9344130D
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 23:01:29 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id h1so712018pfv.12
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 23:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qnEoNGKDBv71wdpZOqPnvJSJzKrnL+pYhPKhc9nrjpI=;
        b=bH0c5G1K19mIVcyh/c5lLo1dOxUG5afhdIFIQeIpItMaP78s9k1O9CmCbjZIUtRxW6
         YgHKb3/FpA5lvwHa1qKMr6ZcIg1Z1ujzsxwI3n5fgo17TwDf44pMU3uKe30mMctdWMFN
         Yw3kR+gI7epEOYvJduOgNnL2YzhOxoUJZ5icm22lZJAQxp1S/F/RswuM8o8oqfFHSceo
         SdSjPKR4YYbEitxidNqMEBZuEqhI9Eo8lvieZ4MD3+tYqLNi3jtTHeyEhWMDkOrkb1Cq
         acC/7/s2vd31WS2E/cpRGssJDRhfa1Sw7cXXUGrpm2s1tSmDK5WPNIoFHAHDG/OVP5ZW
         wsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qnEoNGKDBv71wdpZOqPnvJSJzKrnL+pYhPKhc9nrjpI=;
        b=sSj2f8G+STr+/8NLfnBIXznAWA61ZUj2xa/3BtAOedbR6R/LAkItphOPmmtTRsyndR
         Ej/0OmNbJGoIdmYOj/SgzVBFLh83IwxTBGWd3TlWlppWD8UG5okfSsjfoND0XezksBwX
         Jf7Ipvn0EbMZRmIZbp0d8T1BmUgMvvnhvIF1WznjjKQNfPuulZOYgBqu6UQSodYfUqz6
         5fSwyO6O3QdOLGxDB3D6Y6ibeRLHXmbfJ5BFom5/CSiZNgiclq3H/eDHscB33uteF91C
         p/JIkkK5mKrJgtgI6RSRMSLFdGMVK/TPvhhoQMLUgEfL9tI5x88cwbdCTfg1vxA7jNAz
         vWfw==
X-Gm-Message-State: AOAM5330D6+G/SEu5681QhyjHBK+01AJ/T47/R7qE/S4eKiglt+wvXcR
        3gSTSQju7OpC+Sq82MBGMSCsqkNqqhi1mg==
X-Google-Smtp-Source: ABdhPJxC6zt8p2Bck6OnRDYV4JngsyyuTSj6cgfHafHTvnnsVqsbhY2NKaI+SzzxgsXdhYd1+ifCYA==
X-Received: by 2002:a63:1907:0:b0:39d:4f3:6dd8 with SMTP id z7-20020a631907000000b0039d04f36dd8mr22636263pgl.447.1651039289234;
        Tue, 26 Apr 2022 23:01:29 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id h124-20020a62de82000000b0050d3020bda0sm12027693pfg.195.2022.04.26.23.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 23:01:28 -0700 (PDT)
Date:   Wed, 27 Apr 2022 14:01:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH] chip: don't set the request's file
 descriptor to non-blocking
Message-ID: <20220427060123.GA118500@sol>
References: <20220426114850.2593123-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426114850.2593123-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 26, 2022 at 01:48:50PM +0200, Bartosz Golaszewski wrote:
> Make the behavior consistent with the documentation and don't set the
> line request's fd to non-blocking. Add two more test-cases that make
> sure the library behaves correctly.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  lib/chip.c               |  23 --------
>  tests/tests-edge-event.c | 119 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 119 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/chip.c b/lib/chip.c
> index eef3be2..fc3dda2 100644
> --- a/lib/chip.c
> +++ b/lib/chip.c
> @@ -181,23 +181,6 @@ GPIOD_API int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
>  	return -1;
>  }
>  
> -static int set_fd_noblock(int fd)
> -{
> -	int ret, flags;
> -
> -	flags = fcntl(fd, F_GETFL, 0);
> -	if (flags < 0)
> -		return -1;
> -
> -	flags |= O_NONBLOCK;
> -
> -	ret = fcntl(fd, F_SETFL, flags);
> -	if (ret < 0)
> -		return -1;
> -
> -	return 0;
> -}
> -
>  GPIOD_API struct gpiod_line_request *
>  gpiod_chip_request_lines(struct gpiod_chip *chip,
>  			 struct gpiod_request_config *req_cfg,
> @@ -222,12 +205,6 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
>  	if (ret < 0)
>  		return NULL;
>  
> -	ret = set_fd_noblock(uapi_req.fd);
> -	if (ret) {
> -		close(uapi_req.fd);
> -		return NULL;
> -	}
> -
>  	request = gpiod_line_request_from_uapi(&uapi_req);
>  	if (!request) {
>  		close(uapi_req.fd);
> diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
> index 306383f..987155f 100644
> --- a/tests/tests-edge-event.c
> +++ b/tests/tests-edge-event.c
> @@ -357,6 +357,75 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
>  	g_thread_join(thread);
>  }
>  
> +GPIOD_TEST_CASE(read_both_events_blocking)
> +{
> +	/*
> +	 * This time without polling so that the read gets a chance to block
> +	 * and we can make sure it doesn't immediately return an error.
> +	 */
> +
> +	static const guint offset = 2;
> +
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_request) request = NULL;
> +	g_autoptr(GThread) thread = NULL;
> +	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
> +	struct gpiod_edge_event *event;
> +	gint ret;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	req_cfg = gpiod_test_create_request_config_or_fail();
> +	line_cfg = gpiod_test_create_line_config_or_fail();
> +	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
> +
> +	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> +	gpiod_line_config_set_direction_default(line_cfg,
> +						GPIOD_LINE_DIRECTION_INPUT);
> +	gpiod_line_config_set_edge_detection_default(line_cfg,
> +						     GPIOD_LINE_EDGE_BOTH);
> +
> +	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
> +
> +	thread = g_thread_new("request-release",
> +			      falling_and_rising_edge_events, sim);
> +	g_thread_ref(thread);
> +

Not a fan of using usleep in the tests (not shown here but in
falling_and_rising_edge_events()) to get the background thread to
generate events after the main thread is waiting - would prefer to flip
that around so that the background thread blocks, and can be shown to be
blocked, and the main thread generates the events and checks that the
background thread got them, so the handshaking doesn't involve sleeps.

> +	/* First event. */
> +
> +	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
> +	g_assert_cmpint(ret, ==, 1);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
> +	event = gpiod_edge_event_buffer_get_event(buffer, 0);
> +	g_assert_nonnull(event);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
> +			==, GPIOD_EDGE_EVENT_RISING_EDGE);
> +	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
> +
> +	/* Second event. */
> +
> +	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
> +	g_assert_cmpint(ret, ==, 1);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
> +	event = gpiod_edge_event_buffer_get_event(buffer, 0);
> +	g_assert_nonnull(event);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
> +			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
> +	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
> +
> +	g_thread_join(thread);
> +}
> +
>  static gpointer rising_edge_events_on_two_offsets(gpointer data)
>  {
>  	GPIOSimChip *sim = data;
> @@ -488,3 +557,53 @@ GPIOD_TEST_CASE(event_copy)
>  	g_assert_nonnull(copy);
>  	g_assert_true(copy != event);
>  }
> +
> +GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
> +{
> +	static const guint offset = 2;
> +
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_request) request = NULL;
> +	g_autoptr(GThread) thread = NULL;
> +	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
> +	gint ret;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	req_cfg = gpiod_test_create_request_config_or_fail();
> +	line_cfg = gpiod_test_create_line_config_or_fail();
> +	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
> +
> +	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> +	gpiod_line_config_set_direction_default(line_cfg,
> +						GPIOD_LINE_DIRECTION_INPUT);
> +	gpiod_line_config_set_edge_detection_default(line_cfg,
> +						     GPIOD_LINE_EDGE_BOTH);
> +
> +	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
> +
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
> +	g_usleep(500);
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
> +	g_usleep(500);
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
> +	g_usleep(500);
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
> +	g_usleep(500);
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
> +	g_usleep(500);
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
> +	g_usleep(500);
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
> +	g_usleep(500);
> +

What is the sleep waiting for?
Why 500?
Is 1 sufficient?
Is there a critical threshold?
Perhaps that should be incorporated into g_gpiosim_chip_set_pull()?

> +	ret = gpiod_line_request_read_edge_event(request, buffer, 12);
> +	g_assert_cmpint(ret, ==, 7);
> +	gpiod_test_return_if_failed();
> +
> +	ret = gpiod_line_request_wait_edge_event(request, 1000);
> +	g_assert_cmpint(ret, ==, 0);
> +	gpiod_test_return_if_failed();
> +}
> -- 
> 2.32.0
> 

I'm fine with the code change.

As written the tests are probably ok, but to be more robust I would rework
them - arbitrary sleeps in tests are a red flag for me.
That is probably outside the scope of this patch though, and getting the
code change applied is far more important, so...

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.

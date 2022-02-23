Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B884C1023
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 11:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiBWKTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 05:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236593AbiBWKTg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 05:19:36 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AE58BF33
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 02:19:05 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id x11so18180389pll.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 02:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=owIPYdgJ6pP6K6vPu3oTHJWbhdc85K7o1jqilaoYwxA=;
        b=GXoXj4vt6+LRNJ6e5d/TljAKRs3D9e6FeclcHaokh4Ucd5xmJRtWUQHNdATth1jkqw
         VdQmvRmRMffWWP5/qIq9sLnn5rleUlqZZd+ZXxxnGm/0u9GBF2bONAcHvcyQNeTHNYIq
         3oKBlccRv+YGs5TrnsxUcKwUnIPUpbCNl+yQzqvPomGIvsWR7SB5TrAKXNJJx6R+rrjt
         2Dqc9L6AZmDGffjgkRQzN7j63pYB8p7i5YVH5mtsBzhtUMkNfARxqspvVumFQIRZpOTp
         Qafhuf556UUTXGNA6pSJe/WgzIooW/jQdP4PL7HbU9Ol+SrkZf0xIyPBzJ706/V4p24O
         921A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=owIPYdgJ6pP6K6vPu3oTHJWbhdc85K7o1jqilaoYwxA=;
        b=bnNZ6f3qWDyxbD9xBGE5hYmh1aORHGzm0aG28rIE7p29wTgh6A/lVr0YpRK0sGmoYl
         gqXyTz/ZXJx9KrZWkWXwhv1X9UxrOQeNxhJNfQffqk3zbA//4AvkR+eJFoCPZdJCzX2g
         qfESjBwivU6z/qGmxdL9gSyTjN+kyXkznFbSAs8eD8J3/j7+lz0P8wZZrSW1aHTVdqf6
         04GhrR3tA1hR+OuZKLmqUzf8B8Y+ii+svWao9Wq8E5X/S61gizmqYhKDQdtRj2QWLckj
         rLK6BpF5DSiXTGCdoETqeO3dz7bMIoL48qsHYwFS8NYjTdVtTKIrxyHc4zXQiZrUlRkS
         jj5A==
X-Gm-Message-State: AOAM531M5heFlT/9+pOLGEAbor1M8i/R+znAMi+SAgAX24npbLT7UQ6w
        QzWvXUC3ANqzusODqVVYLr0=
X-Google-Smtp-Source: ABdhPJyt08RuAVoveVH/caPzriLzxusXR7MXXgKfw666zdwaSKDkktuz+XiVu8ha33KOJUJsoAjTFg==
X-Received: by 2002:a17:903:11cc:b0:14d:a0d5:76f with SMTP id q12-20020a17090311cc00b0014da0d5076fmr27155335plh.109.1645611544518;
        Wed, 23 Feb 2022 02:19:04 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id oj5sm2248185pjb.29.2022.02.23.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 02:19:03 -0800 (PST)
Date:   Wed, 23 Feb 2022 18:18:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2 2/2] tests: rewrite core C tests using
 libgpiosim
Message-ID: <20220223101857.GA1023391@sol>
References: <20220221154055.654819-1-brgl@bgdev.pl>
 <20220221154055.654819-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221154055.654819-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 21, 2022 at 04:40:55PM +0100, Bartosz Golaszewski wrote:
> This replaces the old tests for the C API v1 based on gpio-mockup with
> a test suite based on gpio-sim that covers around 95% of the libgpiod v2
> codebase.
> 
> The test harness has been rebuilt and shrank significantly as well. The
> libgpiosim API has been wrapped in a gobject interface.
> 

I was having trouble running the tests in a qemu instance where entropy
is slow to collect.  The error I get is

Bail out! gpiod-test-FATAL-ERROR: Unable to instantiate new GPIO device: Resource temporarily unavailable

which I backtracked to the getrandom() call in make_random_dir_at().

I have a dislike for random elements in tests as it negatively impacts
repeatability.  They are only used here for chip and bank names in the
configfs, and otherwise have no bearing on the tests?
Why not deterministic naming, say using the test case name, pid,...


> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  configure.ac                 |    8 +-
>  tests/Makefile.am            |   20 +-
>  tests/gpiod-test-helpers.c   |   49 ++
>  tests/gpiod-test-helpers.h   |  139 +++++
>  tests/gpiod-test-sim.c       |  303 ++++++++++
>  tests/gpiod-test-sim.h       |   42 ++
>  tests/gpiod-test.c           |  233 +-------
>  tests/gpiod-test.h           |   81 +--
>  tests/gpiosim/gpiosim.c      |    1 +
>  tests/mockup/Makefile.am     |   11 -
>  tests/mockup/gpio-mockup.c   |  496 ----------------
>  tests/mockup/gpio-mockup.h   |   36 --
>  tests/tests-chip.c           |  282 ++++-----
>  tests/tests-edge-event.c     |  420 +++++++++++++
>  tests/tests-event.c          |  908 ----------------------------
>  tests/tests-info-event.c     |  301 ++++++++++
>  tests/tests-line-config.c    |  448 ++++++++++++++
>  tests/tests-line-info.c      |  316 ++++++++++
>  tests/tests-line-request.c   |  468 +++++++++++++++
>  tests/tests-line.c           | 1091 ----------------------------------
>  tests/tests-misc.c           |   86 ++-
>  tests/tests-request-config.c |   90 +++
>  22 files changed, 2809 insertions(+), 3020 deletions(-)
>  create mode 100644 tests/gpiod-test-helpers.c
>  create mode 100644 tests/gpiod-test-helpers.h
>  create mode 100644 tests/gpiod-test-sim.c
>  create mode 100644 tests/gpiod-test-sim.h
>  delete mode 100644 tests/mockup/Makefile.am
>  delete mode 100644 tests/mockup/gpio-mockup.c
>  delete mode 100644 tests/mockup/gpio-mockup.h
>  create mode 100644 tests/tests-edge-event.c
>  delete mode 100644 tests/tests-event.c
>  create mode 100644 tests/tests-info-event.c
>  create mode 100644 tests/tests-line-config.c
>  create mode 100644 tests/tests-line-info.c
>  create mode 100644 tests/tests-line-request.c
>  delete mode 100644 tests/tests-line.c
>  create mode 100644 tests/tests-request-config.c
> 

[snip]

> diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
> index aa9eaa4..df546a1 100644
> --- a/tests/gpiod-test.c
> +++ b/tests/gpiod-test.c
> @@ -2,8 +2,6 @@
>  // SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
>  
>  #include <errno.h>
> -#include <glib/gstdio.h>
> -#include <gpiosim.h>
>  #include <linux/version.h>
>  #include <stdio.h>
>  #include <sys/utsname.h>
> @@ -12,28 +10,13 @@
>  #include "gpiod-test.h"
>  
>  #define MIN_KERNEL_MAJOR	5
> -#define MIN_KERNEL_MINOR	10
> +#define MIN_KERNEL_MINOR	16

Might as well bump this to 17 as RCs are available and 16 isn't really
sufficient.  Similarly gpiosim.c.

[snip]

> diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
> new file mode 100644
> index 0000000..8e3fb62
> --- /dev/null
> +++ b/tests/tests-edge-event.c
> @@ -0,0 +1,420 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +#include <glib.h>
> +#include <gpiod.h>
> +
> +#include "gpiod-test.h"
> +#include "gpiod-test-helpers.h"
> +#include "gpiod-test-sim.h"
> +
> +#define GPIOD_TEST_GROUP "edge-event"
> +
> +GPIOD_TEST_CASE(edge_event_buffer_capacity)
> +{
> +	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
> +
> +	buffer = gpiod_test_create_edge_event_buffer_or_fail(32);
> +
> +	g_assert_cmpuint(gpiod_edge_event_buffer_get_capacity(buffer), ==, 32);
> +}
> +
> +GPIOD_TEST_CASE(edge_event_buffer_max_capacity)
> +{
> +	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
> +
> +	buffer = gpiod_test_create_edge_event_buffer_or_fail(16 * 64 * 2);
> +
> +	g_assert_cmpuint(gpiod_edge_event_buffer_get_capacity(buffer),
> +			 ==, 16 * 64);
> +}
> +
> +GPIOD_TEST_CASE(edge_event_wait_timeout)
> +{
> +	static const guint offset = 4;
> +
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_request) request = NULL;
> +	gint ret;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	req_cfg = gpiod_test_create_request_config_or_fail();
> +	line_cfg = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> +	gpiod_line_config_set_edge_detection_default(line_cfg,
> +						     GPIOD_LINE_EDGE_BOTH);
> +
> +	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
> +
> +	ret = gpiod_line_request_edge_event_wait(request, 1000000);
> +	g_assert_cmpint(ret, ==, 0);
> +}
> +
> +GPIOD_TEST_CASE(cannot_request_lines_in_output_mode_with_edge_detection)
> +{
> +	static const guint offset = 4;
> +
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_request) request = NULL;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	req_cfg = gpiod_test_create_request_config_or_fail();
> +	line_cfg = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> +	gpiod_line_config_set_edge_detection_default(line_cfg,
> +						     GPIOD_LINE_EDGE_BOTH);
> +	gpiod_line_config_set_direction_default(line_cfg,
> +						GPIOD_LINE_DIRECTION_OUTPUT);
> +
> +	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
> +	g_assert_null(request);
> +	gpiod_test_expect_errno(EINVAL);
> +}
> +
> +static gpointer falling_and_rising_edge_events(gpointer data)
> +{
> +	GPIOSimChip *sim = data;
> +
> +	g_usleep(50);
> +
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
> +
> +	g_usleep(50);
> +
> +	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
> +
> +	return NULL;
> +}
> +
> +GPIOD_TEST_CASE(read_both_events)
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
> +	struct gpiod_edge_event *event;
> +	guint64 ts_rising, ts_falling;
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

Can you find a more appropraite name than "request-release"?
Cos it doesn't do either.  Maybe "edge-generator"?
(Ah, it is a cut-and-paste from tests-info-events.c)

And perhaps edge_gen rather than thread?

Same elsewhere.

[snip]

> diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
> new file mode 100644
> index 0000000..8129f16
> --- /dev/null
> +++ b/tests/tests-info-event.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +#include <glib.h>
> +#include <gpiod.h>
> +#include <poll.h>
> +
> +#include "gpiod-test.h"
> +#include "gpiod-test-helpers.h"
> +#include "gpiod-test-sim.h"
> +
> +#define GPIOD_TEST_GROUP "info-event"
> +
> +GPIOD_TEST_CASE(watching_info_events_returns_line_info)
> +{
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +
> +	info = gpiod_chip_watch_line_info(chip, 3);
> +	g_assert_nonnull(info);
> +	g_assert_cmpuint(gpiod_line_info_get_offset(info), ==, 3);

Other info fields?

> +}
> +
> +GPIOD_TEST_CASE(try_offset_out_of_range)
> +{
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +
> +	info = gpiod_chip_watch_line_info(chip, 10);
> +	g_assert_null(info);
> +	gpiod_test_expect_errno(EINVAL);
> +}
> +
> +GPIOD_TEST_CASE(event_timeout)
> +{
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +	gint ret;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +
> +	info = gpiod_chip_watch_line_info(chip, 6);
> +	g_assert_nonnull(info);
> +	gpiod_test_return_if_failed();
> +
> +	ret = gpiod_chip_info_event_wait(chip, 100000000);
> +	g_assert_cmpint(ret, ==, 0);
> +}
> +
> +struct request_ctx {
> +	struct gpiod_chip *chip;
> +	struct gpiod_request_config *req_cfg;
> +	struct gpiod_line_config *line_cfg;
> +};
> +
> +static gpointer request_release_line(gpointer data)
> +{
> +	g_autoptr(struct_gpiod_line_request) request = NULL;
> +	struct request_ctx *ctx = data;
> +	gint ret;
> +
> +	g_usleep(50);
> +
> +	request = gpiod_chip_request_lines(ctx->chip,
> +					   ctx->req_cfg, ctx->line_cfg);
> +	g_assert_nonnull(request);
> +	if (g_test_failed())
> +		return NULL;
> +
> +	g_usleep(50);
> +
> +	gpiod_line_config_set_direction_default(ctx->line_cfg,
> +						GPIOD_LINE_DIRECTION_OUTPUT);
> +
> +	ret = gpiod_line_request_reconfigure_lines(request, ctx->line_cfg);
> +	g_assert_cmpint(ret, ==, 0);
> +	if (g_test_failed())
> +		return NULL;
> +
> +	g_usleep(50);
> +
> +	gpiod_line_request_release(request);
> +	request = NULL;
> +
> +	return NULL;
> +}
> +
> +GPIOD_TEST_CASE(request_reconfigure_release_events)
> +{
> +	static const guint offset = 3;
> +
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +	g_autoptr(struct_gpiod_info_event) request_event = NULL;
> +	g_autoptr(struct_gpiod_info_event) reconfigure_event = NULL;
> +	g_autoptr(struct_gpiod_info_event) release_event = NULL;
> +	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> +	g_autoptr(GThread) thread = NULL;
> +	struct gpiod_line_info *request_info, *reconfigure_info, *release_info;
> +	guint64 request_ts, reconfigure_ts, release_ts;
> +	struct request_ctx ctx;
> +	gint ret;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	req_cfg = gpiod_test_create_request_config_or_fail();
> +	line_cfg = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> +
> +	info = gpiod_chip_watch_line_info(chip, 3);
> +	g_assert_nonnull(info);
> +	gpiod_test_return_if_failed();
> +
> +	g_assert_false(gpiod_line_info_is_used(info));
> +
> +	ctx.chip = chip;
> +	ctx.req_cfg = req_cfg;
> +	ctx.line_cfg = line_cfg;
> +
> +	thread = g_thread_new("request-release", request_release_line, &ctx);
> +	g_thread_ref(thread);
> +
> +	ret = gpiod_chip_info_event_wait(chip, 1000000000);
> +	g_assert_cmpint(ret, >, 0);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	request_event = gpiod_chip_info_event_read(chip);
> +	g_assert_nonnull(request_event);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	g_assert_cmpint(gpiod_info_event_get_event_type(request_event), ==,
> +			GPIOD_INFO_EVENT_LINE_REQUESTED);
> +
> +	request_info = gpiod_info_event_get_line_info(request_event);
> +
> +	g_assert_cmpuint(gpiod_line_info_get_offset(request_info), ==, 3);
> +	g_assert_true(gpiod_line_info_is_used(request_info));
> +	g_assert_cmpint(gpiod_line_info_get_direction(request_info), ==,
> +			GPIOD_LINE_DIRECTION_INPUT);
> +
> +	ret = gpiod_chip_info_event_wait(chip, 1000000000);
> +	g_assert_cmpint(ret, >, 0);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	reconfigure_event = gpiod_chip_info_event_read(chip);
> +	g_assert_nonnull(reconfigure_event);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	g_assert_cmpint(gpiod_info_event_get_event_type(reconfigure_event), ==,
> +			GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED);
> +
> +	reconfigure_info = gpiod_info_event_get_line_info(reconfigure_event);
> +
> +	g_assert_cmpuint(gpiod_line_info_get_offset(reconfigure_info), ==, 3);
> +	g_assert_true(gpiod_line_info_is_used(reconfigure_info));
> +	g_assert_cmpint(gpiod_line_info_get_direction(reconfigure_info), ==,
> +			GPIOD_LINE_DIRECTION_OUTPUT);
> +
> +	ret = gpiod_chip_info_event_wait(chip, 1000000000);
> +	g_assert_cmpint(ret, >, 0);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	release_event = gpiod_chip_info_event_read(chip);
> +	g_assert_nonnull(release_event);
> +	gpiod_test_join_thread_and_return_if_failed(thread);
> +
> +	g_assert_cmpint(gpiod_info_event_get_event_type(release_event), ==,
> +			GPIOD_INFO_EVENT_LINE_RELEASED);
> +
> +	release_info = gpiod_info_event_get_line_info(release_event);
> +
> +	g_assert_cmpuint(gpiod_line_info_get_offset(release_info), ==, 3);
> +	g_assert_false(gpiod_line_info_is_used(release_info));
> +
> +	g_thread_join(thread);
> +
> +	request_ts = gpiod_info_event_get_timestamp(request_event);
> +	reconfigure_ts = gpiod_info_event_get_timestamp(reconfigure_event);
> +	release_ts = gpiod_info_event_get_timestamp(release_event);
> +
> +	g_assert_cmpuint(request_ts, <, reconfigure_ts);
> +	g_assert_cmpuint(reconfigure_ts, <, release_ts);
> +}

Is multi-threading really necessary here (and elsewhere, but this the
first case where the secondary thread is ALSO asserting)?
Couldn't you provide the stimulous and check the result from the one
thread?

[snip]

> +++ b/tests/tests-line-config.c
> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +#include <errno.h>
> +#include <glib.h>
> +#include <gpiod.h>
> +#include <stdint.h>
> +
> +#include "gpiod-test.h"
> +#include "gpiod-test-helpers.h"
> +#include "gpiod-test-sim.h"
> +
> +#define GPIOD_TEST_GROUP "line-config"
> +
> +GPIOD_TEST_CASE(default_config)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
> +			GPIOD_LINE_DIRECTION_AS_IS);
> +	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
> +			==, GPIOD_LINE_EDGE_NONE);
> +	g_assert_cmpint(gpiod_line_config_get_bias_default(config), ==,
> +			GPIOD_LINE_BIAS_AS_IS);
> +	g_assert_cmpint(gpiod_line_config_get_drive_default(config), ==,
> +			GPIOD_LINE_DRIVE_PUSH_PULL);
> +	g_assert_false(gpiod_line_config_get_active_low_default(config));
> +	g_assert_cmpuint(
> +		gpiod_line_config_get_debounce_period_us_default(config), ==,
> +		0);
> +	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config), ==,
> +			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
> +	g_assert_cmpint(gpiod_line_config_get_output_value_default(config), ==,
> +			0);
> +	g_assert_cmpuint(gpiod_line_config_get_num_overridden_offsets(config),
> +			 ==, 0);
> +}
> +
> +GPIOD_TEST_CASE(defaults_are_used_for_non_overridden_offsets)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 4), ==,
> +			GPIOD_LINE_DIRECTION_AS_IS);
> +	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 4),
> +			==, GPIOD_LINE_EDGE_NONE);
> +	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 4), ==,
> +			GPIOD_LINE_BIAS_AS_IS);
> +	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 4), ==,
> +			GPIOD_LINE_DRIVE_PUSH_PULL);
> +	g_assert_false(gpiod_line_config_get_active_low_offset(config, 4));
> +	g_assert_cmpuint(
> +		gpiod_line_config_get_debounce_period_us_offset(config, 4), ==,
> +		0);
> +	g_assert_cmpint(gpiod_line_config_get_event_clock_offset(config, 4),
> +			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
> +	g_assert_cmpint(gpiod_line_config_get_output_value_offset(config, 4),
> +			==, 0);
> +	g_assert_cmpuint(gpiod_line_config_get_num_overridden_offsets(config),
> +			 ==, 0);
> +}
> +
> +GPIOD_TEST_CASE(set_and_clear_direction_override)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
> +			GPIOD_LINE_DIRECTION_AS_IS);
> +	gpiod_line_config_set_direction_override(config,
> +						 GPIOD_LINE_DIRECTION_OUTPUT,
> +						 3);
> +
> +	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
> +			GPIOD_LINE_DIRECTION_AS_IS);
> +	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 3), ==,
> +			GPIOD_LINE_DIRECTION_OUTPUT);
> +	g_assert_true(gpiod_line_config_direction_is_overridden(config, 3));
> +	gpiod_line_config_clear_direction_override(config, 3);
> +	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 3), ==,
> +			GPIOD_LINE_DIRECTION_AS_IS);
> +	g_assert_false(gpiod_line_config_direction_is_overridden(config, 3));
> +}
> +
> +GPIOD_TEST_CASE(invalid_direction)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_line_config_set_direction_default(config, INT32_MAX);
> +	g_assert_cmpint(gpiod_line_config_get_direction_default(config),
> +			==, GPIOD_LINE_DIRECTION_AS_IS);
> +}
> +
> +GPIOD_TEST_CASE(set_and_clear_edge_override)

That should be _edge_detection_ to fit the pattern.

> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
> +			==, GPIOD_LINE_EDGE_NONE);
> +	gpiod_line_config_set_edge_detection_override(config,
> +						GPIOD_LINE_EDGE_FALLING, 3);
> +
> +	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
> +			==, GPIOD_LINE_EDGE_NONE);
> +	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 3),
> +			==, GPIOD_LINE_EDGE_FALLING);
> +	g_assert_true(gpiod_line_config_edge_detection_is_overridden(config,
> +								     3));
> +	gpiod_line_config_clear_edge_detection_override(config, 3);
> +	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 3),
> +			==, GPIOD_LINE_EDGE_NONE);
> +	g_assert_false(gpiod_line_config_edge_detection_is_overridden(config,
> +								      3));
> +}
> +
> +GPIOD_TEST_CASE(invalid_edge)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_line_config_set_edge_detection_default(config, INT32_MAX);
> +	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
> +			==, GPIOD_LINE_EDGE_NONE);
> +}
> +
> +GPIOD_TEST_CASE(set_and_clear_bias_override)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
> +			==, GPIOD_LINE_BIAS_AS_IS);
> +	gpiod_line_config_set_bias_override(config, GPIOD_LINE_BIAS_PULL_UP, 3);
> +
> +	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
> +			==, GPIOD_LINE_BIAS_AS_IS);
> +	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 3),
> +			==, GPIOD_LINE_BIAS_PULL_UP);
> +	g_assert_true(gpiod_line_config_bias_is_overridden(config, 3));
> +	gpiod_line_config_clear_bias_override(config, 3);
> +	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 3),
> +			==, GPIOD_LINE_BIAS_AS_IS);
> +	g_assert_false(gpiod_line_config_bias_is_overridden(config, 3));
> +}
> +

You like to use 3 and 4 for offsets.  Do yopu test 0 somewhere?
Cos it is an edge case (no pun intended).

> +GPIOD_TEST_CASE(invalid_bias)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_line_config_set_bias_default(config, INT32_MAX);
> +	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
> +			==, GPIOD_LINE_BIAS_AS_IS);
> +}
> +
> +GPIOD_TEST_CASE(set_and_clear_drive_override)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
> +			==, GPIOD_LINE_DRIVE_PUSH_PULL);
> +	gpiod_line_config_set_drive_override(config,
> +					     GPIOD_LINE_DRIVE_OPEN_DRAIN, 3);
> +
> +	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
> +			==, GPIOD_LINE_DRIVE_PUSH_PULL);
> +	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 3),
> +			==, GPIOD_LINE_DRIVE_OPEN_DRAIN);
> +	g_assert_true(gpiod_line_config_drive_is_overridden(config, 3));
> +	gpiod_line_config_clear_drive_override(config, 3);
> +	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 3),
> +			==, GPIOD_LINE_DRIVE_PUSH_PULL);
> +	g_assert_false(gpiod_line_config_drive_is_overridden(config, 3));
> +}
> +
> +GPIOD_TEST_CASE(invalid_drive)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_line_config_set_drive_default(config, INT32_MAX);
> +	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
> +			==, GPIOD_LINE_BIAS_AS_IS);
> +}
> +
> +GPIOD_TEST_CASE(set_and_clear_active_low_override)
> +{
> +	g_autoptr(struct_gpiod_line_config) config = NULL;
> +
> +	config = gpiod_test_create_line_config_or_fail();
> +
> +	g_assert_false(gpiod_line_config_get_active_low_default(config));
> +	gpiod_line_config_set_active_low_override(config, true, 3);
> +
> +	g_assert_false(gpiod_line_config_get_active_low_default(config));
> +	g_assert_true(gpiod_line_config_get_active_low_offset(config, 3));
> +	g_assert_true(gpiod_line_config_active_low_is_overridden(config, 3));
> +	gpiod_line_config_clear_active_low_override(config, 3);
> +	g_assert_false(gpiod_line_config_get_active_low_offset(config, 3));
> +	g_assert_false(gpiod_line_config_active_low_is_overridden(config, 3));
> +}
> +
> +GPIOD_TEST_CASE(set_and_clear_debounce_period_override)

I'll let that one slide.

[snip]

> diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
> new file mode 100644
> index 0000000..a2ecc13
> --- /dev/null
> +++ b/tests/tests-line-info.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +
> +#include <errno.h>
> +#include <glib.h>
> +#include <gpiod.h>
> +
> +#include "gpiod-test.h"
> +#include "gpiod-test-helpers.h"
> +#include "gpiod-test-sim.h"
> +
> +#define GPIOD_TEST_GROUP "line-info"
> +
> +GPIOD_TEST_CASE(get_line_info_good)
> +{
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +
> +	info = gpiod_chip_get_line_info(chip, 3);
> +	g_assert_nonnull(info);
> +	g_assert_cmpuint(gpiod_line_info_get_offset(info), ==, 3);
> +}
> +
> +GPIOD_TEST_CASE(get_line_info_offset_out_of_range)
> +{
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +
> +	info = gpiod_chip_get_line_info(chip, 8);
> +	g_assert_null(info);
> +	gpiod_test_expect_errno(EINVAL);
> +}
> +
> +GPIOD_TEST_CASE(line_info_basic_properties)
> +{
> +	static const struct gpiod_test_line_name names[] = {
> +		{ .offset = 1, .name = "foo", },
> +		{ .offset = 2, .name = "bar", },
> +		{ .offset = 4, .name = "baz", },
> +		{ .offset = 5, .name = "xyz", },
> +		{ }
> +	};
> +
> +	static const struct gpiod_test_hog hogs[] = {
> +		{
> +			.offset = 3,
> +			.name = "hog3",
> +			.direction = G_GPIOSIM_HOG_DIR_OUTPUT_HIGH,
> +		},
> +		{
> +			.offset = 4,
> +			.name = "hog4",
> +			.direction = G_GPIOSIM_HOG_DIR_OUTPUT_LOW,
> +		},
> +		{ }
> +	};
> +
> +	g_autoptr(GPIOSimChip) sim = NULL;
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info4 = NULL;
> +	g_autoptr(struct_gpiod_line_info) info6 = NULL;
> +
> +	sim = g_gpiosim_chip_new(
> +			"num-lines", 8,
> +			"line-names", gpiod_test_package_line_names(names),
> +			"hogs", gpiod_test_package_hogs(hogs),
> +			NULL);
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	info4 = gpiod_test_get_line_info_or_fail(chip, 4);
> +	info6 = gpiod_test_get_line_info_or_fail(chip, 6);
> +
> +	g_assert_cmpuint(gpiod_line_info_get_offset(info4), ==, 4);
> +	g_assert_cmpstr(gpiod_line_info_get_name(info4), ==, "baz");
> +	g_assert_cmpstr(gpiod_line_info_get_consumer(info4), ==, "hog4");
> +	g_assert_true(gpiod_line_info_is_used(info4));
> +	g_assert_cmpint(gpiod_line_info_get_direction(info4), ==,
> +			GPIOD_LINE_DIRECTION_OUTPUT);
> +	g_assert_cmpint(gpiod_line_info_get_edge_detection(info4), ==,
> +			GPIOD_LINE_EDGE_NONE);
> +	g_assert_false(gpiod_line_info_is_active_low(info4));
> +	g_assert_cmpint(gpiod_line_info_get_bias(info4), ==,
> +			GPIOD_LINE_BIAS_UNKNOWN);
> +	g_assert_cmpint(gpiod_line_info_get_drive(info4), ==,
> +			GPIOD_LINE_DRIVE_PUSH_PULL);
> +	g_assert_cmpint(gpiod_line_info_get_event_clock(info4), ==,
> +			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
> +	g_assert_false(gpiod_line_info_is_debounced(info4));
> +	g_assert_cmpuint(gpiod_line_info_get_debounce_period_us(info4), ==, 0);
> +}
> +
> +GPIOD_TEST_CASE(copy_line_info)
> +{
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +	g_autoptr(struct_gpiod_line_info) copy = NULL;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	info = gpiod_test_get_line_info_or_fail(chip, 3);
> +
> +	copy = gpiod_line_info_copy(info);
> +	g_assert_nonnull(copy);
> +	g_assert_true(info != copy);
> +}
> +

So the pointers are different.
Are the contents the same?

> +GPIOD_TEST_CASE(active_high)
> +{
> +	static const guint offset = 5;
> +
> +	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> +	g_autoptr(struct_gpiod_chip) chip = NULL;
> +	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> +	g_autoptr(struct_gpiod_line_request) request = NULL;
> +	g_autoptr(struct_gpiod_line_info) info = NULL;
> +
> +	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> +	req_cfg = gpiod_test_create_request_config_or_fail();
> +	line_cfg = gpiod_test_create_line_config_or_fail();
> +
> +	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> +	gpiod_line_config_set_active_low_default(line_cfg, true);
> +
> +	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
> +	info = gpiod_chip_get_line_info(chip, 5);
> +
> +	g_assert_true(gpiod_line_info_is_active_low(info));
> +}
> +
> +GPIOD_TEST_CASE(edge_settings)

_edge_detection_

[snip]

> diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
> new file mode 100644
> index 0000000..b412d7d
> --- /dev/null
> +++ b/tests/tests-line-request.c
> @@ -0,0 +1,468 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> +

Only a couple of minor points for this file:
How about some tests where the offsets are not ordered?
And a few more with len(offsets) != 4.

[snip to end]

Nothing major.

Cheers,
Kent.

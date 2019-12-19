Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BABE12639A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 14:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfLSNfO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 08:35:14 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37889 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSNfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 08:35:14 -0500
Received: by mail-pf1-f194.google.com with SMTP id x185so3273515pfc.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NVRfxbEgLFTvoCx0ZfCbabBZ4zDYahJW1fLwqy/+dv8=;
        b=C6dFwAudCUCLczLIwHe7DYAk4fisoKJzLc3oqJOapoqSOkU1M0Qo+92JdMdYv1mYg/
         +17eON6IBgfv8KUwSeFshWMb9zv4nrE65Gu6wswxf8R55a2IKFuvA4J8PocMZG6xcqa8
         2hep4vDe27Z9uKb7r5I/VGYcYrd5J+/ypX+z9StgULxapmJU2u0x52h0lVbG+89AN0oo
         D/E3nyCOylrxmMJJ77YlMD+ISmppCUuPVrxH9AZsGC9qkwAoerercV37ndXUj2ZQ1x5f
         gnF5nmahYxl1wURagoPQ0ctjiD/LzBVO3KO2oLb0aEF05YfiC9h/hy4cQKhbcSClB6bz
         aIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NVRfxbEgLFTvoCx0ZfCbabBZ4zDYahJW1fLwqy/+dv8=;
        b=OdFjFIWOxJjT244pD2BXnZeH38JKVfg0H7uOVnaPgSzdFHhpK8EqjlZmDukNLFXiYX
         XP0PzHNqHzmKnUkWKtl9TfdJKRD8o8vsZ/HkpKpuAkLycj4IUFluzHLIZRQUfF3hZJsq
         KwHCauqNo40YEP8I8dxuWBAWPY+mouORpDrvlWWUaxok7nPVpw5sMQ5Rh+ztNoG0MpIr
         qNJV4eNHAGeL2RkYA7hQ6/104lx8mzRgHRcmlNOC1h8AAiAhdkTMBJJOJZvTrrK+4vCk
         Qk3ttZ6Y+mMGKhX4YO5yLcK7A0wzJm85gIAvV4kw2pxMzsKpi2xPb1ZcadYs7LJGZXwf
         tUpw==
X-Gm-Message-State: APjAAAVdr/kMpQaNX2Hnoc3bNzBbH6akvxJagXEm3R76VTzlKz78jlvM
        PpC1tjW8Mwkn0D6wyUs4uRbUmr/k
X-Google-Smtp-Source: APXvYqyJ6vQ7Oy9UR+p/lD2qCiTkhSMa/UxNNgWJgFGW3Egacc95XPxbIz1nzt9cSM+7bJWD9Zsm5A==
X-Received: by 2002:a63:28c7:: with SMTP id o190mr8847140pgo.394.1576762513407;
        Thu, 19 Dec 2019 05:35:13 -0800 (PST)
Received: from firefly (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id g26sm561639pfo.130.2019.12.19.05.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 05:35:12 -0800 (PST)
Date:   Thu, 19 Dec 2019 13:35:02 +0000
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH 3/7] tests: event: extend test coverage for
 reading multiple line events at once
Message-ID: <20191219133502.GA12028@firefly>
References: <20191218142449.10957-1-brgl@bgdev.pl>
 <20191218142449.10957-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218142449.10957-4-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 03:24:45PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Add test cases for new helpers allowing users to read multiple events
> at once.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  tests/tests-event.c | 83 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/tests/tests-event.c b/tests/tests-event.c
> index d425d1a..1f4a2eb 100644
> --- a/tests/tests-event.c
> +++ b/tests/tests-event.c
> @@ -552,3 +552,86 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
>  	g_assert_cmpint(ret, ==, -1);
>  	g_assert_cmpint(errno, ==, EINVAL);
>  }
> +
> +GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
> +{
> +	g_autoptr(gpiod_chip_struct) chip = NULL;
> +	struct gpiod_line_event events[3];
> +	struct timespec ts = { 1, 0 };
> +	struct gpiod_line *line;
> +	gint ret;
> +
> +	chip = gpiod_chip_open(gpiod_test_chip_path(0));
> +	g_assert_nonnull(chip);
> +	gpiod_test_return_if_failed();
> +
> +	line = gpiod_chip_get_line(chip, 4);
> +	g_assert_nonnull(line);
> +	gpiod_test_return_if_failed();
> +
> +	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
> +	g_assert_cmpint(ret, ==, 0);
> +
> +	gpiod_test_chip_set_pull(0, 4, 1);
> +	usleep(10000);
> +	gpiod_test_chip_set_pull(0, 4, 0);
> +	usleep(10000);
> +	gpiod_test_chip_set_pull(0, 4, 1);
> +	usleep(10000);
> +

I assume the sleep is to wait for the event to be generated from the
call gpiod_test_chip_set_pull, which is not guaranteed to occur before
the call returns, otherwise you can toggle the line too fast and may
miss events.
Arbitrary sleeps in code, including tests, should be avoided as they
are brittle and obsure what you are actually waiting for.
An alternative in this case is to add a second event fd and wait for
the event to arrive there before continuing.

Kent.

> +	ret = gpiod_line_event_wait(line, &ts);
> +	g_assert_cmpint(ret, ==, 1);
> +
> +	ret = gpiod_line_event_read_multiple(line, events, 3);
> +	g_assert_cmpint(ret, ==, 3);
> +
> +	g_assert_cmpint(events[0].event_type, ==,
> +			GPIOD_LINE_EVENT_RISING_EDGE);
> +	g_assert_cmpint(events[1].event_type, ==,
> +			GPIOD_LINE_EVENT_FALLING_EDGE);
> +	g_assert_cmpint(events[2].event_type, ==,
> +			GPIOD_LINE_EVENT_RISING_EDGE);
> +}
> +
> +GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
> +{
> +	g_autoptr(gpiod_chip_struct) chip = NULL;
> +	struct gpiod_line_event events[3];
> +	struct timespec ts = { 1, 0 };
> +	struct gpiod_line *line;
> +	gint ret, fd;
> +
> +	chip = gpiod_chip_open(gpiod_test_chip_path(0));
> +	g_assert_nonnull(chip);
> +	gpiod_test_return_if_failed();
> +
> +	line = gpiod_chip_get_line(chip, 4);
> +	g_assert_nonnull(line);
> +	gpiod_test_return_if_failed();
> +
> +	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
> +	g_assert_cmpint(ret, ==, 0);
> +
> +	gpiod_test_chip_set_pull(0, 4, 1);
> +	usleep(10000);
> +	gpiod_test_chip_set_pull(0, 4, 0);
> +	usleep(10000);
> +	gpiod_test_chip_set_pull(0, 4, 1);
> +	usleep(10000);
> +
> +	ret = gpiod_line_event_wait(line, &ts);
> +	g_assert_cmpint(ret, ==, 1);
> +
> +	fd = gpiod_line_event_get_fd(line);
> +	g_assert_cmpint(fd, >=, 0);
> +
> +	ret = gpiod_line_event_read_fd_multiple(fd, events, 3);
> +	g_assert_cmpint(ret, ==, 3);
> +
> +	g_assert_cmpint(events[0].event_type, ==,
> +			GPIOD_LINE_EVENT_RISING_EDGE);
> +	g_assert_cmpint(events[1].event_type, ==,
> +			GPIOD_LINE_EVENT_FALLING_EDGE);
> +	g_assert_cmpint(events[2].event_type, ==,
> +			GPIOD_LINE_EVENT_RISING_EDGE);
> +}
> -- 
> 2.23.0
> 

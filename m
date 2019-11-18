Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB631006CD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfKRNv3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:51:29 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41922 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfKRNv3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 08:51:29 -0500
Received: by mail-ot1-f67.google.com with SMTP id 94so14519831oty.8
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 05:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z/7Ftz33svY8teJ/KQqMwD3Aw90EY+ocarvNjCXIwPA=;
        b=LqOlFhOj4muqEFDHlFBtacUAwBMtk+bO71TmrXW/+8k6ZH9Cqkp6Ccc7NThFWG98TW
         +Pwv8lSfOwMA1oOFhuMuwHFnHB687mWHUkROk/PyylQtqYq2ZNLH77riGsEw1xiD5u7m
         WN0YC/XJbj1tS2wOBWsqY85y/+meByzksZOWoZnMyE0GAsX7mVujqkVkpCHN7oWDGZZL
         sPwD+yeRyJdta3GLZ+07AG35a1IqILOs1kQtKNvGgd/c+QrO6ulGxLnR8L7FOKgrodgE
         VTuywyInpMgalOPtBQe3D/YmlH5BZ6h6t0Va6bYjs+LCLIo5+h3aIX+zeudMX1Ulbqcd
         /Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z/7Ftz33svY8teJ/KQqMwD3Aw90EY+ocarvNjCXIwPA=;
        b=gLSXplqYq+tXqNHD6oLtcC4yBBlw5HzwnAStJxJQ79/VuazYDbal+kEBHYGECtCGGV
         sA5uUtOd1NWmn9fWCJy52mwWtzvH1cWY9tCX+D9zmdY8OH8zTZxFkmDbHv3J7H33Jt85
         bQEAuCk5YIdzA9yMxGhPm+wL7Trke2xfCqa7BSUZgrmVxFZOQycgdiXU/v36ZjKCBwXP
         1DWGEeaL9bWBkCTjD4nSw9BqOJ3ANUy0OKEFITZk56K1gNvWi8tjyNnFOdghn8ouHBHg
         rd8WKw86W+c41RCAXw4Q5nay8xJ4NN8i8CUdeONAjwLNbM4P36RSUA5/iR6GxLLtBKcE
         /Wog==
X-Gm-Message-State: APjAAAXq6p/Ak7CQMSpx4h4rIP+A9ZammybpHm4EWpfCXbpu46Mx7Kch
        RJ7ycwJHCWDU5bgVMXplnWmgp4HJyZ/fH4SqsCxasw==
X-Google-Smtp-Source: APXvYqy8aNPWXGwwEnikbkd1XFNhJI96hKktJ1fJ9ouulP46aljlFaHIa3PQY9TxEbclmJP5LnUWP8rvGQPyQpBKf48=
X-Received: by 2002:a05:6830:453:: with SMTP id d19mr11365797otc.256.1574085088169;
 Mon, 18 Nov 2019 05:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-5-warthog618@gmail.com>
In-Reply-To: <20191115144355.975-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 14:51:17 +0100
Message-ID: <CAMpxmJUcRumOCTq2uWqt2=W2Fn6fW4s9h6QZ=BhQAMiuVWzjaQ@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 04/19] tests: add tests for bias flags
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Extend test coverage over the bias flags, gpiod_line_bias and the extende=
d
> ctxless functions.
>
> Also update existing tests to check bias flags where line state is checke=
d.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tests/tests-ctxless.c |  64 +++++++++++++++++++++-
>  tests/tests-event.c   | 120 ++++++++++++++++++++++++++++++++++++++++++
>  tests/tests-line.c    |  98 ++++++++++++++++++++++++++++++++++
>  3 files changed, 280 insertions(+), 2 deletions(-)
>
> diff --git a/tests/tests-ctxless.c b/tests/tests-ctxless.c
> index c1e1ca6..da70587 100644
> --- a/tests/tests-ctxless.c
> +++ b/tests/tests-ctxless.c
> @@ -26,11 +26,41 @@ GPIOD_TEST_CASE(get_value, 0, { 8 })
>         g_assert_cmpint(ret, =3D=3D, 1);
>  }
>
> -static void set_value_check(gpointer data G_GNUC_UNUSED)
> +GPIOD_TEST_CASE(get_value_ext, 0, { 8 })
> +{
> +       gint ret;
> +
> +       ret =3D gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> +                               false, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN,
> +                               GPIOD_TEST_CONSUMER);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       ret =3D gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> +                               false, GPIOD_CTXLESS_FLAG_BIAS_PULL_UP,
> +                               GPIOD_TEST_CONSUMER);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> +                               true, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN,
> +                               GPIOD_TEST_CONSUMER);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> +                               true, GPIOD_CTXLESS_FLAG_BIAS_PULL_UP,
> +                               GPIOD_TEST_CONSUMER);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +}
> +
> +static void set_value_check_hi(gpointer data G_GNUC_UNUSED)
>  {
>         g_assert_cmpint(gpiod_test_chip_get_value(0, 3), =3D=3D, 1);
>  }
>
> +static void set_value_check_lo(gpointer data G_GNUC_UNUSED)
> +{
> +       g_assert_cmpint(gpiod_test_chip_get_value(0, 3), =3D=3D, 0);
> +}
> +
>  GPIOD_TEST_CASE(set_value, 0, { 8 })
>  {
>         gint ret;
> @@ -39,13 +69,43 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
>
>         ret =3D gpiod_ctxless_set_value(gpiod_test_chip_name(0), 3, 1,
>                                       false, GPIOD_TEST_CONSUMER,
> -                                     set_value_check, NULL);
> +                                     set_value_check_hi, NULL);
>         gpiod_test_return_if_failed();
>         g_assert_cmpint(ret, =3D=3D, 0);
>
>         g_assert_cmpint(gpiod_test_chip_get_value(0, 3), =3D=3D, 0);
>  }
>
> +GPIOD_TEST_CASE(set_value_ext, 0, { 8 })
> +{
> +       gint ret;
> +
> +       gpiod_test_chip_set_pull(0, 3, 0);
> +
> +       ret =3D gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1=
,
> +                       false, 0, GPIOD_TEST_CONSUMER,
> +                       set_value_check_hi, NULL);
> +       gpiod_test_return_if_failed();
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +       g_assert_cmpint(gpiod_test_chip_get_value(0, 3), =3D=3D, 0);
> +
> +       // test drive flags by checking that sets are caught by emulation

Nit: don't use C++ comments in libgpiod.

Bart



> +       ret =3D gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1=
,
> +                       false, GPIOD_CTXLESS_FLAG_OPEN_DRAIN,
> +                       GPIOD_TEST_CONSUMER, set_value_check_lo, NULL);
> +       gpiod_test_return_if_failed();
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +       g_assert_cmpint(gpiod_test_chip_get_value(0, 3), =3D=3D, 0);
> +
> +       gpiod_test_chip_set_pull(0, 3, 1);
> +       ret =3D gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 0=
,
> +                       false, GPIOD_CTXLESS_FLAG_OPEN_SOURCE,
> +                       GPIOD_TEST_CONSUMER, set_value_check_hi, NULL);
> +       gpiod_test_return_if_failed();
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +       g_assert_cmpint(gpiod_test_chip_get_value(0, 3), =3D=3D, 1);
> +}
> +
>  static const guint get_value_multiple_offsets[] =3D {
>         1, 3, 4, 5, 6, 7, 8, 9, 13, 14
>  };
> diff --git a/tests/tests-event.c b/tests/tests-event.c
> index 28b77ec..d425d1a 100644
> --- a/tests/tests-event.c
> +++ b/tests/tests-event.c
> @@ -196,6 +196,126 @@ GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
>         g_assert_cmpint(ev.event_type, =3D=3D, GPIOD_LINE_EVENT_RISING_ED=
GE);
>  }
>
> +GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
> +{
> +       g_autoptr(GpiodTestEventThread) ev_thread =3D NULL;
> +       g_autoptr(gpiod_chip_struct) chip =3D NULL;
> +       struct timespec ts =3D { 1, 0 };
> +       struct gpiod_line_event ev;
> +       struct gpiod_line *line;
> +       gint ret;
> +
> +       chip =3D gpiod_chip_open(gpiod_test_chip_path(0));
> +       g_assert_nonnull(chip);
> +       gpiod_test_return_if_failed();
> +
> +       line =3D gpiod_chip_get_line(chip, 7);
> +       g_assert_nonnull(line);
> +       gpiod_test_return_if_failed();
> +
> +       ret =3D gpiod_line_request_both_edges_events_flags(line,
> +               GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE=
);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       ev_thread =3D gpiod_test_start_event_thread(0, 7, 100);
> +
> +       ret =3D gpiod_line_event_wait(line, &ts);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_line_event_read(line, &ev);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_cmpint(ev.event_type, =3D=3D, GPIOD_LINE_EVENT_RISING_ED=
GE);
> +
> +       ret =3D gpiod_line_event_wait(line, &ts);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_line_event_read(line, &ev);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_cmpint(ev.event_type, =3D=3D, GPIOD_LINE_EVENT_FALLING_E=
DGE);
> +}
> +
> +GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
> +{
> +       g_autoptr(GpiodTestEventThread) ev_thread =3D NULL;
> +       g_autoptr(gpiod_chip_struct) chip =3D NULL;
> +       struct timespec ts =3D { 1, 0 };
> +       struct gpiod_line_event ev;
> +       struct gpiod_line *line;
> +       gint ret;
> +
> +       chip =3D gpiod_chip_open(gpiod_test_chip_path(0));
> +       g_assert_nonnull(chip);
> +       gpiod_test_return_if_failed();
> +
> +       line =3D gpiod_chip_get_line(chip, 7);
> +       g_assert_nonnull(line);
> +       gpiod_test_return_if_failed();
> +
> +       ret =3D gpiod_line_request_both_edges_events_flags(line,
> +               GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DO=
WN);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       ev_thread =3D gpiod_test_start_event_thread(0, 7, 100);
> +
> +       ret =3D gpiod_line_event_wait(line, &ts);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_line_event_read(line, &ev);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_cmpint(ev.event_type, =3D=3D, GPIOD_LINE_EVENT_RISING_ED=
GE);
> +
> +       ret =3D gpiod_line_event_wait(line, &ts);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_line_event_read(line, &ev);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_cmpint(ev.event_type, =3D=3D, GPIOD_LINE_EVENT_FALLING_E=
DGE);
> +}
> +
> +GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
> +{
> +       g_autoptr(GpiodTestEventThread) ev_thread =3D NULL;
> +       g_autoptr(gpiod_chip_struct) chip =3D NULL;
> +       struct timespec ts =3D { 1, 0 };
> +       struct gpiod_line_event ev;
> +       struct gpiod_line *line;
> +       gint ret;
> +
> +       chip =3D gpiod_chip_open(gpiod_test_chip_path(0));
> +       g_assert_nonnull(chip);
> +       gpiod_test_return_if_failed();
> +
> +       line =3D gpiod_chip_get_line(chip, 7);
> +       g_assert_nonnull(line);
> +       gpiod_test_return_if_failed();
> +
> +       ret =3D gpiod_line_request_both_edges_events_flags(line,
> +               GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP=
);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       ev_thread =3D gpiod_test_start_event_thread(0, 7, 100);
> +
> +       ret =3D gpiod_line_event_wait(line, &ts);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_line_event_read(line, &ev);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_cmpint(ev.event_type, =3D=3D, GPIOD_LINE_EVENT_FALLING_E=
DGE);
> +
> +       ret =3D gpiod_line_event_wait(line, &ts);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +
> +       ret =3D gpiod_line_event_read(line, &ev);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_cmpint(ev.event_type, =3D=3D, GPIOD_LINE_EVENT_RISING_ED=
GE);
> +}
> +
>  GPIOD_TEST_CASE(falling_edge_active_low, 0, { 8 })
>  {
>         g_autoptr(GpiodTestEventThread) ev_thread =3D NULL;
> diff --git a/tests/tests-line.c b/tests/tests-line.c
> index 4792211..b4bef1a 100644
> --- a/tests/tests-line.c
> +++ b/tests/tests-line.c
> @@ -451,6 +451,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
>         g_assert_false(gpiod_line_is_used(line));
>         g_assert_false(gpiod_line_is_open_drain(line));
>         g_assert_false(gpiod_line_is_open_source(line));
> +       g_assert_cmpint(gpiod_line_bias(line), =3D=3D, GPIOD_LINE_BIAS_AS=
_IS);
>
>         config.request_type =3D GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
>         config.consumer =3D GPIOD_TEST_CONSUMER;
> @@ -462,6 +463,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
>         g_assert_true(gpiod_line_is_used(line));
>         g_assert_true(gpiod_line_is_open_drain(line));
>         g_assert_false(gpiod_line_is_open_source(line));
> +       g_assert_cmpint(gpiod_line_bias(line), =3D=3D, GPIOD_LINE_BIAS_AS=
_IS);
>         g_assert_cmpint(gpiod_line_direction(line), =3D=3D,
>                         GPIOD_LINE_DIRECTION_OUTPUT);
>
> @@ -475,8 +477,11 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
>         g_assert_true(gpiod_line_is_used(line));
>         g_assert_false(gpiod_line_is_open_drain(line));
>         g_assert_true(gpiod_line_is_open_source(line));
> +       g_assert_cmpint(gpiod_line_bias(line), =3D=3D, GPIOD_LINE_BIAS_AS=
_IS);
>         g_assert_cmpint(gpiod_line_direction(line), =3D=3D,
>                         GPIOD_LINE_DIRECTION_OUTPUT);
> +
> +       gpiod_line_release(line);
>  }
>
>  GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
> @@ -510,6 +515,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
>         g_assert_true(gpiod_line_is_used(line));
>         g_assert_true(gpiod_line_is_open_drain(line));
>         g_assert_false(gpiod_line_is_open_source(line));
> +       g_assert_cmpint(gpiod_line_bias(line), =3D=3D, GPIOD_LINE_BIAS_AS=
_IS);
>         g_assert_cmpint(gpiod_line_active_state(line), =3D=3D,
>                         GPIOD_LINE_ACTIVE_STATE_LOW);
>         g_assert_cmpint(gpiod_line_direction(line), =3D=3D,
> @@ -526,8 +532,59 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
>         g_assert_true(gpiod_line_is_used(line));
>         g_assert_false(gpiod_line_is_open_drain(line));
>         g_assert_true(gpiod_line_is_open_source(line));
> +       g_assert_cmpint(gpiod_line_bias(line), =3D=3D, GPIOD_LINE_BIAS_AS=
_IS);
>         g_assert_cmpint(gpiod_line_active_state(line), =3D=3D,
>                         GPIOD_LINE_ACTIVE_STATE_LOW);
> +
> +       gpiod_line_release(line);
> +
> +       /*
> +        * Verify that pull-up/down flags work together
> +        * with active_low.
> +        */
> +
> +       config.request_type =3D GPIOD_LINE_REQUEST_DIRECTION_INPUT;
> +       config.flags =3D GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
> +                      GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
> +
> +       ret =3D gpiod_line_request(line, &config, 0);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_true(gpiod_line_is_used(line));
> +       g_assert_false(gpiod_line_is_open_drain(line));
> +       g_assert_false(gpiod_line_is_open_source(line));
> +       g_assert_cmpint(gpiod_line_bias(line), =3D=3D, GPIOD_LINE_BIAS_PU=
LL_DOWN);
> +       g_assert_cmpint(gpiod_line_active_state(line), =3D=3D,
> +                       GPIOD_LINE_ACTIVE_STATE_LOW);
> +       g_assert_cmpint(gpiod_line_direction(line), =3D=3D,
> +                       GPIOD_LINE_DIRECTION_INPUT);
> +
> +       ret =3D gpiod_line_get_value(line);
> +       g_assert_cmpint(ret, =3D=3D, 1);
> +       g_assert_cmpint(errno, =3D=3D, 0);
> +
> +       gpiod_line_release(line);
> +
> +       config.flags =3D GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP |
> +                      GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
> +
> +       ret =3D gpiod_line_request(line, &config, 0);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +
> +       g_assert_true(gpiod_line_is_used(line));
> +       g_assert_false(gpiod_line_is_open_drain(line));
> +       g_assert_false(gpiod_line_is_open_source(line));
> +       g_assert_cmpint(gpiod_line_bias(line), =3D=3D, GPIOD_LINE_BIAS_PU=
LL_UP);
> +       g_assert_cmpint(gpiod_line_active_state(line), =3D=3D,
> +                       GPIOD_LINE_ACTIVE_STATE_LOW);
> +       g_assert_cmpint(gpiod_line_direction(line), =3D=3D,
> +                       GPIOD_LINE_DIRECTION_INPUT);
> +
> +       ret =3D gpiod_line_get_value(line);
> +       g_assert_cmpint(ret, =3D=3D, 0);
> +       g_assert_cmpint(errno, =3D=3D, 0);
> +
> +       gpiod_line_release(line);
>  }
>
>  GPIOD_TEST_CASE(open_source_open_drain_input_mode, 0, { 8 })
> @@ -576,6 +633,47 @@ GPIOD_TEST_CASE(open_source_open_drain_simultaneousl=
y, 0, { 8 })
>         g_assert_cmpint(errno, =3D=3D, EINVAL);
>  }
>
> +GPIOD_TEST_CASE(multiple_bias_flags, 0, { 8 })
> +{
> +       g_autoptr(gpiod_chip_struct) chip =3D NULL;
> +       struct gpiod_line *line;
> +       gint ret;
> +
> +       chip =3D gpiod_chip_open(gpiod_test_chip_path(0));
> +       g_assert_nonnull(chip);
> +       gpiod_test_return_if_failed();
> +
> +       line =3D gpiod_chip_get_line(chip, 2);
> +       g_assert_nonnull(line);
> +       gpiod_test_return_if_failed();
> +
> +       ret =3D gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_DISA=
BLE |
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL=
_DOWN);
> +       g_assert_cmpint(ret, =3D=3D, -1);
> +       g_assert_cmpint(errno, =3D=3D, EINVAL);
> +
> +       ret =3D gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_DISA=
BLE |
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL=
_UP);
> +       g_assert_cmpint(ret, =3D=3D, -1);
> +       g_assert_cmpint(errno, =3D=3D, EINVAL);
> +
> +       ret =3D gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL=
_DOWN |
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL=
_UP);
> +       g_assert_cmpint(ret, =3D=3D, -1);
> +       g_assert_cmpint(errno, =3D=3D, EINVAL);
> +
> +       ret =3D gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_DISA=
BLE |
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL=
_DOWN |
> +                                       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL=
_UP);
> +       g_assert_cmpint(ret, =3D=3D, -1);
> +       g_assert_cmpint(errno, =3D=3D, EINVAL);
> +}
> +
> +
>  /* Verify that the reference counting of the line fd handle works correc=
tly. */
>  GPIOD_TEST_CASE(release_one_use_another, 0, { 8 })
>  {
> --
> 2.24.0
>

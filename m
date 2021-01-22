Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B3A3001D7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 12:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbhAVLpI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 06:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbhAVLQR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 06:16:17 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3ADC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:15:33 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id d2so2524903edz.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDvxwP3p61QEzTmb8xiGZta7iWRxpBJ2NwYadOstQNk=;
        b=jUY1vLoN9A1Uh56DX4II8kLc3qLE1VVdexBI6vXE4ubgtu12uvnhtjMXhQz+PKfaMy
         lTAoiWxbhfd7GS/qjFeanrAUl42maCYJ++OGxr1oGDih3tAn3fZPyBOrsZlRH4lEhfPi
         0Hqih6wRkcJXWPgBWBYt6smNbryu/BFWVQrx/Yq7JvjhDrTtON7c85HYeKTaAPlega0X
         RB96CCO1D+LZ9Y5cg8lgXCZ3QdxnpNUBGCSILtU3Fw9J439Kry7QJVzXmPhfDIy4cS+M
         0jikvDzq3QVQSU3ut37ipkFsOAvdkLM0ZUTHpmi1Tz3DaIK6D76+WCs9Uqw2HCmfWXDO
         QkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDvxwP3p61QEzTmb8xiGZta7iWRxpBJ2NwYadOstQNk=;
        b=TbS3aFpLjyHsXFeuDKChfBCJPcrvIuXj+W2OYCC12BxACq3AUZMqORcAZY0V0zbD9d
         0qrqzMghYkik9fsdSgeLH3WxmMzpMZRHugtsq/QgtQ95NRQCFs6Oiqdq1x8W6RbwRHma
         h3Wf46xQvLfgTEExLsI/V+OTf3aaRubT3Eix4KJdssRIRfVH/fjFX+KIvEUOAOohOItO
         WGa2WpC5viDEUhEe/h9+GPSTtKsTcSm3DBRC5VsrD4EBqEnikGJrHo0yAVxb1Bu9b+2V
         q5yqUvHqk1XcETafNyl94CCiIaaLbzC8+mzz7AE79vabB61jEpZOZZ1B8PMhwNaKZB9d
         6I/Q==
X-Gm-Message-State: AOAM533p1hLk36xgWv60bqTtvFXx4pxgI1W2LsXlapvu72s+BJOQEaE+
        D8tpE+PBEdUETSGCXXiboCBNII+ZFcltaJm4b4SH9g==
X-Google-Smtp-Source: ABdhPJzIb32lNOiGQ0Vo4AOxWnHzq6STZTOSMQlY4oll1627+OqC4flWBLJRxbIf27bfcSFyXCfOVh9gBNSbun6pYaY=
X-Received: by 2002:aa7:d401:: with SMTP id z1mr2762864edq.213.1611314131739;
 Fri, 22 Jan 2021 03:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com> <20210120214547.89770-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-3-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 12:15:20 +0100
Message-ID: <CAMpxmJXDDeHKD9Zo32R4WD0q_3Ky40F5hkajFvyWPVzkq73khg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] lib/cmdline: Allow get_options() to take 0 to
 validate the input
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Allow get_options() to take 0 as a number of integers parameter to validate
> the input.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  lib/cmdline.c       | 14 +++++++++++---
>  lib/cmdline_kunit.c | 10 +++++++++-
>  2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/lib/cmdline.c b/lib/cmdline.c
> index 2a9ae2143e42..1106a8bcd63e 100644
> --- a/lib/cmdline.c
> +++ b/lib/cmdline.c
> @@ -91,6 +91,9 @@ EXPORT_SYMBOL(get_option);
>   *     full, or when no more numbers can be retrieved from the
>   *     string.
>   *
> + *     When @nints is 0, the function just validates the given @str and
> + *     returns amount of parseable integers as described below.

I'm not a native English speaker but it sounds like this should be
"returns the amount".

> + *
>   *     Returns:
>   *
>   *     The first element is filled by the amount of the collected numbers
> @@ -103,15 +106,20 @@ EXPORT_SYMBOL(get_option);
>
>  char *get_options(const char *str, int nints, int *ints)
>  {
> +       bool validate = nints == 0;

bool validate = (nints == 0) would be clearer IMO.

>         int res, i = 1;
>
> -       while (i < nints) {
> -               res = get_option((char **)&str, ints + i);
> +       while (i < nints || validate) {
> +               int *pint = validate ? ints : ints + i;
> +
> +               res = get_option((char **)&str, pint);
>                 if (res == 0)
>                         break;
>                 if (res == 3) {
> +                       int n = validate ? 0 : nints - i;
>                         int range_nums;
> -                       range_nums = get_range((char **)&str, ints + i, nints - i);
> +
> +                       range_nums = get_range((char **)&str, pint, n);
>                         if (range_nums < 0)
>                                 break;
>                         /*
> diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
> index 74da9ed61779..a6119c164b48 100644
> --- a/lib/cmdline_kunit.c
> +++ b/lib/cmdline_kunit.c
> @@ -109,15 +109,23 @@ static void cmdline_do_one_range_test(struct kunit *test, const char *in,
>  {
>         unsigned int i;
>         int r[16];
> +       int *p;
>
>  #define FMT    "in test %u"
>  #define FMT2   "expected %d numbers, got %d"
>  #define FMT3   "at %d"
>         memset(r, 0, sizeof(r));
>         get_options(in, ARRAY_SIZE(r), r);
> -       KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " " FMT2, n, e[0], r[0]);
> +       KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " (parsed) " FMT2, n, e[0], r[0]);
>         for (i = 1; i < ARRAY_SIZE(r); i++)
>                 KUNIT_EXPECT_EQ_MSG(test, r[i], e[i], FMT " " FMT3, n, i);
> +
> +       memset(r, 0, sizeof(r));
> +       get_options(in, 0, r);
> +       KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " (validated) " FMT2, n, e[0], r[0]);
> +
> +       p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
> +       KUNIT_EXPECT_PTR_EQ_MSG(test, p, (int *)0, FMT " out of bound " FMT3, n, p - r);
>  #undef FMT3
>  #undef FMT2
>  #undef FMT

Same as the other patch - just put the formatting strings into the messages.

Bart

> --
> 2.29.2
>

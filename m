Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0FD300202
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 12:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbhAVLwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 06:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbhAVLMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 06:12:24 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970B6C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:11:43 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a10so7085848ejg.10
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ohfeIb6T1g/LItU2tIorqokyc/lMXRh8pKSHBsSXA/k=;
        b=jXJUmC/3+d0EWsl9S1V6uTc1zE4vNd3iMIMMJV8fW55PgTBZa9TOpoVnba5jObmhSx
         M0ZNzDfCg2rYYcb0h3Imye9gS8J4amqddnuAPlmzqHoj+L9UFAtE32qUoRTDMKklGZ47
         EhH+85CeI5QzFVPM53jCo5aTEVpmXb9cwYtLYKEatzPYV9bkbmw/2RLmCzzY/DIcWNIs
         FHYPF9hP+xY7rmqxWUjQKRkFDjqgls8B/taKDddqbXdKCM9RR76Ps+M0dYgQ0ZqVMg9R
         aSIG5vssxhkhW/jM6lJfmcykyquVRMME9EcN3HkbAAdvFPrZ3jFvmf2GwXNM7ARBMlXL
         ikSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ohfeIb6T1g/LItU2tIorqokyc/lMXRh8pKSHBsSXA/k=;
        b=awuQ7hKq9ESd1mbu+t6ZoKcw0ycEVVziopSZxsL916cZ+ppTyOTgsnomUH2KHxPe13
         pYnS6zHxjymHSLhftKoG0lwfFEqkE4nxpgAvUqT1F81r3PAch7+9JPOf9JNnme+yfRMP
         OIUq0cVDco6AqGZzbWm0qDAjg3d0UyVY2UHYEBNJPnTQgeGwoJoyKXKahvbe7DBUbv7R
         qdWXfXLY5JJePDjZUeVLgHeQwNKsAk4EbEbUbYn+Xn8BXRak3p7etBfkZ7neSRbJPPOs
         zuy8ZMbERXa63KeYFy8v2zh81zgJgEMiWM3tRC9tcEpDNM/Trsnq+dB9cM7NTUEIiV+N
         P3Iw==
X-Gm-Message-State: AOAM533Uult6NBPdVHFE7HThpN8CSs70/GcqlXEnDXCurSVDeLmaQGbQ
        hhuHMaFrXA68+PIlkPbs7rdPHQWya/U+DY7xTpDw4Q==
X-Google-Smtp-Source: ABdhPJx+8cyjOSPL1tc7nHl9sJ3NkCCpib8c5h0HQkGQ8/stAaQAmSsLql1rULjWZoBFb3vWy/h99qtkviGOKMNfKZI=
X-Received: by 2002:a17:906:2617:: with SMTP id h23mr2639428ejc.168.1611313902323;
 Fri, 22 Jan 2021 03:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 12:11:31 +0100
Message-ID: <CAMpxmJXjGf3b=KGxghX=Qpd_rDSFvJWZ12dPOsMRut5kR1OSGQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] lib/cmdline_kunit: add a new test case for get_options()
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
> Add a test case for get_options() which is provided by cmdline.c.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  lib/cmdline_kunit.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
> index 550e7a47fd24..74da9ed61779 100644
> --- a/lib/cmdline_kunit.c
> +++ b/lib/cmdline_kunit.c
> @@ -18,6 +18,26 @@ static const int cmdline_test_values[] = {
>         1, 3, 2, 1, 1, 1, 3, 1,
>  };
>
> +static_assert(ARRAY_SIZE(cmdline_test_strings) == ARRAY_SIZE(cmdline_test_values));
> +
> +static const char *cmdline_test_range_strings[] = {
> +       "-7" , "--7"  , "-1-2"    , "7--9",
> +       "7-" , "-7--9", "7-9,"    , "9-7" ,
> +       "5-a", "a-5"  , "5-8"     , ",8-5",
> +       "+,1", "-,4"  , "-3,0-1,6", "4,-" ,
> +       " +2", " -9"  , "0-1,-3,6", "- 9" ,
> +};
> +
> +static const int cmdline_test_range_values[][16] = {
> +       { 1, -7, }, { 0, -0, }, { 4, -1, 0, +1, 2, }, { 0, 7, },
> +       { 0, +7, }, { 0, -7, }, { 3, +7, 8, +9, 0, }, { 0, 9, },
> +       { 0, +5, }, { 0, -0, }, { 4, +5, 6, +7, 8, }, { 0, 0, },
> +       { 0, +0, }, { 0, -0, }, { 4, -3, 0, +1, 6, }, { 1, 4, },
> +       { 0, +0, }, { 0, -0, }, { 4, +0, 1, -3, 6, }, { 0, 0, },
> +};
> +
> +static_assert(ARRAY_SIZE(cmdline_test_range_strings) == ARRAY_SIZE(cmdline_test_range_values));
> +
>  static void cmdline_do_one_test(struct kunit *test, const char *in, int rc, int offset)
>  {
>         const char *fmt = "Pattern: %s";
> @@ -84,10 +104,42 @@ static void cmdline_test_tail_int(struct kunit *test)
>         } while (++i < ARRAY_SIZE(cmdline_test_strings));
>  }
>
> +static void cmdline_do_one_range_test(struct kunit *test, const char *in,
> +                                     unsigned int n, const int *e)
> +{
> +       unsigned int i;
> +       int r[16];
> +
> +#define FMT    "in test %u"
> +#define FMT2   "expected %d numbers, got %d"
> +#define FMT3   "at %d"
> +       memset(r, 0, sizeof(r));
> +       get_options(in, ARRAY_SIZE(r), r);
> +       KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " " FMT2, n, e[0], r[0]);
> +       for (i = 1; i < ARRAY_SIZE(r); i++)
> +               KUNIT_EXPECT_EQ_MSG(test, r[i], e[i], FMT " " FMT3, n, i);
> +#undef FMT3
> +#undef FMT2
> +#undef FMT

IMO these FMT macros are super confusing, please just use hardcoded
strings because you're not saving any code anyway.

Bart

> +}
> +
> +static void cmdline_test_range(struct kunit *test)
> +{
> +       unsigned int i = 0;
> +
> +       do {
> +               const char *str = cmdline_test_range_strings[i];
> +               const int *e = cmdline_test_range_values[i];
> +
> +               cmdline_do_one_range_test(test, str, i, e);
> +       } while (++i < ARRAY_SIZE(cmdline_test_range_strings));
> +}
> +
>  static struct kunit_case cmdline_test_cases[] = {
>         KUNIT_CASE(cmdline_test_noint),
>         KUNIT_CASE(cmdline_test_lead_int),
>         KUNIT_CASE(cmdline_test_tail_int),
> +       KUNIT_CASE(cmdline_test_range),
>         {}
>  };
>
> --
> 2.29.2
>

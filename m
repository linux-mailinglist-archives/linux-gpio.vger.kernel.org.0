Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E7E100725
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 15:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfKROPD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 09:15:03 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43685 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfKROPC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 09:15:02 -0500
Received: by mail-pg1-f193.google.com with SMTP id b1so216563pgq.10
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 06:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nKMN7njcxxwNTNQDdgizAqN0s9ggsNpt3SNascDwuDw=;
        b=ZVlMAEws0/jqoG/fB5hiHtnJDduGyo1R/fLNfNPYZpwmaGyGJDuZ9ODjortx4Fsu8g
         91QMiwJ+WqrBApfU11FP8KZiyTbuA2KQ8LbN54B4IRS9MVlBTU2x02uPOapWp9swMDjv
         Apct2EsfasxbzhXpoj0fdf+Ej8cYz1BPKjHl6AOU0vJ+gh5W/pH2qIRocGZQ7ncPws7w
         yhKIQ17vX+wMHCi/l2U85AWQXV9N10cSXRAjIUySPdVd/QIlNkp2tYD2ALdM5FMHxFaa
         rPvwWWoA7k93HqQ9MetoqIanZIG1A5x+dL6yMghNqohtXtPpj02ldD7/D2rQmKzzpC5U
         9OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nKMN7njcxxwNTNQDdgizAqN0s9ggsNpt3SNascDwuDw=;
        b=TxvtbDKjHHofIJVIIKRgIgxFMcqUuDgqW1oNli0pBJsQ6QyLIwiuKR1qXbJyz55VKt
         UqP1Cg/Lge3SBUe+bcG/eBFQyCvgFBZiX/jTNqyWM1awsr8B5PiZuliIErALuYT4OvnR
         r2Tbg8Wp+TD3UmLusWA/T1/6xjzJt3bYtQGmbW6YBQxZBC4e8iXjaImC3YfoLw5Ilp0y
         NSyleR149II5fICZAI6sFeM0A4d8ucx0HG4Hi63x8NldC+GJ/ZoefL+II6ePaIieOO6L
         q3VMPZsFSz9Dk+/j631tQe1OOKvGuVPjn9/8brE03gXxViprGiGJuOthXVpw6oBvJMow
         SfBA==
X-Gm-Message-State: APjAAAUh3UQcbQrxogBqmeYqrQnzFtH9tP0MuhFQwLSFbUQA8ZDTPq5N
        JITvPuUwTiwS1XW0tPHWvLaXExnKZXx0Jg==
X-Google-Smtp-Source: APXvYqyul4Psc3P8AND1fENICv3fxd8qFbgUvq+zZJK2ckuGXH1cPs0Vz1MC9Bs4XmV90xtCY9kQBQ==
X-Received: by 2002:a63:5d10:: with SMTP id r16mr33370766pgb.41.1574086500692;
        Mon, 18 Nov 2019 06:15:00 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b9sm22376892pfp.77.2019.11.18.06.14.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:15:00 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:14:55 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 04/19] tests: add tests for bias flags
Message-ID: <20191118141455.GC27359@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-5-warthog618@gmail.com>
 <CAMpxmJUcRumOCTq2uWqt2=W2Fn6fW4s9h6QZ=BhQAMiuVWzjaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUcRumOCTq2uWqt2=W2Fn6fW4s9h6QZ=BhQAMiuVWzjaQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 02:51:17PM +0100, Bartosz Golaszewski wrote:
> pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Extend test coverage over the bias flags, gpiod_line_bias and the extended
> > ctxless functions.
> >
> > Also update existing tests to check bias flags where line state is checked.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  tests/tests-ctxless.c |  64 +++++++++++++++++++++-
> >  tests/tests-event.c   | 120 ++++++++++++++++++++++++++++++++++++++++++
> >  tests/tests-line.c    |  98 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 280 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/tests-ctxless.c b/tests/tests-ctxless.c
> > index c1e1ca6..da70587 100644
> > --- a/tests/tests-ctxless.c
> > +++ b/tests/tests-ctxless.c
> > @@ -26,11 +26,41 @@ GPIOD_TEST_CASE(get_value, 0, { 8 })
> >         g_assert_cmpint(ret, ==, 1);
> >  }
> >
> > -static void set_value_check(gpointer data G_GNUC_UNUSED)
> > +GPIOD_TEST_CASE(get_value_ext, 0, { 8 })
> > +{
> > +       gint ret;
> > +
> > +       ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> > +                               false, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN,
> > +                               GPIOD_TEST_CONSUMER);
> > +       g_assert_cmpint(ret, ==, 0);
> > +
> > +       ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> > +                               false, GPIOD_CTXLESS_FLAG_BIAS_PULL_UP,
> > +                               GPIOD_TEST_CONSUMER);
> > +       g_assert_cmpint(ret, ==, 1);
> > +
> > +       ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> > +                               true, GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN,
> > +                               GPIOD_TEST_CONSUMER);
> > +       g_assert_cmpint(ret, ==, 1);
> > +
> > +       ret = gpiod_ctxless_get_value_ext(gpiod_test_chip_name(0), 3,
> > +                               true, GPIOD_CTXLESS_FLAG_BIAS_PULL_UP,
> > +                               GPIOD_TEST_CONSUMER);
> > +       g_assert_cmpint(ret, ==, 0);
> > +}
> > +
> > +static void set_value_check_hi(gpointer data G_GNUC_UNUSED)
> >  {
> >         g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 1);
> >  }
> >
> > +static void set_value_check_lo(gpointer data G_GNUC_UNUSED)
> > +{
> > +       g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
> > +}
> > +
> >  GPIOD_TEST_CASE(set_value, 0, { 8 })
> >  {
> >         gint ret;
> > @@ -39,13 +69,43 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
> >
> >         ret = gpiod_ctxless_set_value(gpiod_test_chip_name(0), 3, 1,
> >                                       false, GPIOD_TEST_CONSUMER,
> > -                                     set_value_check, NULL);
> > +                                     set_value_check_hi, NULL);
> >         gpiod_test_return_if_failed();
> >         g_assert_cmpint(ret, ==, 0);
> >
> >         g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
> >  }
> >
> > +GPIOD_TEST_CASE(set_value_ext, 0, { 8 })
> > +{
> > +       gint ret;
> > +
> > +       gpiod_test_chip_set_pull(0, 3, 0);
> > +
> > +       ret = gpiod_ctxless_set_value_ext(gpiod_test_chip_name(0), 3, 1,
> > +                       false, 0, GPIOD_TEST_CONSUMER,
> > +                       set_value_check_hi, NULL);
> > +       gpiod_test_return_if_failed();
> > +       g_assert_cmpint(ret, ==, 0);
> > +       g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 0);
> > +
> > +       // test drive flags by checking that sets are caught by emulation
> 
> Nit: don't use C++ comments in libgpiod.
> 

Sorry - old habits.

Kent.


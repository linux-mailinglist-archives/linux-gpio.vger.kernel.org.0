Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED9E3673F7
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 22:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243879AbhDUUEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 16:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242586AbhDUUEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 16:04:52 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48BAC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 13:04:16 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id w23so49495545ejb.9
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 13:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZxQ9Rmg2CRYf990xn/8jN5uRSsvWxDe1bFhlNUC8sC4=;
        b=PsxhZhuP7I7gq+PC2dfO1PfmB7gJpZsv3C6IimwhHbNnJyL3cI5vt2Z8Nt3zY2Eml1
         Xg2r2yj06Cjtd8PLRyvk1eTOV1lKnrHdaEzcSqQnaskNIPP0VTT8zHs/xy1GUraSTYMK
         LB11SciOs9mPFAats0/8cwURwlSAeTppFRbelkL0q6/ztfikONEEZBJGR0avi3U2ZCqp
         NgBCCoJVKbujrLl8/4wyueDedO5ExKawWcYPDCa7j/KvA1tdrbnv606D6jUdxlVpr8Oj
         fBZI0J6A2PavfSPfT/TxGJmHrMU3+G/PjT6HZv54TK2NYDBFcj77q9PoKgJTHsPzlZu/
         L4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZxQ9Rmg2CRYf990xn/8jN5uRSsvWxDe1bFhlNUC8sC4=;
        b=eVYiuv+mkxZuKgTUozhgnPAmKyGzvfVxsJY1MQotQMg1KZ3IgZd+wenFdYABw/jYhf
         QXR+DRY3gwuIw5vYCUahDN6s0IG6DR+UWvQCIUJAKRp6v+SeC6e6ZhH8M0xd2SfNrN5T
         iGgPGiBVH+GY/iUPKTJK+1RGBJORAXvupo1v89Ec3cZd66N1V6DUcMSSVv+2qetu43nN
         wrxxnwiUjUmvbjUlw1sGJxBOBrKdZW8IbKnxn3PjGEs8MHJeUrKghw4kjuv+FcrWxbxp
         luKTETjEtLMSnEB9LH6fOTIWBV1595NX1+VAi1ENEgTds7FFtl20vsyClgYlkrEQ6y3h
         a6ZQ==
X-Gm-Message-State: AOAM531ur55AHuLWWRi18cBhCet3CH+2l0V2inCUi3AfBTPhG0pCS69P
        m7KpNUbFUDkFpRJNX5pE+YC6aiU51e8tGLGQoVXjgA==
X-Google-Smtp-Source: ABdhPJwe2t7hCI+Svu6of8uZUjHKlrf+DVm+5cwXmKfDN3jhWaccJvD2Zgo1MEohPfj09IPUEBnlpdy/gO0+mxo0Zbc=
X-Received: by 2002:a17:906:1d10:: with SMTP id n16mr34009341ejh.445.1619035455312;
 Wed, 21 Apr 2021 13:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210410145157.30718-1-brgl@bgdev.pl> <20210414141534.GA20266@sol>
 <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
 <20210417072326.GA12853@sol> <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
 <20210418034810.GA9261@sol> <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
 <20210419011746.GA4766@sol>
In-Reply-To: <20210419011746.GA4766@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 21 Apr 2021 22:04:04 +0200
Message-ID: <CAMRc=McnJbb50Q_7HjB5mDth0DKtmtmGQaXi9M4qLG4DbpONfQ@mail.gmail.com>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 19, 2021 at 3:17 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip -> long discussion on the libgpiod C API]

Hi Kent,

I was working on the next iteration of the code and I'm struggling
with the implementation of some elements without the concept of
attributes.

So I initially liked the idea of variadic functions but they won't
work for language bindings so that's a no go. On that note: I wanted
to get some inspiration from your go library but your elegant API
makes use of go features (like interfaces) we don't have in C.

The problem we have is basically about implementing primary and
secondary line configuration objects - where the primary contains the
default config for all requested lines and the secondary can override
certain config options (should zeroed values for enumerated types mean
- don't override?) for certain lines.

The basic line config structure (let's call it struct
gpiod_line_config) can be very simple and have the following mutators:

struct gpiod_line_config *cfg = gpiod_line_config_new();

gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_OUTPUT);
gpiod_line_config_set_active_low(cfg, true);

and so on for for drive, bias, edge, debounce, realtime clock.

Output values would be set like this:

unsigned int values[] = { 0, 1, 1, 0 }, num_lines = 4;
gpiod_line_config_set_output_values(cfg, num_lines, values);

One can imagine a simple request with the same config for all lines as:

gpiod_chip_request_lines(chip, req_cfg, line_cfg);

Where req_cfg configures request-specific options, and line_cfg
contains the above line config. I'm still not convinced that
gpiod_request_options is the better name, I think I prefer the
juxtaposition of the two names: line_config and request_config.

Now how do we pass a composite line config with overridden values in C
without interfaces etc.?

One idea I have is to add a new object called struct
gpiod_line_config_ext (for extended) that would take one primary
config and an arbitrary number of secondary configs with the following
example use-case:

struct gpiod_line_config_ext *ext_cfg = gpiod_line_config_ext_new();
unsigned int offsets[] = { 2, 3 };

/* Add the default config for this request. */
gpiod_line_config_ext_set_primary_config(ext_cfg, line_cfg);
/* Add a secondary config for 2 lines with offsets: 2 and 3. */
gpiod_line_config_ext_add_secondary_config(ext_cfg, other_line_cfg, 2, offsets);

gpiod_chip_request_lines_ext(chip, req_cfg, ext_cfg);

Does this make sense? I'm worried about the resource management here.
Who should be responsible for freeing the config structures? Should
the extended config take ownership? Should the user remain
responsible? Back to reference counting for these objects? Is this
even a good idea?

Please let me know what you think, I could use some advice.

Best Regards,
Bartosz

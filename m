Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9DE2ECE13
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbhAGKpz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbhAGKpz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 05:45:55 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B850DC0612F4
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 02:45:14 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x20so13419943lfe.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 02:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6wCexJJdHoflfAAejbO/7iy+Wwgk2ra1VMJTLqKr4Lc=;
        b=P07rAEe4IIceNTHHORSmLM+ffIKYgdULLtlpEzAg/ELfjwGMOSo7LlCNdFj2yuGW8Q
         fuz0D2aS4UGEhRhm+JOxzZbqfC+Rqjf/5SiSzr31oCch+iQ7HufyXLhxlp8e2TjEuhlJ
         EJ3G+RoXjRqNJsUmolOzJBx0XnNhtz0x/DpvQWQ0RPC/77I2LLeXAAQsBJTR+jkXf9DO
         66rM4+4C212cmEOp3ZjpkXYA7KBr5iyaTcfUcXn6/nBQLzD9HZzLC0lG6tqRpyyg9t6v
         AK1PGGI4kYUvjGCPruCDrIGyxidxZc1VMcMcfvGbrQ9+3BukugcNnuGhXbgL89qg4zws
         aopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6wCexJJdHoflfAAejbO/7iy+Wwgk2ra1VMJTLqKr4Lc=;
        b=ssKhiDfwJdppFv2deXl3Aq6Yr4+ao4RLxYf412PAsMNz5m4M9zvTuXDCYGmRr5Ubp6
         C8ngbipoFQw+eygPf7tbNrivBkL6vswcEGjlGpDREJuxWHrmjJzMevDLGqRwh/A71uu2
         n3sYc47TUbBpCbEpO30VHOE9yUB6ozvyHxK5zxK/blf2O5Pm+QdlzTqpZg23BYyv32Me
         lpHNPouKK/jOaSROw5giEx1QYP/Fl5lr/FdF5HonimMQvjWHSFxyNz4dlMkJ07yiBBj1
         kpPoOiZt5aTKVY8dff3GpzuCclRvJabw6TJfb8zMhr8q2oG+QnZjOxUAmkWExMYG5klc
         IyXA==
X-Gm-Message-State: AOAM530rkDtyLsDcswKQGMfSgZn105vIElcHXbnXLedrOnSabfSr9ja0
        hE7rli9awLFMzAJQ9huGpc90UqkQDgA/7+7mbhjWeg==
X-Google-Smtp-Source: ABdhPJwq709Wk4snQ3g4LiIxrAT2O2GZCyz70LqQJaX4p90OkuGM8DhmaVQfcK1+oVnt8oN7sUe1czKDJhQXdbjOrwk=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr3893382lja.200.1610016313301;
 Thu, 07 Jan 2021 02:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com> <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 11:45:02 +0100
Message-ID: <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 11:09 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> I can do it alright. But in the context of user-space I think this
> doesn't really change anything. DT users still can use non-unique
> names and libgpiod still has to account for that if the API is to be
> considered correct. Is this change really useful? How does it affect
> ACPI users that already define non-unique names?

For hardware description instances the problem remains: device tree
line-names and device properties can be non-unique.

What it solves is to enforce unique line names for gpio chips with
the struct gpio_chip .names array set to some names, that each
name in this array must be unique.

This happens for example when two USB FTDI converters
with the same GPIO lines are plugged in. Each chip can have a
"TX" line but it can no longer have two "TX" lines.

Yours,
Linus Walleij

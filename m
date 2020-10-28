Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8A6D29D938
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389476AbgJ1WuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389456AbgJ1Wsp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:48:45 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9CEC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:48:44 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h6so894647lfj.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICbI/UdThJ7VwcdM+R69PEmT9tj+Qod3lfTEpbHHLpc=;
        b=BPr+F0iKjUNJfX5QWDbuTRpNvZ/l8APFnn++eUrY59iDhY83bbHiN/kLrk6Q1EySIw
         QZ2H0NYGI56cTCLKEcLepA2i9F5ZIipMfUe+C09TcoRyAIHRjDrO41xhPrvhTTWc5HwW
         yGUuA2DIMesMjJiqfhRXPuuZNkt7QJT9mNpVWXpygA8m7ab3ddc0mPEo1tir9G3mTbxk
         4jR84FVDHUo4XEbPKe7rHTgcXPv96m7gJzSOuKK6st43nppb8DUU1Otjs/BXNrUs9SX8
         ArZ8mQ0sMbteg+sae68lfonz92FF2cwD8rLph9wAYwjwEBMdrEvRuRVEnj0A3vjWVuLy
         ZC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICbI/UdThJ7VwcdM+R69PEmT9tj+Qod3lfTEpbHHLpc=;
        b=AyD5hWo/YuVKCdtukRm4/xDbeK3VlMm/iAe2uUUt87DWww44x0sPGhPDFOcIVBZcSR
         fgXLUKEBu8ubFoOXCyAXriios0u6uA27YQwIuT5+IMCmDgGTR0dfZKrqdUPH+f32QIea
         ukm0JNGPsTvShu4bF9xuj6ChNJsfqiUmLhM80YrYTW5XkS+RemUI9G8aF2r2a4yuxCop
         Kr0LA/1SoqV/3D6EuDShrdg0U2BOc6y6EppUShXJNRw1laBiHQjxUur7irAvedZAOB12
         O6zI4soIY6mtujL4H5x+2gLzXKGzwy5KFNP9/pYlbB9ZUExkqR8yWPF7NWa7uBaC3J1R
         37QA==
X-Gm-Message-State: AOAM530QSRbqridiAU85XJb7YcCi0QWd3hACh6JVOLdqvbeqZWJ6WWuL
        jmtqr1UW/CwvvvyOiGnjaqf+U0uhdmexxaNvPfWA9ATlJq290Q==
X-Google-Smtp-Source: ABdhPJzJUaMMQZamqfp7s7x24JD6LJQ05fn/YM5TVoAVdEUyxvLdl64KkPnycpYl6rfaAIaNhjqRpi0XpXSRZ+/jICQ=
X-Received: by 2002:a05:6512:3225:: with SMTP id f5mr2822630lfe.441.1603900920062;
 Wed, 28 Oct 2020 09:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201014231158.34117-1-warthog618@gmail.com>
In-Reply-To: <20201014231158.34117-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 17:01:49 +0100
Message-ID: <CACRpkdbTsN6p4n3f9SJrgAjdkzDu2S67rU3tLWwX0X50ekjctQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 1:12 AM Kent Gibson <warthog618@gmail.com> wrote:

> This patch set adds the option to select CLOCK_REALTIME as the source
> clock for line events.
>
> The first patch is the core of the change, while the remaining two update
> the GPIO tools to make use of the new option.
>
> Changes for v2:
>  - change line_event_timestamp() return to u64 to avoid clipping to 32bits
>    on 32bit platforms.
>  - fix the line spacing after line_event_timestamp()

Where are we standing with this patch set? Good to go so
I should just try to merge it?

Yours,
Linus Walleij

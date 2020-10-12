Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819E728BBB0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 17:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389672AbgJLPU5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 11:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389142AbgJLPU4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 11:20:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98DEC0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 08:20:54 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n9so1149633pgt.8
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrbseE77DzSxK0YW+35ZL2IV1eJ0sZQ9NMYvL2AJJ8E=;
        b=bfmjjgwM4CphilL0l5oU/CntYg5I5uvr+B7RhPdm8SPNh/AZvqGKK3JkovljhArXc7
         Cnq5ebXcPld8iOT/HOQylgvApqKrBPjMWIRyJ2vaTJwUjObJYviwhO0Vi99N5A/MbNsK
         DltiNvLpe1qt9p3tLdG9YK6wjEm3LIpCxOhuhi6IuhYRnpIImDX5JGm/C5jFX4lb+FZo
         HjkHhcyNoqpqS4cPQfx7FxUErDHkhtqQgUt82qQGew5c1Dk6bWrgbEmwAQH172CLxkd6
         GCQyg3hWmCTKmRLdkqTOzjYKeDHLL9wKL2fFKAmJT16dPPXnS/m6LiLvjejxZnTo98Oc
         +RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrbseE77DzSxK0YW+35ZL2IV1eJ0sZQ9NMYvL2AJJ8E=;
        b=KTCCCLQtel1jaQ5PcM+WLC4FZOmzuHSod0lfPzdPh4ZndNb1d/yJ3EFGV575qXCGsl
         OCAzfj1Cd4AfCZJ4OAIvQp6sYvIkTA2D5x8lI7siShL4uiUOpsj+6FFiocHkckbeWo/H
         RhgYVyVhzKlfYw+wBe74cwelR2uR1mPC6k04kI0+TiSB+dDlW53BC8zHRXr548PB8OTE
         Fh7kxoftNeVG7srMxDc2RUtVXJmA7yp30mrJ2udmsXgA3kCts37yUhR4R+u4eG3Es3G7
         SIO9sRB86juSvK+qgu6Z1JZStMaApLHxwwwzBmU4LLe7yLSsc0oUIhSolHhHQ20U5Kva
         NbUg==
X-Gm-Message-State: AOAM532kChbG33qYp6QYjX8QkixdApuQWH1aZyIiDFsNYzXvPL5XaA4k
        X5LHOEpAvrkolbXyMP83vVUTSZV6KJ9DGq4MMiKnCo1Wv2WONQ==
X-Google-Smtp-Source: ABdhPJyToPSetb6+wm9Pi+IrbZzMwZZ+kPx5VrJ8cItY3jzPdQA0m2TZCKTRYM+M7QdVMZ7xIn3PO3+Cjn9+fy8A8Mw=
X-Received: by 2002:a05:6a00:22c2:b029:156:543:7c1d with SMTP id
 f2-20020a056a0022c2b029015605437c1dmr6031478pfj.40.1602516054147; Mon, 12 Oct
 2020 08:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
In-Reply-To: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Oct 2020 18:21:43 +0300
Message-ID: <CAHp75VepK2ANCCAJXrn9a8a8E09V-TqutV-7iYR+PEwXjB1Hww@mail.gmail.com>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: Geert as he might give some input to the last paragraphs.
To me, on the shallow glance, it looks fine.

On Mon, Oct 12, 2020 at 6:17 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> Hi!
>
> One of the things I'd like to address in libgpiod v2.0 is excessive
> stack usage with struct gpiod_line_bulk. This structure is pretty big
> right now: it's an array 64 pointers + 4 bytes size. That amounts to
> 260 bytes on 32-bit and 516 bytes on 64-bit architectures
> respectively. It's also used everywhere as all functions dealing with
> single lines eventually end up calling bulk counterparts.
>
> I have some ideas for making this structure smaller and I thought I'd
> run them by you.
>
> The most obvious approach would be to make struct gpiod_line_bulk
> opaque and dynamically allocated. I don't like this idea due to the
> amount of error checking this would involve and also calling malloc()
> on virtually every value read, event poll etc.
>
> Another idea is to use embedded list node structs (see include/list.h
> in the kernel) in struct gpiod_line and chain the lines together with
> struct gpiod_line_bulk containing the list head. That would mean only
> being able to store each line in a single bulk object. This is
> obviously too limiting.
>
> An idea I think it relatively straightforward without completely
> changing the current interface is making struct gpiod_line_bulk look
> something like this:
>
> struct gpiod_line_bulk {
>     unsigned int num_lines;
>     uint64_t lines;
> };
>
> Where lines would be a bitmap with set bits corresponding to offsets
> of lines that are part of this bulk. We'd then provide a function that
> would allow the user to get the line without it being updated (so
> there's no ioctl() call that could fail). The only limit that we'd
> need to introduce here is making it impossible to store lines from
> different chips in a single line bulk object. This doesn't make sense
> anyway so I'm fine with this.
>
> What do you think? Do you have any other ideas?
>
> Best regards,
> Bartosz Golaszewski



-- 
With Best Regards,
Andy Shevchenko

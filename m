Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CEC28BB9F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 17:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389694AbgJLPPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 11:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389498AbgJLPPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 11:15:38 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D42FC0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 08:15:38 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id t25so23643350ejd.13
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=K+zhXAC2xpHOdV0og8J/YlRixfaY+EH57mFBjOxrZpg=;
        b=L+AE2ehEFevyagtBsP+SH/zku8eoOvQJCYh18YgAQXHaoJnHg/alYos5FqMSmJdc2D
         G3IgV44uvHQSOHx0dSKkTJuFxtYpZYoYMPOoMZ9ZHor7k4uRApSvJ3wbyJTwUhNnZj6A
         WIRK0AnEkszExlUPkMNE+ARbfMxawlEfAooRFr9O3FRpheEdEujMVshfJweSau0qnHJI
         BBI95OP6w7LA293/9XFGINgA5Baw5wu4baINFp3ARQIzYt9PikFBWYmqsY8j1wBcFCXA
         YD4j47epuuewOFTRh9Av+tDliqnYzPSBZlLC1saBeH4l9Jr2NV+Z3hDwi8Fq2uMVtCSe
         wZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=K+zhXAC2xpHOdV0og8J/YlRixfaY+EH57mFBjOxrZpg=;
        b=LNrxKx1N8vhqGik8I20ubER63YWtT5n9AWaXAxL16b26F/pk4v1qaBmUdT1oX4PCd9
         Xb7ECNWq++fgnggY5zVvJ3D92donEUcFxuMDRNtVzLn4x5AzMkz0l5Y4OS3rVkgwM/cN
         uxiMtnEJRx2wXELOCVSnU8QzlrLLZSLDiw1Jr/j3sTL4BIl/V048ep2A2d1P1FqMfo0m
         jCKKuL3MgrclKp/W+sYaRgDRbID+t9IogJWrS3P8m2f0Z5C8GogR27iDHqJJdZlI9Xtq
         0w2oVX8Y7RCvjsh69r1u7SDF2XvA3yD2pFUquN+YFfOyJHt120Z3kJveh/L46f1dgjYF
         IIcA==
X-Gm-Message-State: AOAM531ee6nbhzLgcmB/F3Oyo4vFj2rj+fed2s3kadScWdASmMM7wQjM
        W5+O4m988iDfRNktYbyFfY/58NV/es89G58rd8C0cSXsZ+qB7w==
X-Google-Smtp-Source: ABdhPJz0/6e3p1OgTAqLpMTzRV1mmf56lx1iEO0S+FRXJLR5nyWQFC5PUToMUtkPcsfqs46wVPl6U0pYZTT/CanPJ6E=
X-Received: by 2002:a17:906:b285:: with SMTP id q5mr29129980ejz.470.1602515736312;
 Mon, 12 Oct 2020 08:15:36 -0700 (PDT)
MIME-Version: 1.0
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 12 Oct 2020 17:15:25 +0200
Message-ID: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
Subject: [libgpiod] Rethinking struct gpiod_line_bulk
To:     linux-gpio <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

One of the things I'd like to address in libgpiod v2.0 is excessive
stack usage with struct gpiod_line_bulk. This structure is pretty big
right now: it's an array 64 pointers + 4 bytes size. That amounts to
260 bytes on 32-bit and 516 bytes on 64-bit architectures
respectively. It's also used everywhere as all functions dealing with
single lines eventually end up calling bulk counterparts.

I have some ideas for making this structure smaller and I thought I'd
run them by you.

The most obvious approach would be to make struct gpiod_line_bulk
opaque and dynamically allocated. I don't like this idea due to the
amount of error checking this would involve and also calling malloc()
on virtually every value read, event poll etc.

Another idea is to use embedded list node structs (see include/list.h
in the kernel) in struct gpiod_line and chain the lines together with
struct gpiod_line_bulk containing the list head. That would mean only
being able to store each line in a single bulk object. This is
obviously too limiting.

An idea I think it relatively straightforward without completely
changing the current interface is making struct gpiod_line_bulk look
something like this:

struct gpiod_line_bulk {
    unsigned int num_lines;
    uint64_t lines;
};

Where lines would be a bitmap with set bits corresponding to offsets
of lines that are part of this bulk. We'd then provide a function that
would allow the user to get the line without it being updated (so
there's no ioctl() call that could fail). The only limit that we'd
need to introduce here is making it impossible to store lines from
different chips in a single line bulk object. This doesn't make sense
anyway so I'm fine with this.

What do you think? Do you have any other ideas?

Best regards,
Bartosz Golaszewski

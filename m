Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C6E242021
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 21:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgHKTLx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Aug 2020 15:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgHKTLx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2020 15:11:53 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48446C061787
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 12:11:53 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id o2so6514934qvk.6
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pLatoOn79pYJ/DuOSj6cLvAVzQZnxlbGJi91nLHmWxM=;
        b=fbMx3780UeiwoaK7tuSdafEpSCzt2QSHEE1/+ByVUmkAE+hSHgf3oW7Kw9luwn/bGk
         u6kcshS5/siw0+AdKcgPIXz05yzhKR/moxZm+Z53BlEZKybm6wcvZZNOb8yoDcyApwBo
         XNuNqoGVhcajRdB5mIN1cspaFlnL2h2oBAjCV8LKG+CTr1z8rRWsdTo5Axty2xciXgdL
         1rJKcrugyV9FCIxqVf9lrT+uHiWbkp32Y4S8zCNHg++NnG5yjflYqd+nOEpysOGYHfbD
         Xkb7J8MdsmMB8Ccr8Mjm86xw4hmVRa7R7vej56eNeTjX123T6UDvr6lzyhrAhMx1SYdk
         PFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLatoOn79pYJ/DuOSj6cLvAVzQZnxlbGJi91nLHmWxM=;
        b=IURrJsQQ6DXY5c5LC9siJsg4KM41ZDL/EtnM6WxapDmHRyrgV8O8TKtGX/jTpfepPa
         rzvxcXeBCERLE35U31v9Eu4zyUqguBQDAP2U6nSJy8HhZS35x8/s7XhLMs8HN4Y8T/5Z
         sxnPze7koGNa3BEAqGbGfKLsFTLuE6za74bwf+WNbvDTKUHxDDQu7kNgYjxevfxHxixL
         XZRpmzRY9m4filG3QZoEYZwjOirE3DTISEcSq4cAE/E2HhSNZCjLsfgEKC4cVT1czg6r
         TloAnxwHQ8EavX1U2x31W4V1NxIoNL7yYt+7laLPZViyRVLtg6lq9NYzelHFY6/cIQYN
         5iug==
X-Gm-Message-State: AOAM531UBzqW5MkSeK2QslFlK6fn8B5jUQxyLkGGojQW8FDbsmYTBV7i
        wvN2xJ+93a4uJUB70vV5HEUUR3FX7eQY4ErKCYRUwA==
X-Google-Smtp-Source: ABdhPJyXKG5auxbjO/56cTDqtGqYLvRX2FdO9CddQgB4MxuvJmkMvAuxZjB4zO/rAxMf67Lmgq2vQK60FVe0EGnmo8w=
X-Received: by 2002:a0c:ff06:: with SMTP id w6mr2973554qvt.61.1597173112408;
 Tue, 11 Aug 2020 12:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200809132529.264312-1-warthog618@gmail.com> <20200809132529.264312-3-warthog618@gmail.com>
In-Reply-To: <20200809132529.264312-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 11 Aug 2020 21:11:41 +0200
Message-ID: <CAMpxmJWe6Cjhwt3izuPLK-Xzvm=LqOy_nnZ7xg123+M_JgriLw@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] gpio: uapi: define uAPI v2
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 9, 2020 at 3:26 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a new version of the uAPI to address existing 32/64-bit alignment
> issues, add support for debounce and event sequence numbers, allow
> requested lines with different configurations, and provide some future
> proofing by adding padding reserved for future use.
>
> The alignment issue relates to the gpioevent_data, which packs to different
> sizes on 32-bit and 64-bit platforms. That creates problems for 32-bit apps
> running on 64-bit kernels.  uAPI v2 addresses that particular issue, and
> the problem more generally, by adding pad fields that explicitly pad
> structs out to 64-bit boundaries, so they will pack to the same size now,
> and even if some of the reserved padding is used for __u64 fields in the
> future.
>
> The new structs have been analysed with pahole to ensure that they
> are sized as expected and contain no implicit padding.
>
> The lack of future proofing in v1 makes it impossible to, for example,
> add the debounce feature that is included in v2.
> The future proofing is addressed by providing configurable attributes in
> line config and reserved padding in all structs for future features.
> Specifically, the line request, config, info, info_changed and event
> structs receive updated versions and new ioctls.
>
> As the majority of the structs and ioctls were being replaced, it is
> opportune to rework some of the other aspects of the uAPI:
>
> v1 has three different flags fields, each with their own separate
> bit definitions.  In v2 that is collapsed to one - gpio_v2_line_flag.
>
> The handle and event requests are merged into a single request, the line
> request, as the two requests were mostly the same other than the edge
> detection provided by event requests.  As a byproduct, the v2 uAPI allows
> for multiple lines producing edge events on the same line handle.
> This is a new capability as v1 only supports a single line in an event
> request.
>
> As a consequence, there are now only two types of file handle to be
> concerned with, the chip and the line, and it is clearer which ioctls
> apply to which type of handle.
>
> There is also some minor renaming of fields for consistency compared to
> their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> and consumer rather than consumer_label.
>
> Additionally, v1 GPIOHANDLES_MAX becomes GPIO_V2_LINES_MAX in v2 for
> clarity, and the gpiohandle_data __u8 array becomes a bitmap in
> gpio_v2_line_values.
>
> The v2 uAPI is mostly a reorganisation and extension of v1, so userspace
> code, particularly libgpiod, should readily port to it.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

This now looks good for me. Just a small nit below.

Andy: would you mind taking a look as well?

>
> +/*
> + * Maximum number of requested lines.
> + *
> + * Must be no greater than 64 as bitmaps are limited to 64-bits, and a
> + * multiple of 2 to ensure 32/64-bit alignment of structs.
> + */
> +#define GPIO_V2_LINES_MAX 64
> +

If we refer to bitmaps for which helpers are defined in
include/linux/bitmap.h then they're not limited to 64-bits. I'd just
say here that we want to fit into 64-bit integers for simplicity.

[snip]

Bartosz

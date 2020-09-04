Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97EB25D138
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 08:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgIDGXi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 02:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgIDGXg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 02:23:36 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2224C061244
        for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2020 23:23:35 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z22so7059918ejl.7
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2020 23:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odl0w8A6BZ14eaZf5+twGiuKDOnrbmecuN5/Yaz8/oo=;
        b=ojjqpWecE+IkPOW+5SpwYQBRx/yD79nQhyco4r2lFVUCOh5H0Cr1Dy1pX7cgK9H1Pd
         5mHnsrznQJn2cAsFFZKtW3+5Enerr8UtCIOZMgiXA8IU6eq684yTVy+ltW84b8edPuA5
         GWO8i0yNSzT0h7eHggV3bB8dgDPvXI8vQQ4YlVfPc9CaGTwiPn3Sm0neAvs9mcE+qyDW
         B3EwDAt/3KrXYMppj7nL29yd7EtuL+K5exBlB2FVhGDaevmfWq1ELbOZ+YMDxyaP5Ffz
         UVVOCX7SvImAcV9dwVFFsEALtF/0k/buneaxJQAuA2+2vrLCTXk/PeVpB4TlNydmGePz
         kWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odl0w8A6BZ14eaZf5+twGiuKDOnrbmecuN5/Yaz8/oo=;
        b=XbcXJ8ERssBoLXSeNvWYtDXOGQPLM9DIgWGgWPV+/sSVOAHnO/FVLugqJiTu3SFHOm
         aYhI5AYeN0QGAn55HgiXwrJkC4N4tuORBHTbtcVvVCUfUnnkD4p6X8VzCjbh7d0R3WBQ
         WqNvBVwhotVefBgtEitwY5FdnPCzo9p8s1yjKXymX5Zk8IIlK2puQdRaglY6nGFy0VYC
         h12Ose45WCVoszrdXYCpJUc/nfAeZAwME9YIOVpPambVV0Wpd+q9FVx4v1DjEmDp+VxP
         1qXxYlNox0Pe063iuUb9KJLLKjbbwLB6+UR2iVQUdn3PapJg3GKprH2xTU7jwBvNkhfe
         lOxQ==
X-Gm-Message-State: AOAM530MdxlG7NUcEAtCfbPSHULEPBGJdiuFHhbCdW1BuKCCEy8lU/al
        kpOcyzKynbPUvBGdRQ8qTD7N4WPONDjyrBAXlmu/7A==
X-Google-Smtp-Source: ABdhPJwtUpezmosF/ZUdmD9Fxes7PYlkC/TPaY/EWOInsNECB3C8qDH8lwKRAT+ywrv2Mfdorq0AfjvlXJmfpyF0pvA=
X-Received: by 2002:a17:906:11d2:: with SMTP id o18mr5730084eja.420.1599200614214;
 Thu, 03 Sep 2020 23:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200831032006.1019978-1-warthog618@gmail.com> <20200831032006.1019978-5-warthog618@gmail.com>
In-Reply-To: <20200831032006.1019978-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 4 Sep 2020 08:23:23 +0200
Message-ID: <CAMpxmJVmMfND78VqF0cv=WF1PceGvRvWoQpdO6-8XVt84W9Aiw@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] gpio: uapi: define uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
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

[snip]

> +
> +/**
> + * enum gpio_v2_line_flag - &struct gpio_v2_line_attribute.flags values
> + */
> +enum gpio_v2_line_flag {
> +       GPIO_V2_LINE_FLAG_USED                  = 1ULL << 0, /* line is not available for request */
> +       GPIO_V2_LINE_FLAG_ACTIVE_LOW            = 1ULL << 1,
> +       GPIO_V2_LINE_FLAG_INPUT                 = 1ULL << 2,
> +       GPIO_V2_LINE_FLAG_OUTPUT                = 1ULL << 3,
> +       GPIO_V2_LINE_FLAG_EDGE_RISING           = 1ULL << 4,
> +       GPIO_V2_LINE_FLAG_EDGE_FALLING          = 1ULL << 5,
> +       GPIO_V2_LINE_FLAG_OPEN_DRAIN            = 1ULL << 6,
> +       GPIO_V2_LINE_FLAG_OPEN_SOURCE           = 1ULL << 7,
> +       GPIO_V2_LINE_FLAG_BIAS_PULL_UP          = 1ULL << 8,
> +       GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN        = 1ULL << 9,
> +       GPIO_V2_LINE_FLAG_BIAS_DISABLED         = 1ULL << 10,
> +};
> +
>

One more small thing I noticed: the uapi exports _BITULL() macro to
user-space for bit definitions. I think it's worth using it here as
it's more readable than (1ULL << X) IMO.

Bart

[snip]

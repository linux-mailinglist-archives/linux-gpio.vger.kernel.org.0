Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6B2621797
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 16:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233819AbiKHPAX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 10:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbiKHPAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 10:00:21 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A6E13F3E
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 07:00:20 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id s204so9078326vkb.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 07:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F2QrAi/LQ7qBpvMzxLU1SPmaMAR+Dih79qGdKF0xOUM=;
        b=XoL10ntpnL14hLpelSFg61tRXvcm9MKfRPwkD2OFtEjFzDVxkXKuCqzsvylir0UVfu
         P18VvHH4z4eiOMPagBXSegz6ITkwEw41XScRJk5fTz41XHauqiW4O1bCKQfG+H8ETq3H
         6OhUzTSM+g4r7yA+5zihzB+iIeAgo2WpXfH1l3JsjAjiS0LH94ZB8HgVv6cwh3proIKM
         LM9g+TDX26lBvQoTnS+STXMWAXgDSjK47DgT5Jp21BhiB4bn0lIfoYUY28d1/Q+NvYWu
         j8qlQGhkPGo6az2etoLBSpKN7Q/iu4upHkINcPZbafvOj0lzamKf1E3n3mxhqxz2g66s
         JpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2QrAi/LQ7qBpvMzxLU1SPmaMAR+Dih79qGdKF0xOUM=;
        b=FCSuU1hV5gaR/MWIOHbF3gx5peAAPwSbKdscfNj+B5PgI3EvBMwg1wV+lZxnMkS3iT
         lOBla9yGGETANRr49bFBG06091AnMBXGHEQdGGgEwUuE4HgfihFwmDvK/HOshNz9KZKR
         YQHbY5JroumL41eluUTV8Gpx8lriEqINdX88kmKFycOixP9UrnHMI4/w5EGpd8+c1gM0
         iDThf8U23QA9cVyavApjl+v8AvlYLg5WC7NfM3Q9ZdgWDoqSQaeBcMynZviw5x/ZGdlD
         dIRk/RxCsq7lCpZkK2xR+cy/tBNIbcoALdopaQiNnUqiZYqReePdCICx8M7q49ml1e0s
         webA==
X-Gm-Message-State: ACrzQf0QviRhrCImUpt9IjBl/TRpwFDV+V7cxM2IgGeO3qhspel/GYTQ
        gfIGS/v/wTeXiGPZ0JNQqPsA1eQCYuCJ8mG4S7zw/g==
X-Google-Smtp-Source: AMsMyM55T30jGuX17epw2UcfZe39FWnNQlA14xFMGzW06X7z/xG9SBWntvvcGYxoxR6D4LMNbIZdGHUHXCKsj/LcKGA=
X-Received: by 2002:a05:6122:92a:b0:3b8:ae77:6927 with SMTP id
 j42-20020a056122092a00b003b8ae776927mr9973794vka.33.1667919619178; Tue, 08
 Nov 2022 07:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20221011002909.26987-1-warthog618@gmail.com> <20221011002909.26987-5-warthog618@gmail.com>
In-Reply-To: <20221011002909.26987-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Nov 2022 16:00:08 +0100
Message-ID: <CAMRc=MdC9fcrKaXRTq5eQttdyLo_SwhU7qEeV9+ej3L0ENkrTA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 4/5] tools: add gpiowatch
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 11, 2022 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a gpiowatch tool, based on gpiomon, to report line info change
> events read from chip file descriptors.
>
> Inspired by the gpio-watch tool in the linux kernel, but with gpiomon
> features such as custom formatted output, filtering events of
> interest and exiting after a number of events, so more useful for
> scripting.
>
> Default output is minimalist, so just time, event type and line id.
> Full event details are available using the custom formatted output.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Changes v2 -> v3:
>    - Minimise the default output to more closely match gpiomon.
>    - Add --format option for when more detail is required.
>    - Add --num-events option to exit after a number of events.
>    - Add --event option to report only specific event types.
>    - Add --quiet option to not print events.
>    - fix monotonic to realtime conversion on 32 bit platforms.
>

Nice and clean, I don't have any issues other than the regular
coding-style bikeshedding.

What happened to the idea we've been floating about creating a single,
busyboxy executable with links rather than separate executables? Have
we ever agreed on it?

Bart

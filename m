Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7000330007F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 11:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbhAVKkW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 05:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbhAVKi5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:38:57 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7094BC061793
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:37:36 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id gx5so6960210ejb.7
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+fAdhRYdbKzh7cy80B+uxwiM0uWD8OWSKWpHJ2K4I8=;
        b=LhUXPi3dzQ8ifspmaTFtAyzvn+NuPllCX6wsUD5fbUrVBoG4y5pS8qrpWP5y319jx/
         ATg8tANOe8/Vpj9UqDWwNJG8jxjL0VdNtAicoVGbksHH8dS53I/WJKwAELpxMkRh+rC4
         Q7T+bLTnrVDenHbzLCUjkivKZrz4ILAvHGlhAPR8m1z+9NTMXScv0SBHG6Na0buG7tSs
         2i3c/Cui4vYfKY7xniySdxdBYy3B3kthV7oI2+H+raEv8/bzz6qMkKRU3+aITvE4gqA/
         Aky4HFzMTdAi02IQhB2orSktSWkGjFLUYTaWu2/Ijk/lQwbyC3+nxYbd7LEepBk0GkvF
         pBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+fAdhRYdbKzh7cy80B+uxwiM0uWD8OWSKWpHJ2K4I8=;
        b=QHDpGfvXdDvTvD5zoPtI1RsAUWwcxhbVT83RGNnZPf9oh9b9eoacNtXCy4OvqdJBU9
         cD86H99phQnLFLP5aXUhrXnQ9NiyC6jV56pxzTM8jOTkA6L1wUOdoUAQL8bwSuoJ31Ed
         EWO3FwwmMnLrAsrydZ6eHdUdA9CkQj41H0gUig2+xxbfy6/xlUmpsVBPr90Du730bZro
         EN8FZVp/18xLQULAXOrP1XU+jcoz4WSjUUXRqm51OjAtSlQI+AELcKsCQEb56svfwtQB
         w2xIOiCHQrQlQQg4houfsjzifT7/ykDSiw9PeysLJtgeCgXAnsps830sbfsxovo3z/BE
         HgTg==
X-Gm-Message-State: AOAM530beV+e54TBbKhfTtxm+OVoyCcPVjzIvGqMOMiL8xnsQ1vPjepo
        Sd/pIvTMzA/dHkrTv6xZw+0Qup85adktl4FhCj83s+GwrkI=
X-Google-Smtp-Source: ABdhPJzt1YL4wQD6NzcThUhl+9fZSo3D3AsTDEXvXereCC8ddVqas/jbKSpoFiDQ9gnSWNUdr6aY9RsJY3EsWzztukM=
X-Received: by 2002:a17:906:19c3:: with SMTP id h3mr2475548ejd.429.1611311855093;
 Fri, 22 Jan 2021 02:37:35 -0800 (PST)
MIME-Version: 1.0
References: <20210119135727.105360-1-warthog618@gmail.com>
In-Reply-To: <20210119135727.105360-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 11:37:23 +0100
Message-ID: <CAMpxmJWGMECwGx-zCNP+F0RJYH3EV87_S36m2kCSaKp3ew6+bg@mail.gmail.com>
Subject: Re: [PATCH] gpio: uapi: fix line info flags description
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 2:58 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> The description of the flags field of the struct gpio_v2_line_info
> mentions "the GPIO lines" while the info only applies to an individual
> GPIO line.  This was accidentally changed from "the GPIO line" during
> formatting improvements.
>
> Reword to "this GPIO line" to clarify and to be consistent with other
> struct gpio_v2_line_info fields.
>
> Fixes: 2cc522d3931b ("gpio: uapi: kernel-doc formatting improvements")
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  include/uapi/linux/gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index e4eb0b8c5cf9..7a6f7948a7df 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -212,7 +212,7 @@ struct gpio_v2_line_request {
>   * @offset: the local offset on this GPIO chip, fill this in when
>   * requesting the line information from the kernel
>   * @num_attrs: the number of attributes in @attrs
> - * @flags: flags for the GPIO lines, with values from &enum
> + * @flags: flags for this GPIO line, with values from &enum
>   * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
>   * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together.
>   * @attrs: the configuration attributes associated with the line
> --
> 2.30.0
>

Applied, thanks!

Bart

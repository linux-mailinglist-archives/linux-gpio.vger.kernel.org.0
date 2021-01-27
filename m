Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC09305EFE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 16:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbhA0PCP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 10:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbhA0PAZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 10:00:25 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA939C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:51:48 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s11so2774537edd.5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cTb1qG9GkgwXMpUhNx1t/diaUHaqrqbu1GRsagpeLwM=;
        b=ILnM+OVztpAnYmVrO1FVr4Vx9kHcIQGC83QQvcgFKlG6GqybeWuPWtzo+hjn1g1+eY
         otRFOGVi5Xw/X21KkCGw7iVOnhZoDIlEvHU42/SsY+VJE20CEZNz9hM3uDT2VeOYTbfl
         f1nFs8LzId+9cfBGFgcSMNyN7j9p8L/e0JGeOpuJMFGO2GsJ/XcWkMQoP+oi5b8eSZSP
         exgSYYivVrn3jKxSmec7IINWa/r4+iQgGlDzkUq6Qo5kBsJarkVgsDIelg84AYqvGCof
         XTuIe4trKwoe0EfFdpZ9OaBNuagie1GmEaQrVQc/zE1FOctgq9cmVSg8cgds556LlKrE
         rs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTb1qG9GkgwXMpUhNx1t/diaUHaqrqbu1GRsagpeLwM=;
        b=QdzYmfx269K/NSdEz8mNWPxT4ogp/LZNuR7gIH0ckyTkMs8uYmCUwPDQjmB8ww5whp
         Ws6eY9iCdX2h4plqcDbmKQdEOm0ToBCu8Ku7WkGC3/QOLdrNyKVysrHaS5oC66SnlrmK
         4UIfkORJj5TN652c43xaDj0fpRFc9lDSZ4eNzZmMbCWgLG8pDIl/G4d/TP2aBTwsT1j3
         6qg/gc2QUg8gOnlU5NsnZLt6i2snyxdgnL2tmAHdritrbN9hzFIFk0oQ8L9+mSggkbpx
         3q75pyEJK4LERGWRffYjizhpkoCsaqyxu2+wrFPIPKRZgHHeIjT8jiO7ZWvt+xEeGOrt
         7VDA==
X-Gm-Message-State: AOAM5327oyvmV3d24+TY3EwWNHtCxfwviOwvYJTdAlugSVeZKVQ2Tau+
        wH8ZOMGtVK+mVRT2PTR4U+LWXQMyhPRmPS75jwPFMQ==
X-Google-Smtp-Source: ABdhPJxNdLjX1tXkgq0Mtqs/dnVrdJ1tF/Xdw5s4EqNQ/5sSx69L5xot49eIsuqwVjc83JQdSHoXkR2HRcAfXVMyzug=
X-Received: by 2002:aa7:d60f:: with SMTP id c15mr9179966edr.232.1611759107579;
 Wed, 27 Jan 2021 06:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20210121141038.437564-1-warthog618@gmail.com>
In-Reply-To: <20210121141038.437564-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Jan 2021 15:51:36 +0100
Message-ID: <CAMpxmJWHzU7NM950gLx3dJB5ap07J8VRw1GCO-LfNnOOO1vevg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: clear debounce period if line set to output
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 3:11 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> When set_config changes a line from input to output debounce is
> implicitly disabled, as debounce makes no sense for outputs, but the
> debounce period is not being cleared and is still reported in the
> line info.
>
> So clear the debounce period when the debouncer is stopped in
> edge_detector_stop().
>
> Fixed: 65cff7047640 ("gpiolib: cdev: support setting debounce")

The actual hash for this commit is 65cff7046406 - I fixed that locally.

Patch applied for fixes, thanks!

Bartosz

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 12b679ca552c..3551aaf5a361 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -776,6 +776,8 @@ static void edge_detector_stop(struct line *line)
>         cancel_delayed_work_sync(&line->work);
>         WRITE_ONCE(line->sw_debounced, 0);
>         WRITE_ONCE(line->eflags, 0);
> +       if (line->desc)
> +               WRITE_ONCE(line->desc->debounce_period_us, 0);
>         /* do not change line->level - see comment in debounced_value() */
>  }
>
> --
> 2.30.0
>

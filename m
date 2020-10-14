Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F3728DBEB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgJNIqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgJNIqK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:46:10 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E84CC051111
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:46:09 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lw21so3671459ejb.6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCpC5n5gjLQ7Ny1h2euOgjgjG/OdMR0+33aZN6zPSEI=;
        b=L/hlFdlJW7yH1CvYPrVQVNiB6jjifjZ/Hy8j8GNwZqygxWgDhcdu+jcdMapzx+5opa
         23F7MCawAERb3WrnmCTR/xEnJUqEruQcKD2b6HtxEII8aZIEsGNG6PR8brVhyxzZDM9E
         aSjerkwMzVhic6zaxkA8fmRNVPsglY150UVfRAi+FxSE67mw77LvucH7s6/pj2lYjzg8
         BN6vI5zQgMXJPrOyL+5JqXWoYo6WKvtOTVigSKOYTNoqcg8ZdmsLDif6KVifvhEFaWlK
         wJvnMBjv+MHCL38zgcHw2zzVMtCrokZGshrFEiwmk9okKeL2qVVqMnE0FRLzYn81cR9e
         fnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCpC5n5gjLQ7Ny1h2euOgjgjG/OdMR0+33aZN6zPSEI=;
        b=JgIVPYU/jXpKGBW8uqJCB/2qKx0FmEWYpN27aPpKSYxrJJKfv2gopUiHMMmiKoLB13
         743zNtkOhN4pRYnvXofXdQ/ZgrmepokC8DwirVdTk7OIIjn2X++ItgM+0uVqUyzFA5tI
         xN+8FHrMjKG8KVyiYslV+F+01OkR9RnvsB+HFCBQGlpyyDP2a4XG2vIc/+MZnCvOCZek
         QWwDaXjMp5AkTqCwxSan6CMJ4fc5i3mGJ13+JzkJzYsQZC8nMz+YC9DT8eHLwNVcnbVg
         exO80KH5O+ibkzs4azT243b7tYXlsDgVLCN8+5HNOxDKFU2DhI7MvBwJZT9GteA/8c55
         JrdA==
X-Gm-Message-State: AOAM533Y1OF1tO9fTL89yZVcu+3xlzCTQcU5O4BNdRYhTB6cfVap6xfN
        ro2Fw3mJn7uNzFfyD2L4a2AYwnbV2iuD6u5DGtpnIn1nZOg=
X-Google-Smtp-Source: ABdhPJxRMQjHuc+SiS+hcmbFXXYWvX1+GP6HAfbYJvjZQSdufZjbym5kc+yFAvT/fLzz+or08Cv/6RGiJMNOfpTQr9M=
X-Received: by 2002:a17:906:b1c3:: with SMTP id bv3mr4098356ejb.445.1602665168134;
 Wed, 14 Oct 2020 01:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201014034758.19427-1-warthog618@gmail.com> <20201014034758.19427-2-warthog618@gmail.com>
In-Reply-To: <20201014034758.19427-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 10:45:57 +0200
Message-ID: <CAMpxmJX-Npir5LkEnU6JqjYts4QQ4C9NoJE9WE2v1i_QRL6-Ug@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] tests: create mismatch between chip and
 bulk offsets in wait_multiple
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Create a mismatch between the chip offsets and the bulk offsets to ensure
> the implementation is not dependent on them matching.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tests/tests-event.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/tests-event.c b/tests/tests-event.c
> index 6066e45..a43f865 100644
> --- a/tests/tests-event.c
> +++ b/tests/tests-event.c
> @@ -546,7 +546,7 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
>         gpiod_test_return_if_failed();
>
>         gpiod_line_bulk_init(&bulk);
> -       for (i = 0; i < 8; i++) {
> +       for (i = 1; i < 8; i++) {
>                 line = gpiod_chip_get_line(chip, i);
>                 g_assert_nonnull(line);
>                 gpiod_test_return_if_failed();
> --
> 2.28.0
>

Applied, thanks!

Bartosz

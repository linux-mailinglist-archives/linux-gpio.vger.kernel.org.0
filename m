Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2ABA2901D7
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 11:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395116AbgJPJ2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 05:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395037AbgJPJ2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 05:28:38 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DE1C061755
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 02:28:38 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a3so2115022ejy.11
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZjcrEVgxM67PzskttU2Dqo64N65ljOeAu0i8N791x9A=;
        b=e7/1p/hCiFWBDLIqiBI16HdeVID/5NkJ0N35RlGZks5PB6M2phODyxsEP5uAdVNhCX
         kW5ivXgvgQ1Fdxi8XkClvoiKVZRZE9cdju9GlTdjswHV3VJTnWguo0mc+Lkj+GA26AvK
         hS/LH3gGL78cqkFdgyomfA2SdcugmXDKjS/aLDcwOHvlYO4DfIIi6wiRrxWW2Ukho18Y
         VnbpsACCdFGiOCeTkG8UYw5loI+i9FWJrRTz/pG8oEijwmjGbQVx6GuN3Zfj1ZH+7ZbC
         VF2ThP8a5Up/taNVrB3z6O+BWGfRe7/DMDoUhNTpy4fsxuk3ouHLso7bNAmnpZYDFS8m
         fYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZjcrEVgxM67PzskttU2Dqo64N65ljOeAu0i8N791x9A=;
        b=OR4FLY8mqAy1VJs0/B3ZBTKy8Qrwgrg/QtNJRuGt4+uiArS7+3MXjaCKnH3IqiJj+z
         dwYVpQGChbzyncxRNxFqNMGM7lRT+bHlUmfSUuKOjIgI6FqSTf77S/cWaBwN8Dg2ri3D
         7IKQnLOI3ghGEffmxZlbQAAx20Wm1y51maWgjHrgkHgmlOjQ1x0ZgPNZXyz9GEJD2Aew
         mBdPT0AZ419mlsao/MUoSmUQnDHfoH4lAxmOXq1GFwOFjDXg6Y2e0F1+++HFOOZZ5zc/
         koBGxPtM9BkVuVkuCFoFnKeO8XGm6G62Bpb5SiRgO5R702KKmJ8GKRxHMSq+z67lWGsq
         +d+Q==
X-Gm-Message-State: AOAM530H/0BKX1+T7AFY2Tn4Gs8EIOdpuxbM0pyVbo0wPyYiHZ6gaIZI
        mqUt43WG0i2/MAphEPgkaIn6LiWs+CUEqGWs5T3BmQ==
X-Google-Smtp-Source: ABdhPJxVQmD4OajVdHgq4nMKdSytEsdgOIWmA7X9ZPkxbc7Gc9eCYV73JI2IH/w0Ict5aycRb0g1NJDaf3V4tU+hnN4=
X-Received: by 2002:a17:906:14d:: with SMTP id 13mr2707371ejh.516.1602840517141;
 Fri, 16 Oct 2020 02:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201015224711.8624-1-warthog618@gmail.com>
In-Reply-To: <20201015224711.8624-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 16 Oct 2020 11:28:26 +0200
Message-ID: <CAMpxmJXcfYxU56eQ6ibZLmqqEDeZFrUyHFCN9RuSu3AYa-xUVA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] gpiod.h: fix typo in gpiod_line_request_bulk() documentation
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 12:47 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Replace 'prodivided' with 'provided'.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  include/gpiod.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index a6e34ae..f44a34f 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -1141,7 +1141,7 @@ int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
>   *         this routine returns -1 and sets the last error number.
>   *
>   * If this routine succeeds, the caller takes ownership of the GPIO lines
> - * until they're released. All the requested lines must be prodivided by the
> + * until they're released. All the requested lines must be provided by the
>   * same gpiochip.
>   */
>  int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
> --
> 2.28.0
>

Applied, thanks!

Bartosz

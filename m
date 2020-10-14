Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DB528DC00
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgJNIvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgJNIvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:51:04 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7A3C051112
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:51:04 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id x1so2310047eds.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A80CLxNm0ngg2w5W1IsTb65S4kGeBqUYdpk17rALbOg=;
        b=J08K9a5YJfaTygDiqT44+DKWSKNARhDVdBOxmNW74mvAe3ubFiE87a7tTSyD0t0Qjq
         OhpPhb2RHP8ePymWxa+pc57wuKYyFi/768sPBYqiocU2Nr5hCvgykAvDsbYOUyXlVQ0k
         qrqiRkjx5GZyC0A3Ti9BzZm5oqYiAyb5zNzwXp9GUxLQYL4Mw4p/qfdNAKQ1OZ2D5Il8
         Tc5pmItnxWQdMcd/9E9tpQpW/+W8DdaLZ01/AwKjAiY3PDMKWdnIzNkK1fGYVEatjJK2
         TUGP/ZZwoS5afz0bXMF67Fl5gfE0TMfAbred19Oov5xTgdzrvyjrHoATnFIbhBibqxcB
         Dk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A80CLxNm0ngg2w5W1IsTb65S4kGeBqUYdpk17rALbOg=;
        b=pQ9TIcTNNvKwYNt6blmEbcDWPW1upTSL9OKJx3XypnuqEitQ2okZCpj1QaybPrQH2y
         691ncqSJlix+i6xXzAkQIol/ATAmbVJhjmccge1xh6E5Vs7rdqfRTN0BlbbtQN/aqxsX
         7+soBHd2dQjTHVXlAd33RUQIaTYqrD42MkinK0/qN/78LxVoutQdKEvpkPx/1Z7SWAET
         zjnxAjfY1ej0+RLvkNb/9x7NbpXA5ijojwxUBbzKg+b5qJksTZhD2ZSTdOQ1TGS2sIS7
         7hiTnVuDzE7zpjIKIJftX34oz5BaAM8hJvoHf67NQC6pWi8Uc8YxyIca4BRgdyQ6n4AS
         BBIQ==
X-Gm-Message-State: AOAM532iOwSwZQADjMRGbSIG4dE9x4sxAz3dlIFHzHY0WPeQF8JeTNvi
        HlML3kZXuLrafr5V1eUAGpzPOZRi3IeDZJGEe5rIxHoxqGo=
X-Google-Smtp-Source: ABdhPJyTS3UkHXbHlaZSU5HGtSObkJoxpcVozg0R0x1j5JMCTzJ1K5DPtj1NxOFhJ75oygrBrC28tnoobObcj3lGKZc=
X-Received: by 2002:a50:d987:: with SMTP id w7mr4022616edj.113.1602665463101;
 Wed, 14 Oct 2020 01:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201014034758.19427-1-warthog618@gmail.com> <20201014034758.19427-3-warthog618@gmail.com>
In-Reply-To: <20201014034758.19427-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 10:50:52 +0200
Message-ID: <CAMpxmJUcpknHxsit7rg60RJ-+pnUyr2dH+87Fj97HLBHcYkAWw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/2] tests: add check of event offset to wait_multiple
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The offset field is added for uAPI v2, so extend the test to check that
> the value returned is correct.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tests/tests-event.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/tests-event.c b/tests/tests-event.c
> index a43f865..0e5effe 100644
> --- a/tests/tests-event.c
> +++ b/tests/tests-event.c
> @@ -570,6 +570,7 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
>         ret = gpiod_line_event_read(line, &ev);
>         g_assert_cmpint(ret, ==, 0);
>         g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
> +       g_assert_cmpint(ev.offset, ==, 4);
>  }
>
>  GPIOD_TEST_CASE(get_fd_when_values_requested, 0, { 8 })
> --
> 2.28.0
>

This one relies on your v2 port but since it breaks tests, I can't
apply it to master and same for this patch. We'll have to revisit this
once we figure out the new API for the library.

Bartosz

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDA71FCDA1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 14:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgFQMp4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 08:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgFQMpz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 08:45:55 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7D7C06174E
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 05:45:54 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i16so1338801qtr.7
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 05:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9m9WMv//OFprhV8dDd+RL+Fb+UKpc5RDoOswf9hLbyM=;
        b=lHyHoc6D2D1qXoXyh3PWrOlhWDJcQtLlVds+1XKRT/uvoYbsmQ7fP+o4+BP4LQra1U
         wfMcp99foUsufAY0Z6CrVDdzOoYI9VI+oEcH9L/30heyhXYYdrNGpHg1TNVCc9DIO4lz
         1zhNIo4ybx1MBLtqGz/khmJuJ7+tDqMmN5CsYbiVnzs517UulXV0Qs3zR6Lm7g6bNRY7
         UJyLpifegWbWGN2hnbKZ7vLAKRYFdh5amlL9XNUYvaEu1GcMJF9uSVYtfevHtGUDvydM
         DeQDeuzpTjOyuJraRUybZ4Dp5NbfqmYLVk2UoJ3bUKj53ltrlornvKP+KLyB3fEwyp6W
         2VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9m9WMv//OFprhV8dDd+RL+Fb+UKpc5RDoOswf9hLbyM=;
        b=a2aV+RHB1Yd5VsRgx37UO5eCCJ3Og84Izw37Jy0mH8yh+6x2WzWhaj3w9MVrQJvQ0k
         YMkY8EDXM5277iCM5+WAAKTkpw1b5JgRdKB8TLqQ2mjVfzOvpvbuqqohPnxAYJlIBwvU
         ZSs8zrS+Spb49Xnge4uRZzYbYV5UwSD29bD8dqA6moJbrXP5Nk3t62JIJ9I21BYWVBnk
         gAVE86RlAuFvT+AuOR0BoGYu5intdmlcFzxjNwGpawfMxMs+aicals1UrXr19dANSq/V
         DkWWbC4qj7WBYXZoAY0aQXRy0LgbOKqdE0GjFWz8HiDLYmrXsVCEo4qeOUbc6icoUvns
         L1Sg==
X-Gm-Message-State: AOAM531hv0gjS3Ozvp6UNwdLCICdSFSouoNCZ8OlivQ0bS14TlG8lnUs
        N7T+nu815pP6dWo4ftreMfaHdr1lz9s8161PYtYDBA==
X-Google-Smtp-Source: ABdhPJwKcsCwJ+KpoW3d57io3EVSLoB9X7iRN2xdmkBbUlgFk8VUCtDFY4aSeG8RAbsgQuItF5S70UarV6ogqFMyoeU=
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr26765156qtr.197.1592397953774;
 Wed, 17 Jun 2020 05:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200617030639.27690-1-warthog618@gmail.com>
In-Reply-To: <20200617030639.27690-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 17 Jun 2020 14:45:43 +0200
Message-ID: <CAMpxmJUryMf5z9GzeH98emERFJ8ABn+v7A_KV=juCv65YhHeEQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/3] fix get_values for events
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>, ml@ionscale.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 17 cze 2020 o 05:07 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> This patch series fixes getting the values of a bulk of lineevents.
>
> The problem was reported by Gerrit Wyen <ml@ionscale.com>, using the
> cxx bindings.  The first patch adds test cases to confirm the reported
> behaviour with cxx.  The second adds corresponding tests for the
> underlying gpiod_line_get_value_bulk with events.  The third fixes
> gpiod_line_get_value_bulk so that it returns the correct values
> for a bulk of events.
>
> Kent Gibson (3):
>   bindings: cxx: tests: add tests for bulk events get_values
>   tests: event: add tests for gpiod_line_get_value_bulk events
>   core: fix gpiod_line_get_value_bulk for events
>
>  bindings/cxx/tests/tests-event.cpp |  36 +++++++++-
>  lib/core.c                         |  33 ++++++---
>  tests/tests-event.c                | 110 +++++++++++++++++++++++++++++
>  3 files changed, 169 insertions(+), 10 deletions(-)
>
>
> base-commit: 2efb0075a7779fa61bfe01c40aa97f7d23a8e528
> --
> 2.27.0
>

I applied the whole series to master and backported patch 3/3 to
stable branches (v1.4.x and v1.5.x).

Thanks for a quick fix!

Bartosz

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123712F0F98
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 11:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbhAKKAO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 05:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728751AbhAKKAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 05:00:13 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E76C061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 01:59:33 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id h16so18121984edt.7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 01:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7r6VuPBKQigjoyxyE9moxapiWhf8PXnfSot3BszutPM=;
        b=CkDTMfWTDfFLgj8ve+EItETtX2GIofV8zoXCWnLGUux+rvizG3TdJIWF/R457wvOsm
         UuDd2fwPodyn5rBN/3nPGXFUKtESz6RxRJl733ZzKkAxbdBbYXI+lnZUr59h4dVD4KpH
         6nXDaUMqyAcyxQ0D2vkng0idT8eYgdFD5GYb2Igky2rqtpkXEnvS10bdBL51oApYIEQj
         J2JAd73gJg4BNhGbW7j6jp1gXqijd0IysniL3o0K9oMPOX5eUVfct/trn/yawJyGDbCT
         gjsN2itW0LOYXNys9x0Ghhasr/kv5GW0bLDSthhaioKoKd/2K/EQPK+hvjFOo4agkxFm
         yQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7r6VuPBKQigjoyxyE9moxapiWhf8PXnfSot3BszutPM=;
        b=aYdIPFR+WHleQdvC2Xb9YHBsaydhpqMhjVeRexg86DAazQOCtfKaKTiR85pqRzfiro
         6H10ji7/j7pnKxHKFx+YweSAC8acSR66jJBrzoq2TrlMW4BUCN/M3phCmRhl1tRm2kBb
         PiU28Bk7uZHBSBZv/F3lNeU9TLmVDwTDdIsd6zGnoSSjm/64qNuEPxUk9VLU4HrhwXBT
         IP65ZwFR1thtrMMGOCYd0lmIBeWX/9h1uoK6RzoYdVUIu0XuU7o0dwnorvWP+9w5c08t
         QnTvjLNSXQBK0lbN5DohxVywFblBLJ1bI/prMp+MyWgOME+dZkNwndoTRYeEyRD5/msF
         /fUQ==
X-Gm-Message-State: AOAM533AGCIQS62DC1hDqIr45E2B1fAaZF0LXV4/+WRQq4Oc7KDz0ky1
        vYIPIXSfqVjqlAql2xQOeeqA592Byoa9b3FOaF/8Hg==
X-Google-Smtp-Source: ABdhPJzX1NZOrDEKGrHw76vQzEuSktC8dH+VSQnOTGEU4cpxzLrdVZMlkuwjAjc/V1Q6p9v7ChK3XsSC4EIJmFV7f3Q=
X-Received: by 2002:a50:b742:: with SMTP id g60mr13230007ede.113.1610359171797;
 Mon, 11 Jan 2021 01:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20210107040020.257671-1-warthog618@gmail.com>
In-Reply-To: <20210107040020.257671-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 11 Jan 2021 10:59:21 +0100
Message-ID: <CAMpxmJV4SnGnL1Z04q3dHs5S5qZjXBMk-8=piPm2yOVbHb7y7Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] tools: gpio: fix %llu warnings
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2021 at 5:00 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Fix a couple of warnings that I ran across while testing selftest changes.
>
> Sorry about the repetition in the checkin comments, but as the problem was
> introduced to the two files separately it seemed more appropriate than
> tying their history together.
>
> Cheers,
> Kent.
>
> Kent Gibson (2):
>   tools: gpio: fix %llu warning in gpio-event-mon.c
>   tools: gpio: fix %llu warning in gpio-watch.c
>
>  tools/gpio/gpio-event-mon.c | 4 ++--
>  tools/gpio/gpio-watch.c     | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> --
> 2.30.0
>

Applied both patches for fixes.

Thanks!
Bartosz

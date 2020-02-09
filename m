Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D193F1569F8
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Feb 2020 12:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgBIL1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Feb 2020 06:27:42 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:46032 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgBIL1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Feb 2020 06:27:42 -0500
Received: by mail-io1-f68.google.com with SMTP id i11so4389576ioi.12
        for <linux-gpio@vger.kernel.org>; Sun, 09 Feb 2020 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=//tamuXo0VeGf3XNk8EJmB369dWeCwODcHVo81VZdw0=;
        b=WC2+X1XFBJlBFOTPYsXjN533xCq4aEewPIpGSG89mX/l2D5T544l9bix6dWzyBOBQf
         CBgHOohRysgIFcHvFXCMXh4TO0dXsY+3YPwfBVu8SjVunoSf/KIAqsR9T68sJV8vSUc4
         YxPP+ZS/p9koMa16hfv70MoeTH/ZJg580K2q04S7WDYdOOh1RhkMZRgJln9Asx7UBUDp
         XM++PLuYioRNnNjrMp26RAdGLtI/ER0ZCB4R/rS2Adxwla6ChblII2gGeWXmdnDmW2/V
         wyjSVs+lywguHCjDc4zWDJF4BA7vZXG9Y3t0yG3m2bIKYLirQeX3n9+FMmAiNpMY3bHS
         z4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=//tamuXo0VeGf3XNk8EJmB369dWeCwODcHVo81VZdw0=;
        b=CwRAk3balLWAax0myKRv59hncRvAvUV2bSPRuSffcmSLzD7i7UP/tccRKwFYAYLDOa
         JYivluW6BTh26E8x2uUA35EbaNNEOnjgQxC1iEFRY53TYU4o4C3gSR2zZnux9/NnYi43
         43UGxDhasFrNAUjubpgv6jUZAYVuAVjfmIunlp/V+W+6tV/ePqdwXXkOCSbaLM0jC+sp
         s2mFwMLhf+fJhZu4sB/Yy7HisxoZ2qplQP8KkAYfhh1HXDQ0WsnnrSrX6EI8YR0VYmjq
         Nq+puQnOCvoPBL5wV93PiNxnwwNHCwH061DVci5HOCDWL7FtpYTwZv7TM9gJbMtqkieG
         Xbrg==
X-Gm-Message-State: APjAAAWn9jt4mW5MZezhrxHqqL+Yo3kM8APRSN340DoWp6h7WNLsaVlC
        S9V2Pf3mt5utw+7JNJbI1HsKtGXRpTlDkvTCcxzUuzfEeL4=
X-Google-Smtp-Source: APXvYqwRVhEbvhaYEAIEB3kKLvryGCw/v5rTfbrNb3wpfZCd18K2TNBlZ84X8zFEKdc/gV1ZYCXLRW9VtAD99Kn/AUk=
X-Received: by 2002:a6b:fd18:: with SMTP id c24mr5192491ioi.189.1581247661887;
 Sun, 09 Feb 2020 03:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20200208100129.10657-1-dmlinuxnewbie@gmail.com>
In-Reply-To: <20200208100129.10657-1-dmlinuxnewbie@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 9 Feb 2020 12:27:31 +0100
Message-ID: <CAMRc=Mcak_yiG3xt3W_cNtEzfr88R-ti3t8dNGQHpDUNL05+0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] core: Removing unnecessary check for monitoring
 multiple lines.
To:     Daniel Mor <dmlinuxnewbie@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 8 lut 2020 o 11:01 Daniel Mor <dmlinuxnewbie@gmail.com> napisa=C5=82(=
a):
>
> In case when needed to monitor multiple line`s on different chip`s
> function gpiod_line_event_wait_bulk() blocking it, by checking if
> the line`s in a bulk from same chip.
> In current state the API forsing the user to wait for notification on mul=
tiple threads.
>
> Signed-off-by: Daniel Mor <dmlinuxnewbie@gmail.com>
> ---
>  lib/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/core.c b/lib/core.c
> index ed63012..2a46074 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -977,7 +977,7 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk=
 *bulk,
>         struct gpiod_line *line;
>         int rv;
>
> -       if (!line_bulk_same_chip(bulk) || !line_bulk_all_requested(bulk))
> +       if (!line_bulk_all_requested(bulk))
>                 return -1;
>
>         memset(fds, 0, sizeof(fds));
> --
> 2.17.1
>

The subject tag suggests there's another patch in this series but I
never got anything and don't see anything on patchwork. For the
future: please also add [libgpiod] tag before [PATCH] to make it
easier to spot user-space patches on the list.

I specifically made this function only accept lines from a single chip
- this is the same for all gpiod_line_bulk operations. To do otherwise
would lead to redundant code as you would have to retrieve the chip
reference from the line every time there's a new event and compare it
to something to know which one this is. If you need to modify lines
from several chips - please just retrieve the associated file
descriptor and use poll() or select() and then you can easily map
descriptor numbers to specific lines.

Bartosz

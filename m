Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35C020E020
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2020 23:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgF2Umw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 16:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731642AbgF2TOD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 15:14:03 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7F1C02E2F2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2020 07:26:55 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id e11so15405184qkm.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2020 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h9h6iUTLSlaM8ZKedUbrDjAeuBkCXn2xjNjPFH6ekn4=;
        b=T1IpLJ344rgGaAa+SleIJFka/PpqQpfHOmwwxhlqA4Suwr5L752jeOu5N30x6rcKz8
         KF20wG2FJZQGA4AztiZaX4TzOwDhVPTEKfW0sOaPHxxZXhHWKs5AlLiSCTAg8sFusRgp
         PeZguF1j71pS4edUg3CM/8vlS2RLY3+JL23breZejkSX4dCEFuIuecM+9Zp34UrFAdZY
         GWzcWmJsDujFB78JLRZS4i3yxZ8gc8y9UibuKmXikPPbfHYvTNqIpHPz2Vvto1L1wdFI
         4Ri5cK36BuL8D113uj2oCGfqYuOBE5J0COAuRf5g6TIXA+LImkTnIQvPIvdfMRToNHqS
         ivpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h9h6iUTLSlaM8ZKedUbrDjAeuBkCXn2xjNjPFH6ekn4=;
        b=LGryY70JUI8jfeocv+Cw7ZONvUdfQm2+NyWf/4IyTmLbkIPznZFhnStU61E1K8yIFl
         +Xndh/MvKGWf7NjsRwg5HlVGZ0IGlTW2ekP9ikgwqYw05nIv0sFYKu5G8PSVahF+vfj1
         TvqUh/gdT5Av7F09sSyabyaXTYEe5HaIHhaergM9/rgNoFPuOvTNmfZDA6vJ88yXPhSj
         2EPZAAmqImI+NdjfDMJoULm6IfXwz6Et/gQmQRGLqw6uE4rqzLxLCqdqri0v5y/8BcPv
         J1H8cAUgdgfEsXG0ZI2D1sR8ViVQAdc0iLcvF6e8ocA2H3E/7BG4i3MKWicCUzUoLFk/
         MYMA==
X-Gm-Message-State: AOAM533gs6A5aQt48oGohocUuRlrErrBGxHDTwvDT7eWY0Hmmm+KTET+
        PwjjSeKFqlZDd53lkdMXCmp3WoBG9ZoQmaWsHkytew==
X-Google-Smtp-Source: ABdhPJzADHgjRYun7EFvcNevrS1w88lT8h+z8+W9iN0INfkGcrVrm59SoEI2bpu5gUwfXvpzn98HJaI1jOgo7YMD9Lc=
X-Received: by 2002:a37:9c81:: with SMTP id f123mr14194552qke.21.1593440814965;
 Mon, 29 Jun 2020 07:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-16-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-16-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 29 Jun 2020 16:26:44 +0200
Message-ID: <CAMpxmJWoXWk4t08gM8ieMrMSgYPNODjt6Jx3k_L+a9X00891sQ@mail.gmail.com>
Subject: Re: [PATCH 15/22] gpiolib: add build option for CDEV V1 ABI
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 6:03 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a build option to allow the removal of the CDEV v1 ABI.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> ---
>
> This patch is before the V2 implementation, and is non-functional until
> that patch, as some parts of that patch would be written slightly
> differently if removing V1 was not considered.
> Adding this patch after that would necessitate revisiting the V2 changes,
> so this ordering results in two simpler patches.
>
>  drivers/gpio/Kconfig | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index affc1524bc2c..b966a7dc1c9a 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -81,6 +81,18 @@ config GPIO_CDEV
>
>           If unsure, say Y.
>
> +config GPIO_CDEV_V1
> +       bool "Support GPIO ABI Version 1"
> +       default y
> +       depends on GPIO_CDEV
> +       help
> +         Say Y here to support version 1 of the GPIO CDEV ABI.
> +
> +         This ABI version is deprecated and will be removed in the future.
> +         Please use the latest ABI for new developments.
> +
> +         If unsure, say Y.
> +
>  config GPIO_GENERIC
>         depends on HAS_IOMEM # Only for IOMEM drivers
>         tristate
> --
> 2.27.0
>

As long as the series remains bisectable:

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

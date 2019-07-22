Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06A66FFEC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 14:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfGVMky (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 08:40:54 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36730 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfGVMky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 08:40:54 -0400
Received: by mail-io1-f67.google.com with SMTP id o9so73595295iom.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jul 2019 05:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HrE6s2h20GCl+rLX0hg+6OeuG0aEM8ydNp/hg7tCFuU=;
        b=KkEIBUsPQH9wQ3swuClHuM7GN0XhmTsJ5NmOoIdXj37+HXj9DPqouBjxZAs3qktNin
         BeYncFw8NiHDxYlexrkt6n2N/8L2XP1+0KrslG1nPRPQ1EneTud1CdzhD6lWTC+9pBXc
         L3N5b0L36v0oB0M56PH1Ikjb9ODvVrCWq+yd0UwWoecfV9o9GF18TT5WkM30tQ3QuWKu
         qg0zwWskSNg5zOHBC0WCu6faskHePoPIt3DA0a7aP8qgH/swZiruJooFG3PlSBL4a/DF
         LV/NFKcqWjVs7DSRF/r4YHbqM2PyipHp8gUvMaOOLaR5+rdelIPjT0XnqCKTNjFWIGWS
         rxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HrE6s2h20GCl+rLX0hg+6OeuG0aEM8ydNp/hg7tCFuU=;
        b=pHS8gKD3u6UZxC0RY4v2ynUaHlKQW9rbLoJtlKRNsSO1NaNO7LczG/p24OgnY30R12
         opB3tSMX7edBvNbBT1FdVZIkDJiaWY8H/l5r0hFXA6C+nlvtipcmz/ndzgKVM9X9cd7/
         fAdWCSIQRLunfO29xICE9N/obScAxRfV/an6CVSn/FznMkBpzmknYK9eej5xm+seKufB
         U6mbpBsG6iqQL/n7QTdRD2wE2vKiLIUSs2SlqPddZxCjk12AHQ9bvj5AwbtpU7ff103s
         gehQNgJMPT3vafNNAuz4A5b5lngTMY9PYbE1dSuO/5Dw+staggPTxH3kPTG2u7MNtjx0
         VWBQ==
X-Gm-Message-State: APjAAAW79RZqJwkKuh2joyG6yqGvXVNslpmcFo6jG3NscpylNe+QhE5N
        yfaEjkIoC+HDQvyxK6skaU84d6sTeX4CvYLZrBo=
X-Google-Smtp-Source: APXvYqy32EUfLcRGX9TBzkZWay6adgQ/5A3/tB0Lu9tMw5ICtPZDMLKTLajAslBevAyXeS7OCenm//y3SOV2Ym/cQVU=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr63545556iod.220.1563799254007;
 Mon, 22 Jul 2019 05:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190711082936.8706-1-brgl@bgdev.pl> <20190711082936.8706-2-brgl@bgdev.pl>
 <CAMuHMdUp3YMMzhYRBnHFDrf3w7GDK8HY5aAXdjVZ_oMd_n6xdQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUp3YMMzhYRBnHFDrf3w7GDK8HY5aAXdjVZ_oMd_n6xdQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 22 Jul 2019 14:40:42 +0200
Message-ID: <CAMRc=McbADdFSkkm1smJmki+wmz2GFah+vv86ECWeHFHCCNHRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: em: use a helper variable for &pdev->dev
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Phil Reid <preid@electromag.com.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 11 lip 2019 o 10:48 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> On Thu, Jul 11, 2019 at 10:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Instead of always dereferencing &pdev->dev, just assign a helper local
> > variable of type struct device * and use it where applicable.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Applied for next.

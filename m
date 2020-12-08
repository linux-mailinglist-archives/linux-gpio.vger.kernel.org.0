Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEA42D267E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 09:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgLHInC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 03:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbgLHInB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 03:43:01 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45848C0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 00:42:21 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id a8so7201048lfb.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020 00:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymnCoQX1+UEnlfRUosY5UkqWz5Rl16ic4atnqAGgf1E=;
        b=TSzGAA5l5QLF43fxPLXCwVQ7edav0PgyWJzpkKM81cFxyi08uGwT4SY4R7Z4bWL0XV
         wFTFaoDtlnh+oYASBIDEKAq9W57r+GKVQhSKPn75ojafgU9J0Ulr1pOqE1kDa24abJyl
         Rowr8bfapuebK5wuz1PeQB2XY3lOl0yCrlq7rqiZXRI3AenjxPB1hyxkbsFyUrRy3dx8
         NgP2Jsv4HD5IsGy0RwCvW9PTT6yR2K98ZNp/e7E052wu1YEVqW3IHP9WxBzEKFEguwBi
         1liTeusR/i0QxXB5lomW8exauCdRK7Kzl3oZRxEJOJhNDlz0rstla8Aw+1HJW5BI5ZGE
         UZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymnCoQX1+UEnlfRUosY5UkqWz5Rl16ic4atnqAGgf1E=;
        b=Wpmq+yOUqj6uuGu1n90GyOOAwyQwC+f3s3pLuy5fGFAsfRdI3g5u1oBFeGQJfD2Toe
         iX+OckIU2q+Z+qyq20jOBscfJcKTS4AOGkANfFp/jGD1syNcL6tnGsXy6Izzq41PNywI
         2bcSrQE3pVdUfF8BuYqJ2xyvuYzpXbZMB/5DvuL1ihITiT/iFwlN4kQ5cDb+sv+FVnJz
         kyqwwy0EXCa/xYJRLh0rFnq+V44wquokx3MvBKtybRVuid0IgxEPiYsdDm+XjRnnWuj5
         jtdryAnCw7jsNgCdP92Ayhggq9LOvyFqH0wxw84wyhvdB4UJgqQq7rT14v7TM9C8Oy6s
         jY2Q==
X-Gm-Message-State: AOAM532lueoTsz9fFbSslYmqbuQfb7tr1VL7JeRAf+R2AoVym0MFT8mV
        9hJ8wB0FTl8QWiygpiABG9YuRYQjUtR7U7H5acMaPg==
X-Google-Smtp-Source: ABdhPJxJH6WOiwnX0/Tp2sqcPodJNB8qgVejkevd8OIMmSe8HP3/a8RT4LZ5WXvCVLbktHHy+GWvSAkdamL7iDdA6yc=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr9319905lfh.260.1607416939796;
 Tue, 08 Dec 2020 00:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20201203182423.5499-1-info@metux.net>
In-Reply-To: <20201203182423.5499-1-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 09:42:09 +0100
Message-ID: <CACRpkdZK2epvcxezVerW3TVdLgO5sz46J8VreaAANMYw=tq+-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] drivers: gpio: bt8xx: prefer dev_err()/dev_warn()
 over of raw printk
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Buesch <m@bues.ch>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 3, 2020 at 7:24 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> For logging in device contexts, dev_*() functions are preferred over
> raw printk(), which also print out device name.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

All three patches applied.

Thanks for tidying this up Enrico!

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7938CD13
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 09:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfHNHlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 03:41:45 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36934 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfHNHlp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 03:41:45 -0400
Received: by mail-oi1-f195.google.com with SMTP id a21so2436352oie.4
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6L6QM3fOxh2PZBSqoIQZkXX8x/l20bYz6JW0mltZCXI=;
        b=bdMZp7rUBzp97xt1Ga53hfWCrlZa8B+gMxzgM/P+x051H8biao4ElhIquShI3MYd0N
         U82AW0WMmhOoNMQuUd7sS7D3Om4BLH9olYXYAr1o8zZl2Hm9cDk5T6VMAXQEx1RDGMPC
         FXp9dl/f8Ke3J6lJ4765k5RmRsO0ho7PaeG3Hm4NgtkCk1eCM7I6xwoHFyuOAkckOQW7
         RWitlxKpYop/lgpP5n5ERY7vvfw+nfDFBmLql82sB4J4n6gEEk3VRhe+912/M9+zJzye
         Y0J+iSEiU82Ut4RQFlRLsa6kk6XgLPf0zLhuDjx/5XMo5jWrVUDTNRy1hPeKPiQ+m7z2
         sDQA==
X-Gm-Message-State: APjAAAXsILtAMQlLxv/404Wtzh0VlSazFJS8i+rQRWTBu7r/E6tmUwwm
        b25eP2m3qPVZ8kAy1Ed4iP34Dyue+OPH24jWaEg=
X-Google-Smtp-Source: APXvYqwzw3DCEj6sjO9uXzC1rKe9tln90oXfWz3swKn30LwzI7/dwwj+WQBouAJCSLudH4TUSNqDnJjCS86wtJe/BKw=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr4489097oie.102.1565768504076;
 Wed, 14 Aug 2019 00:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190814072032.5876-1-linus.walleij@linaro.org>
In-Reply-To: <20190814072032.5876-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Aug 2019 09:41:33 +0200
Message-ID: <CAMuHMdV3BvS6G3yk2VnQZ80oMRmkxtjRXkxFPONjieFieULSCQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Include the right header
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Aug 14, 2019 at 9:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> This is a GPIO driver, use the appropriate header
> <linux/gpio/driver.h> rather than the legacy <linux/gpio.h>
> header.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> Geert tell me how you want me to handle this, you can send
> it with your pull requests or I can apply it directly
> if you're not queueing stuff right now.

I am, hence will queue in sh-pfc-for-v5.4.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

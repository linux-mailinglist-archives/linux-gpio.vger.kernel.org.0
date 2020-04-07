Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B1C1A11F3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 18:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgDGQoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 12:44:15 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44368 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgDGQoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 12:44:15 -0400
Received: by mail-ot1-f66.google.com with SMTP id a49so3767804otc.11;
        Tue, 07 Apr 2020 09:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9dHFjOaPMQsaSClflJCrlQoK/O5+By+otwJwygb61Q=;
        b=HIcxdrCnmWTYQrDPgWKr+Jc812n9wXD6ddP3WFlo3sM16pT4Z6P6zowTDDh4A5hJCJ
         LGM9eHvAaDdTiXYNJI6PqTHwXVNHLYeLxCPOHXxfPueVScaBRCJC7zcaZgoo3rCITZh3
         syNNOD2T6d1xCv42ox/6BvLDZwDfFE6IckNq4KgxB45G/02sbJl140L7OeWiY4ciIFKP
         7FBJnp1Tl2KJmL6pzLz03hWJ/lSsC+b/AiabbNP6TVt5qRBJzrAl6DK1nJ2MYsVS5fMF
         drNGW+0ZSaCHrp84+LdepKXfhMssFHwdgDrxLdtDblcOgDzBimf2UEiWBbmW5LruBuQk
         5D4g==
X-Gm-Message-State: AGi0PuaNpxnshSgURS2haHAQQ3E7754dn+leiDHxQEIl3cO6ycNcpsJ1
        u/Zaku/YmBqgiy8/xrZE8FY3oPt4wyFtA25EFtFstmvD
X-Google-Smtp-Source: APiQypLc/uUMJz9ICJUJPRnekoWgF51izVDvtaNrBMlK0cq68vLd0pZrBiVm2DFcsFWQ2jjjutdWum0eOj2kbLSYGtw=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr2334844otk.250.1586277854332;
 Tue, 07 Apr 2020 09:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200407154245.2548-1-brgl@bgdev.pl>
In-Reply-To: <20200407154245.2548-1-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Apr 2020 18:44:02 +0200
Message-ID: <CAMuHMdWPwG-U6H+0Nmsz7fLgc-wQDnyQbZbw_rvkMZX6E4Q+0w@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: disable regmap locking
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 7, 2020 at 5:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This driver uses its own locking but regmap silently uses a mutex for
> all operations too. Add the option to disable locking to the regmap
> config struct.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

SATA on Salvator-XS with R-Car H3 ES2.0 relies on a pca9654 GPIO hog
and still works, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

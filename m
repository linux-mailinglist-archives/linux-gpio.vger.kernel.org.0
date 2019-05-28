Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1832CBB2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 18:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfE1QU3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 12:20:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35576 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbfE1QU3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 12:20:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id h11so18326747ljb.2;
        Tue, 28 May 2019 09:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CaeAZegdDasFwjc95G/uKvMDcfaDMYkhXwy3DPb76T4=;
        b=ng1w2IzG8ir82lqCV07f8XHwfMwSQfz34kPNkbBeqd/sDam8xJsL08ogqIJYM/Vg+4
         CTf5DRFTYbWB14E0qu5av1YPYdceG2H8uW8JF9ImElw3dtU7IOhIJlszMeAlBrZhUxfc
         OQI/5SbQ8+hU2d9J/W+4v87TU005pEWisiqPeLgQcvtr6Ako4viWOWiNB4/xPdTVtAHR
         wtvGMBPZtPQNuqRuB6PeEaGpq0tcR8NV6CsQnpw6Vqidwtqhrxbmh8ctt5bWmj3jIuJZ
         qAgz9nYzrgI1LXIrZu2qffQQ4mKQTuO+GWQZGP2z5+i7bNO/BsbZh7e60s1oBh3/MGP+
         oASA==
X-Gm-Message-State: APjAAAW82ZuLUZ1eeIwTryVdh87bjGXNBGDk2Fp80KPr/Qrt7WrTzkKj
        HYnBnDUYYRLBtDQL2xSVZShub8g73xYVgsDBo9gbrCc7
X-Google-Smtp-Source: APXvYqyFXfetTm8lizbyi/LXqGUYtvfXz5fKYTa0J9CKdjL3XOIfKs8UkM7H82QnUarttI4VJLmnP0V0gdOZe4Fu3iA=
X-Received: by 2002:a2e:960e:: with SMTP id v14mr14129036ljh.31.1559060427544;
 Tue, 28 May 2019 09:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190528154601.7597-1-brgl@bgdev.pl>
In-Reply-To: <20190528154601.7597-1-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 18:20:15 +0200
Message-ID: <CAMuHMdW6cKkOHqLq_DtH-Yn9pYHwk5cLug6yjM88F3VetKC51w@mail.gmail.com>
Subject: Re: [PATCH] gpio: em: use the managed version of gpiochip_add_data()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        inux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 5:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Use the managed variant of gpiochip_add_data() and remove the call to
> gpiochip_remove().
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 383A3EFB6A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388297AbfKEKeW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:34:22 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39110 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEKeW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:34:22 -0500
Received: by mail-oi1-f196.google.com with SMTP id v138so17042335oif.6;
        Tue, 05 Nov 2019 02:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IzfnrwkMeyc93hSNQBNHnPEfXYeanr/FufFx7fnxCoQ=;
        b=ZT002xkn6GkqosctOyAxtZC3zUkYLmR1EYyiBAU01+OaZ628ZLM1vIEHrKjG5QMKyA
         Fl2fnKa0Lhe42FjdC3ekiQnOYtIMlZbVpQqfVBV7sCYWm3wzEImcVZUfTFNpQOhQOghm
         nfy18byPajuBjzKJ9Sz0C14/vhUAaaZodmcUI9eh/bRGNTrULnav2g12SSGPjC8P8vkp
         E7h0BwtP/+qb3mNvEGyhTtEyfUdU5LwBFgVtGqrDFYtjWaU6GWmghwWfCrYj7NzUuDN1
         AVyzhH1+UvY/HjA8oBCIF/fd03kx4qQRpEHqgiamq/ujE3/JsNP9+lUBkeJ3hzJEUDAJ
         +8Wg==
X-Gm-Message-State: APjAAAVJJ4effBghLR1pMUin0bkcMZe9nDhZ+0ixnKAS34ONJSZa1hxj
        nzyqtg5dH9xVnHB3NFLvk72PiYSq9q46j5F/SKA=
X-Google-Smtp-Source: APXvYqwe4Pb9xkaXXJR4FYlmpNLRzZYbEcrK8CNbjm/sFyZu0DiesJrfpVh/kY6zqWc8hG7rVS2AuusfJqyo94qCBPE=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr3165011oii.153.1572950061048;
 Tue, 05 Nov 2019 02:34:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945644.git.matti.vaittinen@fi.rohmeurope.com> <208e7b0c1d8e282cdd91d3d31f6c2054b45032fd.1572945644.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <208e7b0c1d8e282cdd91d3d31f6c2054b45032fd.1572945644.git.matti.vaittinen@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 11:34:10 +0100
Message-ID: <CAMuHMdVpiZL2dzLzKXhn0EsDcWc5yCnptRLrF2T0XcT9skUWcg@mail.gmail.com>
Subject: Re: [PATCH 05/62] gpio: gpio-74xx-mmio: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 11:14 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22454EFB5A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388474AbfKEKdJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:33:09 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41952 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388266AbfKEKdI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:33:08 -0500
Received: by mail-oi1-f194.google.com with SMTP id e9so13155970oif.8;
        Tue, 05 Nov 2019 02:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ukUHhvNGQqvmG4eGCAHCkMwRykyubD0S2o3VspHRejs=;
        b=VumLHQ9cAcUgIOUJrx9QWn2UgjhFY0dDl9tzp9cY83Ws1s/op4KqtaaixFO8AV96DM
         T4rjRABDiISbsyTSe7ODlJYTSDgkFkF0I5Crn19ZHz0qNyGypoWSTFjnTGUk9erc452N
         zR6drcW73ga5m0o/290quYFxrpIzbq4CeVc4Tzm6bpzMUMA9TFQa7izCYtxgAwg1KOjs
         WY+vLI8zPmWKYoEvGwdCz3O5El3frE/9p/MYtmVqTP4TYxfkxCakq+05+UUL4F1odesW
         CKQwa3WBAgfGI4w5YxRLxCWh2QCKGT0hM9tuS8kOY6QesHGqATMfvpIkT+OcTDW+UDKY
         u4bw==
X-Gm-Message-State: APjAAAXQRbVYtvDpL9sdarqL+7WtJKGclJQL5sa1k4l9NxeUlEyEnaVN
        wp20lWUZEhfDoBrZtIcrstwalpDCxyoTOnNmHHM=
X-Google-Smtp-Source: APXvYqymKKcMRTc3cVgZqZ9mlkXuveJh7q2A21b6HeRVE1Ig00CeKDfsz9HzRfRTyIqrxE2V6vLEbYl5iYeP2GF5Lmg=
X-Received: by 2002:a05:6808:60a:: with SMTP id y10mr3504041oih.102.1572949987922;
 Tue, 05 Nov 2019 02:33:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945867.git.matti.vaittinen@fi.rohmeurope.com> <326a9336a621d0434adc54f4742c8bf5cc7055a9.1572945867.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <326a9336a621d0434adc54f4742c8bf5cc7055a9.1572945867.git.matti.vaittinen@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 11:32:57 +0100
Message-ID: <CAMuHMdWC+DUo2NnTQQKkAfnd4Xf2d51e_2Q8AYXKM9_hSoYucQ@mail.gmail.com>
Subject: Re: [PATCH 32/62] gpio: gpio-pisosr: Use new GPIO_LINE_DIRECTION
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

On Tue, Nov 5, 2019 at 11:27 AM Matti Vaittinen
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

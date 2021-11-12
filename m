Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED5944E81E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234199AbhKLOJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:09:25 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42725 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbhKLOJY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:09:24 -0500
Received: by mail-ua1-f46.google.com with SMTP id t13so18990409uad.9;
        Fri, 12 Nov 2021 06:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zlta2e0Kmh1OEmvd3Ns7gc/huQsdwkVywjp4rCDaKvw=;
        b=tvuVggLnq4HZ3iCRBdFIqZcL1+Ba73m9doLMozIvbRtZC/EN3YS1JRO8u/gC5P7mdJ
         iNIzOofJcu7IK6RM/b/Q8Z2DkLpqP1aNj3xtJbcWRoGVgi7rFOT6ZvJg/sxITOG7jP9b
         qbMrkI21I5MuX03jNItnatQLfmtQxvgCfehFuBrf//Y0hTuUGuQmHrUhjhFIYL2QRmlF
         R14033zPnIp12Y38v2mRU+amLfkQuCaFBtrMcGZsvhGbjOMQLQqhV9Cpdb/J1e8UEtcT
         ShesqXFCcr9TxxZRyV1HmzJCoPDfMA9xT2lYFxRGxopJMoYiE8u5zN6Bx56Zu2Vd56Ke
         BkiQ==
X-Gm-Message-State: AOAM533q6Ey4nOEbia7o9t8QPPbHfXjIwWVCD/8O50HxDeC1YYw4UVKw
        mnFUlN8G4jL3o4CNdywrmAP6JEXhbDujow==
X-Google-Smtp-Source: ABdhPJy6A+92KiyJNAlg9fiRj626xsjOpMPj6yt29O346KA1PBWTIrkPr/BdMmCtFhUX30DOcmBLBQ==
X-Received: by 2002:a67:b643:: with SMTP id e3mr10408104vsm.33.1636725993358;
        Fri, 12 Nov 2021 06:06:33 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id n3sm3986610vkq.6.2021.11.12.06.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:06:32 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id ay21so18977815uab.12;
        Fri, 12 Nov 2021 06:06:32 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr10590939vsb.9.1636725992447;
 Fri, 12 Nov 2021 06:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211110224622.16022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110224622.16022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:06:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGeuabyQPYE2JPMzg_Kt0r-MxFr62SobQNLzFoWLo=8g@mail.gmail.com>
Message-ID: <CAMuHMdVGeuabyQPYE2JPMzg_Kt0r-MxFr62SobQNLzFoWLo=8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] pinctrl: renesas: pinctrl-rzg2l: Add helper
 functions to read/write pin config
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Wed, Nov 10, 2021 at 11:46 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add helper functions to read/read modify write pin config.
>
> Switch to use helper functions for pins supporting PIN_CONFIG_INPUT_ENABLE
> capabilities.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3
> * Dropped duplicate masking in rzg2l_read_pin_config
> * Dropped port_pin flag
> * Dropped spinlocks around read/write

You do need the spinlock in the read-modify-write case.
No worries, I'll add it back while applying.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

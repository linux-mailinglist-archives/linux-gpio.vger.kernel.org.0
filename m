Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0086516614
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 16:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfEGOyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 10:54:31 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33214 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGOya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 10:54:30 -0400
Received: by mail-vs1-f67.google.com with SMTP id z145so10569813vsc.0;
        Tue, 07 May 2019 07:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPX1bA70OpjfsOSON+iKXddSP9ZQtnXso2oNmufNBaM=;
        b=ZyWcuEj0vgQUtuDgbccfwK8xWfBVSh6BxYfEY2OJDFZEwGrH6ajvS6aASMuzjumwHH
         w/Y88dmzYEbzPTqNJd2RLeyZgsa49kyq6epAGNckCkGRL7HDRJSBbPWbVlgr6r8h1la7
         kTtpP+z+ZYZpp57PFZEe0a2k8yCUhTYzFs8aS6byZJYsibMxFsj8LlRfYe/6K1xvkKzv
         Hao5l1UqdlcoFC3rCwgLP0pvvQ0nktaxiDCIOGM7AnTtKKM8tEJt7RxXuZBg4ovr23bP
         m1ZxZOQFk6BQyMJIyCYbuiJz4QniqjPLrQAjQA353RTOeZ/SWszROfCGWYYCNZtRpZNw
         J0Pw==
X-Gm-Message-State: APjAAAUg/kdELSCjEGAH7Cw+OqLejGxtP02THLcSmawML4ERxVwSMKBY
        j4Hwd9yjNj5SxXGs5sl7xqFywRFwfa6Xdu7dgI4=
X-Google-Smtp-Source: APXvYqwLsxPOVIDjLlCmvwkyoBn4lKzFI6xI9wloL0ckxyUi2cccejXAdB9dxiOloi3+tZxrZsyOtUDrKTB4d/SqFvg=
X-Received: by 2002:a05:6102:406:: with SMTP id d6mr10027633vsq.63.1557240869907;
 Tue, 07 May 2019 07:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190503094926.12208-1-geert+renesas@glider.be> <20190503094926.12208-4-geert+renesas@glider.be>
In-Reply-To: <20190503094926.12208-4-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 16:54:18 +0200
Message-ID: <CAMuHMdVwsghkR22QBfZTBswsr8sSQvoEiiRmEO22Wevqpzp6Pg@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: r8a7796: Add TPU pins, groups and functions
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Cao Van Dong <cv-dong@jinso.co.jp>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 3, 2019 at 11:49 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add pins, groups and functions for the 16-Bit Timer Pulse Unit outputs
> on the R-Car M3-W and RZ/G2M SoCs.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 42 ++++++++++++++++++++++++++++

This is embarrassing: how did I manage to forget to update the .common[]
array sizes, given I added all this extra validation code?!?

Sorry for that. stay tuned for v2...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

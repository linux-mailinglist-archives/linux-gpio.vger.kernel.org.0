Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FEED3EAD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 13:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfJKLqO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 07:46:14 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45367 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfJKLqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 07:46:14 -0400
Received: by mail-ot1-f65.google.com with SMTP id 41so7667084oti.12;
        Fri, 11 Oct 2019 04:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=juzV2eSp/H++DwK4H0Bphy8wWrKxuELOEBeublEi6po=;
        b=HasfCzUE+Q/mtjS24nGWEqpouO0aP5vrvarkVTtXoWIKtksVMPCjBuylPHN0SyMswT
         buCgK5J/BjQEMsAZ0pklLKUJmwlASr608Kub/Q4yjidJGu2v1Gw1QRwG9IO4pxD2gJk2
         QbZ6dCCsRVAc/QdCw+3dGyGPuZC5yEes0smMov+oIWr6q0iLAulPrpIJFuj7BnbTcPv4
         By6E9RdMYHThNGCFE0voKzWe/JzBNj1DQEYRbT0e6B9/4NfWUZefb4I8g5WbleJv6Iht
         z2aXZ2D14wCGBOBf0kzMnsMVBuEJI0KgQJMB5/cqQx27KUlnwMDg2GR4K5ddKdzpmLlw
         qNAg==
X-Gm-Message-State: APjAAAVSOu9vnrdfP71xAx4PMNj+tpxa6EL1ZzdlDJft/t+rH1ie47Ed
        +m1tCQKfF5Wd951NJ1ru6BQMA4o14L3tJ2/tv1Xf+ROj
X-Google-Smtp-Source: APXvYqwmLjg8XGGh3E8+Mly0taJ/4b0SinKvjRPp3H99ZSjUxE3pQ9sqJWUF3CcbyUMTKBW3gKROkBPCZpbSmkASMqE=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr11385266otj.107.1570794372939;
 Fri, 11 Oct 2019 04:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191007140559.11840-1-colin.king@canonical.com>
In-Reply-To: <20191007140559.11840-1-colin.king@canonical.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 13:46:01 +0200
Message-ID: <CAMuHMdUYvNaCYHDK_=HnyyAKa4Zqr+0xe0QnO0KzKpZws4YsCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rzn1: array reg_drive static, makes object smaller
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Colin,

On Mon, Oct 7, 2019 at 4:06 PM Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the array reg_drive on the stack but instead make it
> static. Makes the object code smaller by 32 bytes.
>
> Before:
>    text    data     bss     dec     hex filename
>   31991   15696       0   47687    ba47 drivers/pinctrl/pinctrl-rzn1.o
>
> After:
>    text    data     bss     dec     hex filename
>   31863   15792       0   47655    ba27 drivers/pinctrl/pinctrl-rzn1.o
>
> (gcc version 9.2.1, amd64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.5.

FTR, on arm32, it saves 64 bytes:

   8594     148       0    8742    2226 drivers/pinctrl/pinctrl-rzn1.o.before
   8530     148       0    8678    21e6 drivers/pinctrl/pinctrl-rzn1.o.after

BTW, what debug options do you have enabled, to get a binary that's
more than 5x as large? Amd64 code generation can't be that bad...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

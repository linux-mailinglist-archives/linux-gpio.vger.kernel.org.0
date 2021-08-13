Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14ED43EB33E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 11:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239179AbhHMJQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 05:16:22 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:42883 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239035AbhHMJQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 05:16:21 -0400
Received: by mail-vs1-f42.google.com with SMTP id k24so5781117vsg.9;
        Fri, 13 Aug 2021 02:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCQ9uXbTrQHU/iDHOCGr2LIgoLj89U2ek51LwvC1c9Q=;
        b=Th8eB53I78lc2TdtHDg6govBDu+I7Iny+xM/BJyGj3QKC4fYNqPEX15/xHXyRvtiBc
         mkbZssFWyKWrj5mjjYKo7VKa9uLGnnnSAzUymiS+JdyqVwEvvKhszhJNg/q4rvXfUhxa
         gIWq7o8LCg8S6p49otBKzXnhWieEcerCoEpWb1RMRGwrsyPTLPOtBJtwBAfpmJpJ5RRz
         /2rA+EezUhXG13LyqvkckCj0vYfmun2QglssdVG+XRjN/JOJuw0M00AzI1jpIrAMq2n6
         lvsDfZS4nHnoEZCgEbGzGZ/Ah1PTBPqIgthlrERrswlnrDUMpRM4kZzIC4Vzeytjwkl9
         pIDw==
X-Gm-Message-State: AOAM5335b0YcALrBPsvnbBp2foZYKnEzglpGAzRUBqXa2Ce9Xnuxl8hu
        97ZXHppgdlD6yV7Gpw8eQzH9PtyUGnps/JNtkweWQxEOGBM=
X-Google-Smtp-Source: ABdhPJyIZkIzdLpu8aBEF0dZmhbgHM8CuPZ2+9KJELjMvZfjDw3jnJndhBWm/YCGGa/sgxiGgGft1msE3bNDWX6yQHA=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr665899vsl.9.1628846154669;
 Fri, 13 Aug 2021 02:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <1628840413-21880-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1628840413-21880-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Aug 2021 11:15:42 +0200
Message-ID: <CAMuHMdXHFYLHXcTLPFeJwDEKu1PGwDq0A5w0R2U8P4BsVksHqQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Remove unneeded semicolon
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jiapeng,

On Fri, Aug 13, 2021 at 9:40 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
> Fix the following coccicheck warnings:
>
> ./drivers/pinctrl/renesas/pinctrl-rzg2l.c:1124:2-3: Unneeded semicolon.
> ./drivers/pinctrl/renesas/pinctrl-rzg2l.c:1114:2-3: Unneeded semicolon.
> ./drivers/pinctrl/renesas/pinctrl-rzg2l.c:1080:2-3: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As this fixes the top commit in my renesas-pinctrl-for-v5.15 branch,
for which I'm about to send a PR soon, I will fold this into the offending
commit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B001C363D7A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Apr 2021 10:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbhDSIcA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 04:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhDSIcA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Apr 2021 04:32:00 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE120C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 01:31:30 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id h15so5012720pfv.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CofomMDhzLby6jKPOdJPCFtVEilhHYlHNh+ABC13Dc4=;
        b=HRlxRoH3IzaYwe3LI1zmqVY9HY+Vu+PCTuOgi9FZTqvGbKVNwNN95X/yMqHaXJ8Z0+
         hz2IuChL/5IpS1BReEFHh0jv5FG1Fgl9e3DWEGP1jyi+tUYFx4NWcTpNm+DMYJvGqXNb
         TztXR5Pm/Zy7gxlfvYVbGRpUWgDuurdFi0bItAkTrERdXsDMORcj8cjVFOg1oAMnGLaF
         2J4vHv6oy6z9HMNWFE3Q0ptnznybN/bgkcN1fuotd1jLBQaSSbvv0UTZbreLPUx95w1C
         uxmN/cDRkJLzba0wsPEKbaK6XLswEYqQGiWOoI2HkrRMRfPivPn0pOS2CKk0jkmMMR1t
         CMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CofomMDhzLby6jKPOdJPCFtVEilhHYlHNh+ABC13Dc4=;
        b=MLH/PxgYNoUdYqF8tD5j3f+TgVCuqupBRX4Up9cPsag2WTHYjubgAWlhKbT/wmbFvo
         9NIFkZyLJGStaV1V5Bx65Pw8/wjhABwH/Qy8zROJyULO9Xr1nstrVyI8yWw3NOTrWiFX
         EiuqPuNkvMOzW49XU/qwHXOTlqfiwaUp8pWcK9pLAJtRUUzY8MH7JVm5d6YvyE7XSOr7
         qAYb8cPGZtdwBKLONJTvCmv/JmaBIlOM+AUbGvPBhrSdrIFIl1a/V2d8w1c5UMds7xZw
         +HIOC4UwE0aNFE64zcOI8RSffdtOYxMHk/HxuzWvMsjDYchohrFLFhK3cE8LQqMN5kXG
         cqWQ==
X-Gm-Message-State: AOAM530T4UPSBOAqvpMj2wSAo2ZiMIKsvhKrsuSE+y3+MSbR09z72VGO
        jTuWmeFXDqxuV3E+Uvw1kGnFjU37+FlLAF6Cezo=
X-Google-Smtp-Source: ABdhPJwEl51C2UnztCvtSzBm7xf7+4nT14qMIMlvBAqjBTvaTum9itzOtu905couqLeG+9FMN+5vak02Ac6xffS2hoY=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr10857045pgi.4.1618821090400;
 Mon, 19 Apr 2021 01:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210419052136.2475373-1-tzungbi@google.com>
In-Reply-To: <20210419052136.2475373-1-tzungbi@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 11:31:14 +0300
Message-ID: <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     sean.wang@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 19, 2021 at 8:32 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:

Please, shrink it to the necessary minimum.

>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   mtk_hw_set_value+0x100/0x138
>   mtk_gpio_set+0x48/0x58
>   gpiod_set_raw_value_commit+0xf4/0x110
>   gpiod_set_value_nocheck+0x4c/0x80
>   gpiod_set_value+0x4c/0x6c
>   max98357a_daiops_trigger+0x8c/0x9c
>   soc_pcm_trigger+0x5c/0x10c
>
> The max98357a_daiops_trigger() could run in either atomic or non-atomic
> context.  As a result, dmesg shows some similar messages: "BUG: sleeping
> function called from invalid context at kernel/locking/mutex.c:254".
>
> Uses spin lock in mtk_rmw instead.

It's nice, but now the question is, can you have this function be
called in a non-IRQ context concurrently with IRQ accessing registers?


-- 
With Best Regards,
Andy Shevchenko

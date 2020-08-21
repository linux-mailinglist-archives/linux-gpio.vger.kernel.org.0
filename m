Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD8B24D6DD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Aug 2020 16:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgHUOCj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Aug 2020 10:02:39 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:46672 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgHUOCi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2020 10:02:38 -0400
Received: by mail-oo1-f66.google.com with SMTP id r6so357017oon.13;
        Fri, 21 Aug 2020 07:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F1tCqikcbZlp0aqbufpv2W+EiiZZkUbAxJk2MJtuyVU=;
        b=YYsHYxuSBI3fLmWMs6HYsY3+fEkDqxSmlVbAdEsyKAOAROa5KLcfHdII7f3sQgSMAC
         R/soyGEYB4TbN0l5RlZFNbHQHfTHpQfU8RcGtFwGNfJJxER/PUvLy7ExPfeIgrniPILb
         TGLQAMSjz3BAXvW9ME6qLD5M5qF+qDpyuyx+YksqGXufKCvF56YfFayevh2JSMq//YWf
         LfC3dW2xskb/3a6aNo9A9dNb+dN2xC0sWDvVteqQwAYmMWcN92gbzB2v9BqDLAkjSqhk
         wKf33p8gZtUM8R0BmfjvITIOh8TF8Si3coRPyYUzLfA3x2c0DaRxmCqpFbOkD8rzyPkc
         PWTA==
X-Gm-Message-State: AOAM533htZtJF13kgB3JHKknS9zHD6RKzjU2lEqwVrCJj853iqAu2K+T
        5y2qus5sr65PFBfhDpvJTW+c9fJN/jHJz1Pw6xhKxJq9
X-Google-Smtp-Source: ABdhPJxue6DQPvKVrU/e1TBecQe/t+Dvxc03oxJM64FxUQ24R0PteEm2xE6Ib2UetgbKYa97kaQ6oQW+W8lRdwb3NlU=
X-Received: by 2002:a4a:275e:: with SMTP id w30mr2182486oow.40.1598018557384;
 Fri, 21 Aug 2020 07:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <87r1s5hoht.wl-kuninori.morimoto.gx@renesas.com> <87mu2thoeq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mu2thoeq.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 16:02:26 +0200
Message-ID: <CAMuHMdUveTPg00aRTM8_KczCAX9AYixy+M5Jf8nAV_p8pN0F+g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: sh-pfc: sort driver description title
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 6:46 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Some Renesas drivers are not organized, or organized by Chip number.
> Because of it, menu table is not readable.
> This patch sort these.
>
> This patch do
>         - Collect RZ/xx in one place
>         - Collect SH-Mobile xx in one place
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

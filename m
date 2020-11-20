Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87EA2BB4CE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 20:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgKTTE4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 14:04:56 -0500
Received: from mail-oo1-f68.google.com ([209.85.161.68]:36294 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbgKTTEz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 14:04:55 -0500
Received: by mail-oo1-f68.google.com with SMTP id l20so2443438oot.3;
        Fri, 20 Nov 2020 11:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZA3+M/VVNa3SUOOY7jLzWKoR84YmwgaI/DsfKj9aqU=;
        b=HyP61hAt5Gr1OI2qdLLxiKGqwV9lUi9d/01uaGzaLMzXyXOFr/YthCzrLu319gAVZM
         GS6MUln4+kyelqx2jXJ5kqjiTVihvp6rzbBqhJ8xO7LXUoN9jf5+mCSktW+ZrGU+yc2O
         Y4C7JrzhABx2HzK1SV3HjRuWq6gpAXKtGsePM2UrX5WyVyKp+qk5Ej6F+QKdLp4FXFTg
         PWXJWEogyxyjGN/3anO4Y1geUlvrR4UaMBBytWaPXhKjvLUMgr+wNT20Mkz30yYZE98r
         2Vm9vUo55MWu43QuX2QYn0bhv2pzFiKfA4PCfJq79S2kqxN3aUMVjgMmkaXZOBqGZL0z
         7l/w==
X-Gm-Message-State: AOAM532nunou55uxjN3NviRLaI4mVAPfpPcD70N21wVcVBvKbE88ECE/
        XTGtTyMlzG6JMkDyz8s+42o5METrWj2A4uLP0Pc=
X-Google-Smtp-Source: ABdhPJwl/mRWeppvi1dwTiN5ioQWhB7KWKxlwUdKmlSbCN3evBAbGlx0526M4UT3y5zLWSFcqAWi5nCCaq59k6y+lv4=
X-Received: by 2002:a4a:e80b:: with SMTP id b11mr14876540oob.1.1605899094394;
 Fri, 20 Nov 2020 11:04:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <da20103af0c22424c5d08a12f7107771bf4c01c5.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <da20103af0c22424c5d08a12f7107771bf4c01c5.1605896059.git.gustavoars@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 20:04:42 +0100
Message-ID: <CAMuHMdWcooXsRULUVwZR35z=2fUN=5pJoV9arAK+baWCz8ECjg@mail.gmail.com>
Subject: Re: [PATCH 049/141] pinctrl: Fix fall-through warnings for Clang
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 20, 2020 at 7:31 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

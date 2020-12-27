Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3AF2E32EB
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 22:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgL0VWO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 16:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgL0VWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 16:22:14 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4945C061795
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:21:33 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m12so20052643lfo.7
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S705wJ8jeaSFVbMX7bL0WkIpIJX6/PwuZQDPsUKEpLs=;
        b=npHMd4OCN05Aebn/ekZGqwFyJ1W9GvnSHfl8tutjfMfvJndFGLG23HGXzPHJNsTix/
         2W2teMq12gH0ym4ssei9zcu8+07nbjToAS5I/g/DRlt98SjP9QzlkF5gLRbU0NGP1NPk
         gkJoWn1KPRUvtySlLhmsyabmwH+prgFWVsR0xUT64NWbJi0ZkVNj95WH4vvfPYEohweO
         Ssxm6v4jVu39NV0o9hthCfLIgDZ38kO3ibXLG+ZdtFJecbPPRbU+c+NphExJDywi4xVr
         jBwoYuV0dFxvlcROwZXEnpcq2BAICNYmQ+t+1apyvHszRbV2vjbauJC3E5pnL34C0yOI
         7aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S705wJ8jeaSFVbMX7bL0WkIpIJX6/PwuZQDPsUKEpLs=;
        b=HdDWpi2+96p9hHYUDdmjxjY1fmELntOc/Qd6tiUgeEm7MDlx0qfuNRuGILxFQ9xiAC
         GuQKyU7+wf2hzXCOlGSGeeL01RnEUMu0IdsLSEf4JvYR8RQZRizh9nfRM1gggPmmrlZI
         YL3dpY0sTdsyIvMhzdzppiWdajvYo61i2U+OCqSex9eRx2pOBvEjwun0ISZF1xn8gawl
         uvaZW2FOGNSc6dRtDqHf1sEDHTKwXJfnkzGsKFFW6mNA+JRyhX+b/t9hAu9hCfqKKnJj
         EYIrIQXM1M9fUuZkLJGPxF9h+zm1vban91FpJQM/bU2+/DZv+v6oonhSQM0Bmx5U8xQV
         DuzQ==
X-Gm-Message-State: AOAM533emfxIXfp1skdMxyVnyhxa7EFzVTwLHUPnjJc+v99Rq9ldCQEO
        G9U5e3nR4nXy9zR4Lrum3BdbIUz0KydjIJAsNEzwEw==
X-Google-Smtp-Source: ABdhPJyc5EvZMaXo9k3+9/F9vBkhZsYE4IIEsTdjHaoNVq54awShCgL52rci+fH6v5fD8AHlPDiRrxBtX7V1KO90xyk=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr21635698ljz.74.1609104092057;
 Sun, 27 Dec 2020 13:21:32 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me> <20201224112203.7174-3-nikita.shubin@maquefel.me>
In-Reply-To: <20201224112203.7174-3-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:21:21 +0100
Message-ID: <CACRpkdadUVHefag4d42BJiOraAmHrXDcK7gzjZrLXn371rMwOA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] gpio: ep93xx: drop to_irq binding
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 24, 2020 at 12:22 PM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:

> As ->to_irq is redefined in gpiochip_add_irqchip, having it defined in
> driver is useless, so let's drop it.
>
> Also i think it is worth to give a gentle warning in
> gpiochip_add_irqchip, to prevent people relying on to_irq.
>
> For example
>
> WARN_ON_ONCE(gc->to_irq,
> "to_irq is redefined in gpiochip_add_irqchip" \
> "and you shouldn't rely on it\n");
>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Take out the suggestion in the commit message and implement it,
but I think WARN_ON is too nasty, just use dev_err().

Yours,
Linus Walleij

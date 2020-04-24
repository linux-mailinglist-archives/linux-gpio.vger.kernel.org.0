Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252D81B6EEB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 09:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDXHZS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 03:25:18 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37271 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgDXHZS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 03:25:18 -0400
Received: by mail-ot1-f65.google.com with SMTP id z17so10843285oto.4;
        Fri, 24 Apr 2020 00:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G56N+TqoA/ZfPrftZPRH6Zx1EcgCba0QKfRtB0JtMEQ=;
        b=pyUcEazLKQGqEN1zcAmoABZhnCH7NhD3cOOgfiX/4+j/1Mabgqo22jKwtG03gCGjG6
         ewa6RXsmWSdtHMndERkJIXevGqm+EMCZzgLQtaHkiL9SZLhk8PRfD6DybqIyP8i4qdqt
         iorky3j0g+eHexF59it5yaNGJnFXV5Q7x9GrNxozbxlKztG3h1TzTrAvPjnYeczBxMFc
         QZfb7kV0+DVk8hwvkdGX44NplFOCX4i35lJz1UT9TDdLMiaRteudR7oH0UdtuIdNKgcS
         JhTRljz5pq3Wje1HnpkCFZs7eRHuGi/KypDYoc9h1d/lsvaXB5a3/1xt5L/bJEcRK61F
         sYLA==
X-Gm-Message-State: AGi0PuaySIG9K20Xx9U4sDX/MVxkDBvFg0jCIULWW1R9fev25FrDzFZ2
        za40h+GUUyLObowzOIwZg+o3nehfdpyZDyj7Ww4=
X-Google-Smtp-Source: APiQypIhWqol/yZezLeKzfzh2UVatDdylc6kjCjORRt+TpYoZ4fE7RyhuPOWdo9CtvWr6dBCUmvB1oYEZOAREiFzeeE=
X-Received: by 2002:aca:895:: with SMTP id 143mr5789513oii.153.1587713117140;
 Fri, 24 Apr 2020 00:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200421142402.9524-1-zhengdejin5@gmail.com>
In-Reply-To: <20200421142402.9524-1-zhengdejin5@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Apr 2020 09:25:05 +0200
Message-ID: <CAMuHMdU01Mvfo0jO6bgzws94ELtA6MfWDmjn4H4x8B+Jgi=+sA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: fix several typos
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joe Perches <joe@perches.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 21, 2020 at 4:24 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> use codespell to fix lots of typos over frontends.
>
> CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

>  drivers/pinctrl/sh-pfc/pfc-sh7269.c           | 5 +++--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

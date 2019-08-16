Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C36B8FBFD
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 09:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfHPHVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 03:21:16 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38203 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfHPHVQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 03:21:16 -0400
Received: by mail-oi1-f193.google.com with SMTP id p124so4145181oig.5;
        Fri, 16 Aug 2019 00:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woqYnDK59hsaM1VecGDsyGircWRpLqgX78M8A1XNKAs=;
        b=Qww305Lxmt1febaJchUig9tIK96H9vpZJs6q2pe2TCIx0o938xiWazMCPyxuKCPt2u
         iHYrsxm2VY41npk38AFvQO8FNig7HS8FFGOMsJSzLP0kP3+d6UPfTV+Yl+e1GaH5rEYk
         6qOzOSLWKLvSwE9DlP8RJa/dcP2aFp/vfNDJxWSZu+z0Dlmy+vuAw+1uanqpKl+8qHE6
         Ji4MeIJAUZPgA5SNqHSGqLUnWpE8nVxuQPHjT6/e6kux7H/4xLH7rtSDx/ElAdQYRAlm
         xflEF1vvNDIcs8sdfC/g6GS/KLybG+R4KAUVvz7SHpJLUSi/Ps0P0pmj7yRzdMF6tvLB
         Xrpw==
X-Gm-Message-State: APjAAAWTkYYZfqk70wTzgw/yttSmMhgLbrkxA8opEAg03QDGydBSEJNE
        uR63l+Yui96ohi/PDYneJZO1YicHXrQZQGTliu+Q4A==
X-Google-Smtp-Source: APXvYqwExJ7Mcu0c6m5tuqNT0w2ZW76mh4LoKhe4X8SJJxV7zxELGerz1ZUyUmUFGRshMXqJxoI+kBhB69ewMwLzmQI=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr3857756oif.148.1565940075410;
 Fri, 16 Aug 2019 00:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190815060503.2853-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815060503.2853-1-nishkadg.linux@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 09:21:04 +0200
Message-ID: <CAMuHMdVJSR=WrOMJRhsjx2tLh9tQF0HS4QioPJjrAxjO52jq7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza1: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC Jacopo, Chris

On Thu, Aug 15, 2019 at 8:05 AM Nishka Dasgupta
<nishkadg.linux@gmail.com> wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> three places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

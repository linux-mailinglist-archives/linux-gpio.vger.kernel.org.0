Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686E13C714E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 15:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbhGMNka (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 09:40:30 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:41634 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236222AbhGMNka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 09:40:30 -0400
Received: by mail-vk1-f177.google.com with SMTP id q124so1732291vka.8;
        Tue, 13 Jul 2021 06:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ks+aQKe2+n4Zk0Ta4yhtI3Gp8O8SNuAgjxZAciGA2PU=;
        b=QxbfGksVo9mep89bil9LSDVB8K2B9KKcFKa+EXApU3ZWViA6CAT/ZgdPzDIvxEIKjw
         WVWh/gSP6Zwfs6Np+El5G41d6pLHHSA30Usa41TkJRzGIvTlBwBn71grKr2pj3N1oBza
         j0paunip912RjjPABfcKvSlkrFQwFOqi1+zUgOmfFOvn+rp+RPpdwbo5j09OQjnC5GGv
         E2DRd3ef79u18KjiUzaJuneRd/BoOAiMew9AosEoYvhN3SR6NP73iOkylm8cREOGtI/n
         xqXtIgRJm9yaAwD/L+ommMy40Vsx584XJ39+tJw0mmORW0xtAt8gDeiXjG+LY9BbZnLk
         m5vg==
X-Gm-Message-State: AOAM5314fmwtzQok8pYBT75b8JqXjcFRHolQC48c/5QnOI8WPp7/zB6C
        vXkJT9pWfHFYvPJ4To5lq6G9RpbP2FPF2aGBGMY=
X-Google-Smtp-Source: ABdhPJzbX0h4Uh+m6cq4jAo57sstkGWVD2F8nZ8RsWP64JZ3iNA/azYn/kT1fRyfpJYji4mRYdsYPVQZmFe18hOGedk=
X-Received: by 2002:a05:6122:b72:: with SMTP id h18mr5122218vkf.1.1626183459647;
 Tue, 13 Jul 2021 06:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210712194422.12405-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210712194422.12405-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jul 2021 15:37:28 +0200
Message-ID: <CAMuHMdX4bmJgtESAM50n7XbphG8BTJcC7GrDSQ+1LFrQMQpgfQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drivers: clk: renesas: r9a07g044-cpg: Add GPIO
 clock and reset entries
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 12, 2021 at 9:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add GPIO clock and reset entries in CPG driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

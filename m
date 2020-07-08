Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140E521867E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgGHL4t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:56:49 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39005 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbgGHL4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:56:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id 18so36679194otv.6;
        Wed, 08 Jul 2020 04:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dpcugomj6AYMYKtNzodEy+2KAlXlgaT4b5NSGKQ3XT4=;
        b=OGKGdtP//Y/fEblGxW1o42HsofHy98C72R6nQJLou9DPq/C6wbGDW6i668jN+AsF6z
         1IVoulc14TGuvaNWRH+b5EEpEgvq0CdoKM2bmqnyyedju/Cr5wIAcRp+j8D3i5YeTkkl
         gBXbnsUJcMbFWmN/hmtj/i9o77tz0ANjw716Z2nVAjlIDXppWMkJfElF/iDhmPmYghfo
         nE8tUtEdm0UmGfo4JstF7BGFyZbZE2GsEImj0XC8unnyfIKuMYJOq1cR4Qwfv/ccOrZB
         p34uka2ob2P9jDcUNL5PbyRbHzJwrwdS0nGRkbqxCYityq4cFnkCQPe1fnkvn6aJDsYc
         3sgg==
X-Gm-Message-State: AOAM532zUcbdAPW+7zVyb6b6v3EP+EDmh01gw4KHeUZB8/zR+L8G8d33
        DtWVT9po+XQHGE7GbDdcKhZDVn712pogagxpCxE=
X-Google-Smtp-Source: ABdhPJwdQ4P79u5T3r90DuVhOcAJF327hbBgjsPu58W0mp2gbxlTAv3GZJlx898xJQ9TgmXpvt4cbd/rRi6aPnqabaw=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr37145375otp.250.1594209408609;
 Wed, 08 Jul 2020 04:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 13:56:37 +0200
Message-ID: <CAMuHMdVZLMh=YnFaheSC=rhLn4_LMoZUVy4KPaHj-=jHqyt0MQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] pinctrl: sh-pfc: pfc-r8a77951: Add R8A774E1 PFC support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 6:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Renesas RZ/G2H (r8a774e1) is pin compatible with R-Car H3 (R8A77951),
> however it doesn't have several automotive specific peripherals. Add
> automotive-specific pin groups/functions along with common pin
> groups/functions for supporting both r8a77951 and r8a774e1 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5254D44E82B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbhKLOKy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:10:54 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:44910 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbhKLOKy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:10:54 -0500
Received: by mail-ua1-f52.google.com with SMTP id p2so18986587uad.11;
        Fri, 12 Nov 2021 06:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4DOuw4nyHs7hU56f2iCja0ZDfqiThTsFxVnB3zDgPfI=;
        b=4LnniHzYEiWzM8AgiF/nfTT1kDo1RJgnR1nFUQCHjYn/a3+NvKi8RGpt6TCfs+jCZx
         TJ8u6aetLIKmPQwLA8m9pYPVNSuABJiaQYRhex1XZXUn67pVKjwg63rSKdKQluAPzEWp
         H60iiCsN9ibGyB2yeeARqyuGMpvvxbU3FEUEHu4R3ZBJ1qbt0diBxrcfTVdBXIxupAUK
         qXc+SPojm/CS2AZKqnqlBrvxhRbqH5ADw0i8w+IGho2GjylNVHz8V9wBNQtS7RGPcaGI
         85qciRvq19mb8yqHVVSeYcPwv7N1y6yn0TPVa4tkFBpeUPQybXJtAmM1+hxxvv2f4M+3
         pYYg==
X-Gm-Message-State: AOAM532xIb/CocorU1GA8qwaq4QL7Blotpw/ayb3yG9HiNSg9t4sGJB9
        WNmub9GbN6mm6QRtP03JtUx949IF5cTX6g==
X-Google-Smtp-Source: ABdhPJz5KGNJrVdAXKI67Z4d66322skrJGUdEoTkkyYUJMVGUF+dtI0zuGNceNigS2DkLchS90nUuQ==
X-Received: by 2002:ab0:3813:: with SMTP id x19mr22586736uav.56.1636726082730;
        Fri, 12 Nov 2021 06:08:02 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id u16sm4499191uad.2.2021.11.12.06.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:08:02 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id t13so18999817uad.9;
        Fri, 12 Nov 2021 06:08:02 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr22545741uaa.78.1636726082069;
 Fri, 12 Nov 2021 06:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211110224622.16022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110224622.16022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:07:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWoJEYkPDFa5CBnz4HUOD+E791hLu1Fk2xFaz0UX+hFmg@mail.gmail.com>
Message-ID: <CAMuHMdWoJEYkPDFa5CBnz4HUOD+E791hLu1Fk2xFaz0UX+hFmg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set pin config for GPIO port pins
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 11:46 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support to get/set pin config for GPIO port pins.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

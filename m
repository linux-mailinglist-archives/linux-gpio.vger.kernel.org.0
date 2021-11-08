Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5785644810E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 15:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238977AbhKHOQR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 09:16:17 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:33689 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhKHOQQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 09:16:16 -0500
Received: by mail-vk1-f173.google.com with SMTP id d130so8289594vke.0;
        Mon, 08 Nov 2021 06:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l47DyX7zT07Ftsepq+P26ZkT5gnhRsZgVIxOMImJuls=;
        b=1D/YMS5J9wFckgE4pyemTZX7npsBbLLGByoX5AIHlCzcfN5VERfw/ORKFWCQQVKsIT
         aFxb/IAbonJcjNJH71agikUOrlfLWxy4JYm/cs39x4SkbrSzYAolDGnM5sbWxG+nawXw
         Ic92Z+3L4fpsXKzPAuEnWvsvXcA3UjTcN+H/FJL1iLnCJHqzQ07H3n0cSTgX/5kCQzy0
         m++imdr6IlSpCEHPpxbUW0ZMIou9FidTXIxToDkEV23aSruJlg+W9nAazS+yPJjkjPnb
         fUrpYgTp5kBU9aea4SNAIDOm9WmZ0Dvdfm6CUjuUIGnjL276an98fkNv6OjfwBeCds3T
         BDXQ==
X-Gm-Message-State: AOAM531pfZ+fHRrVP3h9t3EtSjEFdiY0ccMb5qZlGL0CTgK1uk15Totz
        j26K2UNBlmoBTUCNV9mMiixrI57Lc5dYrDzX
X-Google-Smtp-Source: ABdhPJyivZeljKXDxJCQtIxyZYyGnsHP69Ogaoz04J3MilG4pXl4Mvo2hy4SD1N+g5lAo6G0Z6XIYw==
X-Received: by 2002:a05:6122:2015:: with SMTP id l21mr291031vkd.16.1636380811701;
        Mon, 08 Nov 2021 06:13:31 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id o16sm3254094vss.29.2021.11.08.06.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 06:13:31 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id d130so8289571vke.0;
        Mon, 08 Nov 2021 06:13:31 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr22172276vko.7.1636380811049;
 Mon, 08 Nov 2021 06:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211029124437.20721-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211029124437.20721-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 15:13:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVu49AC0nc0hgV=HsR8qEM0pQQuo8T-RRCwwTLvXgO2HQ@mail.gmail.com>
Message-ID: <CAMuHMdVu49AC0nc0hgV=HsR8qEM0pQQuo8T-RRCwwTLvXgO2HQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: renesas: pinctrl-rzg2l: Rename PIN_CFG_*
 macros to match HW manual
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 29, 2021 at 2:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Rename the below macros to match the HW manual (Rev.1.00):
> PIN_CFG_IOLH_SD0 -> PIN_CFG_IO_VMC_SD0
> PIN_CFG_IOLH_SD1 -> PIN_CFG_IO_VMC_SD1
> PIN_CFG_IOLH_QSPI -> PIN_CFG_IO_VMC_QSPI
> PIN_CFG_IOLH_ETH0 -> PIN_CFG_IO_VMC_ETH0
> PIN_CFG_IOLH_ETH1 -> PIN_CFG_IO_VMC_ETH1
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

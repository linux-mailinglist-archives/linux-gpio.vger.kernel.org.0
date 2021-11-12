Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B72F44E833
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhKLOMP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:12:15 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:38893 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhKLOMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:12:14 -0500
Received: by mail-ua1-f52.google.com with SMTP id o26so19088682uab.5;
        Fri, 12 Nov 2021 06:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhXqfwSlPm16zKdEV1ag+dVLF4h8hJZRSRqMOMtnQqE=;
        b=pAMihPEe/5UFKRD4T/1DfbLMkJDHEisTHlH1XgSmeAj2IknKzLyfQyjBJbiYlI8VzC
         BD6g8MLKf+HOnKPZwjLl518QcsbcP629wR6lIS2E3OvVafFvBXprCy4tMCn5H440e2tk
         a1L6Jz0p3Rny8F6FDXKfA93lXqIu/TGonc8uOeCmTy1/XUbsMEKny0h2O3v0U0DHJRo7
         SOZnPciXkzQZHGNfd+LaqXOxd7QXyG+ViyFqypjr9DTWfJMyWPBv/327UD2u41ujEq0T
         owTivkZW7+O/aBh32iHWsWkIv594sNWMadz7draRxntAYnT192iboBikuwyUcX5YPvx9
         2xpQ==
X-Gm-Message-State: AOAM5304HWVlUCktLM3ITwL8Gf0awAyR2G1LdtiIR758LNVeLGceCnFz
        UTpTDVVsJRhVfViCiA3VXDrKrSBN6TluTg==
X-Google-Smtp-Source: ABdhPJzQ2pUeUXWsBt79uZucsYMSuLGKV7RPpagUhB8nnNXwrU12K4qXxaJanDlhVBz5L0T3xeZuAw==
X-Received: by 2002:a05:6102:d8d:: with SMTP id d13mr10491858vst.54.1636726161974;
        Fri, 12 Nov 2021 06:09:21 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id t1sm4006288vkl.56.2021.11.12.06.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:09:21 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id v3so18954364uam.10;
        Fri, 12 Nov 2021 06:09:21 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr22901368uae.122.1636726161283;
 Fri, 12 Nov 2021 06:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:09:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVw=bDj=Uq+wXzBb_HhG4viHZC0A0znv15htvwwS15oEQ@mail.gmail.com>
Message-ID: <CAMuHMdVw=bDj=Uq+wXzBb_HhG4viHZC0A0znv15htvwwS15oEQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RZ/G2L: pinctrl: Support to get/set drive-strength
 and output-impedance-ohms
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

Hi Prabhakar,

On Wed, Nov 10, 2021 at 11:46 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch series add support to get/set drive-strength and
> output-impedance for RZ/G2L SoC. Along with some macro renames
> and code cleanup.
>
> Cheers,
> Prabhakar
>
> Changes for v3:
> * Fixed review comments pointed by Geert.
>
> Changes for v2:
> * Fixed review comments pointed by Geert, split up patch 4 from series [1]
>
> Note: This patch series is dependent on first two patches of series [1]
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> 20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Thank you, will queue in renesas-pinctrl-for-v5.17 with the dependencies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

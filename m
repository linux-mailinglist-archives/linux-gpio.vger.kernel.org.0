Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3034544E819
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbhKLOIc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:08:32 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:47061 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbhKLOIb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:08:31 -0500
Received: by mail-ua1-f49.google.com with SMTP id az37so18960945uab.13;
        Fri, 12 Nov 2021 06:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJmCWstttBVJgsAoVcdgI9igVyOKxly336dk/irGzkU=;
        b=j/p9aOPFgugqiTioyL0YoHLNG1X4/+P919tfSc9y0hzqeqCpPh1x2BtoEjgvM3aJrw
         vUwdgPbhWQLWzvfTk7WW5/G+3qKMCoLlzJZdzLAYCBCQGYhpeyUJQtV4XcTvcOf2jQ6s
         VGzkezfqCa+03ALEC54ShAF8tNQ09fchvz93MsijrLySD/6dwhehyc1I/L8OGyb7Hmx1
         081B1BIuk6qZpwEobcSDnrx/SnBF3ylF4c0kfxXqHWqyjzQNBSnPBuLzeOeMwCHSQZ4F
         tt7tNyxbwF3l7JsYTaIV51ZoHPmpVlEQt3Uf2/0vUYu1X8sfxX2zAHW6sSX3MfhqIrou
         /KsA==
X-Gm-Message-State: AOAM530XBfBIe0bgvJvRSq2ivQUzJKEHG67cwMfuuoFvJ+X0ErlvOrb3
        AJ4kubdzeOsl0UYhoLShg3GpjTwNTTpCjQ==
X-Google-Smtp-Source: ABdhPJxuAGTTrPB/rBy8GsgB+1nOs5az4N3WSmRYsF9nuwMgEdefrmfRnPH7H6rfYkBUVPUe3RfWpQ==
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr22825635uah.50.1636725936181;
        Fri, 12 Nov 2021 06:05:36 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id j21sm4026753vkn.4.2021.11.12.06.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:05:35 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id l24so14739829uak.2;
        Fri, 12 Nov 2021 06:05:35 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr10054849vst.37.1636725934845;
 Fri, 12 Nov 2021 06:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211110224622.16022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110224622.16022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:05:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbksaO9So3bX5bJqg23VoarT6rf0p95PRzE9hCHd9=Zw@mail.gmail.com>
Message-ID: <CAMuHMdXbksaO9So3bX5bJqg23VoarT6rf0p95PRzE9hCHd9=Zw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] pinctrl: renesas: pinctrl-rzg2l: Rename
 RZG2L_SINGLE_PIN_GET_PORT macro
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
> Rename RZG2L_SINGLE_PIN_GET_PORT -> RZG2L_SINGLE_PIN_GET_PORT_OFFSET.
>
> Also, rename port -> port_offset in rzg2l_pinctrl_pinconf_set/get for
> readability.
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

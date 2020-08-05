Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF15623CAC0
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 14:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbgHEMo3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 08:44:29 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35388 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbgHEMfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 08:35:44 -0400
Received: by mail-oi1-f196.google.com with SMTP id k4so39435189oik.2;
        Wed, 05 Aug 2020 05:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fi0Vkqop4EGcsiOxJMU7b52vof3OIZ3dx6v9pdPXURk=;
        b=Fjkc66/9z1rjezmzJZw6poKCoQ5ijqbbKucCg8c5uY+vD60eOjjmnEPBvKHpQVyo3T
         5pa+lMj8TwVBkvbAcTITAmudONTGslPJ/CdlskfrqiV+lL80Mhr5A2ViFrilcA0F8asO
         S7RNwHsHPLqZCdNTTPaYTdCeyaTx6cNen0GyE4zjKXUcSBG4gu37Cd+eG7oLKn8gG7s5
         dV59dJ3RL0K7yzORNpg66f4As1szXqgdA/xXuxNPlJbBPTDOpbcCxE5KSFEKF6M10VWl
         kWDISRGG13cUeFfBCe/AcP9o+h0QEp46u4VYOzHEis+9Es3J7JLJy6TZNE0HTiHhTtVN
         xUGQ==
X-Gm-Message-State: AOAM531c0orxplAMj5VENbNTKueO15XWqM6mNoB3pJBBows1KeAU7gez
        oOHukhSz4A6yT955gTiIiaZdnPpyx0in16TjA8Luaw==
X-Google-Smtp-Source: ABdhPJy7sqwBSiN+pyzIPZ9M2XedaR1gb87JLdDr/1wnAKP9dc8YJ0PX9xHpkxMnE8yZusJ10E71WEVlm96ZcFvLUso=
X-Received: by 2002:aca:b742:: with SMTP id h63mr2275849oif.148.1596628879890;
 Wed, 05 Aug 2020 05:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <1595005225-11519-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595005225-11519-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1595005225-11519-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 14:01:06 +0200
Message-ID: <CAMuHMdUZi4iPTv5Q7PgHkTEOS-N53rB2iRHBw=Mr0v1Lo89MKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7790: Add USB1 PWEN pin and group
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 7:00 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add USB1 PWEN pin and group for USB1 interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

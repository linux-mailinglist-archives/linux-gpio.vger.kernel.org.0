Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018652BA4F2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 09:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgKTIn2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 03:43:28 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39615 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgKTIn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 03:43:28 -0500
Received: by mail-ot1-f65.google.com with SMTP id z16so8037213otq.6;
        Fri, 20 Nov 2020 00:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UV+TC/nIwAvGxe27TfWZuXpBFdXk+Z+MJcbi20RbkeU=;
        b=k4w7WxryBvZxxrojA+gdk8wx4B4oNcrmQQk+oACfcTvGM5IteMS+U6HPrgYHuDu29g
         eoDYV7BbS7okxzeXjdEs95xqMX1h6JsPH8ZIlrA8fXyhDFGVG1+BWqPTfiYBrrHZNCqp
         2GHWm80wBkCpLrxIxL15A4d1ZdgRXqnJvmBS65kbLKHvM59+YDzdMKodOCzT0cduWzIt
         8HelCn2DXILUYmyK5/L6aJnHi29wlyvASN1lIcw6SxOB19QAsZyfu0oymKU69OV/GI4z
         Ud77W6YtudMDSDy1HVe+5IqloN6L392AGawfjwGEtAR1qZBEVDnYRfqcKtydjT4B5dB+
         xByg==
X-Gm-Message-State: AOAM530Ix31gSBm9lNnVOgGa4KhS8b+PGMXhRJMSvLJfZMtbFcuwshhi
        W/G/WXZSAwt7l04vtHT6YjT7ZdPZN3FvLM2OgZbII/CNhv4Hbw==
X-Google-Smtp-Source: ABdhPJwF6dm4lbvW1b4Nq+g4yoxyTy7kSZqf7olXgtsY4xIffGm79jCArbQPbzpVn0t2fDTE87C0ab1THN4wTxg2XLI=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr12246961oti.107.1605861806032;
 Fri, 20 Nov 2020 00:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201119130926.25692-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201119130926.25692-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 09:43:15 +0100
Message-ID: <CAMuHMdWV7h53Tm-qM4fx52NuU+7yHRXpOKjon-Fm1ao5O9irMA@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: r8a77965: Add QSPI[01] pins, groups
 and functions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 2:09 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add pins, groups and functions for QSPIO[01].
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

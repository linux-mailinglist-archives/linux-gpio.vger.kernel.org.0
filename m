Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0DB2BA4CE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 09:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgKTIiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 03:38:18 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:37812 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbgKTIiQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 03:38:16 -0500
Received: by mail-oo1-f67.google.com with SMTP id t10so2042888oon.4;
        Fri, 20 Nov 2020 00:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UV+TC/nIwAvGxe27TfWZuXpBFdXk+Z+MJcbi20RbkeU=;
        b=eIacIT8z2vDIUOLlvn7KuqiYOxLlnNo79paIpbcE7SVGFSffMVyrQUtTZPBxUTJp5K
         ROZsMJLwxRCwWr6zqrwzw3BD/hD9T5BszMwbvWmzVsigkh177O0kAzrt30XhB04XuvUt
         euCDJunZb4/gkLuI2YsnGbn0rDinyPtPSEMtavSfMzS/bYTN/Yeyr5G1F7X+To8Y+CcF
         aDAw40UkidmSGt3pha3FcFcnkdsPLQZyOLFRZ9bkFulkfmHK2O8Re9sgCILOpFiwZR1C
         E2jM5uEbqjYT/l6XWR3IJzc0yW4N2aRsVea09TH2rgDYLCQ+Pft5IH5Jfzq4mvDjuySA
         J/EA==
X-Gm-Message-State: AOAM532JESzbsTFITWUUnh14OPNEhpD9Y4wq/zWG6ENd0IxkEPj5l/Iu
        YHRQpXF2lKrF0EmXgz+SURtwuH17CbumCUTICkA=
X-Google-Smtp-Source: ABdhPJzR2//2OJGmAKmRurcCF5Pmnvd6Zw26PQX+HmnocDInNWRSJsXMuOxEhUFxFac+BI2+l6sGNVQCQfmxyanSYpo=
X-Received: by 2002:a4a:e5ce:: with SMTP id r14mr13417862oov.11.1605861496120;
 Fri, 20 Nov 2020 00:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201119130926.25692-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201119130926.25692-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 09:38:05 +0100
Message-ID: <CAMuHMdV+FDJ2pFyC0rGgOS3LwpA-dg8siTiA6gCjNLr05iDSGw@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: r8a77951: Add QSPI[01] pins, groups
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

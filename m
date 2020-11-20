Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9620D2BA4ED
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 09:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgKTIm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 03:42:56 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45115 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgKTImz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 03:42:55 -0500
Received: by mail-ot1-f68.google.com with SMTP id k3so8026228otp.12;
        Fri, 20 Nov 2020 00:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UV+TC/nIwAvGxe27TfWZuXpBFdXk+Z+MJcbi20RbkeU=;
        b=fiWGkgLbyGpgTRi0J1o4wNIfl4C73YYam9BpqYSR5dkwFdx+nMHlFazAikCPJJd68h
         1lrBGPacCP7/CX6Vzk1gQxUrvnrMsuz56tdzu8VaRhYoEloIaBIOY7CIYoQIdrsEhYqY
         ND9f+8lTTISZXx23tiJPr/xvpDlSoCcxE3dQxcDmecFNTeT6ozIktD8BETkCm0yp/00u
         ZP60sUZ/34b1gkSPzJpPIAr5ufGpvbH3bFIeTsex+BekhL9P9ykJ2mXNzEqsLHdC7QEy
         8xfRBqX6ICsmK+olv4jmCpYde+hGtlZ2xGlisX5h2ed1iPxxYrQqtBEoFSrlKs3mV2PS
         lATg==
X-Gm-Message-State: AOAM533C//VZN9lZNkJtj6ULQrjfMakHV1Tsce6cEE39isc18Lhok1Oq
        hkgeQH8NYgx4aWQ6fe7jcmiBmve/e+/kZjOmT+C0QgR64nFbew==
X-Google-Smtp-Source: ABdhPJysBuhRN2/Vvm7x22WAU1I04V4C8112Rod8kJhLnvdzDP3lGjsaBbZfL2ops0uWL5Lz3UoYlGYdfyZUK9xG+FA=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr13409297oth.250.1605861774814;
 Fri, 20 Nov 2020 00:42:54 -0800 (PST)
MIME-Version: 1.0
References: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201119130926.25692-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201119130926.25692-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 09:42:43 +0100
Message-ID: <CAMuHMdVr6u=QOmN-OGmfZQegcaDLU=6tCRNy0kYwxiq8QiN80g@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: renesas: r8a7796: Add QSPI[01] pins, groups
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

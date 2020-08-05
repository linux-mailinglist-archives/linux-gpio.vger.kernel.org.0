Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAB923CAAB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 14:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgHEMnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 08:43:07 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:38087 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbgHEMgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 08:36:00 -0400
Received: by mail-yb1-f193.google.com with SMTP id e187so11384689ybc.5;
        Wed, 05 Aug 2020 05:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8hbSnFLozAnFw+mEl1ug9b36cQI1zAqdjX8AiRGf5eg=;
        b=hb2pliSgGkPsyEzfmhgDjqehn0bPAW56+btYIyS3Np8i6buuK88MET9JSJ0TqygRBT
         23LL8QrPlV9+46Lz87nOYn0sqCxZxW+eTmuw3pc69a7mZRAxC+PDtskzQ2Vjf90poscz
         yuwCQ+uPR9dY0OkOrTorM1bTnfUnbsMuWD8k+c4PYLLoNln40qGT4lTvCJcOq+0REmKY
         XVUiKkaQX3xNIKocFBFHvJgczF39n2el1aePaKWZf8+ySADLC7AAqJXLt2Q/dSx9Rl1F
         u0FIXItziNBtm47+Z812Exka5pBv0CvXaIRQkaXYRyb85w+gRdHBRZo/WkKNKIAcq5L6
         bOLw==
X-Gm-Message-State: AOAM532FqcQHW4+l+EpxH7jOipve+LsrBI2O9m9vmgy1kqmQCzksQFuB
        RknedRfMQu4z23qaR4phw0ZPyjC7LszLzjzOgymkEg==
X-Google-Smtp-Source: ABdhPJz68cp3BRosp19kHXfNdEIyo86KFXA5kI74C0lDw4gKE3Oz8neNAi9dx02X0JasBYqG0QOhCPNYbri4NwptkNk=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr2165898ote.107.1596628926098;
 Wed, 05 Aug 2020 05:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <1595005225-11519-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595005225-11519-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1595005225-11519-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 14:01:54 +0200
Message-ID: <CAMuHMdX17U-wBTZ6Z2=yHn4x9N1CwEUJNBmYKaSV5v_sxUd+5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: r8a7742-iwg21d-q7: Enable HSUSB, USB2.0
 and xHCI
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
> Enable support for HSUSB, USB2.0 and xHCI on iWave RZ/G1H carrier board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

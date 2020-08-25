Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20EEA25198D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 15:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgHYN0m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 09:26:42 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33347 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYN0m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 09:26:42 -0400
Received: by mail-ot1-f67.google.com with SMTP id t7so10353277otp.0;
        Tue, 25 Aug 2020 06:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z4lruBPSPBoCjk79gyfZpdmH0WXdNgeiqOeNZcAn4Ck=;
        b=MKKHHpVBingi6NfIAxBsRtIgk9F8am+deZn3CIPms5Tkl8eOxgKr8EqG005dkX0SRx
         gatk2qqVkra8nRtymeogF3YTCVx+Qc+wA2ALEgz0ntKKHoyKPY5mNy/Trx1x5Ox8XULq
         5IrmttxvyTCaVx6mTo6b2X5J4Dks3mSJH9EWDYbj3o4ohPiime7NW2Iw6i/MVmL/ho8K
         Mi7q/jdEHoC4Stglmg+t2MwDfCHY/T1H1aEZz1CMNZIV22D4J2Xo0VT7AIVgJyMxQ85U
         eB4CL0VkPzJuNH2T7Eumzj3e/5aMSQzOtvEwx+nrGiMfj7Mni8eOzUao7v2w6iI93sZ/
         kGWw==
X-Gm-Message-State: AOAM5326oeQSA7YqDzaDk98Ec71lwuFvGzYW8gMEqaMvL9e1plxuyGOu
        p3k3YS87qQHlzQsd1dzuRZw9jN9uhGlODbolmWGYCg6v
X-Google-Smtp-Source: ABdhPJxezF532QFJrLI6cfNX5O+6qltMV9la/ajBFid1dzl1wERNYCWJFaFu0svnQ0KOr2ghKW/xA+/iIvnjKUXrJV0=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr6266712otb.107.1598362001245;
 Tue, 25 Aug 2020 06:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200825095448.13093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825095448.13093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Aug 2020 15:26:29 +0200
Message-ID: <CAMuHMdUOvm+63TKU=2Yb4E12OZjdxAt+LRFfeT9sTayoyU8zVQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7790: Add CAN pins, groups and functions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 25, 2020 at 11:55 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add pins, groups and functions for the CAN{0,1} interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
> Hi All,
> This patch is part of series [1], since rest of the patches have been
> acked, I am resending patch 1/3 from the series.
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=333191
>
> v1->v2
> * Added CAN clk pins

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

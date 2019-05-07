Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FB515E2F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 09:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfEGH1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 03:27:17 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34760 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfEGH1Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 03:27:16 -0400
Received: by mail-vs1-f68.google.com with SMTP id b23so9762663vso.1;
        Tue, 07 May 2019 00:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FyVGzS5//5vO9vIjlcFm3jhEO92omY429+h8Xxopymg=;
        b=NLx/R2v5lpgrqLKTCbgZo149IrRIJ6Wra/M1byl0d7kSMToi82zah/qlZ1UcYsTeH8
         /Cb21rDU/LefPI94YiOwq1OOWFAQFrRwHgeZLLBiXimJbxl3CPqLw0R75KVyu/U/rBDN
         03uOnGMUtDSLORiE6iQam4BaOfsjzFeLVEzDedkJyRR8S53B5pagQsrdZCThG5kYY7Xo
         YTZIlQoY7zoq71wiFcKef15VEvRXZiF7dbuqaQ9LiL1fQgggKf3r07HWnkK0MT090OM5
         M8vsf8UBQQ01PwwtjDEAPuyGGhpntmIY+DOd6Sd9GT45tBT9MmFuXvaYICUDW/pw6Tqo
         7NQg==
X-Gm-Message-State: APjAAAWeEk6ImGX01zDk4cHEqxfNLsWBgfDKcMs+zDW1yApJhv+u7tRq
        SUdXeY181l0D/Rk2WNyyL/LVgK0NFxha3HdDp7E=
X-Google-Smtp-Source: APXvYqwrEEzrFVkDP47Qz72Io6bBpzKJVgVkqqfZ2FyCdPMsHIiZzF/v2t9Mtavq+/7sFR555XysNTU8MSI5igMJ/LI=
X-Received: by 2002:a67:e2ca:: with SMTP id i10mr8120311vsm.96.1557214035681;
 Tue, 07 May 2019 00:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190503114304.20412-1-geert+renesas@glider.be> <7b8155bd-94da-8bc5-ab64-3847dc30e9a0@cogentembedded.com>
In-Reply-To: <7b8155bd-94da-8bc5-ab64-3847dc30e9a0@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 09:27:03 +0200
Message-ID: <CAMuHMdU5rOq9FKRsU35PtA1Dnd3s559EjjCYX8=nr-zTT83wug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: Remove MMC_{CD,WP}
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergei,

On Mon, May 6, 2019 at 8:46 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 05/03/2019 02:43 PM, Geert Uytterhoeven wrote:
>
> > Hardware Manual Errata for rev. 15.0 of March 26, 2019 removed the bit
>
>    1.50 perhaps? :-)
>
> > definitions for MMC_CD and MMC_WP in the documentation for the IPSR6
>
>    ... and IPSR7. ;-)
>
> > register, as these pin functionalities do not exist on R-Car V3M.
> >
> > Remove the definitions, and the corrresponding pins and groups.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in sh-pfc-for-v5.3.
>
>    With these small issues fixed:
>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your continued attention!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

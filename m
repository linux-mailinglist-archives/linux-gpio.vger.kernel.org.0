Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA39BDE1A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 10:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfD2IjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 04:39:05 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43845 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfD2IjF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 04:39:05 -0400
Received: by mail-ua1-f66.google.com with SMTP id n16so3203490uae.10;
        Mon, 29 Apr 2019 01:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GnxBF0jspOG3+YYITdmvIXsHWEoXG/JoFXQLoO8H8mc=;
        b=srgQGvQehvcNGo79mnScNogUk0PH0TNCI0NSawmAZfQO4EEiG00MdvB4XBE2xayz5x
         3ILGh4Md7Xs/bE651MY20QYdogRUy8pBaSEFXGIrYPiQOwK8dpLDT51BFr4US9xyeRSh
         vapIg2nW8jHNx5ZThcNQnCNQ+i6Buy0ESkhrCDRl4Z9Lf9apdlZamwKuecFsN6k3hKOa
         m9p8YVt91QsGZnYevC/6kDxOiMFBy2c2bzJrDv/TaRoi29NM/gB62FegisUEjyaTAkB5
         W+0F2vtxukmL8z5+J+V48QUahrl9n/+AUS+fVae34bcC1oHDD5+HAm0WH8vI6c4DQKja
         m8yA==
X-Gm-Message-State: APjAAAWVZdm2n9feWdmX1nNWF0hIh07kSLUvP9SLjHrTRyA9ERmgpRU6
        jgYdlAuIMTXFShwZmpa54IRQ7B0cOge8HKHzBULyYA==
X-Google-Smtp-Source: APXvYqySuVBKCjsg0ITcy7+yxJ3DC3BYWPSchTC5XaksWQRt8ozQndvhm8zNOSD/SVZZ38Cn3ZD+1AMaB2GP+5HxDsg=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr30526721uao.86.1556527143965;
 Mon, 29 Apr 2019 01:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190425095542.726-1-geert+renesas@glider.be> <20190425095542.726-2-geert+renesas@glider.be>
 <20190426092139.5mwjtmm5fnpek6bb@verge.net.au>
In-Reply-To: <20190426092139.5mwjtmm5fnpek6bb@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Apr 2019 10:38:52 +0200
Message-ID: <CAMuHMdXMeaO8uTT1thMGp+rfk=pcy-ejEU1EPNc_z+0Gw1GF5w@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: Correct printk level of group
 referral warning
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Simon,

On Fri, Apr 26, 2019 at 11:21 AM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Apr 25, 2019 at 11:55:39AM +0200, Geert Uytterhoeven wrote:
> > Fixes: 6161b39a14380815 ("pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This looks good to me
>
> Reviewed-by: Simon Horman <simon.horman@netronome.com>

Thanks!

Is the atypical email address for sh-pfc reviews intentional?

> But I do wonder if "referred" should be "referenced"

Yes, sounds better.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

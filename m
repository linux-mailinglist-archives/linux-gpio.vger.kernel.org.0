Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 188FFAE4B5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 09:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfIJHdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 03:33:14 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43050 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbfIJHdO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 03:33:14 -0400
Received: by mail-ot1-f68.google.com with SMTP id b2so16931403otq.10;
        Tue, 10 Sep 2019 00:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5P01RYkKgcHPUYjswW70NifVp4Z0kf9Z1V54hUpct4o=;
        b=DSxojzIVOSVtMwdbCZrEvMpH2wqOXYRZQ1i5yxZWqeIqv0g5QenZ3U3V6DaiYjAU7A
         37/9wjhqXvzq9VREkeAVTwd8zUjkVsvYSH9ye0OF0gXD5Y/QrQa4+l8/V7v+C/1s+xgb
         5UhsIb13KSBVxxKcGivSuiH2vBHxW3Vcm/bWyAnwxEHs1wkoRO7IHYkTBr5k/lyP+YSn
         zT0sGo88un7xJ2IaLSv5OKKH/7OTXMveqRVBhi3HVwaSuZNKFydlz1nsYz0FlQBI7++8
         4ZCqaix5+2Hp+gWD8B+7dsChs5ov9hRb1RZnwnCNt0CUe1cwnKUYlue9P+6P8f55p14x
         zemA==
X-Gm-Message-State: APjAAAXiFKNA4zLYjpioAJksfRh00tliRwPcgtbVHgvz58lrrYNwr7s/
        T6ho40/RzwhyhVYrTznt2rseWFtSAUSU3uJfxmg=
X-Google-Smtp-Source: APXvYqxvjvfB3lp1gpAc4xcpHpepOmJjAOO9w99Zz6FSJOl+rXJQVuknMhQYK1Zv06NkX5LG65XIVlBM2DfpxreJ7GQ=
X-Received: by 2002:a05:6830:1196:: with SMTP id u22mr24870585otq.39.1568100791499;
 Tue, 10 Sep 2019 00:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190904121658.2617-1-geert+renesas@glider.be>
 <20190904121658.2617-2-geert+renesas@glider.be> <20190905085925.umc6khhp2nurdljo@verge.net.au>
In-Reply-To: <20190905085925.umc6khhp2nurdljo@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Sep 2019 09:33:00 +0200
Message-ID: <CAMuHMdVAM8LpCZiJPattkj2QsBrXJLKde-MB1Y3+iqC2DNegpA@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: r8a77990: Rename AVB_AVTP_{MATCH,CAPTURE}
 pin functions
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 5, 2019 at 10:59 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 04, 2019 at 02:16:56PM +0200, Geert Uytterhoeven wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > The Hardware Manual Errata for Rev. 1.50 of April 10, 2019 renamed IPSR2
> > register bit[23:20] value H'3 and register bit[27:24] value H'3 from
> > AVB_AVTP_MATCH_A resp. AVB_AVTP_CAPTURE_A to AVB_AVTP_MATCH resp.
> > AVB_AVTP_CAPTURE_A.
>
> I think the trailing '_A' above is a typo.
>
> That notwithstanding:
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queueing in sh-pfc-for-v5.5 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32651F197B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 14:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgFHM6t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 08:58:49 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43314 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgFHM6t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 08:58:49 -0400
Received: by mail-ot1-f65.google.com with SMTP id u23so13513132otq.10;
        Mon, 08 Jun 2020 05:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mHdvDaMk/db1nbnHcHOQAqF9uq7Vrg4lOvOEa6pwFfo=;
        b=h2x2WrzFy/j8siIWJ8InHiX3tORUi0SEf7AUq3yIislvAAMZ39iGgqBcnS2xdVv3Ii
         4TZ5BjLVyaI9Ts3QAXjfvzDrCfuuAkqO6dcqQuysdRTnH6mAYQ8WG7GbBBTI7uK8CdUH
         HS1wXWAyXEWztXa6daeXGGXwUsPrrCt18W5UjzDXzU3ep6ENQl8r49ICUBvXAPl8H8sn
         9lG2G3TMSyrfr6uQoOsGGEIAVl5CU7ot5nObHu70p5WF5oEP3wjg3uwAhl3GL2nrgodo
         QvBA12NGqyiqLSCqp46BpYyEImYbcRgtlCqwWdc1yB3XE7o6AsiYzYVEWcQduZq6MRv4
         Fxrg==
X-Gm-Message-State: AOAM53314txW6SXLbky05jA/wo7aw7MwG5TCmaKoM3bYZJHErsHMI7R7
        NBMsYM+KnzAoMPO//TGN6MbvbYQ+uftUOzplF1Qc7nzN
X-Google-Smtp-Source: ABdhPJy5YqUSVrJs2mxDw0i9C/cOq3kBrgAoaZ1IO+OwNEIP+ngN12Zq/hSsRV/zMN9Wkk9CSzrwyV3fZxROaxCIWRI=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr17075546otk.145.1591621128066;
 Mon, 08 Jun 2020 05:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <fd089d37-95bb-4ec9-282f-e04d7e5195e4@cogentembedded.com>
In-Reply-To: <fd089d37-95bb-4ec9-282f-e04d7e5195e4@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jun 2020 14:58:36 +0200
Message-ID: <CAMuHMdVMTWtHjrVpJo7kCcpYhMt4EQ0jfGjSUC6Hb9Riy21R=Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77980: add RPC pins, groups, and functions
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 5, 2020 at 10:23 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the RPC pins/groups/functions to the R8A77980 PFC driver.
> They can be used if an Octal-SPI flash or HyperFlash is connected.
>
> Based on the patch by Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

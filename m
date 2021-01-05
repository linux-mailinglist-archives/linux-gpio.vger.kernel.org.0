Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7C02EA9A3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 12:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbhAELP0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 06:15:26 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:37225 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbhAELP0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 06:15:26 -0500
Received: by mail-ot1-f52.google.com with SMTP id o11so28934489ote.4;
        Tue, 05 Jan 2021 03:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o94+ZFhbY84q1cXhg7/Y6rDSY5ckUTUmt9EX4aDq07Q=;
        b=P6PTcv2dSWpDtRBwiC2q6Lckk+nw8XfTEbxSZR9QBKFbuDs82QxYRnO0EuhrqVsv4o
         s5jKmJ8c0QR7LyeWzNTM6V19sB1+aK3BE/Mf0Rospxwplicg9autVrZS42vGSWfHRZn+
         J4la4eYMrl2MbLpgu6dazsBeM+4AviGXnoIRaj4fpKAeSPfR9LACZCp29zNSp1arPi4Q
         g0ym7EVlK20iiPVtSgne7P6VxoP6B0f6Q71CjQodtNycSp62Un947sdLfqgqjL9ElHVT
         EhxrNz2yTjkQvmo3ZP9d6SIuNIYLteh2VsDrsdTd0VVlg/y+5R6A1yrfGK9RqNyIcINl
         uaeA==
X-Gm-Message-State: AOAM532B0yJ1swoDl8NEKWOd/r1pUgyLyjLfthxoM3FVf5clKl5YfI7b
        Z3XKD+OU30cQxRMgbk8zoSm5K/kkGJOQJnq/J7o=
X-Google-Smtp-Source: ABdhPJzMABKFdhG1HCUeBn/TBQBtiSq0l2ujXehxbzg8hR7fjDLY7hs/FLTcY900AR41WST7mcBNJFfHTBA3gex9Cic=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr40653891otr.107.1609845285464;
 Tue, 05 Jan 2021 03:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 12:14:34 +0100
Message-ID: <CAMuHMdUT8CEyJ1ERmLr443SuZgemFF40cDviSGwhYM7ZnN_b_g@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: remove shadowed variable
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 5, 2021 at 12:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> After refactoring, we had two variables for the same thing. Remove the
> second declaration, one is enough here. Found by cppcheck.
>
> drivers/gpio/gpiolib.c:2551:17: warning: Local variable 'ret' shadows outer variable [shadowVariable]
>
> Fixes: d377f56f34f5 ("gpio: gpiolib: Normalize return code variable name")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

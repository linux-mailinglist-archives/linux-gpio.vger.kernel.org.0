Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254362F03C0
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 22:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbhAIVPa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 16:15:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbhAIVPa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 16:15:30 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69708C061786
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jan 2021 13:14:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o13so31655975lfr.3
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jan 2021 13:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kifOu64xMoeH7KczQZpg/DzUNcHtji8mTPLqSoxmIw=;
        b=NhC+jbemFcv+1/xo0tTBHjOZzn49yaauter3Dj9S0iu3q7J4A3OKxXFeMQq/8zQZw7
         amyf0YUWCS/vssebj7lLVz5UBV5TQ+yGfPBkmIgL7rFhF9OnM3wVCtUhWgVHXWHoyEfr
         ni8oVa7dqLYS3N/rvXCQZDnNdVLIFtAhbVFjniaTpd7SWFpiOYad2Vwy5TiXzExTcEcr
         I/zv7M5uNs+zN7BqgZfT7huo3B2BlQxW1QTSIJOhCP64nQHhOCbX9+wcvN8TaXVLvENt
         pPkTXLcHiuTFgun1yjSKG6gKFJHqyVBCzPkOQeYm1ZL20XqD5YR8J93Pwy7w2Wqjyb8y
         raSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kifOu64xMoeH7KczQZpg/DzUNcHtji8mTPLqSoxmIw=;
        b=CkXXKAmb40TcHHqsozb6uPDkTEY+zQ0lHM18skkXD/g9fZx2AEdjTFIrGWaEqVKDIp
         Zhh35BAtQ3W/htqJl04pl9s1eTDrIJ7YAuAi+XltrA72+EshmIhwzj24eQ1b28HzqGCt
         vgBO118rvy/vLcI6u9/2GC27/s796/7Zvlw3i75REeCU0KRtL9YM+ZTV1txJrq4RU2pE
         H0fTbN40trgX6hO4tNs214ED3oZH85e42FgRZAm7vxhoqvWsmjcvENcaZFuIKe2h9EcT
         fOiY1f3ACs9HqKQRcd9GlHhwPC1HyB0eO+HuSwLS/i0wjTbEVXwhvyxaCNJdyUF9RLgC
         z2KQ==
X-Gm-Message-State: AOAM533dRqCLEULTwhYjSuifKpcbg2Dniefd08kQ0ZQBuBszcJCKPPdl
        DZ0GxIDyWrvv/wRRp2VFaKk/htnVdzNLCbTe+1XIWa0CZE0=
X-Google-Smtp-Source: ABdhPJziB3kaeiDvLJLfYt0pvZQpZctrlx4d3aibVEs9asRPA9Z2izRha2bpKGvAT3BM4fC8P1HZj6fXD1V3n6B3TIE=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr4092858lfe.29.1610226887973;
 Sat, 09 Jan 2021 13:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20201218045134.4158709-1-drew@beagleboard.org>
 <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
 <20201224203603.GA59600@x1> <CACRpkdb9RnGJbct+D-88JPDSbaVp1XS8vjhhHYosy20EPkLjaw@mail.gmail.com>
 <20210109025527.GA2918377@x1>
In-Reply-To: <20210109025527.GA2918377@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 22:14:37 +0100
Message-ID: <CACRpkdaOfU=OLp5D-EXK2oU9bScLZ-QjLdCSrewiSBa0SRRNwg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 9, 2021 at 3:55 AM Drew Fustini <drew@beagleboard.org> wrote:

> I discussed my use case and this patch on #armlinux earlier this week
> and Alexandre Belloni suggested looking at the pinmux-pins debugfs file.

This sounds reasonable.

> This made me think that a possible solution could be to define a store
> function for pinmux-pins to handle something like "<pin#> <function#>".
> I believe the ability to activate a pin function (or pin group) from
> userspace would satisfy our beagleboard.org use-case.
>
> Does that seem like a reasonable approach?

This sounds like a good approach.

Yours,
Linus Walleij

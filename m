Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75108146BA4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgAWOrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:47:07 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34042 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgAWOrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:47:06 -0500
Received: by mail-lj1-f193.google.com with SMTP id z22so3753623ljg.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JmNwutQKHpAV/EernODq16vd7uKqZFYYsu0ijc1flIE=;
        b=ve5w/t/+pklDk05P0uXDsysWxLi43Uj6yrfEktLh3WMprqJF0qRF3LvPcBX89TXdbp
         tkAKVxzsoFOSWLeA0e7M1yo9FZNpT+ERSO/MCTZLkjSqvk4t5DcaVXGLS85sMsTXymYA
         b6CEqvQ1mfEJ1ZllWjrmEPtDLtQSIIaoalveKZuEXcB9OQNj7BHwMWMwqMx66mMoCDri
         nMRKUcYzRzAvEjxh3q0/44GzjYcq9CJT7CMeiXjxpkz/QLVKMPL1nHM4Rjcagce6Ey4a
         g3aQuqFJXdFRN43ZsqP2hLz9D5ZwhLTo7uRseMIKnkuCkbRs7mUW2EuOhVZ7Et7RiiEr
         4GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JmNwutQKHpAV/EernODq16vd7uKqZFYYsu0ijc1flIE=;
        b=AnKlxzaXDi1XoDZEy1oWaBz3I9fa8BDjry4+Y0iFfPt+0VbzjdfCmLPpB18g0P/XdJ
         jBwA/pNb5HUs4sQUpkioX0ozwXmtBLKo3BB4ma1kbGkY91DbBS4VAYcvRW14HyfXKgQS
         RegT5C001mVKohrpZ9NDTzpmw7wU0zJcRbjHBb7AWEfh3ZIqJSYP2AZq97wZBSUlOp0w
         ufuYX40Dalkna9h7cBLZCB9KM73wzDbEJiqrRF+iKytmpK0qBtVk7yqsw6u1T6R+afMg
         x+gIt+DuNfJOIgvSr+ImphP06uWut+YFdgnsZrOFE92b9v6Pw52BTxISa4NOVYqS/sWC
         93XA==
X-Gm-Message-State: APjAAAXcLow/whEow23kKmABcRs6DStxE4UJG/sDm02BlAG+nsSt5/GE
        4yIioCqxXAHIltVNKOAIVRcrxCg13mlA3DAOSAgDkw==
X-Google-Smtp-Source: APXvYqzVt1jkh/Ae3f89hsmIB58noUNs1s3aqXtdsmlHwk3GGVOzqjmxtIhFXUzPwd+hL8sA7E+b+7zWxyU0DKNLnnY=
X-Received: by 2002:a05:651c:111c:: with SMTP id d28mr24062625ljo.32.1579790824750;
 Thu, 23 Jan 2020 06:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20200120095625.25164-1-haokexin@gmail.com>
In-Reply-To: <20200120095625.25164-1-haokexin@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:46:53 +0100
Message-ID: <CACRpkdYegEbGh_UGUhxAQQrppsa7pSiythHZPhdTxpGeraYx-g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Lower verbosity when allocating hierarchy irq
To:     Kevin Hao <haokexin@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 20, 2020 at 11:07 AM Kevin Hao <haokexin@gmail.com> wrote:

> In the current codes, the following 3 lines would be output to
> the console for each irq line.
>   gpio gpiochip0: (gpio_thunderx): allocate IRQ 10, hwirq 0
>   gpio gpiochip0: (gpio_thunderx): found parent hwirq 245784
>   gpio gpiochip0: (gpio_thunderx): alloc_irqs_parent for 10 parent hwirq 245784
>
> In general, there are about tens of irq lines for each gpio chip,
> and then it would emit so many insignificant log in the boot process.
> These infos are more suitable for the dbg purpose. So change these
> to the dbg level. With this change, about 200 lines are suppressed
> on my Marvell cn96xx board.
>
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Patch applied, thanks for your hard work on this Kevin!

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AB52D0591
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 16:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgLFPDY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 10:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgLFPDX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 10:03:23 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C472C0613D0
        for <linux-gpio@vger.kernel.org>; Sun,  6 Dec 2020 07:02:43 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u18so14314825lfd.9
        for <linux-gpio@vger.kernel.org>; Sun, 06 Dec 2020 07:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7GSF7/q8MnFUXWw+PCnNRKUNyaVuIobqjrVeLl4q8oM=;
        b=kOCuOXb6USjnRhIr8MASK53UanhDGAkTbTLq+CMMz9gJEM8JM9hA0ztutFWH+lj2A0
         E6N+5OvSsKYRqaHiZ2E7LhWLorYl3f0VgYsS2wIM1WP8YjNxOHtNiV629gR/Y5L+syWm
         QnhTHsPmYHsEeuEZkzOf5Yf1ru8aE7EG4XvI8txPrwFJai3W47QdEIspB0Qob/UX76zP
         lcyhRaIRYT7MYFjxFy9FmUkBJssgaG/wRKcn75pN90/JHyZtA0MRqoE2+gcSKzzbZa3l
         ZP14VTynl2nyYdugXgVwtsRwfsGdn7J6ivYbwPPSOTOCOVmL3OK81ED+wHhF4+MoeYXZ
         Hyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7GSF7/q8MnFUXWw+PCnNRKUNyaVuIobqjrVeLl4q8oM=;
        b=ebUNIE88l275+zXwQBQN+2C6Uytl0PAvnmj5z/q/ba9ARaaMTEOWh5XNUS1Sn45/t2
         aAL+1mVtDqXdFKQsZHL1OIGTkGDbA3Ns30ZRZPfe29MCTUPIa+AXSvd9ATZoAyvnRLGf
         ow1iTg4cVFwWfly0i+KONm79FuC91Gt/spkQ3YT5iC7or3PX8MPZwDOBTDolrdK8MRzB
         /ZHLO6pobY5t6m76uciwNE2bqgISyBpghzF/IvF18NxsEaBpAAMFIZU4sH9CVb+HFlSN
         oLjsuj7VzPACM0VUNrXcMpZwXvi78ZRX4EdZDDs4jXKwGQk86LD8q9CZwsF3Yp8oNQK1
         A3Mw==
X-Gm-Message-State: AOAM532XIoD5Z2AoiYY5y9T0qYZg+9d/5QqTdsc3fByG5HS0d3jJXNPy
        n0pPamfYILQnqcnv22m1PYmzT3bYX65ik9X2c3gNjg==
X-Google-Smtp-Source: ABdhPJwvs892kp0Bqkxvf0wpF1Imbv+JqWWKo/L7nlbwoTL6xww6KxK3jwQtxp92trguwcg/bu4WrU/YMXd7+MQPgNk=
X-Received: by 2002:a19:ad41:: with SMTP id s1mr6982448lfd.571.1607266961278;
 Sun, 06 Dec 2020 07:02:41 -0800 (PST)
MIME-Version: 1.0
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com> <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
 <20201205221522.ifjravnir5bzmjff@mobilestation>
In-Reply-To: <20201205221522.ifjravnir5bzmjff@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Dec 2020 16:02:30 +0100
Message-ID: <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     luojiaxing <luojiaxing@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 5, 2020 at 11:15 PM Serge Semin <fancer.lancer@gmail.com> wrote:

> Hmm, that sounds like a problem, but the explanation is a bit unclear
> to me. AFAICS you are saying that the only callbacks which are
> called during the IRQ request/release are the irq_enable(), right? If
> so then the only reason why we haven't got a problem reported due to
> that so far is that the IRQs actually unmasked by default.

What we usually do in cases like that (and I have discussed this
with tglx in the past I think) is to simply mask off all IRQs in probe().
Then they will be unmasked when requested by drivers.

See e.g. gpio-pl061 that has this line in probe():
writeb(0, pl061->base + GPIOIE); /* disable irqs */

Yours,
Linus Walleij

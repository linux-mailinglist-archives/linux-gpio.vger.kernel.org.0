Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE0D3A121A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 13:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236318AbhFILPT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 07:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbhFILPS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 07:15:18 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39832C061574
        for <linux-gpio@vger.kernel.org>; Wed,  9 Jun 2021 04:13:24 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r16so976173ljc.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jun 2021 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QugCigS9fOj5XysW+4Oue4xRZg7LzQZSMpAyh31Q1WM=;
        b=bpqS0X+jjnWtLoSwLxKHqkguPp+mF7DTHL/j5d6kq3p1JKUIV6ZTdzAPgh7f4Y3QCF
         sjZPpWZBjkFJ/pwfeNbt5zp5zBjZCvMC2HwEHborK1gBOFVI/mfKhjwojDMpOsPdcy0C
         HD4gfAeOfQSzZfGF0nkSpeqtq3bUHchBgqiegOmo7FkQLPWaWu+eTU1EuQwNsshs+TT4
         nJam8YO/zprZfzlPkyo+8M5zxs9RAoMM4QNn0vSTf+yPAjlgMETHk1Wo0Su1dNKGDsLT
         nu2redsHNb37b55YrhIpVyqdbBmmIZgJ48mdTETRD43HNC9lEZRX5+9AX6jd4RoW1Lvx
         tvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QugCigS9fOj5XysW+4Oue4xRZg7LzQZSMpAyh31Q1WM=;
        b=FVxcZSHVMDsIBRDFhlD1V4okAikAkFQMEIqdLK/rKZeyJ2BaFlOQuqK62O13QeK+q3
         Tf4N+WguEqyIIqwtSm/d7+FGA4ycAJ2E4MKAS4WDiwLcoe88Fo1d3k+MYyyDNWxut7ti
         dDFjZJ+WcKcCqWdjJ0X0gqmArx3+H74BrjSb5HsefPZH4TSEFGhljRoP5RTZ3e3QIEzP
         fPq5UXnTVEfhJ3COk9HZHBgG4Ngq1dfnxwC+tmSM3RtFp2v5ewvQ6dbQ/tDqezkl+5/a
         uioOf8Pso+D/IdRlI4iSn+gQf07e6GogjiZ137tmDp+pEtXDnlmTllAnA+A/tgr66h0E
         x2Kg==
X-Gm-Message-State: AOAM532EhPvwRe0B3GyxmTpcXHrozWYWChmw1iQe+aM4hn0WRUAw8/Ly
        Y6Ai2x9Ieh0M5k0ieyUeN7uW3D8QF+Nz3gc955Zi1g==
X-Google-Smtp-Source: ABdhPJxo8J+WXMxRas2USR7baWmM68fVP/NSPDHs/rukMxOLcTL8Zz+rwryBtfYk+IPjKYzdwxIbTXKinVZtj6GmKLs=
X-Received: by 2002:a05:651c:1057:: with SMTP id x23mr21221750ljm.467.1623237202587;
 Wed, 09 Jun 2021 04:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <1623134048-56051-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1623134048-56051-1-git-send-email-zou_wei@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:13:11 +0200
Message-ID: <CACRpkdYvU0aO5sEdDNH6C5FwO4yBMdCwY-0so5YTpBvyZqM58w@mail.gmail.com>
Subject: Re: [PATCH -next v2] pinctrl: mcp23s08: Fix missing unlock on error
 in mcp23s08_irq()
To:     Zou Wei <zou_wei@huawei.com>
Cc:     Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 8, 2021 at 8:16 AM Zou Wei <zou_wei@huawei.com> wrote:

> Add the missing unlock before return from function mcp23s08_irq()
> in the error handling case.
>
> v1-->v2:
>    remove the "return IRQ_HANDLED" line
>
> Fixes: 897120d41e7a ("pinctrl: mcp23s08: fix race condition in irq handler")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Patch applied.

Yours,
Linus Walleij

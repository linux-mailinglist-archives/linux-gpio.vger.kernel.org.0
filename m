Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962E8344436
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 14:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhCVM7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 08:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhCVMzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 08:55:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25A2C061762
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:55:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f3so12758166lfu.5
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mnA9oqrE8mMJYoCBDJE689jPEwqppMfcVdTwmK1Y6c4=;
        b=n1pVgCkpBLa1kMa1KiIgCjcDVkCR4X+ABv0SyuXhNa6CsGJe4PRjotxnGsIx1+Tkkp
         nZXsJim9146CFhsE3xX1UhYmVdts9rm2AE4ekDq2ayt7/ZAcFxIlg7fDImuKmdZEX1Ay
         +bu1cKnRyzzEQXZDDPNEk105wMb/MjbmyIb0DvCHARGmhuOY/O+Ea80NZTBw0uDl5eUx
         WKwCCtQ6EwskuTYXPQ4j34sLaMZAEit27wOsph9TkU4LAHoUa7kE7EDny1RzvnEj/Q5D
         ndVA9F3CGJeD2iDweki+djev7HqcnwB36d6UAyqdkHeYG+711PAfdTINgEb0snO0FGEV
         dEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mnA9oqrE8mMJYoCBDJE689jPEwqppMfcVdTwmK1Y6c4=;
        b=jMcJK8j2KGyWY+FVa8rgScP5cLtg0NkR/DWIqGrxCQb+Qlerfvh9+xuCm9kzHSTx3N
         7jTyEBs6D7yvW13A+EXP5w4xZlONNsh2bLVV9DYJu+Bk+31Fw62UxHQaVu55SD8eu25+
         fwDI36HK4TPims0u4pqXBTiYEdHG8p4CSl5bdlUQtiVkpMH0L1WOjBCaCFE9I3iA95Uj
         wtHb/7eeZpiH2xHt3hb0tZg7MVQQxI3bC3NPwWepAoEqe86iWRr8qY0qT8MqS4aaTjhT
         3tpntDe1rXgWDc8kntFGYo8McENvnxOV/su6Gc3oqNKEkUb72P3JkxXkNGUjwaBs2agq
         ipjg==
X-Gm-Message-State: AOAM531bqmvclDC9cPu/dgd8WsCwDLgs8ZZxje1xBolrUf5uJqbrKcVc
        hCmtNIbkBOiN9VtN86fvqMu5Np2UvXMStz1uQeULPA==
X-Google-Smtp-Source: ABdhPJx3MFZzaOpjYIZ9eD4ths32f1hidLiCA7SjBnnrDvWS5qELc5wEBqHK0GqShtNiGcSCy6geo82WMHAJqaPQ7KI=
X-Received: by 2002:a19:548:: with SMTP id 69mr8998765lff.465.1616417705151;
 Mon, 22 Mar 2021 05:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210322104310.863029-1-jay.xu@rock-chips.com>
In-Reply-To: <20210322104310.863029-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Mar 2021 13:54:54 +0100
Message-ID: <CACRpkdaskju7vmfVaooPi6qkiF6dO-q_MB-NSTPHYS0GBO3KyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

On Mon, Mar 22, 2021 at 11:43 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Separate gpio driver from pinctrl driver.
>
> Jianqun Xu (3):
>   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
>   pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
>   gpio: separate gpio driver from pinctrl-rockchip driver
>
>  drivers/gpio/Kconfig               |   8 +
>  drivers/gpio/Makefile              |   1 +
>  drivers/gpio/gpio-rockchip.c       | 650 +++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.c | 909 +----------------------------
>  drivers/pinctrl/pinctrl-rockchip.h | 246 ++++++++
>  5 files changed, 924 insertions(+), 890 deletions(-)

This is a very nice change (separation of concerns!)
I'm just pinging to include Bartosz on this patch set so
he knows a new GPIO driver may be appearing through
the pinctrl tree (and he may want to take a look).

Yours,
Linus Walleij

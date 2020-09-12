Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9333C2679F2
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 13:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgILL2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 07:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgILL16 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 07:27:58 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9C5C061757
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:27:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a22so14592119ljp.13
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMgjoPvhBymfHHvxoDHXTWG3WNCgF0x+QyIygNl61qo=;
        b=K2ir22V83VWYej3YXRtevdddjiVrwkyl9QVqmYMZG3B7/24spsZWiQX+krop1tfWAB
         KB58AfX+WRynhoSlRl51gU8WCfEolkXA1set4DxteuYMb5BDl6uhbE6WkgCZtTjOrYMH
         gNH/SykGqxdt2Zt1DR0Axxpf7uyfmhHnHlB7aS0nGBSZpaMOMSFsm1ukk2jnQWul6pv/
         HARODYj7k1Jw9VcX63i/zQDmEEIyWjyZX6UnlNB8z/46S9IrO2TpLRWMGKIQoXuBWElD
         azi9iVA2mvJV8N5bx2mtIrNhkcgXgScgOLAThgzgvg+NKpfoJibr3DiTfkIcylg+nkCy
         UPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMgjoPvhBymfHHvxoDHXTWG3WNCgF0x+QyIygNl61qo=;
        b=F8m8oUrwNLhYc+BpX/jD5F9viyIR4SgkrKuJYv5WMvsypweyMgklLW7STNTQVddApb
         fauEeINMKJhy1AOxhKMCOzewq4FI8/L/OaKBDmUnIvmaKbuL+caOt5Ri+PgHKdwzaGtB
         LYQv+W66nSNJG61osmSH4c5jtpXjdA1a6wqC5ULOcmZFHMpe1KMR1i0p/SLAOIV+m7Mu
         zgs53ZpRFNDdRs7G3pJETOYoBZtRO5jz1EWcUW6BVkB1MSHlgZUf2gNn8AFmmsJ//Kj5
         ShZfP6qO4OQNqG6DV6QVNYhbBmD2sF72q1U8UVrxFyAKGOf7WsvxbR3recIlGWvuFXOk
         Coqg==
X-Gm-Message-State: AOAM5316cZ9j08/SJAT7XlMAV3IfpnR5k2UmfTMf4eTkhZXab5K8RD4y
        AVg2NG7VAWvSoRg9OOfGJ9iyYfaL6NgoDG0pI0DTig==
X-Google-Smtp-Source: ABdhPJwQe9XEaD08U6BUOCKzC2OeLI06PoyDUFw0hqEreXKuQOwFBcqG+MtAuhhsofCax+HVS//1g9iR5Ma1hBfvdUk=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr2344401ljb.283.1599910074793;
 Sat, 12 Sep 2020 04:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <c4ec95a7-aaf1-2331-352f-2def319a1c7d@rock-chips.com> <20200117081358.5772-1-jay.xu@rock-chips.com>
In-Reply-To: <20200117081358.5772-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 13:27:44 +0200
Message-ID: <CACRpkdYGJsK4Ek8pDCeNMWt41dd2s--Lkxewh4Po4E-45UdwMg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: rockchip: codingstyle for pinctrl-rockchip
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        David Wu <david.wu@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Jianqun, Heiko,

On Fri, Jan 17, 2020 at 9:14 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Do codingstyle for pinctrl-rockchip by spliting driver by SoC types.
>
> Convenienty for reviewing, the first patch only moving
> pinctrl-rockchip.c from driver/pinctrl to driver/pinctrl/rockchip/ .
>
> Jianqun Xu (2):
>   pinctrl: rockchip: new rockchip dir for pinctrl-rockchip
>   pinctrl: rockchip: split rockchip pinctrl driver by SoC type

Why were these patches never applied? Is it my fault?

I don't even have patch 2/2 in my mailbox, possibly it was
too big!

Heiko if you're OK with this change can Jianqun just send a
rebased version?

Yours,
Linus Walleij

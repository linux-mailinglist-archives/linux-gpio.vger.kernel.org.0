Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57CD300409
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbhAVNV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727527AbhAVNVW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:21:22 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA2EC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:20:42 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id b10so6481305ljp.6
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ytvqF/ZqeSdIbyUwKUH9eT2gg+DzZJwumCDEIik8VE=;
        b=vTHteLhf3Hc4M8GUMorykIr4Fz8V7IhlXaOyz/Jl2vc8CI3f4b9YSoLVdUimaykGab
         zdaUNTg2TPxiSyNXl9LR+gCD9OUqmJkZ19NKD1obMt1T2554FBeKW3aCkJwJPl1KeTEC
         Lyq7yFbl5a5lQtEnT+PuHFOhTdn8umLYSlyuvyczo3gZYfA6TmcFXkMXP14U31WqgdqQ
         vyA/dZkU8gL2XpwJfA9IrL7+dpdeDjafr+pHKRS40xl9PqWKg6ZEHymCOZmUFORVtFoL
         xJ07KMfj5Xx8pCwXE680tiDtIMVs+F28zYlQEC7WNjSlKHNswp5D90xKpDNOXJG+ZaJk
         lEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ytvqF/ZqeSdIbyUwKUH9eT2gg+DzZJwumCDEIik8VE=;
        b=hoMkx+8Kps0wfXZd5P1xX92kGSoxUYuHt47e8fehpBMfeKaPQNZYZO1irFAkOu3Jfg
         3HrQDb3xxl0yZqv8tcUoRNVmowskXNERIvWWEtgnyoX2pqKYkYpqoo22f7LZLVPpHo7+
         BkU9nPA68NkZCTWZeDJeu1ydFccD3OjPalH0YwTbvm41wGy4F0IX7aOKIFhix6PJrDwe
         RKxqE+CIvypFH/ZtU+jMKKaNbzMCmh2WtcqGIkT/EmOrqxAa13WSXpuFZqntC2FCkCYM
         3jIeO8Pqp+rb5ym5/IcbSICxMLoKn/3ZRJFb5N5gEJ+Kef1AdwQtW/o46geCoacQhiif
         mJtQ==
X-Gm-Message-State: AOAM531cDyG1bSHy92VC26wpxE6nqe4+1ph/yQhoerS3Ff7FA/HB4Kt7
        xWC9q1YSzJi2814zh5V2zZszatEl8aV4RuZE6dg4vQ==
X-Google-Smtp-Source: ABdhPJz2obQCjwabSzHHW28CA6Zz2X57g2dz9ds/UhMqC/vA4Af8AKjfdgsI4a+HItN2SazQGOStl6xwxxDpujPiGIA=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr782769ljj.326.1611321640829;
 Fri, 22 Jan 2021 05:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20210120050342.320704-1-drew@beagleboard.org>
In-Reply-To: <20210120050342.320704-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 14:20:30 +0100
Message-ID: <CACRpkdYnKcMyqj00_uVxhHVUva1W12Pd2sjmVbwXVz-Jy8xrBA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: clarify #pinctrl-cells for pinctrl-single,pins
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Emmanuel Vadot <manu@bidouilliste.com>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 6:04 AM Drew Fustini <drew@beagleboard.org> wrote:

> Document that #pinctrl-cells can be 1 or 2 for pinctrl-single,pins
>
> Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
> Reported-by: Emmanuel Vadot <manu@bidouilliste.com>
> Link: https://lore.kernel.org/linux-gpio/20210115190201.9273b637a7f967e7e55bc740@bidouilliste.com/
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Patch applied!

Yours,
Linus Walleij

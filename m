Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CAB35A962
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 02:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbhDJAHz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 20:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbhDJAHx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 20:07:53 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A73C061762
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 17:07:38 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r20so8404501ljk.4
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 17:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJNZvvQN4sPxM5wTrNOHML+RfF3Y8nDwxuD/Ny2pkH0=;
        b=XzsZoxckL2/lWNBV343T7e8p1OP1MEHfrrQySw3QeHFDCqhKSGv5/ETPu7lgi9+czL
         GCzTdNeJ/sv/szktTSmrR+2owxPBidWWcD6smgH2GCf10wu+l/4m1VF19xWl+Ip+jKLD
         K3ASd9yBJP8nC/sqUXiJNPb9ltqdqFHATegBbiYog/mmJV/XgUf9NGrOm2OOBr3Q7FUe
         1VGb0vo1Cwu5lWjTA+c7G8wgKFe9dw1cSOeyD/vvZL52W5BuLlgkL3qx0LRPCc5TVS1V
         KJN/jbBMZ0u+ZiWmtlTs23MUBSHUYzcx61NGUwKFwZ0xrqON6F5TzDVxbVgCW5wzQL0l
         TyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJNZvvQN4sPxM5wTrNOHML+RfF3Y8nDwxuD/Ny2pkH0=;
        b=qxptiDDczjTjbFW49LuQ5FA8n0RJjM4A0KrwhNe4Ix1D4qxihvdR1COzHdkguaBKTO
         1ot2dqF8JKJbD3PUWiDHrI10jrcUQwPx5NciRB7GSdOAA2reEurIwMkjwj80x0lsvwtX
         Z5Ghklvfn8I5suvOSWG74CH/icbyxLAbyCsWA/YMNwqiHn20C5jKk3kx2+3luYKOJcEP
         pUCeTBCtPSysVK0pETxmLOgrTQpbbnjjRrAiLwXJFkLxdN9SMN6zPL8AfvYlN20acNrW
         nDSXVLYuefOTs5BffHosOf1GBFSK0q+MLbO5jFQzrZ1s/DlIFW8vKDmA6yLJ8FoemTQD
         V+LA==
X-Gm-Message-State: AOAM532rAY/OcS4cSCJu2qp8oy+/3lQfpfNQ9Ej+fxQbxDKOYULUytZa
        HXhKGE4DLN7u2pxEhM/NCI46Gy5i1yTpayXZaWr+1B4CNK4EfA==
X-Google-Smtp-Source: ABdhPJyi9BNKN/wSUa0cnqzp5rwoSw8W2ep8I9VXh2Adb4f1hRty42wJTvzb17wXiXq9jMTCp9/8ZZiGbZUTThq0SQQ=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr10693204ljc.200.1618013256948;
 Fri, 09 Apr 2021 17:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210408195029.69974-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210408195029.69974-1-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Apr 2021 02:07:26 +0200
Message-ID: <CACRpkdYm0yG7mC0H7YwgQdPP1eT=GSkvHbohA7jc6LDsVPsZBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: use 'int' for register masks in Exynos
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 8, 2021 at 9:50 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> The Special Function Registers on all Exynos SoC, including ARM64, are
> 32-bit wide, so entire driver uses matching functions like readl() or
> writel().  On 64-bit ARM using unsigned long for register masks:
> 1. makes little sense as immediately after bitwise operation it will be
>    cast to 32-bit value when calling writel(),
> 2. is actually error-prone because it might promote other operands to
>    64-bit.
>
> Addresses-Coverity: Unintentional integer overflow
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
(...)
> Please apply it directly, I don't have any patches for Samsung pinctrl
> in my tree.

OK! Patch applied!

Yours,
Linus Walleij

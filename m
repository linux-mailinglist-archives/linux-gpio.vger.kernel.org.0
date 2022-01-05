Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3130484FFC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jan 2022 10:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238852AbiAEJYu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jan 2022 04:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234013AbiAEJYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jan 2022 04:24:50 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F7AC061784
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jan 2022 01:24:50 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id y22so159451546edq.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jan 2022 01:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x/Nken2odV4gckkQ8V6N90O1oM6oc/RLFuu7U65G9ng=;
        b=enCDi3X3u8T4D6TrBkYLVSCRvi7Icbz9yjgOi3UoOeRpka+U4Gzd/Wxd25C5Gdb3G/
         GMSeKDHw8db7ACPAcG2Aqn9Sq2unMNk+UMKtgNKp6BFmS51332wsfG9ZeSFny/AuA2YJ
         OUNBBcZ5QRdV4F4jXwWu7NTBc12LeuAlzABmgudthJ5gITvkLudYukB1uFE16vRBEipH
         oL+EZ5p1iJ+qI3BMIXPSGA1K+6gdfjB4MqqAjDIVzC2kog9gVgLX6Pp2sFfEQPpNFuFt
         jiKSPVN9qKQL0V+cFOOf0MOuJfOTFWka5pWca6b3wvfICtv70eMtIYxL4IcRJqaScicU
         OZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x/Nken2odV4gckkQ8V6N90O1oM6oc/RLFuu7U65G9ng=;
        b=nDIrHCStybE0esK9mDjXeU/e0cnJYJaH7Lwi/NJTmgCQD5FRzbEVtsvih6fQs2EtQu
         cIoeLT4pO3eQkL2iKWaL2UipNm8Uk5qhYO6AiHk+K63iVUgxXKxMB1CghE1VdFOkxo+Z
         Ratuhm6e5ov8FMK7mevhelUbEPkiH8bwuK9aK5gvzQTtKzUxi0QcOzw/OkZ9rhZi9gsv
         0YnuMp8C1WXm2pDqPuq1YZWbpVqbqOzaNdNh/irVKK9KWLkPQ1uee1K86yiCJz2gIsyA
         dCk1s5n7QabZcFluusFEaWMp9Ip7ZpK6/mXDHwO/duymVBo244XeH7ZOmDSJm8WIpqmh
         AgqQ==
X-Gm-Message-State: AOAM532whlFBGbDRybIrTel0u+qHX/BDwKbKLefc7Rl4C+IXa9LfvbwK
        aCpu6tnv2DXPUlPyfDa2ZAmb+5+72B+dV382XivWtw==
X-Google-Smtp-Source: ABdhPJyATT38VL55Ws94nS9wqslEGbupCfSKXrv3FU/7Gb1aF9isr5j8LAZacVQJUds8OKc2Sb7KlPo5Gnes2znyX9k=
X-Received: by 2002:a17:907:62a8:: with SMTP id nd40mr7909363ejc.101.1641374688581;
 Wed, 05 Jan 2022 01:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20211222171915.9053-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211222171915.9053-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211222171915.9053-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 Jan 2022 10:24:38 +0100
Message-ID: <CAMRc=MfYuu_mBe2Ym=izAe942UzvoTSuGpsEVHvuBHkO48pnuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Use platform_get_irq() to get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 6:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Applied, thanks!

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB443DB5A1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 11:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhG3JGB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 05:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhG3JGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 05:06:00 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F3AC0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 02:05:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y34so16496407lfa.8
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 02:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7fjXkwTW0XnvdKErYY4YL2ErCAYkMkBwM+Rl2m8Fj6I=;
        b=eGvLfG7jvtnjTQ7y+uCAzJHDZINAwVBBBlKWuE7mlsW14wdA2ixv+vViZ8bNRmLRFU
         LcZoDot0roZma+aktjsr9qvzqe8VziNoIxS6VbmN/Ana/GyH3CH2OW5qUr74F+/Ta7qV
         vC+gStNco8y/HFqsuHSWQXiHCoqm2WKHBfHpK+PodFsejdDk7xYD8NJ0fkdozpy5zQUu
         7H4wxOHYbkp987bOegnd8nuNL4HbDbj9g38tCQeSg2sX+1DQUFUdUbpnCAR+TwYhIWqu
         wnQepbb3xRK2LFHiVbYJaR1RDMCVGatNdlDwUrBc9nVMV0ZB1pg+jhVJts5TEcUb9qkV
         Li3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7fjXkwTW0XnvdKErYY4YL2ErCAYkMkBwM+Rl2m8Fj6I=;
        b=Fm/l1gB4G+QZ6TRZPNsJYkTTPzPmCRxLQb9VczLWPQqIeIH2EcUGBtihDn2n63uIpT
         MhMOxsX/arcJC5PPqCTRdMr8rCVjH4hqjKjM7wMvtsZqH0I2Mj04RYrq9bvd2YN8LwUC
         aHlQ0ZdXSw8/G14FNpbdFR9beU5A/GXQFY9dtFfj91ut1N4n6sxW5yoaeG49Zd75gWh6
         nw1U0pAVVjGuROOikJz/cNeZNlRbYkSTTAn9TaxALzvEn+jcdaFTOCkMsxwnnetgt+ug
         hmIa/chtV3QX2tas8PHBd0HusyCkllJk+1AJPYUosrSWyEpxsCQw8XDXDbahSjASM0l/
         Qebg==
X-Gm-Message-State: AOAM532BUmQBM3ptEqnGedwxC8kloJE9xgbEOxwlUeKabQaE7Hrkds8D
        KVRfK7ytOfdwDXC0yDirMTZx/0OvrDYL3iptkbQ/sg==
X-Google-Smtp-Source: ABdhPJzIglz1+X4aSDlLJ6cYQdggCLwPPABBzmggXznaSbU40ecn/VSlTll3FYW9jH0fHE4V0yz43gnugLU0kCh26VA=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr1160863lfd.529.1627635954345;
 Fri, 30 Jul 2021 02:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com> <20210716162724.26047-2-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210716162724.26047-2-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 11:05:43 +0200
Message-ID: <CACRpkdZdK38iwwCQKqUQ1Xbd-5kf8NFjAxT8pvq+e7jT+wiThA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add bindings for Intel
 Keembay pinctrl driver
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lakshmi,

sorry for slow review.

Since this is one of those "Intel but Arm" things I don't know how
Andy feels about picking up the patch to his Intel pinctrl tree
(I think we discussed it in the past) so I need to know how to handle
this. It'd be great if Andy queues "all Intel stuff" but I don't want
to force unfamiliar stuff on him either.

Andy? Do you pick this (when finished) or should I?

On Fri, Jul 16, 2021 at 6:27 PM <lakshmi.sowjanya.d@intel.com> wrote:

> +        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;

Did we discuss this before? Are these hierarchical or does these IRQs
map to more than one GPIO line?

If they are hieararchical then the driver should just pick the lines
in hierarchy from the parent with no data in the driver, but if one
of these IRQ lines maps to more than one GPIO line they should
be like this.

Yours,
Linus Walleij

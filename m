Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653312A66AD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 15:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbgKDOqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 09:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgKDOqu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 09:46:50 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9603BC0613D3;
        Wed,  4 Nov 2020 06:46:50 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w4so6566648pgg.13;
        Wed, 04 Nov 2020 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D13WCRMZZS+wHwyj06riYhDl3tpjBHjdfCjUyz/WQjw=;
        b=Xmhu5+bFkF0L5G71ykrfhD4RWML66PbLeDUPxDN80j7mqAhdBoe35JnX6z7+v/a7Bo
         7+R6+oHsqFud1zdiStPBgzniC0UPiEXjISKUDjI404YW/9W6yJo1Jdlcf6y5LplxldBn
         Vyct/k9aeF42siOt9oAePCkaI0rnvCyFRQka+wMW93fVCekLHmsXvGfBdTBEayUGQdUL
         YEjP906eHTFCXn15CCnkgmmFXw2Uj2vDoDQwHkCcfBxZ9xjjwjcGRTlzX1GXRjLCd+0r
         0RVIcybXcWd+v+QY7aBxZytJAZtyLbiiv/qXxCyyUQgFFNvmBUnd96YwHOgxMFAbO/vd
         6uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D13WCRMZZS+wHwyj06riYhDl3tpjBHjdfCjUyz/WQjw=;
        b=Lqh1LSzHJHOCaCKWikvKkDfN4zQ9bC04oeuT7VrXOJJfyxKrCdjlJOYjwQE912bHND
         oiEpOBBodG70a2TUsRluOKreHDWntk6iGHrMA2xkMQApixebF3Uvr7ur66RltWNz7tAb
         81rNYsU1JA2awwXiEsIAum8tyFPs/r1cwI346nF/u36U3O42NzM/hcVnKnUnHJW9b2bn
         WwLHLSLljxfEUrMjI9Cl7Yw7pqjZ207q4cHIJdaB0SEaePQsGahnBMvcasMol1cmvM5o
         QCIEeQevfW2HeXPcPXqwl8q7T5VYoQuaJhGYtQcBCHa9rTUzTEO/i5bpC6dVmxK28+Ju
         +A4w==
X-Gm-Message-State: AOAM5335Pwlfm6YA0xzW7nSh4C7atdHQG6h8xQ9xXN+ChcgYaBwUnAaK
        h0I6Hnap1uvDAnHvc3eFL5tevH9zzwbyz0gSo7o=
X-Google-Smtp-Source: ABdhPJxYW1pmghuHcu04Hyvy/6SKuowuLBL9UfmNV2kf2mBYRMh6Gj8quAE1cS+fHyXcOr6ZPHBscIGmP6v1dx6/lTo=
X-Received: by 2002:a63:3e05:: with SMTP id l5mr2275127pga.74.1604501210176;
 Wed, 04 Nov 2020 06:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20201104132624.17168-1-digetx@gmail.com> <20201104132624.17168-2-digetx@gmail.com>
In-Reply-To: <20201104132624.17168-2-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 16:47:38 +0200
Message-ID: <CAHp75VeJrQCxaCR+6u79=k=EP7y=LpEsytp6MWQ+UGz+oFXP6A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: tegra: Use raw_spinlock
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 3:27 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Use raw_spinlock in order to fix spurious messages about invalid context
> when spinlock debugging is enabled. This happens because there is a legit
> nested raw_spinlock->spinlock locking which debug code can't recognize and
> handle.

This sounds like papering over a problem that exists somewhere else.

What I would rather make as a selling point is that raw spin locks are
necessary to be in the RT kernel for IRQ chips.

> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

-- 
With Best Regards,
Andy Shevchenko

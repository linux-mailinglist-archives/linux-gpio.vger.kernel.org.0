Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C7A84DC0
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 15:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388403AbfHGNlU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 09:41:20 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46212 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388395AbfHGNlT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 09:41:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so59801374lfh.13
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kgpWH2YHfeZR/X5CTcCs2YYyG/cbaml2jN9R+mWQJe8=;
        b=drdAJ26HduPkSd8P0kndpKneVTeGSZ/1Zig8OOG1YTvaJvYrosl7dM66iI7DG12ZdW
         9nW1z963s9U5s6dZU7nu5vfBt4XPuDwOOMjtT5widxECJe4baTRFEefacJ8Mw16LpC6z
         mBAvaslfDlqc5EfYnCIYlnvaMc9VZwNjTx4pe7jBuBmmikXIs3nA6MM2Wp4Njj7WkpFL
         OjTXq0Vnxfd6p/+UClvtrqDqHAjC6OpQEO6a9y83Xus9gVjyVkpLlHwun9/COECw15AT
         Af2pxEXy0227aCJYrZA4E/SH0jb1FlygYPBLKZYAHs86Ry/adRDCzC1s+XvUiV7Ol0uj
         g8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kgpWH2YHfeZR/X5CTcCs2YYyG/cbaml2jN9R+mWQJe8=;
        b=lhMV6xJTH+qm0MS8eblu5WgzdLx7VYkev4RqZ6BLfE648T98Dshz/uPLDe1deXXRBl
         8m8HaQ5f3+DRN7+qmFkOtiePCg7w0qT4yEJ+gyGeiVjH+nBiUThvvLFAMolbc187MrIs
         26NHZx29QE3qAe88PsyLoxBNyAtTH3jaPU784upY7mT4OGslPZrMd58M2DT5hylDpqI6
         jWqIeOgtDPwktSTSwHO4znu1yPaOk2AWoX4MTVCZjyk/L/yAsZhy58VlOQtBP3IwWCE2
         ChJ73qS/bUXpPEDRU+KJaqA5bTVTP3s8ypbC6tCOAP76wMQOIzrukO9dCGE7sxBbkTMB
         YNag==
X-Gm-Message-State: APjAAAWRa5z2h2eoX2UQLfoHrgd8HrhCQRXOBP1F4Ex8Sr3KYvLPzZyD
        crYDc5x8gtVXz1zq8fL65OJmeidfnNsblgUYaUNWcg==
X-Google-Smtp-Source: APXvYqyetAWWbOXPmfrrAwd442wfPscqOxq1b+mraQGf4tL/l2xbnlWUM9Lf9Ap+xIMr6ZRLpWRfrPxYU/YbqpFiIZE=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr5511848lfq.152.1565185277723;
 Wed, 07 Aug 2019 06:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190708110138.24657-1-masneyb@onstation.org>
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 15:41:05 +0200
Message-ID: <CACRpkdYQhyh1BW789OcxGTomMkC3e8hMr8sodbWz-z1=5s9fDw@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: hierarchical IRQ improvements
To:     Brian Masney <masneyb@onstation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 8, 2019 at 1:01 PM Brian Masney <masneyb@onstation.org> wrote:

> This builds on top of Linus Walleij's existing patches that adds
> hierarchical IRQ support to the GPIO core [1] so that Qualcomm's
> spmi-gpio and ssbi-gpio can be converted to use these new helpers.
>
> Linus: Feel free to squash these into your existing patches if you'd
> like to use any of this code. Just give me some kind of mention in the
> commit description.
>
> [1] https://lore.kernel.org/linux-gpio/20190624132531.6184-1-linus.walleij@linaro.org/
>
> Brian Masney (4):
>   gpio: introduce gpiochip_populate_parent_fwspec_{two,four}cell
>     functions
>   gpio: allow customizing hierarchical IRQ chips
>   gpio: use handler in gpio_irq_chip instead of handle_bad_irq
>   qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core

I solved things like this:

- I kept patches 1 & 4 as-is
- I squashed patches 2 and 3 into the main patch with minor modifications.
- I added Co-developed-by: for your contributions

Now I need to address Masahiro's comments on top and let's see if the
result looks acceptable!

Yours,
Linus Walleij

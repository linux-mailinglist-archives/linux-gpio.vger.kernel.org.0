Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57BC959907
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 13:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfF1LML (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 07:12:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33987 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfF1LML (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 07:12:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id p17so5600911ljg.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BLYNn2gbiV06OLhtSgaE3edNKHjdYdzufxnKdLIZssI=;
        b=aB4jAYw0ITarTEmVLgxLDcVeY9dDnAqTQrOH+eSQmtxwEnZr2aepU7N1Wuidigxd2D
         ZRT1Z0P6mdrh7K7Fq8WefC0FvS1mttQvM0xqZG6DtdZ0raxdb4UGy533kbl9/k1UI7Ot
         JQxV3TXfEo0qzBlop23mSFlXFT4GJPZnfLpXBcsJzt6y3fbnUyUg+TxqS3aNhnWYZ3u4
         awcfS4M41NAhFFmOlaKCsPUb8n/gAlc4bCy3nz7XKx8BPTISLej0nIK/VWGRFNSKxR0e
         3UEpxeSmarHWcAiGTsp5Mo7lCrMpgRKzOGIrhG11cPB+4uJKK3pqczfI1F6oglcNjBsM
         81bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BLYNn2gbiV06OLhtSgaE3edNKHjdYdzufxnKdLIZssI=;
        b=W5ifjRWjFN7JPboIaBLbZH/wuxkzC0NhvLD39kGUsGK8H2XZztmYMe4C3GsGFvU6MD
         xpAw3HntjenRplMqReDl9J3kRRp2S5NMklqwEmk9hA4s7d6d0SbcCo818bdBD32JYNuH
         PdvWhyes7A4xJuVt3o5+nffYizaw3GrPbAaUQeRrumYT1TNiqqoFsYf0GixfybsPuL9I
         E7a0puDvU9NSF3MUWJSG09w1fCEMWpDbID4MT0cas84HKWJHs+Al0PWvoBJq280DELBu
         xVW2GG64gqwEJUN2a9gBg/dv26WeYaEmJQQ8FF2w8rJVc8PjnecqbfkdBtEl7oQgt8hu
         VGyw==
X-Gm-Message-State: APjAAAUoR3GeT2pKdGDFH3t4MEVrZWDh4UfKSTEandChKrjVW967wyAp
        jm2YYypjbIHn6VpNkhmDfHu/vl7b3SyMjzci8SXyFA==
X-Google-Smtp-Source: APXvYqwy5vCgIzc8hAKtHz38Udr2xgppaLDenX2DXviD7lMDZFUZyq+pWqt3ymHcAhiH2VSMYhX9bYFpmLkuJH8CppI=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr5828695ljb.28.1561720329467;
 Fri, 28 Jun 2019 04:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <20190628104331.GB17335@onstation.org>
In-Reply-To: <20190628104331.GB17335@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jun 2019 12:11:57 +0100
Message-ID: <CACRpkdY1SZDphGmEXgFQwirVNO_Nn+qz9oojuQuRoEscgo_22g@mail.gmail.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
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
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 28, 2019 at 11:43 AM Brian Masney <masneyb@onstation.org> wrote=
:

> I started to convert qcom's spmi-gpio over to this new API. I'm not done
> yet but I noticed that this new API assumes two cells for the parent,
> however spmi-gpio's parent (drivers/spmi/spmi-pmic-arb.c) expects four
> cells. See pmic_gpio_domain_alloc() in
> drivers/pinctrl/qcom/pinctrl-spmi-gpio.c for more details.
>
> What do you think about adding a function pointer to struct
> gpio_irq_chip that is used to populate the parent_fwspec?

I discussed this before with Lina and I na=C3=AFvely thought we
would have only twocell irqchips... OK I was wrong and
Lina is right.

And I agree, let's put a function pointer for this in gpio_irq_chip
and add code so we default to twocell if it is not specified.

You can hack something up if you like and I will just put that
on top of my patch.

Yours,
Linus Walleij

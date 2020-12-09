Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4362D3E25
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 10:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgLIJEy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 04:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727920AbgLIJEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 04:04:52 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC11CC0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 01:04:11 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id m25so2047388lfc.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 01:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8KKN6kEP37Zb7PmsnDAFaBNjQZ74PfUTCo3xpIHe+4=;
        b=tjbgpYtBD9Cp3oZ/+ZqVBgK6uC90kg/92F0++7454fg6X8Y045ejX12IJi61RR56Tn
         CSR2t9R1X3AqFKJ5434ULkCLTHbcDD9pJTJudwHZdYfCIGntqZx13i38HAnQmDCw/5ep
         0GAnISEMnHP26rv0VZkfAcbZW3CFFErixasIE+i6SQQ6HINGDEKY5sWz/cjrlRHseQK/
         TybZFQwME9Ej/CANfPWjJabsFL3zHvJyzfmMbVT6efU7iFMWW43/ldBZ0K2GjnbH/zi9
         AwN44apWWTMptUo6wJak/8T3RnkS3mZWJScdeCj/Zm9HYSoXlkTnG1kA/r1UGLcosH58
         c1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8KKN6kEP37Zb7PmsnDAFaBNjQZ74PfUTCo3xpIHe+4=;
        b=NX13c8RxoNEwasL5A75fzdP2Rb9BtW96Bla+a+PqCMgHV2XsVYBCzOteh2u95mSSCH
         QYGPtgz0ifKy98ycomlTxQ8LDrhCaiXZw8ZTJo92suqTY+Zist4vghQxmZl+pQG4ZXWb
         mQfwA+BebxGUvrUPZhDrQhc6bkcD9+4+5Kp9zzoYy8ubVXqYkWrC/YxaQgTmCg1WKnd+
         DY0p6+tIBNozljRyqakD/UTOWmEJTY+kZ7iV8D5kjdlGzru6cnMzQCcppxDCl+bS8Lmb
         hq3bm8sIFwQNj7F2yJ3AinuhJFsn2W8ke5kad9Wt5oH2CDH3aVXcx9jkpAGg/QpVeZDE
         Ym7w==
X-Gm-Message-State: AOAM530/ItsNr2r3DGkTPmLUSmTHLdL4YEKP/l0yuRMqGZ/WtycrWug4
        tqvqht3zYqN5dnFsKj5Qc8ieIsCWvs0HUA1sUcN8Rw==
X-Google-Smtp-Source: ABdhPJwuKkyip48lpOSEFICnOa696vlq3QGttzrv7MSDYITrNbVRdD+irJ6V6I1ixXgelIrnyZ0MGPhltSqo1zq38bI=
X-Received: by 2002:a19:6557:: with SMTP id c23mr633204lfj.157.1607504650310;
 Wed, 09 Dec 2020 01:04:10 -0800 (PST)
MIME-Version: 1.0
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
 <1606901543-8957-2-git-send-email-luojiaxing@huawei.com> <CACRpkdbodato7AL4xv-oEO9+-Mo9fDaH+jZh+6T=3urE0tbULw@mail.gmail.com>
 <5955bd97-046c-8ac3-f66e-ea967e8f9128@huawei.com>
In-Reply-To: <5955bd97-046c-8ac3-f66e-ea967e8f9128@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 10:03:59 +0100
Message-ID: <CACRpkdZPmVWHV9Rbpfma3gDic=fmQQ9B0oQ0HsqwnJ0EpoGENA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
To:     luojiaxing <luojiaxing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jiaxing,

thanks! waiting for the new patch!

On Wed, Dec 9, 2020 at 9:19 AM luojiaxing <luojiaxing@huawei.com> wrote:

> >> +static void hisi_gpio_irq_disable(struct irq_data *d)
> >> +{
> >> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> >> +
> >> +       hisi_gpio_irq_set_mask(d);
> >> +       hisi_gpio_write_reg(chip, HISI_GPIO_INTEN_CLR_WX, BIT(irqd_to_hwirq(d)));
> >> +}
> >
> > Interesting with a GPIO hardware that both as enable and mask
> > bits. I can't see why, usually they just have masks but I suppose
> > there is some reason.
>
> I see gpio-dwapb.c distinguishes between enable and mask too.
>
> In my opinion, enable indicates that the user uses the GPIO line as the
> interrupt trigger source,
>
> and mask indicates that the user does not want to see an interrupts for
> a while.
>
> The difference between the two types of flag is that interrupts
> generated during masking are recorded but not lost,
>
> however, if interrupts are disabled, interrupts will lost.

Ah, that makes perfect sense! Thanks for explaining.

Yours,
Linus Walleij

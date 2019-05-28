Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487492C55C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 13:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfE1L0i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 07:26:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41047 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1L0i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 07:26:38 -0400
Received: by mail-io1-f68.google.com with SMTP id w25so3946376ioc.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f63H1f5vJ9qAhu7DFKNxQrE7HwrSDOZLpyEalUp3FmA=;
        b=MoNcMVK+19rETeCSdS86WvUOF+QanmMuzgyz4USKjDCyqJy5ATxtytdNyWhLUhPzK7
         3lLrA4eJp6EUT974Ua9jV0EW1h3qZbVDHKknvEVDD0yCnCqhV3q1+395Q30LTAn5kyK8
         YJ/9sbJy+3/3jSrakrFSJGTunWBuqpSw9bTrYyQLBB2BB/1K8kUaCM1rOjXwFd8T1Kem
         x5hrYzZwsa+/3J4oY99XIA70l/itoCfN5VdEhdJgMf5CBuZH+xrGEZNyswxjs+4JDpGK
         x04m+SZ/gzISHQNxsntNIhWsx6Qp31qyqxvHeq1YNtXegLT6XWBd45+kOk48qErpubmi
         DSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f63H1f5vJ9qAhu7DFKNxQrE7HwrSDOZLpyEalUp3FmA=;
        b=AW+KI7EKdSyPNX4ShYZbpqouvTAX7QcZpT5yjdNpjYyxEFrPCQ09kFpR2W64ZBePxt
         R0CZug/FoUtZ9fRGhabPrraI97Vz0erO5R6Kpd6r9mQL+aBA0FITnvQOEy7sK64VkQHg
         0B8KhLOWLJhP9JyFubMe8Z+tz+wqxgwOcvsmJ4wvlN+cDLxR3hFuy/YM/8g5Or5gRQ87
         iQsNFOKOqkRBFHGX5TqpijTyc9uY3ucCm/fboBB/ZCBw28we0uDWgg6GJLMVP8p8Su4/
         Or1v+aw6G+12h5MzAXqJj6y9H+ogIVbsqNChMHK9mqbUhUnmKkjbU7ANKKN6/g0yixVX
         SLvw==
X-Gm-Message-State: APjAAAUAUnBIsbDhBYicSLkdll+O9ysrSZdEafG/6cCU47mZbHz9lNjY
        po4nrRIfJmk98srR5X78hmnXF+6KvT6MWLgIPwvauA==
X-Google-Smtp-Source: APXvYqxPxBqa6Q5trPqt6nLpEjrJvWagv+vXglYbTXmsfxK8aHVbZ7UlOoBk7J5fCcFuJ1NWlwPXJV7IrICxwnh16Ds=
X-Received: by 2002:a05:6602:2109:: with SMTP id x9mr108496iox.128.1559042797766;
 Tue, 28 May 2019 04:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
 <20190527112720.2266-5-ard.biesheuvel@linaro.org> <CACRpkdZt-AosWLPcwDQqi_2i4adDk-ioT3g3aTicyXiZpQOGGg@mail.gmail.com>
In-Reply-To: <CACRpkdZt-AosWLPcwDQqi_2i4adDk-ioT3g3aTicyXiZpQOGGg@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 28 May 2019 13:26:25 +0200
Message-ID: <CAKv+Gu90dwSdLOwVFEuobSEAMYCS+ju8x-MDHVGng8OKG7taug@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] gpio: mb86s7x: enable ACPI support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 28 May 2019 at 10:34, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, May 27, 2019 at 1:27 PM Ard Biesheuvel
> <ard.biesheuvel@linaro.org> wrote:
>
> > Make the mb86s7x GPIO block discoverable via ACPI. In addition, add
> > support for ACPI GPIO interrupts routed via platform interrupts, by
> > wiring the two together via the to_irq() gpiochip callback.
> >
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>

Thanks.

> I assume you want to merge this through the IRQ tree or the ACPI
> tree, so go ahead.
>
> If you want me to queue the whole thing in the GPIO tree just tell
> me (once we have the ACKs in place).
>

Marc is willing to take the whole thing via the irqchip tree. I'll
need to apply some tweaks though, so I'll send out a v4 shortly.

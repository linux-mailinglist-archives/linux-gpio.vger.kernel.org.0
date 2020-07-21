Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B87D227C2A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGUJyl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGUJyl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:54:41 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91885C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 02:54:40 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q4so23458703lji.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V+ApNFhuh5/Xa/SN7ZB1B0XnAdKPMO78qt6VCOOCJqg=;
        b=dZlfOtv9M2z3+pJgWrhyllBxy8r0XXctLO5AQ84BLB1vI63c3myBMV0GsMsRCRKP1d
         /SBlqbN1sm4ovKmAMHQMJ1u92152Z56TyTANRm5riNlfANDy7wlCdWlyYAvCLMCvVVdG
         cQZJzJIiEynKg8QUvEZZFN1SmknDA/9xrZTyefJODr59/NQfzStYYXjjikOT39LZ9v+3
         Dw8At+QiVTOXXYrSlJXLvmyxt6Yyu5E4iMqIKSjLUoUGdZJ7AcqfhyQkXw/U2O++LwCv
         5b+Eyz05QWX8kNBNtyHmiE3+R7LnyK4DqeNBAbSIttTKUCclOH/crvMeFljY37WNyJhC
         IA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+ApNFhuh5/Xa/SN7ZB1B0XnAdKPMO78qt6VCOOCJqg=;
        b=LUvgFIueV0ceTNIDNVyUXx463Fgvq/6zPWNJUP33dJ0mLQrx4zXx+kS/7bJQjUYxe+
         +9nSN4GlzufrwNp1oEDWTIGlvipyfze+QjmTUqZwucRGqSpUDfhIoNewI+NORMQfLHhO
         W9Rb02QQCJdtEWS4Y2fBlIPponvZyAwUZ764UtG8rlCGLdq2h2Yt0k2S+CIazPE9VqUU
         ZABIf6oKZhGtyEe5mXk4VFvo/qyh7915UzmJUAJ1+/HjLyM9Utg+E5EEYNuNNX9yRfPn
         Y/tlAzwgQl1iEWpVaRKV+BU051LS4vH9xUliLyR4YT2d9QxfRUJgph+saIafuzY/xePn
         QwiQ==
X-Gm-Message-State: AOAM530EyM8Qixo2dqxC7ovGhTWCK3Lwvv/f8CDJ2ffS0NfqwTkVwU7u
        t8p+0pb8mIR5rvvFnh2LLd7UDTwhU7oBFm2T3uGu1Rh9OZQ=
X-Google-Smtp-Source: ABdhPJwiqdXVOP2EVWX0e4HmyETgK0ZEVX53VGIlsjjP5dew/XALNhjoGvyaW5SDBjeFf09yK2urYl4wdS9sTZrylTk=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr11768878ljc.104.1595325279059;
 Tue, 21 Jul 2020 02:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200717141924.57887-1-linus.walleij@linaro.org> <CAPLW+4kX_1YNDNNeqzQGHZmnr0PYKHsrN++jw9-jOYv6Da3UuQ@mail.gmail.com>
In-Reply-To: <CAPLW+4kX_1YNDNNeqzQGHZmnr0PYKHsrN++jw9-jOYv6Da3UuQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Jul 2020 11:54:28 +0200
Message-ID: <CACRpkdYxhOQnXUaW-MdT4NX+NEES91NOoMPR6wEcaCrUR253Cw@mail.gmail.com>
Subject: Re: [PATCH] gpio: max732x: Use irqchip template
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 19, 2020 at 6:34 PM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
> On Fri, 17 Jul 2020 at 17:19, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > This makes the driver use the irqchip template to assign
> > properties to the gpio_irq_chip instead of using the
> > explicit calls to gpiochip_irqchip_add_nested() and
> > gpiochip_set_nested_irqchip(). The irqchip is instead
> > added while adding the gpiochip.
> >
> > Cc: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

> I can test it on my MAX7325 board with BeagleBone Black in a day or
> two.

Thanks! No hurry.

> Do you want me to verify your patch on top of linux-mainline or
> linux-next?

Either should work.

> Also, is there any specific stuff you want me to look at,
> or making sure there are no regressions w.r.t. IRQ from the chip is
> enough?

Just that really, that the IRQs happen as before.

Yours,
Linus Walleij

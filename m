Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71AE6957F5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 09:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbfHTHMS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 03:12:18 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43380 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbfHTHMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 03:12:18 -0400
Received: by mail-lj1-f194.google.com with SMTP id h15so4091951ljg.10
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HHSoqWKZEGvJJ3+or43k3Z7aZ0JM++edMhoQlijfvls=;
        b=VwuASG2RtKyMhxNLREWp421hmIqGZ521c56swV/Ot1Rmmo369Vat8gqvMuAkadMD6t
         FmKFqdcsB6UzQT0DifyJW4Z7hm1fVoMPU5RFTlMtdPVX0u6u3sJp34Ib7iQTQo3LBrDx
         jii1kap3+W20kvr6AHOfLCFFEgML4W9rrcMSXcq0OTNJGMJIjosVGwjzfSDFZjI55zuV
         HTmpqVNvjrOZUCRcmNf6lHkbvdoO3zzUCVWTq5Zeuiwr8+SjtUmyF1XnyYXGurmr5MSX
         nHwGFXZTHrXdySpLKbUrZmnA9xXlqVqPxZp08uSHbRmmRiWI6EokTiZBOd37z1KwEN4U
         ty0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HHSoqWKZEGvJJ3+or43k3Z7aZ0JM++edMhoQlijfvls=;
        b=h3f2oCo/1ViHDLfNxPWVuE5P+g4sRaW1oC3CK4pTnTbinip7fZW9UhSUjykfJi9nL7
         5kJruAxnju++nGPhFHGjtK0sKMv3yz4xGJ4/rsCXZd3F72dDXk6eaiz1HOh5REk7KocZ
         J77sx2XziOeK+/C5TXcKC3q7u4frmgFuoMGw3PfO3q+lX7o0vfgYKdLYGBAK39UeyVb4
         nsbkNHEchGi46Wj3pSOFoxXLGwqxxARsKeaFLJXvao3MpK71z5F1uw3xbBnyuATmSpsj
         eQjGpQj4K7+SalQomr6oUk1D2ghZp6N0fm5dGWTi9mKbZtI5l+00wtSs2ACH9RL/6oYc
         7T7w==
X-Gm-Message-State: APjAAAWmr4W1eyyKugvDl58MrnVJDwcziXwZ27OuNXPB6p9WUz5cXmKU
        NXXwD8K0eWqDD/+D+ZT61fQ1REBIkz/3rgBlljhXZ7QorbVYAg==
X-Google-Smtp-Source: APXvYqzvOU/pXCt+Y4om2H2xOwRjllpQArHaRTouxDBCQgr1luDhMaWUq5i1R1z6lbicAftr6o4Jr+oiaQox7/zjQ3Y=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr14924495ljo.69.1566285136324;
 Tue, 20 Aug 2019 00:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com> <CAHp75Vct3qtR5bDF6iALmduKEEq+gNL-btmzQVuWq_hYsmxKhw@mail.gmail.com>
In-Reply-To: <CAHp75Vct3qtR5bDF6iALmduKEEq+gNL-btmzQVuWq_hYsmxKhw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Aug 2019 09:12:04 +0200
Message-ID: <CACRpkdbRZ=88+ooW5jb5vu4Dwsaj7Ce+V5Ked2-bGn0JWpTHfQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pl061: Fix the issue failed to register the ACPI interrtupion
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     Wei Xu <xuwei5@hisilicon.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linuxarm <linuxarm@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>, jinying@hisilicon.com,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 19, 2019 at 5:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> The proper fix is to revert the culprit since we call
> acpi_gpiochip_request_interrupts() for all controllers.
> Linus, please re-do the approach with IRQ handling,

Exactly what do you refer to when you want me to
"re-do the approach for IRQ handling"? Do you mean
this driver or are you referring to:

commit e0d89728981393b7d694bd3419b7794b9882c92d
Author: Thierry Reding <treding@nvidia.com>
Date:   Tue Nov 7 19:15:54 2017 +0100

    gpio: Implement tighter IRQ chip integration

    Currently GPIO drivers are required to add the GPIO chip and its
    corresponding IRQ chip separately, which can result in a lot of
    boilerplate. Use the newly introduced struct gpio_irq_chip, embedded in
    struct gpio_chip, that drivers can fill in if they want the GPIO core
    to automatically register the IRQ chip associated with a GPIO chip.

    Signed-off-by: Thierry Reding <treding@nvidia.com>
    Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

The new API introduced by this patch is what I am trying to switch
everything over to, because the forked paths inside of gpiolib
is causing me a maintenance headache and also increasing
the footprint of the library.

>  it seems broadly
> regress with ACPI enabled platforms.

It only becomes a problem if the platform uses ACPI right?
But it's a problem if I can't really tell if a driver is using
ACPI or not, there is no sign in the pl061 driver that it would
be used on ACPI systems until now, so how do I design
for it?

The problem comes from the problem/mess I am trying to
clean up in the first place. So if the new way of registering GPIO
irqchips is not working for ACPI, then we have to fix that instead
of reverting all attempts to use the new API IMO.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D363632D0DE
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236771AbhCDKeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235607AbhCDKd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:33:59 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C60C061574;
        Thu,  4 Mar 2021 02:33:19 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id u12so6601600pjr.2;
        Thu, 04 Mar 2021 02:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DbTGwtwN+3FwBHptevJXZkE1kRcgS++9qmkLPqlJEgM=;
        b=DEMEpGAJ8h04MK/Ux5i21+AZZ4hE66NtW86NckRm18a0lCmN3Ib9iR7vc29mpZlQEp
         6snIV33kEKDq/gumlRe6dbRFX7pv93WLSXjPvlEj8OciNFSSKhtoMsTstJKZlzAPbXys
         PM/z6Mgq0atzVfBcxMP4x10J4Re2LX78ZLtKRGxNHvfhBYFkFeWdaHD2w5AcN0893q5U
         SM3MZvQvOVms5NGjx3fyte8bdTpRtnFGjl3HcyCoIvXLMleqNmKMvxIvOOdGqKS7O1yh
         5xeyY7+XJygG2taB12Cm51CMCdHCbBLorZ03tHtWQ+oXsjD/+EOU5jXN64dv5ufw0gQv
         4Nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DbTGwtwN+3FwBHptevJXZkE1kRcgS++9qmkLPqlJEgM=;
        b=rD8egkSv5lZ4kNoL4uBh+rZ4wwHND51GMmLTlklYPRBqfCcc6BbCouMPZXaf8VsUx9
         zcP0HPPAKowniVi3MvP8zzsBVNWdqfPgPMfh/p4YKQlKfZqxw8cXl3BBcSaT6QMxvntr
         xTCxi7PMzPN+K0m0fBfG/G5lMu9je7Cj543PzjLa7FR50E73BcUTYTIg37ESLWZ62bJw
         SqTgL7z3if+0OVRQeuEEqZHhFaAyo53hCrwMaEhnPN2B9mvdcTrqnjZQcWjGbcyHofat
         75Bizpa1JSZOQ1JmQ3d3HqhjKrdBxHsY34R4q5rCMttFOQiLafxP6LudE2ak8sjDoCAr
         Uoog==
X-Gm-Message-State: AOAM532WqOr6JpM50CFmwL3W7mzg6TGEFAwQlmkLA9sPkxO6vinIYsZL
        3OARCLFaKTJO8OvNvw9Dv+W6eddlzDlAkFNfbJg=
X-Google-Smtp-Source: ABdhPJxNQSj0S3iGBlwnK8egDCqTMJ+MAyl7DDSfnL4kOfExCG5mu9h72f+jq68lZPe/6mS1ajKMEMejq2LS/diUXJ8=
X-Received: by 2002:a17:90a:4586:: with SMTP id v6mr2220656pjg.129.1614853998595;
 Thu, 04 Mar 2021 02:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-2-noltari@gmail.com>
In-Reply-To: <20210304085710.7128-2-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 12:33:02 +0200
Message-ID: <CAHp75VftSREbd=k6tr5VCk7rZu3Ftsv-5wr1MOv0eVHRD5PJTA@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which resul=
ts in
> a compilation error when trying to build gpio-regmap if CONFIG_GPIOLIB_IR=
QCHIP
> isn't enabled.

Suggested-by: ?

> Fixes: 6a45b0e2589f ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  v4: add patch (fix include instead of gpio-regmap.c)
>
>  include/linux/gpio/driver.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 286de0520574..ecf0032a0995 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -624,8 +624,17 @@ void gpiochip_irq_domain_deactivate(struct irq_domai=
n *domain,
>  bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
>                                 unsigned int offset);
>
> +#ifdef CONFIG_GPIOLIB_IRQCHIP
>  int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
>                                 struct irq_domain *domain);
> +#else
> +static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
> +                                             struct irq_domain *domain)
> +{
> +       WARN_ON(1);
> +       return -EINVAL;
> +}
> +#endif
>
>  int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
>  void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko

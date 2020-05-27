Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252341E3872
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 07:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE0FrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 01:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0FrH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 01:47:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C38DC061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:47:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m12so24969288ljc.6
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0vbClyMx5TYGfqb4n9vTWCrpjeClZWLtPJ8NtG2vwKo=;
        b=PMqtX4Tf2QdfwA7Y/oCNz5uo1onqPJhW+dvGH8XeGwSNSHEH3l0gLjrABXY8//QuHu
         LTKmC79E6MJknT+SN052hfeh+QSxLKfJet+K+mk8CKFMX6c7QmGruUZGwkI2t8fK1vBB
         4WozqztK7Xgx1K+Y1Nlj6KIVt52yVZmuoUNcPGT1UZLmBstgWLcIVVIhJ0Mqzi2gC98f
         /8OfNSsSIOr1Ddld30g5Bwo19zSF/RifzESB9JGxZSU5wCxIB/fjEI6IQGsewIVKGuG/
         Rieog1tIPUf9W0rgvZSP0h3bKXG/7Sj01PbIWYZPiomrTl8fw4VSq/oGZrVHfMaIGnuJ
         5BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0vbClyMx5TYGfqb4n9vTWCrpjeClZWLtPJ8NtG2vwKo=;
        b=DWUX42kP32DDMXgccKIFkTC+bO2pskDcQeob0EZiLop39c+TsXNVWkOokU7B9IrzQQ
         QYI1FNla2I2+gONXBur7bMpsuWoia8YgwN+xQ9rfp0m21uelHR6OEgWqNA2VKaSYYd3Y
         D36or0hbD+bnb2D6t61OnQw8FSGrjB2AQJa+0xSSqipBxVKr1IJX+9rh+IogftGIZGM1
         ruIv20NC66Tb6ra9UyW2JcJ7TzmwE1ERKMgn7TeTB3qz3Rsza4IMvQkBVaDX6kxQJTNB
         Li+vrH5Lk73Cb2u7P+tuYEWOgjMNgZHvIAsRTtpNMi8SIbxxuY+mDZExkK9tid4wW8EE
         4Eag==
X-Gm-Message-State: AOAM533ALbTPiFcGy7mNAMb7yTmWrZ9YREUtH9+89eJDsKHYe1l92ll1
        cbqm7xVGfrQeFiuCtYWVAX2wmudysQf5QCBncmb4Ow==
X-Google-Smtp-Source: ABdhPJyv3bPK4eBrl7Q8xFwA5cyGPrOlHm9mYwvexO9lbBBjBYk+CVr0EJCiN/7CZ3fREvcRtkUolQAUTN5T1mgeato=
X-Received: by 2002:a05:651c:32d:: with SMTP id b13mr2236669ljp.283.1590558425866;
 Tue, 26 May 2020 22:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200526171222.14835-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200526171222.14835-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 07:46:55 +0200
Message-ID: <CACRpkdY8yXJUcWBG2ACHPmu4-+h4fY7Fuvbn69sFny2uZNrQmw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 7:12 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> +static int pca953x_acpi_get_irq(struct device *dev)
> +{
> +       int pin, ret;
> +
> +       pin = pca953x_acpi_find_pin(dev);
> +       if (pin < 0)
> +               return pin;
> +
> +       dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> +
> +       if (!gpio_is_valid(pin))
> +               return -EINVAL;
> +
> +       ret = gpio_request(pin, "pca953x interrupt");
> +       if (ret)
> +               return ret;

So would it work to do
gpiochip_request_own_desc() here in some form?
I.e. can you figure out the hardware offset number?

Yours,
Linus Walleij

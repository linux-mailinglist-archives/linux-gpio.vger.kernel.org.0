Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B5644527
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfFMQm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:42:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38133 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730514AbfFMGtG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 02:49:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id b11so14160883lfa.5
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 23:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1ul9q93DMTF9fOF4OTMBFxypkqDQ0BHDLiu4KuQL10=;
        b=KMppsMt8BkVVt4uUqhw2SrdqTarwyhvpsyDtVhZldaP7nJBeyTfxEESTst6AqDJ1Oz
         6vlRDsUGu3bl52pTbQV/5UjvRQxxrRthay47SayEDABR7JeE9JzAeHzeCgmggBu/yOVr
         aD2jr/YAEbN2D/ewXOQw6MxO6BlPd/+6CL/3VgZ6iJbm/ZswnSg81IIqHxKPW7Kq6Sy0
         ZL5F/AhWvLjo+ObSp1pHcuq6W3N691RZTOU9z9MHeT5t3JKe8p+Qxu+XjdmPZ0u1XW/2
         8iQxGpcpeFLKxoB3wnmM39vVMeycEEpVa+Xo/3BteiKspNaJLPnGKE6tUxz9lHg0FF5N
         d+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1ul9q93DMTF9fOF4OTMBFxypkqDQ0BHDLiu4KuQL10=;
        b=L5QNI4+cn0pIvbcaYptFtyTbfDPKHqqGWEPRcqK9CUgu/D57l03AqVJZDQMkTEAWzw
         PLFruG0UbYH57MHWQeOmWM/kzcmZR2MmOMRlZ0dvpJwFlOGaZ5GhVFJ10EzilKmTL2R/
         41Tvbnkjz9qwe6uElJNPcMgOQAdLC1SUBkzcFe1pVcwCze+ALSmmO24gAjc/n+lD2B1G
         mYezxZ6h8yO3NP3VhUbn2hY0TmvNLg3nRKMF+7nHO/gsMTKcAWn2ygecjVbueThUzbTh
         SxaIDfsefid0LOBKrkU+qvLWkcfCclsFIqCb9O2jCQjYUEso2mAPsWGe78nAkxdLFPvS
         dAUQ==
X-Gm-Message-State: APjAAAW9rOHuUQQ1/TB3/2BW5micJIF73wDV+emcTKWbG+GdJ74oI98t
        HSrhLe+diUo0BT4TWuBItOb1pG/j4V4lykoQCRBXbQ==
X-Google-Smtp-Source: APXvYqzKtdLCW6OZTLopPf2ocC/MLTwV93BokjDpORyBw0FQUk/pTKnsuj1Pfvn2t+CFt4v0aTC7625m7Hvz61+ZKmg=
X-Received: by 2002:a19:7616:: with SMTP id c22mr1160459lff.115.1560408544770;
 Wed, 12 Jun 2019 23:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com> <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Jun 2019 08:48:53 +0200
Message-ID: <CACRpkdbE5pFRr9vtd_OUCbRBz8H6HuvX0cxp83FBnZZsws5r5A@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio configuration
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Oops I missed one thing:

On Wed, Jun 12, 2019 at 6:50 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> +struct gpio_inverter {
> +       struct gpio_chip gpiochip;
> +       int count;
> +       struct gpio_desc *gpios[0];

No [0] as Geert points out and:

> +       size = sizeof(*virt) + count * sizeof(struct gpio_desc *);
> +       virt = devm_kzalloc(dev, size, GFP_KERNEL);
> +       if (!virt)
> +               return -ENOMEM;

Use this:

inv = devm_kzalloc(dev, struct_size(inv, gpios, count), GFP_KERNEL);

We use struct_size() for dynamic structs with headroom in the tail.

Yours,
Linus Walleij

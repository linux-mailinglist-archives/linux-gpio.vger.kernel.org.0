Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774B22182CA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgGHIq1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgGHIq1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:46:27 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1455DC08C5DC;
        Wed,  8 Jul 2020 01:46:27 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d10so17900269pls.5;
        Wed, 08 Jul 2020 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qZ03xHjfNzuDWZZiqGX3DC5kj/5ECeAjAtUS8El4zxI=;
        b=CLAgYJWd+YFh+FhheQsiQlRG23S1ygvduKQakyCbQaXXn4Y9hloZ8AozIu0g9TZPWA
         LSE2Rq2FK7eB3zMAiDnf9WymVcJCZyDDNryYZNtEGlk2HXtRD2yDDkqwAwNS7wRtkL1X
         Jpc1talIySbvC5YD7MCo3KMR+FoE+ieQ1XhPkBlmU7k7aeMflKK8WL74mF9K43kIGEIg
         Hs47MOURiyUquCarPdkcmH4yEogYFzYSVBxXs1CU4fd8GDw7hURnTgSy5zJAA0BjE/Zm
         6uW+dJOJTur86d222p7ZBHthepNmyk/pGvN3AwlFR521by7BDlo+JZrCtDQ0zQOO+E+I
         Cv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qZ03xHjfNzuDWZZiqGX3DC5kj/5ECeAjAtUS8El4zxI=;
        b=T7XqOoSVHyOHVoRvMcX/kXhtdYxqck6BaiMkvcJPtaCbftzDJn6N5rnoLdEFPNnKj1
         mOR29RNEzjgiVo5Z13djLCMBj4wAHsspIMJSfgyrGdk+6euL20rAZct3RSuL2122iPYz
         wCkow6P1BTTZ5VrwHxYuOdEGLELOHLwdm93Begh4h0lv4m2vW/8CrwmkTSQ6t1Zkx0PO
         hv0PpPeGSl7o0v4vjidQPjEK7ML6hbI/Ww736G8aK6TXxCcoCKwjEE4IA9X0jBXoJ80m
         UrcVyRL4fWpQkatr3ehk1ba/zmWCS9lcfZ79JZWnYYt//DqtDeXchFuTEa6lSck8BHFv
         uP8g==
X-Gm-Message-State: AOAM533zKdpVn91NT4beoetsZQeJJpBqjAha0irRm7O+1MWetZk3PxIs
        jelJp1DckB8Wk1AEGDZZRQTeCZHsITv4fBdFCFINEqYA
X-Google-Smtp-Source: ABdhPJw62QDV2zS9snbcU6B0PJtG2PoCPEmLwqHtv1nmLPPBS6FOt+ZBjxdzZQcf/kuLSApkcuNiUI++nJ/eTvuhTCM=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr8389174pjb.181.1594197986603;
 Wed, 08 Jul 2020 01:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-5-digetx@gmail.com>
In-Reply-To: <20200708082634.30191-5-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 11:46:09 +0300
Message-ID: <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Check whether GPIO IRQ is enabled before proceeding with handling the
> interrupt request. The interrupt handler now returns IRQ_NONE if none
> of interrupts were handled, which is usually a sign of a problem.

...

> -       pending = value;
> +       pending = value & gpio->irq_enb_mask;

> +       if (!pending)
> +               return IRQ_NONE;

for_each_set_bit() should take care of it, no?
(and probably return with IRQ_RETVAL() macro)

>         for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
>                 unsigned int virq;

-- 
With Best Regards,
Andy Shevchenko

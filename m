Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8393578214
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfG1WaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:30:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38752 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfG1WaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:30:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so56639278ljg.5
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zdX9YrMQVaxUpfOTBX1O7pLAKJ90DiMSNYDDgK4w6MY=;
        b=uzHn7y7a0Y0/qlrn0YKzbEZHsMJUT2XOGNwHEDmiall7D/hRi7/Pa0PXDWsMKK8M/x
         +T5Ufs0bPMV5NZn4UKxhRQJRiV7HioFeyz42N5YxMlqpe0otIap7wBnrRHIXRlabL6F+
         tIw+FW06ASnNiOMxsazFNARFAoQxhXCx8mVUKVQUiwc6s8eKSGDQ+wV6xvlP+RKVCx69
         AthGteqAMcNz4kes7DpXDFFTXyZdf1plXIwdX4VvK4RzT+DjLMcAtCpSZs6JrLBP3hiD
         AjyFEwNvD7QVeh3gFADQG7mUdVU4Krzz3Mz+hC8ImhnfZx9OK6NL+asd76M5rif4Ggir
         TO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zdX9YrMQVaxUpfOTBX1O7pLAKJ90DiMSNYDDgK4w6MY=;
        b=D1fnSo+LxNUotvB6vnBp1LKuhkAcQFYAh9zRBG3xF+pa4sjYNMoyC6Rxh0r9rKrehH
         yGy+Opt1XKRc05+0OKHW5TJwP/e+98rCW8TI3RW4P8shfmiwgGvm6qFnPuohZS7cYItO
         zQxRBy0AkpTuREDpp5w09SUFSQSr9uKR3vCDP54oXi4oPYegYUEWJZ7PyiMLx66xJdUD
         kJnEGEhgv/EshvzY4L24M2eO0dUO6qmZ9fhtHoCy4ZqLRdA9MVQh5s7Q8aplmuephqJk
         8vFtO9V54b7huKQ9tj+aFvaxHgZ9N6GQB7h/4J6pdlwPmQ8p7PrEvHM1JGzTE/QkDhBW
         IqUw==
X-Gm-Message-State: APjAAAWqZaDhJT2Sltrm9qKCYc1LJjfzUpKz4eSYfhAWxvTdM38R2K9c
        rj+YTaYRQFtlAzit+fpY1BY5CLCxy/hIyShbo1dp7fsO
X-Google-Smtp-Source: APXvYqyNNR8/uF69NmdXmI2Xz8NIUyywV1VbobmDCsvJZxej/NwUjEoBbVcZtYq2KHv7AytYbnmLcq/B2nAMEoUr/1A=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr8075769ljs.54.1564353021137;
 Sun, 28 Jul 2019 15:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190707023037.21496-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190707023037.21496-1-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:30:09 +0200
Message-ID: <CACRpkdYSDT3pQzNTiHoDdtwMQn32jZ83Q71G=soQ1ycdg+F1ag@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove less important #ifdef around declarations
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 7, 2019 at 4:31 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The whole struct/function declarations in this header are surrounded
> by #ifdef.
>
> As far as I understood, the motivation of doing so is probably to break
> the build earlier if a driver misses to select or depend on correct
> CONFIG options in Kconfig.
>
> Since commit 94bed2a9c4ae ("Add -Werror-implicit-function-declaration")
> no one cannot call functions that have not been declared.
>
> So, I see some benefit in doing this in the cost of uglier headers.
>
> In reality, it would not be so easy to catch missed 'select' or
> 'depends on' because GPIOLIB, GPIOLIB_IRQCHIP etc. are already selected
> by someone else eventually. So, this kind of error, if any, will be
> caught by randconfig bots.
>
> In summary, I am not a big fan of cluttered #ifdef nesting, and this
> does not matter for normal developers. The code readability wins.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Hm I guess you're right.

This patch does not apply cleanly on v5.3-rc1, could you rebase it
and resend?

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEA6831AF
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 14:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731677AbfHFMpc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 08:45:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43235 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731425AbfHFMpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 08:45:31 -0400
Received: by mail-lj1-f196.google.com with SMTP id y17so57578146ljk.10
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/lcexmvHJxJRySjQLCY7ZSg7px+Zsdzgbj2vRh55qM=;
        b=ORNp8Po4jlU1yF5zQNBY9xOsg3dWFJsndVntCldzZfwE2dvd1gQAGIeb0ALvShYKcl
         PlQCtw4LUOADJYv4uW6LycNlGXGBQg6+gsH3SUWpLItFJ7IxdE3TrvfBfGXAYTQmOCag
         IJcOdeOCr8JwQGBvc5fW0zLZJEt/JZiy2r9i/U1vb4s7++axVma0KhqV7PrcdX9XxH1B
         dHiq7A4TuZhkQdqp4tP9mNLKW8VmzEH4zFr4H7Hg3GmMBONaYOh7I85gmG/oBp4WWC4z
         DcxsH65QoGDbTQLvRqVoL1IVpiDLHkWdSQ58RqL5bYH2uDHuD6hal8ha0KBDCpa6OWsZ
         OQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/lcexmvHJxJRySjQLCY7ZSg7px+Zsdzgbj2vRh55qM=;
        b=YQMrDdWmoPtCpCy3db3suFpEygk6dVpqAw/Z4gfluQHmUE1Yp51rrIHJUr6JO6dqrN
         nIQVEX0cFT8/4BVYkWzqqtut+GPAoenhJOKwTTM7Qc6XX6HOOgtJhxn9gVrFaRkgLV0M
         ggeokvggIVa+BsrEOv7UQDwnAwx1+cKCxGq4x0DD6C/8PqbsY49joUwzzuzQrAUU4dA7
         uj002nkPcnKBDJQ3crntJCfmiRs+ZmXNZ+y6qNwEI8dqTXDd8dxpQmWepr06dLw8gBkM
         oU2pz7+pRlYf4fsnMtOXo7GywyrfF6hK71AVYZe3OE8GUXnjuGwIDuB1CO3UZyI+goQK
         q6vw==
X-Gm-Message-State: APjAAAVJZ5Ht1n1o3AhCIv9biLIFkHQBgitd6Lf273sD4B+RCOv2iH5F
        t4iBXaYbTiHdKojdKPNNXgVs7f3njPvQaL67MBcXeg==
X-Google-Smtp-Source: APXvYqyJB6V5f6X4ZYTw/Dx96rRsmFRZ8lQ78ZU+eRN4u7Jr+fYSV9bRsgd9LYigvv9O3QXhRfadXQjQILbPAtIBTCA=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr1619698ljg.62.1565095529681;
 Tue, 06 Aug 2019 05:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190731123814.46624-1-yuehaibing@huawei.com>
In-Reply-To: <20190731123814.46624-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 14:45:17 +0200
Message-ID: <CACRpkdYoCXP=LaGSFhAuTZJUB6p=YVRpBhsqCp9S67yJZiChVg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix build error of function redefinition
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 31, 2019 at 2:39 PM YueHaibing <yuehaibing@huawei.com> wrote:

> when do randbuilding, I got this error:
>
> In file included from drivers/hwmon/pmbus/ucd9000.c:19:0:
> ./include/linux/gpio/driver.h:576:1: error: redefinition of gpiochip_add_pin_range
>  gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
>  ^~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/hwmon/pmbus/ucd9000.c:18:0:
> ./include/linux/gpio.h:245:1: note: previous definition of gpiochip_add_pin_range was here
>  gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
>  ^~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 964cb341882f ("gpio: move pincontrol calls to <linux/gpio/driver.h>")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Yeah those get covered twice these days I suppose.

Patch applied, good catch.

Yours,
Linus Walleij

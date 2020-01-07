Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E58132323
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgAGKDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:03:07 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40372 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbgAGKDH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:03:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id i23so38452989lfo.7
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oKol1E5uFe81KlR9aKnDvrtZf1SzxED4CQaA/7Xrzzg=;
        b=tuhkkljaIaiJJmUSutuX9s49tqJJqqkeBY1ys9QSuul3nan94u8dWFgVt3mkhvDSL7
         EDUhKOUpqXWFMEnWjZbKjyfAI8UqHcUtDKq3ouBGxUTnWwieRa+yRkYhErpu/llu5eaN
         qkxjtVsp6ULjQmqaFBeFW9JN5YjEysKwOSox7x1yzuJZsuZSW19h6N2LLqtFBO3gf71a
         Fwb5Eq+c4UZ/4V64JiipmIfK4IO0154Od9v/4lGOP8UtsjUOAd/bT2TG+8JfueUtuaAe
         yFVZMyYKJ0Lm5NhUomnxkSePElrk45XMm5qnowkk175wim6tQxv6HsSpy3+OVK40ciyL
         XmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oKol1E5uFe81KlR9aKnDvrtZf1SzxED4CQaA/7Xrzzg=;
        b=ngimgHdl9LcaOp/kTzCjmeYR27qaPpHVn+gKyWx2W5xgJ/U4HAY6gUuKYbnd12H7j8
         PKrUbrer1sUVBqsS9/pAvJlyOPZ3wZ28Z0ZiIyBquisy3voX3rdkmvuIzSytQk8Y6DzX
         +Gf3t9jxIQS7eWv74ZLI+yhm1ouLlfu+4Ukw73O2OUU/t/8vg/TbmLge/+E93q6L0+rX
         rraNVUAD7LrZluC9ByONTKJn3ej1vVnYEzicOdZi8DYEfoPyTnXC2ridEBKvsV02ZdA1
         NaCC5s9xEuys2SPevDdx3mpaim88r+prtsaxZBcoaihWhfHBN7SnvLtYVkXBCkup/yFm
         bBVA==
X-Gm-Message-State: APjAAAVmqDXE8T52XbqFsXanY9bKN7nKT/R/DOwtjFh3ZqLnnVqafPTw
        DI8lhWXhnQkY+jnpHaqlcoZd4ylSjhWCpe5CVnmvGg==
X-Google-Smtp-Source: APXvYqyflFfe/fxFM4BmLdYxturyk1PQjv7lTfOtfJH89YmeXjrRU3ac0vEpHAQ+sVYd5gKsJQSyt7VB6pvdJtKdvNE=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr58521415lfg.117.1578391385288;
 Tue, 07 Jan 2020 02:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-3-brgl@bgdev.pl>
In-Reply-To: <20191224120709.18247-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:02:54 +0100
Message-ID: <CACRpkdZbehdStd2O_MKFLTWjfPaqCyM+Nimr16ZN9-UQOd+peA@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] gpiolib: have a single place of calling set_config()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 1:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Instead of calling the gpiochip's set_config() callback directly and
> checking its existence every time - just add a new routine that performs
> this check internally. Call it in gpio_set_config() and
> gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
> the check for chip->set() as it's irrelevant to this config option.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

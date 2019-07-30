Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D377B5EF
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 00:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfG3W44 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 18:56:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35801 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfG3W4z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 18:56:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so63741263ljh.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 15:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+wN4+Z8EREwCReGzTsl/8rDGQQqk+naMOiOedp6zWJ8=;
        b=ZAkqDL2WcRbEdbMCJfQ4ECnHrL3z9ekD2j9BetxyfB9dxe3kPqE6rzzpWXPQ4RazWz
         fkNO9gMIEKquR8OTHMphn6TH28OV/6L3wVIEOhYMMuqkvlPsarUt2xgCkB2qQal7P2ua
         lOXzYgq2/52OT3d6sooWP/JwIyogxYJQTAwX7OKTUXKwcz6l2jaSLrMVBViuEllp7+9H
         yiKrTvoAX5zKhd/M7ED3HdtbwIPJ0jrDTmKnSWu5VbBGfGUQuJq21umrdXUDPemTilTJ
         bd3/ieRg6cStN5wWN9gc/aYUOCv5VcH2HSBLCFiyzUX6EyayebKsyzQuHnxFefSveKvG
         j9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+wN4+Z8EREwCReGzTsl/8rDGQQqk+naMOiOedp6zWJ8=;
        b=be/4pHuwZ6nGlzZCI2BcUfOtueD9Wj+STplWhr2U6bqcmiW6ddP1KFYlihOSy+2C7I
         FYt8EYJQHAJhsAhO7kkBuDp9ILIhT/SmkpLbFDhbRKQ+MOT1KimOHiTZSJm2w3zBa5Ft
         A58ygFza3usljp1IEofUpr92jQUNef9notLVqR3BbnvMUKTeQrBsnxdiMCGmU1G6g757
         km/q2EdLy5/TDJjepLAdc5lqrI3iHnRkaor/hiQkeV8pNKWfXaptKvXj3G4P//XSToYT
         KbiQ+cL8h4yHImYW3tryQ0f7Dyc4Y5O+iuqIJYVb3M/7mvLb6/zJ/1A+j1jKwrrwRdnV
         SiYg==
X-Gm-Message-State: APjAAAV4CiJNnC33OdBamEsUER4fGhlP886LwHhZscXteJ4XeQoepT6C
        o/XM8GS9EqH7DY0vHKH0HHBro4XRXye4kDb2VVzB8g==
X-Google-Smtp-Source: APXvYqwgS2kvfds6buKdfqOySHYCa8XdVeMDL2lQfLz5OmrNB5zEBhwjL3FIjxO+wKpUnAP2aRtqcANGhUidIP+h+AE=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr59317626ljg.62.1564527413858;
 Tue, 30 Jul 2019 15:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190730104337.21235-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190730104337.21235-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Jul 2019 00:56:41 +0200
Message-ID: <CACRpkdaxC_b+U4gao9_Mf0XZKVWsyComUn0Z9KrQ88m_WW_LRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: of: Reshuffle contents of consumer.h for
 new library layout
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 12:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Kernel build bot reported a compilation error after the commit
>
>   f626d6dfb709 ("gpio: of: Break out OF-only code"):
>
> drivers/gpio/gpiolib-devres.o: In function `devm_gpiod_get_from_of_node':
> gpiolib-devres.c:(.text+0x19a): undefined reference to `gpiod_get_from_of_node'
>
> This happens due to move the latter under umbrella of CONFIG_OF_GPIO while
> customer.h contains staled data.
>
> Fix it by reshuffling contents of consumer.h to satisfy build dependencies.
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: f626d6dfb709 ("gpio: of: Break out OF-only code"):
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: no change

Patch applied. THANKS for fixing this, I am on vacation so working
on this a bit left-handedly.

Yours,
Linus Walleij

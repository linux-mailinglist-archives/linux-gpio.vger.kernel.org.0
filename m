Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79AEA1053E2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 15:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfKUOC6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 09:02:58 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41013 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfKUOC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 09:02:58 -0500
Received: by mail-lj1-f194.google.com with SMTP id m4so3330977ljj.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dp47ye1jpXPEBYtT1tzSaST9eQHtdYklix3PuaCBWE=;
        b=f1cK463oeJX+zw/Ijd8FSqaHsAimkV1b0IPi/3QzcFEeJAll1DT3+lXoslRLmbD9US
         W0KQNjDaFSDt05eec9MJMQjXhIUKlboCtCQqvxv4SMwyAAkYKyEK1N8m2KGe7JL1wIzn
         D6/LfM3PFR0mOCAGwnVx+9idBnmIuqyE3zHpKPrRpIkbepYnLgQgyjGeP72cb7icu/1w
         7KffVK/SGsrchmGqtnWts9R+Y055TESSkut4Bt1L0jH3QtLW0rq6pTvf1O26FljJH7cW
         zKVCMjySH2kKNcm62FH73BiRi33ozwKElCH9HhxYlUFQbNcuyqK8usRvUwFpNBdK3rVP
         cyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dp47ye1jpXPEBYtT1tzSaST9eQHtdYklix3PuaCBWE=;
        b=G4wieZ41gcFF/guoanFhqyFWoq7Y39ouIhMaO1mrL+UXQj8KxfrxuDMRGs8ZQ4orPE
         J/ZztapowZZrrLn0zhry28dVjVTxtzKiz+V/sNbF+Ezm6Gjv2u6+K8PHa6GJf2vtu8IV
         mXG8b8ZXKVkzV0wismOCHSXO+xWxUBxJaQWfYL1Xw0WT64T1reb57luCdZjcoSJPW759
         B0iVSthRUBZ6GBbJ7ezAW/NIi4PzBKa6XCe5qvGhvWzQ0UmTorPXMU1TgJ9Xpn0NhZNO
         R5jx7LX/7Pm7xbqrBqkkupbPDm4YMz9J6VuXG7nUlEyvqpMU6ox/eRhaVJMk/PL6lzaa
         yKSw==
X-Gm-Message-State: APjAAAWsQhX91kA+gJzcyWuZSBnGzPbzE69kGPZFweRXYFKNxWEdRB06
        01wQXZbOVULjqulh3v+Tf6e/BRHklfLrtNbB8gKhtg==
X-Google-Smtp-Source: APXvYqxEgtrJZOOBZnidPPbY4KG7L2631lgrobQbArJbvChwOmenejXbC13NkxAFjaOdceqs3okTqOxsA2bM/47Hxcg=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr7586649lji.251.1574344976478;
 Thu, 21 Nov 2019 06:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20191118180251.31439-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191118180251.31439-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 15:02:44 +0100
Message-ID: <CACRpkdYUxwhf_qNpDTyhdy9_A119yE3NaKshwg_eJhJ41M_dTg@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: lynxpoint: Setup correct IRQ handlers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 7:02 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When commit 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be
> handle_bad_irq()") switched default handler to be handle_bad_irq() the
> lp_irq_type() function remained untouched. It means that even request_irq()
> can't change the handler and we are not able to handle IRQs properly anymore.
> Fix it by setting correct handlers in the lp_irq_type() callback.
>
> Fixes: 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be handle_bad_irq()")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!
This close to the merge window it is better if I just apply stuff
I think.

Thanks for your hard work on this!

Yours,
Linus Walleij

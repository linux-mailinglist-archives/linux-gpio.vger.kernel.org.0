Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB821D721B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgERHmR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgERHmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:42:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEACFC061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:42:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h26so7155564lfg.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j9Ur/vxEWIL52dfwOw8YYCV6oeiN9nwKK9yjcaOs+4Q=;
        b=dlSkXbCR1ThnwMyp0GGXAcYwDODiqYaShVcZSo6ZonExeVaEnG4IAXVTEiJbBQzjSV
         6fMdtYOzkok8XWBboCVNb0x4bPC/Wc6+YIodABl8tNo88bJ6OI+GqAXxo8iY4Oy025sl
         1HS0h4tCb4KQBOrwvxW6G92YHk5WMKCAvg4U1kKqxqrqpUidAHp+nIPTzgX9m/WhuOEU
         84dlpXhl3waKq4c4bvmK7llIRT0Nl60zhDa1uVbpolZT6k+CT0Hc33VzFH/npUQCT75C
         qV29K0kLx4WMWDNLp5r/VIswWqpFGOMoMEjwGEj8ncHVuxwv2VwEqDHQrJglau3HOABi
         c86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j9Ur/vxEWIL52dfwOw8YYCV6oeiN9nwKK9yjcaOs+4Q=;
        b=NN0b8m12LT9/XnhYCDJnmusktEHuhB3XqmyIF2ie6bnKzWrHNU4w2mO5bX8L+rOoGB
         lJOvSmgGnQZ+VUp8OYiGt7qjdWvrX8knm81UfHkTs7PpfK7kl9oGGsv+YCJz6Dk0Wzqu
         U/MjcFZyH5KF52wB38HD7Z1EPcIQNUEKERmQ05FkuINht6lNNrrstCjbB3E2y47hj/zX
         89xJJzYaJyeGc/egeZf+HXbh0GDCjcLrMsqtWuKTjBlXrFNl1oU9OX+gZjB/ohAn0aHC
         X+mOeR+/KmLiCQtV9mvqyKJ51fnuF5X4Rlb+7Nq658HuCvwverAX4h+e0Wywz3aBzCks
         nSPw==
X-Gm-Message-State: AOAM533ylIyQaGylr3o03JoC3RGSg8coxciKLR/V9QjetEtqCYyHwEGu
        8HFYrSmoHrruMJ5uBgwGRH0VVheQJwA++tcytEy5Xk7z
X-Google-Smtp-Source: ABdhPJyUv8oO6jCif+TX31K9a3e9qVL7RtIp3Tuqsviah7tVwekNLB8IHnKwKZLJom64ElzeMJWcwZoXaMwWUH/VYvc=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr10665954lfi.47.1589787733213;
 Mon, 18 May 2020 00:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200513143619.20565-1-brgl@bgdev.pl>
In-Reply-To: <20200513143619.20565-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:42:02 +0200
Message-ID: <CACRpkdbqRfn_Ma=GLWmMkBDrvPJC36=9GA0xAUBWBZvfh1X5gw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.7-rc6
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 13, 2020 at 4:36 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following batch of fixes I picked up since v5.7-rc3.

Pulled into my fixed branch!

I had already sent my pull request for -rc6 to Torvalds when this arrived
so I had to wait for his tag to arrive yesterday before pulling in,
should be fine though.

Yours,
Linus Walleij

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E5810D36E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 10:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfK2Jqx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 04:46:53 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:36133 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfK2Jqw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 04:46:52 -0500
Received: by mail-lf1-f47.google.com with SMTP id f16so22159489lfm.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 01:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1GlpRjYHbCH1VLhj1GGbDkK8pDGEyIE6EbAHuHd+GZA=;
        b=q9W84uLv7pjhogvkXqLbP/k5nxHNBpWq9J1QjYHlsAr1SFbL+qp30+lBeclfsb/GzZ
         j7pClPaq9SlMppvVUpXjCmtCNEwrGoPO7X1xsF/i4+kLzC3fzAUbUQJjkeHDDwuhH/zb
         NjR8gfdn7+c/YRq6rBQLXSS36nm1bX6tVM7DIwbv2Oj5ufdzxD9DkfX4vDBNVFdF/26K
         f1TMGaa0TpcNMNU8fV/8CnayLEIpr4vL6pKJKVht0A5WLCT7cQk+CJp6qvu7o1+h6wjj
         auQPw2boB6djmP9DWrxwW2UPKlavniRkXEUE+y2ARzrlBbmipOQ8v22yJ9OwNpfnm6WL
         qxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1GlpRjYHbCH1VLhj1GGbDkK8pDGEyIE6EbAHuHd+GZA=;
        b=WIb27Rs9VTBF/TmhRiYWN3kt6KUgK3ZIZbwqKgfWOC0vcMeLfwCCqAE5tPXtlMvixs
         pB/Aejx9gTrKb1OIz+mAiqIILXByM8HDIq8mqbAzXKQ0Wyyf3itnw6Eu66WKjEerScCi
         y5xtjDVbL/83UNbReePigelQLMhcKzwHvkQcO5dZ9TrCBWnqzXFmWmr5o49LYtLVH0vH
         YGsMaQjY+bJyZBZb3WddpOT634sxOvtRm+HgOUrKOnhbBbZ/HXVx5vM0b3unTNhl5Rhi
         EFYdVk8NtkIxD6ErLIRQVl6S57iTUs8efxi17AGn5EMT5EC869JfyGB/qGV3an5Mi9fm
         f+kw==
X-Gm-Message-State: APjAAAUkzkZ2VDsLRNut5Bj93AEfwIcZ187xRqsSfaasB9mSelD7YqGl
        LgXwASlrCQHvO86kEg1bbLAsmXRK4FGShQpVqMKbdw==
X-Google-Smtp-Source: APXvYqziak5rpAuJX+vyu6qoveI3kiclrpYm4tORoy1TjnqQ83VK/QoRTXCkFn8M+I0SFBq2G39fwcQfBRg8TsYn9Ug=
X-Received: by 2002:ac2:410a:: with SMTP id b10mr7739875lfi.135.1575020810861;
 Fri, 29 Nov 2019 01:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20191129085336.15968-1-yuehaibing@huawei.com>
In-Reply-To: <20191129085336.15968-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Nov 2019 10:46:39 +0100
Message-ID: <CACRpkdbeKdEAEtoPZH8+fWcZEOqJ6cdGTRSkrKx8L9avxnPQQg@mail.gmail.com>
Subject: Re: [PATCH -next] gpiolib: of: Make of_gpio_spi_cs_get_count static
To:     YueHaibing <yuehaibing@huawei.com>, Mark Brown <broonie@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 29, 2019 at 9:53 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Fix sparse warning:
>
> drivers/gpio/gpiolib-of.c:35:5: warning: symbol 'of_gpio_spi_cs_get_count' was not declared. Should it be static?
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Mark merged my patch causing this warning into the SPI tree,
would you mind resending it to him including my Reviewed-by tag
and a note to apply it to the SPI tree?

Yours,
Linus Walleij

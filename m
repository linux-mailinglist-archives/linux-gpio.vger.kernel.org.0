Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6A9ECC5AE
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 00:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731517AbfJDWMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 18:12:30 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34161 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731463AbfJDWMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 18:12:30 -0400
Received: by mail-lf1-f67.google.com with SMTP id r22so5515683lfm.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 15:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cPIZ+fnAlaRxQz6OBsn+7HePWQmLD0l/EqVuqSsBiGQ=;
        b=d/kc/+0AAPxHyj4k4cAv6qruF/pAxg2HxprKzH0JR59Lx5sxBCBEC8rcJEu8sb67zz
         uMohNjleIG119dLXR/yy589+cZcnQz+3hVsksxSlYtx9S4DNZNXXAfC1oebjlduvsXZq
         grVEKCW17JrM9rgWTh9vwlSUpftMuTZLBZZQ3F/GKWAtf5hCpw0aymvKGn6HO1khtNS+
         EfJ7vhCsCaFQUiJtsJBJ0nUQ55SmpX6bIpGRKgll4lUWxJYuejqcbrZNLP8BXj7784ao
         KdJFvysBjaFAWIsofJIrgJfvekaXoAV8L9JeDcxLetjHkpi2vI5ys3disBPoP+ybTEFw
         dfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cPIZ+fnAlaRxQz6OBsn+7HePWQmLD0l/EqVuqSsBiGQ=;
        b=HJKf12Or2wSyIHAVIUlG1HkjVYtF65VEdz1Qm5KuZ9uTEryhtw0NsLw/9WCnO9JEi5
         Jg/RND7Vq8ezLeRDCNO+T9/jsRnnnpuPBbMBt+s2HoHatf5X2kovre6NHTT7d3oJbIHU
         EPf8EZz8stuMwRyb/VmkL1YODTQXclaTJLFR3ZnFT6h1T8JHsmDS2YEZNZP56ZauqAmK
         yeziFEla/ix5qLFjqrk8dS0s8aBVBKngDQ1ZseI3SmxgqeDm8QA6UkmkxeDR2OtFHprQ
         xh8xQ3cBPNt+n4jtxWpbeDYdQUbnqIBMyM7ESeZNvOgIcD7hRyTfaAX+CeHjEkqHOWhY
         91ow==
X-Gm-Message-State: APjAAAWjcci93esHVmXjF6LV2Yn/wOLKP8BfbOmpZ7oRxL+Sd1lT6wy8
        r4La+I6LIGmaW2Nd3zAzWVmyx9hmmpg/wlHnfBvI1H/E1v8=
X-Google-Smtp-Source: APXvYqza0oEk98S7EffaHqeKg0F1DfdTRYKAD3oRj+0+f3G+JoJId+R/3P3jR0kEIrJu2sD12zU3NtPZzFtzmkJCAow=
X-Received: by 2002:a05:6512:419:: with SMTP id u25mr9802400lfk.165.1570227148706;
 Fri, 04 Oct 2019 15:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191002170249.17366-1-brgl@bgdev.pl>
In-Reply-To: <20191002170249.17366-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 00:12:17 +0200
Message-ID: <CACRpkdbUb-x1nSZS5f-jK5mtWKzODeihxxWxym3vc0UKiyQEcw@mail.gmail.com>
Subject: Re: [PATCH 0/6] gpio: replace nocache ioremap functions with devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Alban Bedel <albeu@free.fr>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 2, 2019 at 7:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> This series converts all users of nocache ioremap variants that aren't
> ia64-specific to using devm_platform_ioremap_resource().

Do we have an ia64 gpio driver even?

> Most of these don't call request_mem_region() currently, which
> devm_platform_ioremap_resource() does implicitly, so testing would
> be appreciated.
>
> Included are two minor fixes for xgene and htc-egpio.

All the patches:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Send me a pull request at your earliest convenience!

Thanks,
Linus Walleij

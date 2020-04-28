Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A637E1BC01F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 15:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgD1NtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 09:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgD1Ns7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 09:48:59 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AB9C03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:48:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so21519618ljl.6
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hprmAywS78pYBC0BQt7gTceIcUivP3JeOHfXgeteKA0=;
        b=fCPifXw/aNPOXfO0rsjZ+yaZg41307Lkkk7BSKaH5H7psRRpteV5LYlsmB0N4dqM+G
         B8ufwhgl1jAKHJtIaK2N3pMI8gNruYVHB2STb08rGaoYD52IUxGOz4Aspg3Ds0Le0ikd
         TVuF6fV3Rvf7ebyZClOq1W3RpoHzm1YWMlrNqWKruL5OMdAZDou+zZlYEpF0HNAI/2Mc
         4NeZzLtbfLNep4qlhJEL6P9PCgYdG7lyL4tYiZmCwJhcQwNzV22+w6k7VeKjtO6YFRXV
         VYcgB+OPVwmv8eRYthKbSjqUsDGLqzpfUOeRl8laT2tDQSpAHIW/c8WTecXhOlyjnf/2
         XtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hprmAywS78pYBC0BQt7gTceIcUivP3JeOHfXgeteKA0=;
        b=DbhRTOQw1jQbainsXxgO8CfsFY29uZ7m+GidPS5nfpyTybTt9fnR6pFzojZvI9UNQa
         thyQJpV07Y9xKM1hPhdN8kIjjwlFaLycR2PhAEcEKeJD0Q+T+SoZUqFWKD8X4SyWjD0r
         OOX3spMYawQdmdWIrcSZxKJMKRCq3icueLI8My8fapbn9LQNi1cPS3j2FmAX83AM3wdV
         R0x/pYZ9jxsMkU0lhqWLmoDH9odU49ICTcp/cF/qei7+d4+poNnLD/kob8DBQ56VIcdE
         yvec/gO/uQwE3WV9YRujOpNROwnHpeqCEI8L35UuZy/z02qkh0KA0W5mCogUFo12i8iw
         87yw==
X-Gm-Message-State: AGi0PuYzwb5dKMKGPbo+fG0GjHUb90fB1XsEeOjzSU1RKxCQwpC8SWrp
        OeQ/FLDPEMHdZpEFWy/YPn/1a77v8df6kWBzGKJUug==
X-Google-Smtp-Source: APiQypJIhrNrQ+oaUJ5NP4QQvPil4l3MmkC57hDze40HmsjQNpb70nI3ajhIbXVp601g+fxmmSsaOiIc+ymo3FzTcC0=
X-Received: by 2002:a05:651c:1058:: with SMTP id x24mr18355448ljm.39.1588081737490;
 Tue, 28 Apr 2020 06:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200424141432.11400-1-geert+renesas@glider.be>
In-Reply-To: <20200424141432.11400-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 15:48:46 +0200
Message-ID: <CACRpkdYozdZZN5OB_tYOizFynWAXGSuRMbA1HmfBh0cZJ4J9aA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Improve kernel messages
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 4:14 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Simplify the printing of kernel messages and make the messages more
> accurate by using the most appropriate {dev,chip,gpiod}_*() helpers.
>
> Sample impact:
>
>     -gpiochip_setup_dev: registered GPIOs 496 to 511 on device: gpiochip0 (e6050000.gpio)
>     +gpio gpiochip0: registered GPIOs 496 to 511 on e6050000.gpio
>
>     -no flags found for gpios
>     +gpio-953 (?): no flags found for gpios
>
>     -GPIO line 355 (PCIE/SATA switch) hogged as output/low
>     +gpio-355 (PCIE/SATA switch): hogged as output/low
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

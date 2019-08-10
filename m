Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA4C088A02
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfHJI1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:27:41 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44338 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfHJI1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 04:27:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so94111149ljc.11
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 01:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hTVqGxAe7lslqUt42gHEXLSjhA4Akjn51TmLM5R2veA=;
        b=JI9Dvi/BijOYXxUOHjAy8vv0lxIEQS5DBnOTLOY13QpjloVihhx5wJarjIB9sBhr3n
         EDrUca+Ns8mxxV53zyqsgh6rrr/vt//V+6XXTiZqYa+m/feDcsAQnyggkMjR+WDw3Eur
         wEprnJIk42VeNuCNyol49a8QIEpXzRGq3WuRTyahrCxFm7r6qmWmlEwuwO/+/3jBoqW3
         bOFP6dQ96qzWxAEzFEc0L9s7/Ehtv40g3UdlU1s6IhpaVUU5ACKSaVPH00bipLies1Tu
         LVRTUG93tqZKcpkgndnSgyj1qmvOZbX8OQsbdTo3O63RW0tuGbKislQKeIXvC5PTxpMj
         mUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hTVqGxAe7lslqUt42gHEXLSjhA4Akjn51TmLM5R2veA=;
        b=E+TmF0xoW6E90r05LfeLR5YLoFwOhwShiNH9KFPJy7dwA7TjOiMFFB0drA7mwwN30h
         CmaEJxsAmY3NvLCzMPV8TcAAwaqlnKN28lk3jDcX/rwj5Zoz4M1XDfV/lpUnDDU05yae
         JVAk+hBP1qC1zzG2DQGI7QFU0EDUKFogh6IsckAuug4izsVUlF1CBnpp5uJ6TXUTTk3b
         R2V/CSZ68ske6ACF7DxD9+bVSlkydI4oStEmtEFqM5Z9u6NbI4l5jNOCdSqlBXTpny8N
         064XlCxgB7jEZKgQkLVJB6HKmX78O8hIsyco9niNdb1Nr91p1EqPTwzZohWiPCMlYWia
         TCoQ==
X-Gm-Message-State: APjAAAUX0Cl2Oq9MBv/PoAeMzJJLztwyCrGoRDOuWQUnCdG5f3ET1Xb7
        TiqCb6eMYzpwsMfLSItBYIff3WtQfzYtayLaXEgdQg==
X-Google-Smtp-Source: APXvYqzjGxI8uNtXooWBa90whrdvf1kkuE6WbE17TAUjWmxFtAkE7CW9RTvVNl9VllXR3jrBV6Fow6JyxDQS1q4xHxo=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr13018340ljg.62.1565425658753;
 Sat, 10 Aug 2019 01:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190808132543.26274-1-sr@denx.de>
In-Reply-To: <20190808132543.26274-1-sr@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:27:27 +0200
Message-ID: <CACRpkdYzg0At4qf1Nv5_+SzgqQ-iLU1ND9Svhj47=pXJf9E7Mg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: Add for_each_gpio_suffix() helper
To:     Stefan Roese <sr@denx.de>
Cc:     linux-serial@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:

> Add a helper macro to enable the interation over all supported GPIO
> suffixes (currently "gpios" & "gpio"). This will be used by the serial
> mctrl code to check, if a GPIO property exists before requesting it.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I really like this patch, it makes things so much more readable.

Do you want me to apply both patches to the GPIO tree when
we agreed on the final version? I need some ACK from some
serial maintainer.

Yours,
Linus Walleij

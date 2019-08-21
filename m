Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB6C897337
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 09:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfHUHTx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 03:19:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35764 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbfHUHTx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 03:19:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id g17so1161630otl.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 00:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yfSDrj05bLHl7LZiUa1ozdu/z2XSs8zhYyjCg+fS+Ow=;
        b=jFBkqYpR5bieJP8QNkxwu8XN/YcBZoX7Hj6Ykealc1RfjJD+KG5mvfmrHp4JLXFXZK
         OCX0VGoia6/e840cWQJm+eqbMp4k9oBkBYslK8SYz+DnlAy+HF02vefanaogGpiW3xeY
         kmrqz42mdQxLZZPCc3A61hlJh90PAmpohgEfStGfeL2RUX9p4IUA1nL5w1TG4io6Rio4
         H2SzvY+UAVqa+WTsXYs+I9tzK1sn04SCuEELNA93fy4lpKZxb9kj+1WMEjRTyGRh59hd
         3GZ3TS1ItZCwmtSGXXOOa0YQqoqWY3krm8DkS1uUIWXSGqDqcwpVSuGBTG49p2SozNVb
         uxbg==
X-Gm-Message-State: APjAAAXiijQnJHS8MOkPxY3OkbuviI43qY1sIffcycZIy1BNc6jbihcf
        ErYZAEhi5PqTKjI0Hawh9+i0LLMFKZQbe1KZiKc=
X-Google-Smtp-Source: APXvYqzmEE7bsU5S3o/3s3bEOhlAghAs0LBCQcxi9KFoVWvYrxHNcV4vAZz++8dh7AUXaP7rn+v8a807XLkAJSsz7AI=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr8874040otk.107.1566371991825;
 Wed, 21 Aug 2019 00:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190821070923.687-1-linus.walleij@linaro.org>
In-Reply-To: <20190821070923.687-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 09:19:40 +0200
Message-ID: <CAMuHMdWF1GXYtFbjrALRMObqzezd-cBwDPAqhC-9d=RbrLxNyQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: Include the GPIO driver header
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC Greg (coldfire)

On Wed, Aug 21, 2019 at 9:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> The Coldfire GPIO driver needs to explicitly incldue the
> GPIO driver header since it is providing a driver.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Geert can you pick this up for m68k?
> ---
>  arch/m68k/coldfire/gpio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
> index a83898426127..ca26de257871 100644
> --- a/arch/m68k/coldfire/gpio.c
> +++ b/arch/m68k/coldfire/gpio.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/device.h>
> +#include <linux/gpio/driver.h>
>
>  #include <linux/io.h>
>  #include <asm/coldfire.h>
> --
> 2.21.0

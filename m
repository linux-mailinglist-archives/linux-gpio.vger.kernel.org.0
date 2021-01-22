Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42018300413
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbhAVNX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:23:56 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:46436 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbhAVNXt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:23:49 -0500
Received: by mail-oi1-f178.google.com with SMTP id q205so5879601oig.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N9TJq7gw8sRGrdgfSYgLb4SIv1sZGZZJdezSmJn9ifE=;
        b=CNhgB58OaSLonhZlIkvwlts6P4EIHCsZS1pcnBG8h1nWRHRa69behrpKkTsVqLGD0P
         zCQLAHpLoUzCbHRS6uMJSZBBPS/z0+jVB4GccVhVxFPsyysLKsrz1PhJg4AcLgVp5a9H
         fsb+wr/nn/HVYXvs/0AM4sSAFVDzwKq9Hk81fv+LKGV2v3G9hBS5po17ZHFA8C/mZGo1
         J9FJlOjMIECWvz0rOVrvHm37MM6FbJlxYuLuk/ENizv3VXg/DP9RE+49cV3BF5RJH9R3
         IaClaCZxszSB1gPgYYpDEUCM+WIuWSN4w/gXcAD5WRmrm+mlMO6o9KmY7M1KXrFIVRDE
         Hk8w==
X-Gm-Message-State: AOAM531NWQ4r5kq9M4YyHkDCfOuD6eJ83AqDApaPJs4xfpWkma7KgFrF
        ad5UEYie6a8zazSMhp3YnW8J7Wpa8KxcgAEMQyw=
X-Google-Smtp-Source: ABdhPJyiWDmX+XCl84dQU8Zd7R7TwBcb8mjIBaG4UdBmOdGHrTjqVisYyZN9yuBHwwzL4Hn2FjIPavWzSiF0E7Kr7MQ=
X-Received: by 2002:aca:bbc4:: with SMTP id l187mr3180582oif.148.1611321782489;
 Fri, 22 Jan 2021 05:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com> <20210122123853.75162-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210122123853.75162-5-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 14:22:51 +0100
Message-ID: <CAMuHMdVYw7WywSMwxQ-vGOuqOiEjPVambM1o84sYeON-QVcZhQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] gpio: aggregator: Use compound literal from the header
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thanks for your patch!

On Fri, Jan 22, 2021 at 1:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Instead of doing it in place, convert GPIO_LOOKUP_IDX() and GPIO_HOG()
> to be compund literals that's allow to use them as rvalue in assignments.

... to compound literals, which can be used as rvalues ...

> Due to above conversion, use compound literal from the header
> in the gpio-aggregator.c.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

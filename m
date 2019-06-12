Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888C341E6F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 09:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436705AbfFLH5J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 03:57:09 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:36288 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436677AbfFLH5J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 03:57:09 -0400
Received: by mail-lj1-f169.google.com with SMTP id i21so14231802ljj.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXA5+gru4alxNYEnUDfWlNEf8IzRnyf79cJH1pZ+38A=;
        b=kyXw3a62hPc8udfYOuMAFQYc8Fccbdh+faAsJI+P80Pmxk1yzP+yGX3iYvLw6rKGmd
         Hq5U0d+axsu6EW2le0gAyQbKtW9kf/Ivndl6VImX75cPGL0Fcs+i59EUswbIX/VS2Xhe
         k76atnR56cJ9m+Gc7s2SUb6x7P9Xlwnk6yWRJ6MECQ6KIz0SlTN9IRrgopyv/Fh0563I
         S0qhrdQi0Ej8Uh/vBVyPDklESV3Z2hMmmSJoYCP9VMLofhElWe2ZL1d5PDyzXiWkUKIM
         83GyzWzjMVmFDkjFDTb9Ku1+kYkQvONmgcpVTlTkjGsljU7iz7h6TkDrpbNNxmcilk0v
         2zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXA5+gru4alxNYEnUDfWlNEf8IzRnyf79cJH1pZ+38A=;
        b=BqkHoCkbWBm8hE+tzgJp06hKbRGcieretfb714XOC60654Oi8IdCzoLO8edyLQnsvC
         aWOnMx1hbgLBj+Y5X/OgQdW7GzsvKywDJ3XNZ6onp9Ufc+GBVc8UsGzR9ucIUsXJvzpe
         fbXtWoLrjOcfAMlZR/WB2wqP555aF8+I4q/aIgrLOO3VBn20AYG6L84g/TWcRov/V+/K
         1T6agnBBq2slX8KzNMv5SfdzETImIlGGYpHIRdA2H1vnKz1wDBlTJbiM4zcz4uL+AxHE
         DMLT0i8hLMrOMiRur1pt2ifNR5etJrgdIWa/pM+PQAbNizvWRrnOjRFG24C54ipV8S/c
         BARw==
X-Gm-Message-State: APjAAAUerhxZ3f3xoixxTarceqpBf6e6EtshEln/523BwbPJOWttS+kL
        J33t7WThNFehYxUr/DGbmcI+noWYxjYHo8LpTl6Qmg==
X-Google-Smtp-Source: APXvYqyB3zRR+puZuMgastRuk2Y+CVJpnyH92tVnnNrgusklC+mEKSu4OgiVQhvUTB626b3d5lUUV2RAlvRSInwCGJ8=
X-Received: by 2002:a2e:5d54:: with SMTP id r81mr5507217ljb.104.1560326227130;
 Wed, 12 Jun 2019 00:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-4-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-4-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:56:55 +0200
Message-ID: <CACRpkdaH6mE8GoLGJfZFTQZntBdOLqJ3GxSGMX8xyi5nRzXhug@mail.gmail.com>
Subject: Re: [PATCH-next 03/20] gpio: gpio-omap: remove remainder of list management
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:11 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Commit c4791bc6e3a6 ("gpio: omap: drop omap_gpio_list") removed the
> list head and addition to the list head of each gpio bank, but failed
> to remove the list_del() call and the node inside struct gpio_bank.
> Remove these too.
>
> Fixes: c4791bc6e3a6 ("gpio: omap: drop omap_gpio_list")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij

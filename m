Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31CF1CF20C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 06:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfJHEzD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 00:55:03 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46762 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfJHEzC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 00:55:02 -0400
Received: by mail-qt1-f195.google.com with SMTP id u22so23129707qtq.13;
        Mon, 07 Oct 2019 21:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NuipLPrWDOHTna4R81Ns0ysok+dpoazuekwN/UYksCI=;
        b=b1UAUxoBcI9azVyX+4fyfcr8QslbKfW+ZNjl72tAkSBp/Jy1YWJ+tFCP3v/iE6uGZo
         uFsmfF5NevYXiJYD5i7adKbaXEvLAmRipJapvNOvu3mvQmzrlB3fmOhmdHk3VfVgkcIQ
         vSxJM5Stk3ECN5ymfkv9mvlbQe33hpkkFLtxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NuipLPrWDOHTna4R81Ns0ysok+dpoazuekwN/UYksCI=;
        b=h/akzlMw0lRhs0sKaW5PeOeA6Oc9a0Jio5dkiXHDFAeBluxaQnv0Z+p1ealFSWjYv5
         jb7lokXgrqQ5G0BILF7QoKB3U/Lx98dArUseRXbJi3aIU3JaJJuf5Tr4rGCsycU7/Yii
         O9hN3vcXINH0DaUydqY3ybUUN4HjUwJkzNnlaufYvsggsHML6nxBAMifHJeVGdvvHXV8
         VbQmsbVwB9yhx0Oc+LItUqduNTPKQfVR5ZlpZk8DZS1nRQlKCv0/J67iltooi7VSqAaH
         Zvi5TeNg3vmVm+j7Beg0dW2EkHVslBhUsQCdd4vdg04MYy+LWaeJDOP16+gXQL0WOm7G
         scQw==
X-Gm-Message-State: APjAAAW9O6R95rV8ofTwvNi2YVxkr9+8QUS8xk0Z9LZy2AC3h+5bHi5L
        drOnAKmhtq+9dYCOOn0GfdMM54JfdscQSC4n1jY7Gfix
X-Google-Smtp-Source: APXvYqz5wHXB1nmfXhmlr/qLAPDW3G+ziIzScyrrHSPrhN9j+O+3LkVT/JnM12/t9lcaqiMe59v/oRgpIA9UeoUtEwI=
X-Received: by 2002:ac8:670c:: with SMTP id e12mr33620565qtp.169.1570510499983;
 Mon, 07 Oct 2019 21:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191008044153.12734-1-andrew@aj.id.au>
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 8 Oct 2019 04:54:47 +0000
Message-ID: <CACPK8XeKx_W0_b6ZLJzVdtQQOL8eZ3FcscB5TZT5NXMwRi4r6g@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fixes for AST2600 support
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        johnny_huang@aspeedtech.com, Ryan Chen <ryanchen.aspeed@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 8 Oct 2019 at 04:41, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series resolves several issues found in testing by Johnny Huang from
> ASPEED, who also contributed the patches to fix them. We'll have more patches
> from him in the near future (which I'm pretty happy about).

For the series:

Reviewed-by: Joel Stanley <joel@jms.id.au>

These patches have been in the OpenBMC tree for a while and look good.

Cheers,

Joel

>
> The major issue resolved is the way I grouped the eMMC pins. What I had was
> ugly and I want to get rid of it before the binding is solidified with the 5.4
> release.
>
> The remaining fixes are minor issues that stem from lack of documentation or
> understanding on my part, and at least one brain-fart.
>
> Please review!
>
> Andrew
>
> Andrew Jeffery (4):
>   dt-bindings: pinctrl: aspeed-g6: Rework SD3 function and groups
>   pinctrl: aspeed-g6: Sort pins for sanity
>   pinctrl: aspeed-g6: Fix I2C14 SDA description
>   pinctrl: aspeed-g6: Make SIG_DESC_CLEAR() behave intuitively
>
> Johnny Huang (3):
>   pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux configuration
>   pinctrl: aspeed-g6: Fix UART13 group pinmux
>   pinctrl: aspeed-g6: Rename SD3 to EMMC and rework pin groups
>
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       |  86 ++++++------
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 124 ++++++++----------
>  drivers/pinctrl/aspeed/pinmux-aspeed.h        |   3 +-
>  3 files changed, 98 insertions(+), 115 deletions(-)
>
> --
> 2.20.1
>

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4500B42015
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfFLI5J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:57:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39904 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfFLI5J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:57:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id p24so11451513lfo.6
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1EziaPVHwI3OsN4q5Q0m4XpCeZBocIr9dDoB/RcVNjs=;
        b=RiL/H776u6ayTVWLP4Rrw0ebZQ3DKh3efnfcUVnvwGSkIgTbR+eWHbcPCZedkbXbsH
         Mwcxf4g6FpWRQ90+/runRr9kZnXPcNNW0i/pWfCxnBnQpGfBQojgZX33jbwmIr8LkEBn
         va8mu634mqOa4r7r/odvuSu6dIl3GVmN8rdKvF/jRcG1UnVI8033D1vgZfZfzniwH3na
         ZqiH2elFYwFqaXbuDeshhpgt0Hs5zc4cb//Gt/fQ32rpmh6mqLBPJtloIdP/6BCc6NSf
         VU/WZsqFNER2FzpFptEnFMA+1lFnpokcdcG1Fp5Yqs7FUG3RQJ4Gr8Lb4cDLr0my9zo0
         h8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1EziaPVHwI3OsN4q5Q0m4XpCeZBocIr9dDoB/RcVNjs=;
        b=ucRjo+E+5Lf8kAiGkaPfOJDMbyy85WDt0n0NZ/5d4J6akMzRciTHkJvr0/4OQHjYUe
         fIC6+L+sjjtFkv2oHCCWDbeeSQDGVA3CSPVdPIDnHLyb2pzBWFeyB4tSvsangrlk8uEa
         I0pFBFiWam6Knbsnbie4Q7pZLoq01fPPDhWsBNrXBQ4KyL5jEZK4EXioAKixeK1Ljnsv
         N9HCSu+Z4TbslV8FXoMtiZG32/O4XXWv0InNgJnR4PUiE+b03pWCJ2NX9UtMH9V5k/F9
         wqbFEva9HQIQfS4H/7uX7EVRj16sqP7PNB3TbvaOxIrxclRR2i4ytETI2z8eBfExA418
         30XA==
X-Gm-Message-State: APjAAAUt+UPdkbAzYdYkmRhPhCR+z/AGRRUb9EiU8cXJcd2JO61nauhB
        h3JZ0e2kHOjVdJXZ6Okta/1oqaDqTRpNJUHbItetXw==
X-Google-Smtp-Source: APXvYqzdXC0nDBe338kDBZkoplEJnp9z+g++x8HvyKX6p6DHugHZB+t5hf2uxbdvplO64qLWE8dpOegyo1Bkz+japzE=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr39749313lfh.92.1560329827260;
 Wed, 12 Jun 2019 01:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-17-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-17-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:56:55 +0200
Message-ID: <CACRpkda7d9SV-muuvEpO5VhCHrJozRtOMVGi+1siyWzabTMmww@mail.gmail.com>
Subject: Re: [PATCH-next 16/20] gpio: gpio-omap: clean up omap_gpio_restore_context()
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

On Mon, Jun 10, 2019 at 7:13 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Use local variables to store the base iomem address and regs table
> pointer like omap_gpio_init_context() does. Not only does this make
> the function neater, it also avoids unnecessary reloads of the same
> data multiple times.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0503A50F4
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFLV0U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLV0P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:26:15 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0992C061574;
        Sat, 12 Jun 2021 14:24:14 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x73so7430236pfc.8;
        Sat, 12 Jun 2021 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c9ib10t36R/EO1N7Re3lDE2MnwjGOz25v+dbyCiOWAI=;
        b=Pvds2+eVgeiCLXPwrEsoZdchsy3q/vkm/NRXLwkg7m0x614cSDxMJciWOV4UtST6h8
         9MS22TsxqWEgaHyX+Ob8arEFgfYJtMPl1JxdVxRfCPat2L5s0Wu6TV+wxWWhsnKKbUlp
         pDWxFg+Wzctv3BnfZKg4Y1IqLu1v4a3ENihzDttnwu2gIOf/GUHF0IzatZCApFNzTa6H
         SrQj3T5S37II5dvpzFdpw+Nw2PjD2ekHBL05EBOP4GqZB0/bEV64LCClPiEsVUXCZ4m8
         a7rhGlU39VN3imPD0NwRVpcWngajhYJHdQMbTb/NilzZE7gy8IfJF35XtEhw96w3Znlv
         iy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c9ib10t36R/EO1N7Re3lDE2MnwjGOz25v+dbyCiOWAI=;
        b=E+M9LKdNJGE8Y0IZLikXC4vKTgL61RRjYvRa7eZ+SoQzbD77acUrSzv9/rVWJCwsmk
         7rOoWWtAk/oFHH39plyDPmQN2K45kZXpeSiXRQnYJkdHFKJMWQTy0l4qB5N0tBPcHSjt
         BUm1LGfgtYmD1QwBCfh9BrGRmnLBJudtr2d16KxKZfjhMGhVgimSvyycDH7raprd9RJ2
         12z3um0fLaVy1fraCYxu32H1HwH0RxIqWtHmAmhQoUmVLlQuv034eyhmxOCcuDSa/x3O
         bBfEh9g3+fO2IE4DZD8zxMHXPJOjADv5aloH+BgZU6FDLXR89S6a03hB5swLHqgMbxO+
         gjgA==
X-Gm-Message-State: AOAM530WnUHGIIScvIwfOkBJ3aYdpWDopV9dcSV/bgGthzh5ZBa5QuwT
        uJiUrkOOB4umhniJVRK8D1xLxXlGkHKfNJYjRgs=
X-Google-Smtp-Source: ABdhPJzE4TVjeipfw8Zk5WKdZ6liL0hydNjaNzMwPu1LPUA9qnwPQRmKBbK+zeqjo78m2J99UDMDQcriFxv7+7p3+Tw=
X-Received: by 2002:a05:6a00:139c:b029:2f7:102c:5393 with SMTP id
 t28-20020a056a00139cb02902f7102c5393mr7900451pfg.40.1623533050891; Sat, 12
 Jun 2021 14:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623532208.git.sander@svanheule.net> <e1be20bb92cff2688153125b534b738b71c3a743.1623532208.git.sander@svanheule.net>
In-Reply-To: <e1be20bb92cff2688153125b534b738b71c3a743.1623532208.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Jun 2021 00:23:54 +0300
Message-ID: <CAHp75VdsNpOdZYEjBxRZfe5tb40v4iNa2W0Ys_g-vpTpqBKkTQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] regmap: Support atomic forced uncached reads
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 13, 2021 at 12:13 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> When a user wants to read a single uncached register, cache bypassing
> can be enabled. However, this is not atomic unless an external lock is
> used for the regmap. When using regcache_cache_bypass, the original
> bypass state also cannot be restored.
>
> Add support to atomically read a single uncached value, bypassing any
> regmap cache.

> +int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val)

If this is acceptable in general, I will rather name the function like
regmap_nocache_read() to be aligned with the other API naming pattern
(see below).

>  int regmap_raw_write_async(struct regmap *map, unsigned int reg,
>                            const void *val, size_t val_len);
>  int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
> +int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val);
>  int regmap_raw_read(struct regmap *map, unsigned int reg,
>                     void *val, size_t val_len);
>  int regmap_noinc_read(struct regmap *map, unsigned int reg,


-- 
With Best Regards,
Andy Shevchenko

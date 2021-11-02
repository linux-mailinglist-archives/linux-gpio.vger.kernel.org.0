Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6698443680
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 20:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhKBTeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 15:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhKBTeK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 15:34:10 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E38BC061714;
        Tue,  2 Nov 2021 12:31:35 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w1so1206747edd.10;
        Tue, 02 Nov 2021 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bt940E6AfKeGJyxU5HlKvj0wHTzNhdmnLGDk/z8Wpsw=;
        b=gSM99RIB3tfBlxPN8B4IYaJzcoVxPJzLlScvspNdRLnGElKH8BdgO9MWg1xHvumZB4
         kzyevjodY9IVvTtgobKQMelJXrztXAA30Od7mymwlyGuKD08aw2SC1hBQ4ystnjw2zGi
         mMBUTZhQ14RPhwUAMHRVCKPhHFoqxssevoL+jP6GNMS29FKnpPfvl5Q3ZwRst6zUB56O
         fQfRUG+TVY6COXWJ8Qh+RQ9K/heSU385/i15YRx2H6cpPY6k2rmr2sXynrNGmAP9jlTY
         dpG1HLr2HFt+0jJVrXb4Iz8oPFRTHfzBfF1BefNDAFgq5eixZ8Iy9qaKmu9Ynpqc7iLi
         tbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bt940E6AfKeGJyxU5HlKvj0wHTzNhdmnLGDk/z8Wpsw=;
        b=50IkM9I+sJe6n93B6xNKcfsDaI62l+jzfAV8o7f+fsNAwwZlZBMXba4CRbaQI0HD2j
         g+Pz4LdVEmBqD6W8KK1K6vSHhVijqOoTcjf5zD/xMJ6BiHLe7TMVGGUwUEB14HCMzUPq
         Bo9N6khyO4ly7nd4mQKnQ5GIboW6gZ1zvYgK2LpnGE6GmqcyAR4TfVCQPab2590255fs
         aKSiqVA0ewOsSwglXs17XIoy/As88rivdSC5kUroI9gxaEad2mE9HObRiGwdxA1iWiNi
         cS/yoan9aMb+xqtFoIgB1xU8vnN/6eTATdtJQdoNP++lNDX4OZ/gqmQAjgXTSsF59J5M
         KEBg==
X-Gm-Message-State: AOAM533CYjckeyClmeGFoRtDonqRciku2uiFO5AKYAhSDo1lIXBV8ZlV
        LUcpGbPnaV/wYmzNOLYJJl+erM2Cv1EPN1LWAVM=
X-Google-Smtp-Source: ABdhPJz1dUar5MBJH89kVTK0v4f9sWDCrAJS84etFr1P8yuZokSHutdkwOPVTYoUJTqSC4irVoW8+4dwGb9ugbb9H+Y=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr47674900ejc.567.1635881494034;
 Tue, 02 Nov 2021 12:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211102165657.3428995-1-robert.marko@sartura.hr> <20211102165657.3428995-4-robert.marko@sartura.hr>
In-Reply-To: <20211102165657.3428995-4-robert.marko@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 21:30:44 +0200
Message-ID: <CAHp75VcWWBHDpM9+POPMUmWuGmdbyH0wCGXvqFH3znbZnTht+w@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] reset: Add Delta TN48M CPLD reset controller
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 2, 2021 at 6:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M CPLD exposes resets for the following:
> * 88F7040 SoC
> * 88F6820 SoC
> * 98DX3265 switch MAC-s
> * 88E1680 PHY-s
> * 88E1512 PHY
> * PoE PSE controller
>
> Controller supports only self clearing resets.

...

> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

I haven't found any user of this header, but mod_devicetable.h is missing.

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>

> +#include <dt-bindings/reset/delta,tn48m-reset.h>

Shouldn't this go before linux/* as it provides more generic definitions?

...

> +#define TN48M_RESET_TIMEOUT    125000
> +#define TN48M_RESET_SLEEP      10

In which units? (both)

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92B031631B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhBJKCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhBJKAT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:00:19 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B99AC061788;
        Wed, 10 Feb 2021 01:57:06 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id m2so891855pgq.5;
        Wed, 10 Feb 2021 01:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihCVLM8wbPa6uVw1PsjcMBaBbOPs7zo6mYASTSqfzA8=;
        b=TgPmxqUHIW5DCYehR/z+rrcAFpH8wGHP96YkwUesuJ/V0x8emrbmiCj9ZeWcXLDizh
         qTeYPBXJPdmQeVwV77TYy4tjQBJfYuuX4IpmohLFCO9kA46MQqpkhvsA3ZAJ31C6Exda
         0CB3KUP9JCPAyl+lQtKUKNnH1XAoxbuOjKy9oOjBa7c7TTEPg6OdguAnhbMNfkssun1s
         vRYRPhrtECIlReln01IKk630sopMxpMgJSM3vD+OuQ6xT6BxVU28XzZND8UYJM4lfFT5
         /2GJghHPJ0hnOzmnZXrS0mZ0W096uDDinL9+lySrhUrzIGGYUuF9w56yAPqjss3U+xCD
         fUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihCVLM8wbPa6uVw1PsjcMBaBbOPs7zo6mYASTSqfzA8=;
        b=umRSKyNEAgIyBOBLU/Dd4zAzSBReK8rYeHGq3vcICBFN4rjfk0BU/KNNPFV7SDM0nn
         9WDvf/QC84PcXwRb7iNdADhR8vxsXHDZhgIeE/3glBiL4H7ZhrwSPR+63+hr9Cv7UJ3I
         cPqRZfctJx3vMU8aVggKBV6OUQcjjdT5adbH5CGKBVu6XQA1GJUvl6t1vPBGLAYh5UGY
         bO4B1jum9AZNN3FgtBziy6bOQc6S3jhpYhb45CyfpdsOZgj9rqI/9CxVMTYan4gdU5kG
         YGCK7dW3YeCFPkno54Tk+YLK8Nl0TwBuOlmYiUAFS9SPDo5aSGdhWIyNkZRrEwNcAxPr
         O+tQ==
X-Gm-Message-State: AOAM533jQ8BlV4KqKZFHMCajC7wOP3xa3x6PKErwHrz8MXH3TLuLRMi6
        ZOY75yZ1PAAWqkRirjBPlBCPLRFP3a7Vc7YTp6Q=
X-Google-Smtp-Source: ABdhPJwo8ZrfqL4qcTNa4Jbwrg/Nlk5mIJst4AA8mfBJbgBT//InnNkUrDi1bkHKvtp/rSUeJ/WB+qCq8xPW+bpmnBs=
X-Received: by 2002:a63:3d0:: with SMTP id 199mr2400502pgd.4.1612951025778;
 Wed, 10 Feb 2021 01:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20210210074946.155417-1-drew@beagleboard.org> <20210210074946.155417-3-drew@beagleboard.org>
In-Reply-To: <20210210074946.155417-3-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 11:56:49 +0200
Message-ID: <CAHp75VcDVVZ=hg5hfRTs9hJ20gdEE_Xhccyg859nsvtyxTXCyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 9:50 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add "pinmux-select" to debugfs which will activate a function and group
> when 2 integers "<function-selector> <group-selector>" are written to
> the file. The write operation pinmux_select() handles this by checking
> if fsel and gsel are valid selectors and then calling ops->set_mux().
>
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
>
> function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
>
> To activate function pinmux-i2c1 (fsel 4) and group pinmux-i2c1-pins
> (gsel 4):
>
> echo '4 4' > pinmux-select

...

>  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
>

> +

One blank line (existed) is enough.

> +#define PINMUX_MAX_NAME 64

...

> +       buf = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME * 2, GFP_KERNEL);

You have to (re-)read documentation about Device Managed Resources.
Keyword here is *device*! Pay attention to it. TL;DR: misuse of device
managed resources here.
Potentially memory exhausting (local DoS attack), but see below.

> +       if (!buf)
> +               return -ENOMEM;

...

> +       devm_kfree(pctldev->dev, buf);

Calling devm_kfree() or other devm_*() release kinda APIs is a red
flag in 99%. See above.

--
With Best Regards,
Andy Shevchenko

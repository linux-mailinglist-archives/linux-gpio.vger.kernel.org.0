Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC90341A18
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 11:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhCSKcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 06:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhCSKce (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 06:32:34 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9052DC06174A;
        Fri, 19 Mar 2021 03:32:34 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id u19so3381811pgh.10;
        Fri, 19 Mar 2021 03:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r32lV09s88h+HoP8Bj5Y2e3vMFEbSj1qDO3dMhyWpvQ=;
        b=R4UObzAKftRwHGGiSmzfhQ24/1ze55k7Cp5XrGKPaJMaq0+NCG/uHgJcO0VaAqiTVA
         vgU4Pd3CGPi/WDgsdu2sHt/2uXkk85j42vV738FG4RJCBjH1EIlEw4UD9nvaIt1RNe3N
         BKqztBIRxxr4PaJ2Idm+D+j4p75JX/3u3WLS6DiEM4siI6mtyLLeuv79/nboq09sE8aP
         E8vzm1SmIN7PXSdcX7qQvmXcZO0bzj4dSRW+zT/cdxVg44SOo8Rd+bCohQdIMvzD+86a
         uuZvkofdedjMAojLd8CTqqS5pImbFfYq2jpmFJzi3sGd6yerMiwaoLCQ5MHskVWeuFd2
         M2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r32lV09s88h+HoP8Bj5Y2e3vMFEbSj1qDO3dMhyWpvQ=;
        b=Zb9lxc6Wo4B30b04oxAlC+bMQ5xuGhIVzhq0V4Q+vw2gMqIDaEc2Zt201sHaHiZkVo
         1Jv80yM8EnqxYLrfT2Xcs1znWo8DYfgXlKE0vfx3Om20zEj5XlinIUuc+lWuTiLtZWzp
         eJ46EbP9Tcfp5A7XXA8MIN5FFT37Qo55DnzCnm2RfZ5W6SQoAhUErWEKsamreGkOBV+b
         j8Bb3tifFUc2V2VyOAmWAeBDrp72W0PmwWmk7eRv3QFSJWA9GcBbwa31tiURqlShwpAl
         zmAScNkgRNAfErdWYiqxa8R8iYiV8NrFQlK57r9NX8Ng9n8ul7SBoWjUPc2QkZjHSPbl
         8efQ==
X-Gm-Message-State: AOAM533kOnTYADqktdzb4TyxYISp8WiEMSlOqpy3pqKyTyYE/dUnBOH0
        gHEYP4EzkQcLWM2TKMBf/KtjYSxVble1qnQezkU=
X-Google-Smtp-Source: ABdhPJztVIFPtB4YtyCvFO4O4QzUWZicqEw5fmi3tAbTpUhyaHzEmPfRflHaJRbORuSvYmYcE+ojyZtSVOjLiNS778c=
X-Received: by 2002:a05:6a00:1596:b029:200:c2c9:95e7 with SMTP id
 u22-20020a056a001596b0290200c2c995e7mr8565244pfk.73.1616149954042; Fri, 19
 Mar 2021 03:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210319081751.3149-1-ran.wang_1@nxp.com>
In-Reply-To: <20210319081751.3149-1-ran.wang_1@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Mar 2021 12:32:18 +0200
Message-ID: <CAHp75VebBcLf5X9TVVdydVZD2wzeNgU=uQ+JLnKD1g4XwjWbAg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mpc8xxx: Add ACPI support
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 10:10 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Current implementation only supports DT, now add ACPI support.

Thanks for an update, my comments below.

...

> +#include <linux/acpi.h>

Missed
property.h
mod_devicetable.h.

...

> -       mpc8xxx_gc->regs = of_iomap(np, 0);
> +       mpc8xxx_gc->regs = devm_platform_ioremap_resource(pdev, 0);

>         if (!mpc8xxx_gc->regs)

This is wrong now.

>                 return -ENOMEM;

This too.

...

> +       fwnode = dev_fwnode(&pdev->dev);
>         if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
>             of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
> -           of_device_is_compatible(np, "fsl,ls1088a-gpio"))
> +           of_device_is_compatible(np, "fsl,ls1088a-gpio") ||

> +           !(IS_ERR_OR_NULL(fwnode) || is_of_node(fwnode)))

Since you left acpi.h inclusion, you may switch this to

is_acpi_node(fwnode)

or drop fwnode and use

has_acpi_companion(&pdev->dev)

>                 gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);


-- 
With Best Regards,
Andy Shevchenko

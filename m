Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85273EF3F0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 22:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbhHQUXN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 16:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234601AbhHQUXK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 16:23:10 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDE0C06129D;
        Tue, 17 Aug 2021 13:22:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i9so22992294lfg.10;
        Tue, 17 Aug 2021 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tdArbszDF0w5Eojonc3/z7aHZTmugHtPfpWzsgEPiog=;
        b=DaWtZ1GqM4zkpnwiMS9GIDx0jpdrMeJ9ObnsMHPNwRq5WBqzIOJStvdW9Z+tUebaOM
         IVvyH6NaqltMsUwVD5mrr+o+d2CLVE1MEKfEDkfcmithMJOUHkD/tq8IW4MejrfbSMI2
         dLJeiTJ0Dm5ZvkIlb4QFVPI8GyR71Gkv3nHKzNSubYtZ5H4zyGqlY55o2t5aQPs5ucEP
         WTsI8NRex5zu3hXrCmOi0cjAKVMKjqqTOB3of6gy/Aqur37VjRyxBgu+v9HG3i5pkoU1
         tb2mx3z2PndeeEhCMoEXEIikuuPbWmeMWnvx7TZMgxAy1kMbvB2etwVGVkrRnIjfnvdq
         8AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tdArbszDF0w5Eojonc3/z7aHZTmugHtPfpWzsgEPiog=;
        b=P/L1BJgbE0zZMoy04pNyic4QrTO0nRWDUaPkqNRgDfgT89ZFFpX0v7lOjU02xgYECr
         Qu+D1QAvseAz82CCEtxIcpT43GNXBswHQtO87KfqO4xAMfMffJq7mHP5/snzaeTMH+XQ
         tYMgCQuiRnWSen4Tw3NHC8xfidr8OIer97NosWHc27mwCEeuiAIPQPd7uT12OEQlKr9w
         7WhKRpCr4JBPKxJIYSOpToQfwaI3Bbd51o/ZlEqWROWkc2DVA04q8n1xkD1hGzSfsojC
         Y4PDQO69y8t2exUS+qlk1ljudpOgw+x04eYd5CJXnJV7TSSpfKdlS185KGCADYRW45hc
         ebeA==
X-Gm-Message-State: AOAM532eEppGPTu42c+UXBePJCKU03eOiyIcKi8gtMBI6uyFg0NnsKhV
        HPxN9MXG0vk8h9yYK/AQiDUYCgxcKR7H/8ezjl4=
X-Google-Smtp-Source: ABdhPJxGQcT9nkUnf9D6jfUmhvH074lalPuRiL4/yEaY5ZQBcAbNGbPO7prV5tDUlhPuXcsaVU6MwQLFzUMStGTqNbw=
X-Received: by 2002:a05:6512:ac3:: with SMTP id n3mr3585311lfu.583.1629231750178;
 Tue, 17 Aug 2021 13:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 17 Aug 2021 17:22:19 -0300
Message-ID: <CAOMZO5CaH6GQbMaXNj+Zg_=hTXtQSoHb7DfHeqfxBmOvzvkPWA@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lukas,

On Tue, Aug 17, 2021 at 5:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files") removes the
> config MACH_MX35_3DS in arch/arm/mach-imx/Kconfig.
>
> Hence, since then, the MX35 3DS BOARD MC9S08DZ60 GPIO functions are dead
> code as its config GPIO_MC9S08DZ60 depends on the config MACH_MX35_3DS.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> MACH_MX35_3DS
> Referencing files: drivers/gpio/Kconfig
>
> Remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38404218092
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729823AbgGHHPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgGHHPN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:15:13 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3847BC08C5DC
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:15:13 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q4so17208117lji.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XRilmb1Jngnk7k/9K5uAaSX/0kCWr8sNf6kcRHVMY8w=;
        b=pNTkKnbb3hm+A+HQN5rOzozN/kmm1vVVSMgCB0LBOI8R1nunHbWZwUEelAOtheH0GO
         wO9AabHTuWsSBZT8qzYUHWZuSppM3d3h//+tF8HbkX7cOcVKJ2+Ey98jOPgRmMqHt/vu
         4O1LSHNgxdIxTbmQRRpInCaRmZCJ+fTbaJSIJ7KuDK+Ay/NvlJtdK4rcbkmhHF1COedM
         YGrkeGmvEEDEwRrXDB8bh152Vv9mLFwWrVMhObHQQnGIrEmx20tA5aiyFWT0YP66APeE
         vQ6d9VW4N0kft+tfC+ZUyoSW0HkLv9E0Y8RkFioicZhrfo/a+kNPCjn+PFvhBzFbSjRI
         817g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XRilmb1Jngnk7k/9K5uAaSX/0kCWr8sNf6kcRHVMY8w=;
        b=HIfHhWVCBJ8SDR/89jIXDcc3i6LqK+lM9H5eIxqSBqSGrEILrJZsdFrPL8x8H1OYUK
         5F6Lmynove/F3APAtAeAzZ0Z517oVzZi0Rv03EhqTmzNPrwuu537+CatLf3tw3JbVr0S
         CdxCwn9Dm/v6KSCDB0dCSHFKAFAXko8ThqYMzHoYHdRfFkMnmMAVxW7FFOjFm6thXqgB
         96OfdtqItTY6hWroBbEm0HrRgmyr2GUz7a7tva+UgXP4Jn2SXRBu3TFv5B3SIsWbNiLU
         aC5fnMOzGdB/qSbuu2Xd1E3XFkTlGV3XaYB1f8EFpc/Vub37BRJzj6S5NV3zQYo+ZFsR
         TowA==
X-Gm-Message-State: AOAM531f1SZw4rO5Zgs6fxegWV3y/S9nUVLolvVdg59KQFFMDFSvCDEX
        z+6whlUkGSQJ5Ohtpt0r3UE3Uf3L3D4WPq5HIpgA/A==
X-Google-Smtp-Source: ABdhPJz3MZXHxkiizN62clTohAU0g4h+DH6Xo1PXwi1CusMZHaGTT7dQWRauM5eiBDYVxbBHJhKYbKpNH502nmMeHHI=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr11201719ljj.283.1594192511738;
 Wed, 08 Jul 2020 00:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-3-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-3-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:15:01 +0200
Message-ID: <CACRpkdZ-0L=ONVbneB5pUoDkwS0btT2FnnDWc7YL0LsZj4fhWw@mail.gmail.com>
Subject: Re: [PATCH 02/10] gpio: gpio-altera: Add missing kerneldoc entry and
 demote comment
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joyce Ooi <joyce.ooi@intel.com>,
        Tien Hock Loh <thloh@altera.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> 'struct altera_gpio_chip's 'irq_chip' property is undocumented.  So
> add property description to the struct's kerneldoc header.  Also
> demote comment block which is clearly not in kerneldoc format.
>
> Fixes the following W=1 warnings:
>
>  drivers/gpio/gpio-altera.c:34: warning: Function parameter or member 'irq_chip' not described in 'altera_gpio_chip'
>  drivers/gpio/gpio-altera.c:78: warning: Function parameter or member 'd' not described in 'altera_gpio_irq_set_type'
>  drivers/gpio/gpio-altera.c:78: warning: Function parameter or member 'type' not described in 'altera_gpio_irq_set_type'
>
> Cc: Joyce Ooi <joyce.ooi@intel.com>
> Cc: Tien Hock Loh <thloh@altera.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8052534CDE3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 12:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhC2KZg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 06:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhC2KZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 06:25:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BF7C061762
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 03:25:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id v15so17642734lfq.5
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1G3I9QVPXwPvRfI745XP5a1d+4zxYuxWK2JaQBgRm0k=;
        b=avwZeUFczkCHkutqTbzePqfCEm1OJ7T/Fp4MuJSCvvr6vB4y4WsLeHrQlud93Z6WJC
         6B1m9hUlOp2Lnfgl1Gfyj58i5bh8z16NHpKKAydOS2qZxFn+p+ao44842ybeieMy4jSU
         bP2aNz+mnLoxIYbZEhDYeE5wwVYSXFEu+HQuhUdbFVD2ZnYC/7t7Rna9hLgSW6dsaZQf
         YByLXE88acpGINxfHetL5CaNzp/tjw+jgvuAMyIWT3XpQSS+MuNvm7LIdP61XKwFxL1j
         Aj5Z467dm4ByAbJQxpkxI9VvEpq0aYbHUvwMprsFEjHJMj3tthqlONey1lZrm1NPEgpY
         6xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1G3I9QVPXwPvRfI745XP5a1d+4zxYuxWK2JaQBgRm0k=;
        b=XqP2xLY9AUBNsI8wlLSErLYX4QKwkxDot5d0ru+PnJPUoMCmL9VTGrhwCZ6egClgCN
         2AAC0P4wPfLxb/6s/hLKIPRUAz+bEy5IgLfujvC6ePSYUeaje4gtqJhQwVG2Bc8gy/X/
         y0J3mbPyhMl6R9T2rd7/7nh26LRzpPChCzThYfX4xxAzJ+L0M8v/yZYMxFbh8UbPY5Mi
         QE6TH7aRLCLSgRL0MEmxD5TxiGPFxvydW3Vu4QxAnHvtbJNjqaPSVn0rXaT+wZeyUbQb
         /wdYobhj+x1mbnZ1N8Bzv7gGbQwpP24r6mkV+bJ2zcOlFu3c9Bc9KUkLqx7UTkgT+54N
         QHnQ==
X-Gm-Message-State: AOAM531+ODRVELU9X1h1UBE/b8oOjlslpGm5mr9aL3aHX5dP4kLa6Cc7
        m602scJV7xZ2NzD+J8OmummKvzOLPw25V/f8avjKMA==
X-Google-Smtp-Source: ABdhPJx0PLBdZxf9K3TpR+fo0wrWxnHmOzpPaWyq5FE+4WoZMRpUjmhuw/h3Ad0guqZS/O6u/VLbZPpmH68mMFUijHw=
X-Received: by 2002:a19:548:: with SMTP id 69mr15859805lff.465.1617013506599;
 Mon, 29 Mar 2021 03:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210324081923.20379-1-noltari@gmail.com> <20210324081923.20379-2-noltari@gmail.com>
 <CAMpxmJXVnKHXvvaaObTiHemxfC77u-zikPfEtprQ7qdDn9Z0cg@mail.gmail.com>
In-Reply-To: <CAMpxmJXVnKHXvvaaObTiHemxfC77u-zikPfEtprQ7qdDn9Z0cg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Mar 2021 12:24:55 +0200
Message-ID: <CACRpkda7oHHFe38oHuLXP_9OgEonc46AuXsXYv8br859-j6+pw@mail.gmail.com>
Subject: Re: [PATCH v9 01/22] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 26, 2021 at 2:14 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> I suppose this will go through the pinctrl tree.

Yups I applied them.

To make things mess-resistant I have applied them on an
immutable branch and then merged that to devel:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-bcm63xx

If we get problems between GPIO and pin control you can
pull this in, but let's hope not!

Yours,
Linus Walleij

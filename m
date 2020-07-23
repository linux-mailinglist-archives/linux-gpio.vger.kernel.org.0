Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CB322B0A8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 15:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgGWNkL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 09:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbgGWNkK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 09:40:10 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBAEC0619E3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:40:10 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b25so6376969ljp.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0eegOArgjvO8rP9syB7xmG1tp8kx/F1yrwr3UNCLFEo=;
        b=YmkS7Vh4mwIp+nMV18OSIk4pf7op1uBA2TkP/ke9aZMe7v2Bo7c53f8FLIkodKBdkZ
         3tcKEQi0+gDlUUl6vIQfXe03avSwX4r0Z1Ho/SNeJNDr1nD0OrRzHWUx+4BhS+I6jcdg
         PkIxlP6R205v6/wCBRBgA1UQXA+bfQNPfyTHXkoXZdJMDZndAQuu9LozLyTLHGrkOoSM
         hLP3AYgQ28AzXbEjtCVD2jjKbdtrN15cBQPjVqD2FsThQgoX97pHT/KgLCCR8DY+hKF4
         3UhsPZi4/CGdI+2Sif+O3/1rXFoDXnFmZXbwW+b2GUh/JSOY/T92UI03ODBXOAU4kJEI
         5yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0eegOArgjvO8rP9syB7xmG1tp8kx/F1yrwr3UNCLFEo=;
        b=q9uFiT2T8YZNWEkFrSMwiW78l/O62b2Fq6d9a1qWnhmQ/JNlUiTbbqbth0E+fWPwfS
         gLspxpIm++U9qCMacbJYyRPFygxAn/AMfwyRonbHPnK3/GKveKYNmuCT5g2NLLz/SpG0
         r+3qfJHT4gKkUzDfv0WNGSJ3gQy3/9cVnYh9Ya2OX0QIS1uBjKBlXW4m8zBRFYi3hINp
         6pe7F47JKH5nD/U8iJP4eQATHNu6s6yCMgtH4nE4MBc9bkXlWJ1YRilsOcMthct9Gwmb
         rIhv7inFCRGwcS6v00IKBb9N7rsWm2St01kOStFmd8wvn6f9T+CKtIIsdwAkgFVNa51c
         B/zg==
X-Gm-Message-State: AOAM531PjzjP+y/IPzHIgyXNnZABCMszHnuOV/MnQQBCnE9y9Q5JguC5
        VC/GtNHXXxp6xgDGEp1egUlaQ3GxxzdfxDdeT6LLsA==
X-Google-Smtp-Source: ABdhPJzkhTQiz4v4EweObFS3VjvRBHaK+7cqyFcfiqMUdnGJXvj0jmfVgVQamNi7423328Gef8C+2ZKNdMl7Uo351Ro=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1865085lji.338.1595511608925;
 Thu, 23 Jul 2020 06:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru> <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 15:17:08 +0200
Message-ID: <CACRpkdZO242FC=O8nAXjKX=9VRpkkQdMA6S0L2ZWNX9D1hmcYw@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Serge,

On Thu, Jul 23, 2020 at 3:39 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:

> GPIO-lib provides a ready-to-use interface to initialize an IRQ-chip on
> top of a GPIO chip. It's better from maintainability and readability
> point of view to use one instead of supporting a hand-written Generic
> IRQ-chip-based implementation. Moreover the new implementation won't
> cause much functional overhead but will provide a cleaner driver code.
> All of that makes the DW APB GPIO driver conversion pretty much justified
> especially seeing a tendency of the other GPIO drivers getting converted
> too.

Needless to say I am a big fan of this patch. It's what I wanted to
do with the driver but was afraid to dry-code.

Please look into the minor nits pointed out by Andy and respin,
I really want to apply this patch set.

Thanks,
Linus Walleij

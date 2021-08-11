Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CED3E8F29
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 12:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237210AbhHKK4x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 06:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237183AbhHKK4r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 06:56:47 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAC6C061765;
        Wed, 11 Aug 2021 03:56:23 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id u16so2170224ple.2;
        Wed, 11 Aug 2021 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZsD1c1P+qqsjbd4OmA9anS0SCu8YTLOolMi0UCBUU4=;
        b=juI4jvKxVb+HIf74SvubODv/Qfro6XDEI3jZvpLGddfqmPnzkDqJTz2yV/Zlpk7dGg
         6PW3xRkMkKHWFoosh5gNtZAjvwWxMrnuJzwRLdd0rE2EDK5a8Hz8Zs29OWoqd0fGW5YX
         kUO9ZWiB1YsxNNiBksSCd2J5cwSjHWx/8pdwbmVQGA7IsfC+JALdCByXUeW9YGM7h2w1
         QDyS53nP045RPS85ys2YPQobSB4eMy5RXK9n3UmYDmRYW2Icp7NYJpBJPKEKCI1xXsZl
         WYBLdlu7A+xx3zhTnLz21OkkMmXk9+MNiVkwoYf2FDO3qJD75RVKOFBDMQ1CqQ+AE5hX
         +UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZsD1c1P+qqsjbd4OmA9anS0SCu8YTLOolMi0UCBUU4=;
        b=Wyhm527J4MmvWXarhXNZr1WapYjF2U5FIjmljsh/wABJ/fZcjNUq5g4QaWRmaYF8sA
         IowcyA9QARhfS4JUKHa7FtoJAMpewBwllZ6kQEnOXJQHSpHakNmtvY62unuuzlWhQmWB
         TdntiSky3gi0Hf+MoXbmCc/IZ5NM5VJWMSKLbtHA1FtCQ8HckRcx7NPHJUTkGoAAypZ7
         u/xHIJFNyRG4mm1O/DrkIZQtRl6RBMSaxUDjAFiLJhGeasiAPW5cQOOKsVUC36+GAw5v
         FBZ9V4PUdrQb4WEPAyi2uOVW8fS8K9KxgIzRZraZxRvNG9eNmi9ITckBDfwBBQCMWFI4
         IuZA==
X-Gm-Message-State: AOAM533woajcgbmkrRU/BUwXp/i9reV3RjN2v6zzG8hTNH7BqkWrTLed
        vOL/S+eug6Mb2/0ZdSDHsEXVep1UVOl7TwLCFes=
X-Google-Smtp-Source: ABdhPJwtqGfoEcEk5LZFyufa1jUMXKphxPWbc5QjUivSvcQ6czzruv6tb2EaLfj6okHVfPlZ4s9LwpM5kxnAM0QjW1g=
X-Received: by 2002:a17:90a:cf18:: with SMTP id h24mr19788185pju.228.1628679383181;
 Wed, 11 Aug 2021 03:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com> <CACRpkdZ5NZA0XCZe5X0g6uRGn6cdeFcvtR8WrRoNtu8EwrMV2Q@mail.gmail.com>
In-Reply-To: <CACRpkdZ5NZA0XCZe5X0g6uRGn6cdeFcvtR8WrRoNtu8EwrMV2Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Aug 2021 13:55:43 +0300
Message-ID: <CAHp75Ved2Zqh1CND-ZRYOHja_bh7HgvmhCtutKaUHPOnL1Tqmg@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 11:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jul 26, 2021 at 2:54 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > The driver can provide a software node group instead of
> > passing legacy platform data. This will allow to drop
> > the legacy platform data structures along with unifying
> > a child device driver to use same interface for all
> > property providers, i.e. Device Tree, ACPI, and board files.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> This is really nice, I wish I knew better how to use this mechanism
> myself, so I need to practice.

This driver is actually a complex enough example covering 90%+ cases
of software nodes in the board files.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!


-- 
With Best Regards,
Andy Shevchenko

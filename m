Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C623EB1F6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 09:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239688AbhHMHuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 03:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239602AbhHMHuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 03:50:02 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F073C061756
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 00:49:36 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id x14so14072649edr.12
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BrJy1hgfginzqC/cVXiCRdILJzK89mdFTfJPom24JdI=;
        b=aZRvc1XlxT+OIVZpIqckHS7xiAVfOWzrvV4m5p8E0hLzR691xgQKYisFZK1spfeyCU
         8/fIXMOw7UXUsoj+3n3MXSY2MdGii5SR+xi5uIi919aCSPT2WsP1DWH/6orqFltOYwEz
         fxQyhIVun5t7kNH9ZiQI2CioASSRwPRzjETbttK9q3SW2LkqnRwj/rLE7CNfICYvUEmC
         yIGxHo8NUnC2+YKCFEB5FAwrLT6Ezg3bGArcxaKiBo6V5DyGR+yfikd/oMinXza+N/iy
         fMn42pnVSiFA55JXIDcNo2uC0xkbM5RfxGcpX8CwZ8chRAq7IZNsSPOAg+Fzwq5V34n9
         zQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BrJy1hgfginzqC/cVXiCRdILJzK89mdFTfJPom24JdI=;
        b=kjZkytaJXLN4V2IOWXF/SPsSOBJ1XPrEkURiBuO7gh96GwJeE3+DZaDgOFXqYAXeEE
         Og5nNLL77Ixi1vHcPXtYztxyyakfbGJTQfzB4TnefaZYWEQHdDdiGHxtcWx6O/hiq/pa
         wnlaPXV+CDKSQShCaW4AlhmFfdmtKtS59hqQdltpNQnp93JoLosDgHGiqObcB0EME2Ni
         4w/MIYcn2QkDBJsoRX5xFi8+k9KT2qPUYEv2O+hvU9j5CSJb4g15DIFWVUNl7eQ0hCp+
         dD/XVLGG6r43JctfeFll1WJjyIKNfVnINfBRA7S8TKEoz9NAqKYpEIUAPtK9iHBNkVD7
         UPfg==
X-Gm-Message-State: AOAM530itoJYMxt/Z1qjvuDMMmGYXURjXJflCmGuAMUVMvpVprA8SZw+
        tM9+XeKYIT+IviyqC5SKOS86c/8UgCgxRky32Z9Q1Q==
X-Google-Smtp-Source: ABdhPJyzKBXO1fElhQR7qGNCwf4c7g4vGhr7DR2woteQEuSGwLzw++CxqBdpNmLP93DbTtH04+bQVT6j+YYXcZX0Zuc=
X-Received: by 2002:a05:6402:394:: with SMTP id o20mr1468908edv.232.1628840974886;
 Fri, 13 Aug 2021 00:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <YRUmM1E80OTIrApK@black.fi.intel.com>
In-Reply-To: <YRUmM1E80OTIrApK@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Aug 2021 09:49:24 +0200
Message-ID: <CAMRc=Mdz4TQAgZP-TLAFxEdEHz5_xEWkzqOa4vL98xp9Ceye8g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.15-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 3:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Mostly DesignWare changes, but really small update for v5.15 for the Intel /
> ACPI stuff. Has been in Linux Next for a couple days without any complains
> from bots nor people.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
>
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.15-1
>
> for you to fetch changes up to 5111c2b6b0194b509f47e6338c4deeeb4497bda8:
>
>   gpio: dwapb: Get rid of legacy platform data (2021-08-11 16:01:06 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v5.15-1
>
> * Rework DesignWare driver to use software nodes instead of platform data
> * Drop duplication of forward declaration for ACPI in consumer.h
> * Get rid of legacy PCI PM code in ML IOH driver
>
> The following is an automated git shortlog grouped by driver:
>
> dwapb:
>  -  Get rid of legacy platform data
>  -  Read GPIO base from gpio-base property
>  -  Unify ACPI enumeration checks in get_irq() and configure_irqs()
>
> gpiolib:
>  -  Deduplicate forward declaration in the consumer.h header
>
> mfd:
>  -  intel_quark_i2c_gpio: Convert GPIO to use software nodes
>
> ml-ioh:
>  -  Convert to dev_pm_ops
>
> ----------------------------------------------------------------
> Andy Shevchenko (5):
>       gpiolib: Deduplicate forward declaration in the consumer.h header
>       gpio: dwapb: Unify ACPI enumeration checks in get_irq() and configure_irqs()
>       gpio: dwapb: Read GPIO base from gpio-base property
>       mfd: intel_quark_i2c_gpio: Convert GPIO to use software nodes
>       gpio: dwapb: Get rid of legacy platform data
>
> Vaibhav Gupta (1):
>       gpio: ml-ioh: Convert to dev_pm_ops
>
>  drivers/gpio/gpio-dwapb.c                | 56 +++++++++++++++----------
>  drivers/gpio/gpio-ml-ioh.c               | 49 +++++-----------------
>  drivers/mfd/intel_quark_i2c_gpio.c       | 71 +++++++++++++++++---------------
>  include/linux/gpio/consumer.h            |  6 +--
>  include/linux/platform_data/gpio-dwapb.h | 25 -----------
>  5 files changed, 84 insertions(+), 123 deletions(-)
>  delete mode 100644 include/linux/platform_data/gpio-dwapb.h
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart

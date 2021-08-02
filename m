Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAB73DD240
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 10:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhHBItS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 04:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhHBItM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 04:49:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0869AC0613D5
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 01:49:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so10503598wmd.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oS4lE7ssaw+gValSJ1G5a+zfogb8J5bISQ28SiJZ3MY=;
        b=gYUDbVhA1ZxEjXZFrI4OlwQ4268BRoqI4gCTGaEP/MfISQCkq9aZJfoMlFIIPsAcph
         /oHOXtUFpo5JgfaODg7whj8J4hXiNt3/kHyPr90PlsCNMqPeIwoNbe1Iig8K+Cr9u4qa
         KLqCzpJcpf84kiSbO8cGC+eJbu9UlzZunGgsM8GYYqmD4NpV6JxUaoUUv8DTPNCT7EM4
         1EGaNoq2R/TES6hkkN0IFZNcIBiFrJUg2t/9j8qKO+ihY/BO7i3hH1VKUlecv3egosHY
         BymOrHpKYfuz4+udKrqHjJMwyQU3q81UK/BAqc+E7dQbtGkGb2/DlNnBF+lrRMbefh9x
         YT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oS4lE7ssaw+gValSJ1G5a+zfogb8J5bISQ28SiJZ3MY=;
        b=KqGQG5iFJ9iGbuWG0dX4FaoImLyvO1OUgKrZBxixPss+6ewq4qrHKJinRy4qL1bZUR
         YVgbGh8h95halfnc5VyYvM66UUpikGR3l/STulBUHFwki+TDpAUtw2xIE+jXAjZ+0yUf
         Q9DAaaT5sYLPJurgzdiATuit9nFbSaSxMXiLg0ADde9vR4hxJqo9zVNCpLP31CrbccRv
         TwJ0D140sb22gaCH1RCB35Oc1Zf3agah65r7GR4ccSwhwwOxsDNW4irFFHfb4WXzy1s7
         iWhCNsATjlMyyV5uI1sb1Jjry6i1gr7CUIioDUSRZYR6Fz3F3WfBPuUOMH3jPbuuTtJT
         QyBw==
X-Gm-Message-State: AOAM531KlWbGWL2CkEJ+GPM2Svhb04NgNrVVqeBE5DoEEPGzQ1A12RGz
        BQY0DewmGwMqHEwCj12eAYFDYA==
X-Google-Smtp-Source: ABdhPJzDHBWmYChUlgAKktSx26Mvt1Lovf+PhRNq961z+O/UQFFtaPHcojCur1lq4Vmg6dwHeXS5qQ==
X-Received: by 2002:a7b:cd86:: with SMTP id y6mr15628948wmj.181.1627894141641;
        Mon, 02 Aug 2021 01:49:01 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id q22sm9453528wmc.16.2021.08.02.01.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 01:49:01 -0700 (PDT)
Date:   Mon, 2 Aug 2021 09:48:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/4] gpio: dwapb: Unify ACPI enumeration checks in
 get_irq() and configure_irqs()
Message-ID: <YQexe1daiEsHxT7j@google.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Jul 2021, Andy Shevchenko wrote:

> Shared IRQ is only enabled for ACPI enumeration, there is no need
> to have a special flag for that, since we simple can test if device
> has been enumerated by ACPI. This unifies the checks in dwapb_get_irq()
> and dwapb_configure_irqs().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c                | 13 ++++++-------

>  drivers/mfd/intel_quark_i2c_gpio.c       |  1 -

Acked-by: Lee Jones <lee.jones@linaro.org>

>  include/linux/platform_data/gpio-dwapb.h |  1 -
>  3 files changed, 6 insertions(+), 9 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

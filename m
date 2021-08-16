Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5663ED525
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 15:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238767AbhHPNIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 09:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238382AbhHPNHW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 09:07:22 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FE1C0612A6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 06:05:12 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id x10so17211260wrt.8
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2TLMUpZsqF9Ae6W7VovKuderGPIdSJS+4m+ITA9mHpo=;
        b=ZUnYgPXkLdSduyaLopovzb7t3m77GLXmNIo+lAR56M3bWA1fewt6xbtZ8Q4PBUhhFB
         /0tmbWG3vVKZ31lbHkgE9U19EFeS2b7Kg6Gg/j8WoMeug5aCOl14GOHUZkfBkX1yiSTf
         zRVrO+g+N53DM21uhqj37vACNsQzqo3sR2nuUfH/7Qe+WmexChuWZtXhMwP1HGYheUQ0
         Te/ARLaxNvKjd951Tws59ErAbyQWmYdcSrZL+CUPTLtPeEKStVjtRBJAT3wCZqKnBPfT
         UixYiJ/bJGOWCrx1qtTeEX37jo90g+GEffP4HQQxmyoVpYS0cXol/bvMxZ/Txa+i6WqP
         dSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2TLMUpZsqF9Ae6W7VovKuderGPIdSJS+4m+ITA9mHpo=;
        b=JHglmkP9nZMTBffT73OXS62C1WAOYwzn/c2K8n94GNsh3hIkCeZhX7ZLzh2+BNWXKO
         zm3Srq3iJ0XiyEacabQL9WMQUsDqDcnMLcPJG/pQvHfuPMcLGue1rNtst9bUwN37K9lw
         2J5Gf+yxBby8FIRGPIh0IErkak1CtwE1r1UZcRe5rVBogMsGgsgH6kyc9EW979tNIr5S
         S84I7pRi8CKsUQ9edGlDbg4B1AURaKVTEc7hAkqsHCUXtMhvUuof0Bgt3y5d6hTIKGGK
         eB5I8PDgouvWtE8tPqpuj6Qmlu/mneaqf0eoJgMvuvXHpFnwCnDWdgapKZ7vzpvfNR/b
         a2dQ==
X-Gm-Message-State: AOAM532+O3CPrvBns8WVsNGH3BSeY83SIYo63Z8wf4gdAXBp0VG5V0nh
        ugTaYAbmLMzyu1W9y+3z5mVRtr2M+byWJr2Z
X-Google-Smtp-Source: ABdhPJwZVap8mxiIL4sMvu8z3kLgqrFgMMLnVxTQDMX0agP6RVd4BhUaRhzvHWuJuOn1EigzudOUYg==
X-Received: by 2002:adf:e5c5:: with SMTP id a5mr18067467wrn.120.1629119110855;
        Mon, 16 Aug 2021 06:05:10 -0700 (PDT)
Received: from google.com ([2.31.167.59])
        by smtp.gmail.com with ESMTPSA id d8sm12334380wrv.20.2021.08.16.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 06:05:10 -0700 (PDT)
Date:   Mon, 16 Aug 2021 14:05:08 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
Message-ID: <YRpihHP3kDz5nYV9@google.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Jul 2021, Andy Shevchenko wrote:

> The driver can provide a software node group instead of
> passing legacy platform data. This will allow to drop
> the legacy platform data structures along with unifying
> a child device driver to use same interface for all
> property providers, i.e. Device Tree, ACPI, and board files.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
>  1 file changed, 37 insertions(+), 33 deletions(-)

Doesn't seem to want to apply.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

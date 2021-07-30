Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C9E3DB5B2
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 11:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbhG3JN4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 05:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238067AbhG3JNy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 05:13:54 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6ACC0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 02:13:46 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z2so16605285lft.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kgTIDw70Niyned/UivIxn0PZ0VEJvs1sW/WkqiL8H8M=;
        b=bF7NUYLwxdeJtaWOqQR2Z4vA+K5YtMt18gwe6FpidDFvJRq4nU2iZ+QWisCiAL915D
         K0wT4IljFnFmW0IuNHLPCPqMYBFpeY16F+EsxWIFaIla1AWXnKzPm2S229qUxEEaM6MC
         uq6x9eSzQrQY8mOlgKvMx7Uv3tNCloV3aIN2AatipDT8yfLSsnkGFCel+fObhiqBQfqh
         acDmgK5C2Yi7+TRjVlLGKWpIQsSktcA1l+xP8Xt8CCTcMXWu8SEVOwZ63GxlC0YQXod5
         RZHlB/YtEhh35KMljbhnvLnyd0JKys0+Akho3cAAHMWeiO59MxIlvgXYFY/ReSR9NwES
         Dydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kgTIDw70Niyned/UivIxn0PZ0VEJvs1sW/WkqiL8H8M=;
        b=UulNUV6KWdKdIfGLBbWoPoP5WiXuUwxac/XhLPzB5sLd8ioblJ05Wfu1hf8N/6R5Gw
         2Vsy5pvy8+gDmOPjPDGNsyrZ9tR3a7Qh2O9N7DAVqReP+sraQNlC5QCOI1FQO3h1oHg+
         RHKDjElhqAmOZZiVj7F74Q613aiT0M0HJF8FK64/SIKMyERRTCG/S8ZT1mD70UPGJ1pC
         66DCI1wFK4SECFcJosgeLcqdUnF4GQNUp+4/eOaU04+SQdRletTypBHFoEzHSMNiitRY
         Rzpv+1bya6AWmhUT9cH0PwsNIF28Y1iylKeO2H9jDKi1lGy9fwxNiSHH84YihFauWTZO
         LtzQ==
X-Gm-Message-State: AOAM530jVImFdp91L4kE+Nw6R4iaIRRZ480grkT0O1l47LUXBor9MzRr
        OLZXS6RTjIa4/JBh5rpI8OtTSjSC0bofiLxJcm00ZA==
X-Google-Smtp-Source: ABdhPJw50cRX8dVUdsvnUo20MaZWEMiOKDDikxukTABn+21hZBBOQc5j6uiOO01exgTSS2/qWWQ10RQ4Eye5kRwkxXs=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr480601lff.465.1627636425019;
 Fri, 30 Jul 2021 02:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com> <20210716162724.26047-3-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210716162724.26047-3-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 11:13:34 +0200
Message-ID: <CACRpkdbv77hjJ91h3fuLSYbpT+Yxd4X8_S7F+NsUw+QsKXN3Ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lakshmi,

On Fri, Jul 16, 2021 at 6:27 PM <lakshmi.sowjanya.d@intel.com> wrote:

> +       /*
> +        * Each Interrupt line can be shared by up to 4 GPIO pins. Enable bit
> +        * and input values were checked to identify the source of the
> +        * Interrupt. The checked enable bit positions are 7, 15, 23 and 31.
> +        */
> +       for_each_set_clump8(bit, clump, &reg, BITS_PER_TYPE(typeof(reg))) {
> +               pin = clump & ~KEEMBAY_GPIO_IRQ_ENABLE;
> +               val = keembay_read_pin(kpc->base0 + KEEMBAY_GPIO_DATA_IN, pin);
> +               kmb_irq = irq_linear_revmap(gc->irq.domain, pin);
> +
> +               /* Checks if the interrupt is enabled */
> +               if (val && (clump & KEEMBAY_GPIO_IRQ_ENABLE))
> +                       generic_handle_irq(kmb_irq);
> +       }

Aha there it is. "Half-hierarchical" with one IRQ handling 4 lines.

OK we can't do any better than this so this and the bindings
look fine.

I need to know how Andy think about merging, and then there is
an uninitialized ret in the mail from Dan Carpenter look into that
too.

In any case with minor nits fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

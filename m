Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CAD50A28C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 16:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349253AbiDUOea (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Apr 2022 10:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389041AbiDUOe3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2022 10:34:29 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED3C3DA72
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 07:31:39 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2eba37104a2so54502207b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wFI100ksKyx/De8JN82LDPBcTcxrj8iutf9RS/aDs2c=;
        b=PFD/WP8oOojZ7hWXT7AKN/o4scR2dHpuRMHfhP+qV3FTfhmRRMo3KypyjfQzu8Kwoa
         yJL1GTY9T1lsNRg3ddqZcOnN1GiLcjRMCh6EishWNc09VlPWoHQuaIwTKKNuYo7zIbVd
         UsCl5GqEE/jUsRvRupg105t2iSRIHw6FhRb2dddvoGH9i6lsZsNn4jaHLybpCSs/W2+q
         2s0bE64G5jx7xUBj3fOvYipT8lpYi+dCewdRHHcb9D0/t0Zkh4BQGZzwshKbpseldb9L
         PjIIl9DI9X5lmEH5hfAiFNgBenF/l9AdQpellfFv+3+tQAgvs6a1BWaguAaIM0c9JKXt
         a+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wFI100ksKyx/De8JN82LDPBcTcxrj8iutf9RS/aDs2c=;
        b=gwuYibC3gkWyWS1lXOK+IH2K2PUf4MWSG4Ep/dKawFlBoqIzvb8eLNjXz/m8zexBJp
         gjwcnyL71BhEcTfd3a392xFrx4jJ/blyzOjAM66knGUzKEFtmlqESebCFALjfiQ2iP+V
         ZwynFuqD21lYdeYL9LoRPlv7MsI3d2rXRRC4cWGzVuV9WByITFjqXARJbnkvjSqw5rGz
         4UmWR5s0cvs4rDdKZjHXJsrpmieocidlj8K3JNQFFCY6BoPAMLsX+xfGeHLE+QIPrEoa
         PTO4pHGwMFLBUfoKmORBmm8keRkALJzAfrNEyMwT2O7rgA5YBCPEruIuEhSFQ/a9E9Pb
         dIjg==
X-Gm-Message-State: AOAM530QNS4fQ1OD/XFShzcGBA9kXydCf2VgLsGPijD6AE4Ta1hswQ0K
        vSTc/h2gvkFs4+oUGQ/s+YewpQK1IlwG8SyCN7GcULq5JWI=
X-Google-Smtp-Source: ABdhPJzc+2ALCE7Xo4CcUntkIGPkRLulqQajSFyrx/E9OSaxsFlqnOPZLERahbngQ9Sh9Z1MwsiYFsn5KbcV4X4kj2c=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr24374270ywd.448.1650551498376; Thu, 21
 Apr 2022 07:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220415215410.498349-1-marex@denx.de>
In-Reply-To: <20220415215410.498349-1-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 16:31:27 +0200
Message-ID: <CACRpkdZiQiovFrgo7v7vRyQdyS0q8yS_dw097rbb31dXWsEDRw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/stm32: Do not call stm32_gpio_get() for edge
 triggered IRQs in EOI
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 15, 2022 at 11:54 PM Marek Vasut <marex@denx.de> wrote:

> The stm32_gpio_get() should only be called for LEVEL triggered interrupts,
> skip calling it for EDGE triggered interrupts altogether to avoid wasting
> CPU cycles in EOI handler. On this platform, EDGE triggered interrupts are
> the majority and LEVEL triggered interrupts are the exception no less, and
> the CPU cycles are not abundant.
>
> Fixes: 47beed513a85b ("pinctrl: stm32: Add level interrupt support to gpio irq chip")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-gpio@vger.kernel.org

Patch applied!

But I changed the subject to pinctrl: stm32:

Yours,
Linus Walleij

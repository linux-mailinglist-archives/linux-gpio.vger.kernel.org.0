Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F36F581B70
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 23:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiGZU7x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 16:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbiGZU7x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 16:59:53 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AE839BB7
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 13:59:52 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id w5so6685298edd.13
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 13:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZVMmT66zBWHeS9bYbeyt7i6nEjBhxBa3DLSXKxsnGY=;
        b=PUBNT3UA/hm6rgJwFdHGBKRDIwlPEWalDAxwase+0PDZRVNtJcQYBCctt9UTnC3aIx
         uURsOnlDPXZLJMSTiBzCrn4YPDDQubGnEdo6hZOmCUAs5evoOGu6ZT60RIJYvbeeWKoR
         T2r2a2n0cidAd6zsnRkyH1v9BvKu38MHhpVyTrmujdu+avY8RVVx4SigE4P4UDBfRVxb
         +tFSJTBv2hXCQc5QGnj0+xevw2Tef6Aijokp2STNMeJO6KwJSm+tyePeETerlkPyX0QW
         Zh2etfeex1GmP0PCSKTL910YI5Wafa8ns2ZZZSiIA4UThDdkA3n2ooZG5jk1LpfdVMrb
         g5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZVMmT66zBWHeS9bYbeyt7i6nEjBhxBa3DLSXKxsnGY=;
        b=jiCHp28JWiLt6ZwPbZEpG+Z4f0r0sXItXsqgW3GhR3VjdyHLisAjhpissP0KW9qstA
         dUJ/Fs+0VR6dYKB9YiC353ZXHBINi7OR2kbcYgMEY28xOZCTBj6CARjl+w9ySC0Vr8Z6
         UEFWN3GN5UEzpzrn1w8NVdjnbbBS3cnpyXWoJjpP9lH2YW3XmA4JMiatMsn9bIYBtCiZ
         cVNG+A2M7QCXGxQJoZ3jMAb6VjcJBQTatU7DTbvr1pEQiWmuoy86M/mwEMl67F+uPnnt
         0l1Fn34M2VVaiJ2qEkoju6HaPgznTiD5of682ntf4cfOcrMcboNnV6xaknzPMix3T2Mj
         3zfQ==
X-Gm-Message-State: AJIora/OqY0kX0/CijlrOdLjtSZM0OH3IxDe8BblwjRb+fkj15ItP6Sv
        /ii51DC+jEhEarJjBgxjEf98nDRrKPU6X/MwNy/XiA==
X-Google-Smtp-Source: AGRyM1sT3FhoWF3hnt19aN3uyT78QBBuLpQPSm3rExd8W3R1tzH6g6cSAgfxlzV1G4HEGtowZUivOh+eQFO69BjBolM=
X-Received: by 2002:a05:6402:2696:b0:43b:eb8b:d0da with SMTP id
 w22-20020a056402269600b0043beb8bd0damr13547357edd.158.1658869190580; Tue, 26
 Jul 2022 13:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220724224943.294057-1-marex@denx.de> <20220724224943.294057-2-marex@denx.de>
In-Reply-To: <20220724224943.294057-2-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 22:59:39 +0200
Message-ID: <CACRpkdZ4Sb_96pOArp7pv=vALkyPHnLPPjuP7FFyRW1VOs=Adw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2022 at 12:50 AM Marek Vasut <marex@denx.de> wrote:

> Always configure GPIO pins which are used as interrupt source as INPUTs.
> In case the default pin configuration is OUTPUT, or the prior stage does
> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> INPUT and no interrupts are received.
>
> Always configure interrupt source GPIO pin as input to fix the above case.
>
> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

It's up to the driver to deal with the final hardware state, and the
author knows what he's doing so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

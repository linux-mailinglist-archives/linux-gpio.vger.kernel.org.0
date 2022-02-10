Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5BA64B19A0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 00:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345738AbiBJXjB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 18:39:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345704AbiBJXjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 18:39:00 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F0E5F6C
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 15:39:01 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 192so19996631ybd.10
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 15:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XWem/pFj/duUmLXR87z8cwj1is547stEysJJncrBbyU=;
        b=nM5t4eZrZMgsT2rSz/IB1/EOFC/nvlZMyN2Xy5qFaJYNZTBobuDmDPcux2czjubZ4Z
         Ku1jaS1Hu5W7ArCQ+Rv/drYv+XCnkJHgF1qiKJu6ewwGWbBTCbmrYSWc1+u+HzNpjqEs
         lhxOOlxuIhfW671gHw1NSfLLl3tIIvP/UatwKYNmNw1VQIadGNUc122zLOoBbVk89fP1
         eEIBbGM8sg9eGGyBej2+RtrQB1KGUmV4AXBPcf2MCzrqu9varZHbAR5S8KzwWbbt+Pto
         RlY+DkMIsvoOWmBN4KnYKVOt19jbaAL+CvlYG1EYyn4xcC3bwNW44uNC+bZA0O3AApg8
         OZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWem/pFj/duUmLXR87z8cwj1is547stEysJJncrBbyU=;
        b=0FWrzEfGqgXMAsR2CMEL7M2fbznEVdy1nRZx6jQacuSw6LVGU1k4LP9a+D5B36Gk5D
         ZW52h5htzP7abY+Zt7MXWrIiofUcXUWwI4ndAEPg6Y5go+8jBHkoeHJM2RUNuEu7DSYb
         9nF1McSblDbCk45glNFO04VUKQ/zstS5kaxKGsgEZiuCpFcdlJLNBd6YFfnl20Mrb4AH
         +UsvjxCWiKxMen/4UE1fElM53/pcHNe5GalQVioBqoSDfL9PUz4ZuY11Sz4YjWo1D94V
         iuZbvEwiP80VzRgxztxjym50BxQp3ElLS/fM1xvlmf8ZDiiExvgBeLn7bhsw38654LPt
         9R1g==
X-Gm-Message-State: AOAM531Aao12Gp9k5TpHbuzBHU7iMCTRPMqMtAPOL0aJBgemry8qNj3m
        w7Y19fiz+Zaxiu5sbEKZDC2LCnGK+BiPYUg6UWGF9Q==
X-Google-Smtp-Source: ABdhPJw/AGERv/Fuv3ciYuJgOH/qQi8Md7cZRastkPHUJ8bgZqlEllKxFpsPteU4o/HqNEvvCOtqGQ7w/rsnkAjSUUw=
X-Received: by 2002:a25:103:: with SMTP id 3mr9244416ybb.110.1644536340427;
 Thu, 10 Feb 2022 15:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20220209162607.1118325-1-maz@kernel.org> <20220209162607.1118325-4-maz@kernel.org>
In-Reply-To: <20220209162607.1118325-4-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 00:38:49 +0100
Message-ID: <CACRpkdZkw1efC5viWwr_72V0K_E+txwxGLzwe=NJV3FEdnGinA@mail.gmail.com>
Subject: Re: [PATCH 03/10] irqchip/gic: Switch to dynamic chip name output
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 9, 2022 at 5:26 PM Marc Zyngier <maz@kernel.org> wrote:

> The last dynamic aspect of the GIC's irq_chip structure is the
> name that is associated to it.
>
> Move the output of that name to the relevant callback, which
> allows us to do a bit of cleanup and mark the structures const.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This naming was once introduced for the ARM PB11MPCore
that had two cascaded GICs (commit 58b8964990dc6)
so it became a pain to see which one
was being used in /proc/interrupts
arch/arm/boot/dts/arm-realview-pb11mp.dts

I see it is not appreciated to use /proc/interrupts for this
type of diagnostics. Ugh. I suppose people do it for the
same reason they keep using the GPIO sysfs, they like
it and they know it.

Yours,
Linus Walleij

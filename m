Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22DF0580EBA
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 10:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238216AbiGZIQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 04:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238169AbiGZIQC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 04:16:02 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F349BC19
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:16:01 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id z23so24539911eju.8
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LfDVOeVPpLdHT2UTIoTpJbVfDnCLIY30JY2E/XjBeXE=;
        b=KsvCNhP4Vza3VqVa7IFBh7DU+gq7K4cHBURlx3TZCfRIo6Y367qP3Dcm23hO9L6C4V
         gyyeS5FsD4PtEPiKLbho9Y0bUTCUXwUFat5LZywaEGWyrbb5Yl5DptxDobsgpCmprgOW
         bdxf3iNJg90eKT7/OrxijP1H0ZvfzkaZoSyaDTATwOeA3Y8KUwfXvQgOvBPRGPXrBdwm
         C2YVKWHTB3N2GDpkwqLBotIrM8iFkKZsG2Fh3usvNGmpj6qMOUDhQ1p0t+5w0/Ak+WZq
         qT/Fs0MY6BdfZZPBYPBZ6nvVNFLXLLA8WFDeDxxtyB06/IMipcW8DQTE+gtjhelpDJoK
         1JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LfDVOeVPpLdHT2UTIoTpJbVfDnCLIY30JY2E/XjBeXE=;
        b=xeyT3yaSPk23UBlNidIxhw5jDVA6tO9UThP/QC7MS8KyeUI00Fr8poj2+7qeF0U0wY
         x7Bu5qVUTd83edMzPmU4UgZOrX1ZZ3FTC1sZEl7LehIWBw2wgevoQ4B3lhHkiJaXdT7K
         t/DibYgbDwoUb5VCaz5EGlK+yTu7HE7hshdcvfa1fp8Qp3ton1p3T/uF7EcDgpAASLIC
         787H1OvovGjLBS+QhE+8nAFUXOSNhi3GppsllWx80SEyhHdG2FooIeuLzFtgEyCVMA+Q
         fn+119oQ6PodfLn8JDesvyVdqQdlxjfZlMlsGjNG0xgTPRG2Ig+MAOb5IflPOlcHyyC6
         TE7g==
X-Gm-Message-State: AJIora+hAwjqjqRmYOaM0IT1syA61YJAD6znlUuec8ZOwdjwACOP9csl
        IfYEfeOErPnZldMmrrghgRBPhjO8LxGC+T6y3XC0ww==
X-Google-Smtp-Source: AGRyM1tnQh9BnxgMXhrFEFIWCHi3Zn3tb4QrRBZVb590UOS+owL32oQf0zKizc2q1qQbJ6ZoSaMFEtZbIkoDgfRIfks=
X-Received: by 2002:a17:907:1ddd:b0:72b:49ff:d39e with SMTP id
 og29-20020a1709071ddd00b0072b49ffd39emr13038034ejc.500.1658823359635; Tue, 26
 Jul 2022 01:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220724224943.294057-1-marex@denx.de> <20220724224943.294057-2-marex@denx.de>
In-Reply-To: <20220724224943.294057-2-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 10:15:48 +0200
Message-ID: <CACRpkdbUbnOeH7p7ycmvY1YP=K_s7Oj0gt=g-m2s1P2CAqLGMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
To:     Marek Vasut <marex@denx.de>, Hans Verkuil <hverkuil@xs4all.nl>
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
> ---
> V2: Actually update and clear bits in GDIR register
> V3: Rebase on top of new patch 1/2, expand CC list, add Fixes tag
> V4: No change

I understand what you are trying to achieve, and it makes sense.

There's is just this one generic GPIO-based driver that makes me
a little bit nervous here.

Consider:
drivers/media/cec/platform/cec-gpio/cec-gpio.c
Look what the driver is doing with the gpiod_* operations on it's
cec->cec_gpio.

A certain GPIO pin is switched back and forth between input and
output and in input mode, it is used to generate interrupts as well.

Will this still work fine with the MXC driver after this change?
At least it will be set to input mode twice, but I suppose that is
fine, it's not your fault that the frameworks are orthogonal.

Yours,
Linus Walleij

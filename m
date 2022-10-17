Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE6E600C5A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 12:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiJQKYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 06:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiJQKYj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 06:24:39 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7D760494
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:24:33 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id g27so15318713edf.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fVRUR7IbxeLlyl/yBV+D78vge94+KHHhMUxVYnVreiA=;
        b=H7TA09WfFVJJ46b7i9lXcm2CulWrLxcCoPXWemXOoidiZz6wAVX9cXyubeGM/K6zj8
         EMFBcq+M2/9OBYevrfMp/I2wVtTNuP7EQ3V7Oz7L7rOLfGY/ZnuY6EhXcTntnY+haWXl
         KncbkUeyG8j2i8etP4/CSoRuVGqMc8PZ9tayJoZmtrDKJeKK80ByfJAaF58GtkOJ7uGQ
         KqfyfKhpibdpWkYFJQsKunMPDzImtvWNKS9SxCyaNoZqAXnB1zBUBI79UiwUTbuainPb
         fyfvzhRpNSKUtw04cMtdByd5bxf2EU/2r6bCZnANMpDcoM7WUe9WT4l4hDTsRyF9KHHE
         EusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVRUR7IbxeLlyl/yBV+D78vge94+KHHhMUxVYnVreiA=;
        b=d3Gzyc7gu7iRasi157EK3HdD8V/7GUuCsWiOUphnRchZBCQP6yw1WayND0nkOQf2YA
         Up/Q8H7SIdTAsyzI6WCO09PpKm2NCZQZKkK41NmXqLXe2franil6jhFqAFKHZoicaKce
         MXCuQxDnDmTGme6FFRq3elrHpokPuGtH7etonoeTCbIyiJ6524xROqEhr58hG1Q4yS1v
         UMqKrfzbhGIZ9KZ6KPdkpRJ86lSImw0do/6vkxygv779/bCvhxbJbteZAtyslZ0egHkN
         xccZWfDcCGWPDm+SOtNr5NHzKOTOjntqWFixKXGk+4U1aRI3zXXQ97Diz6c3m3KYKcTU
         Bw7Q==
X-Gm-Message-State: ACrzQf18tSdb3bYkoz9ff9kFlH1mLKKv0wGgFUo3uMd25TwFVrEjCJlR
        FwdryVjleyfZfypthLp1NCC3H63lnpDatbxcG6db+PBIPMY=
X-Google-Smtp-Source: AMsMyM6NzhO/5WLM0iYNtou+BqF/NVDPXmRBPN+KAvDXc7WjI2ofBxChLEbpqsdAELB8yL6UUvEqjiwqIRTyDGRvXtM=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr8148133ejt.526.1666002261820; Mon, 17
 Oct 2022 03:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221013215946.216184-1-marex@denx.de> <20221013215946.216184-2-marex@denx.de>
In-Reply-To: <20221013215946.216184-2-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 12:24:10 +0200
Message-ID: <CACRpkdZwZCDA-pvneLYyMvxqeZkSoM3CFRHEkpOLoiWpPvXOxQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] gpio: mxc: Always set GPIOs used as interrupt
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

On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:

> Always configure GPIO pins which are used as interrupt source as INPUTs.
> In case the default pin configuration is OUTPUT, or the prior stage does
> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> INPUT and no interrupts are received.
>
> Always configure the interrupt source GPIO pin as input to fix the above case.
>
> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5E5650581
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Dec 2022 00:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiLRXVm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Dec 2022 18:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiLRXVl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Dec 2022 18:21:41 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AF82ACB
        for <linux-gpio@vger.kernel.org>; Sun, 18 Dec 2022 15:21:38 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-144bd860fdbso9796945fac.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Dec 2022 15:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HeZF9tP6ZG7ruJThbgQPBUxPhrS24qJFPWMRWImYY6I=;
        b=DHhG2m/5V7I0tfYIdQNABd1t1yIe4DwXBHhLB46BnPBJYoUCFlnlZvdmJkpkiU8UXY
         tStwd7zE91haqAL9KjG7f3nbmQlaqYf7vPluk30L9vUg9mebCYbBQtThJA4u50O/yUlh
         gP82ZmmrfGAgy58fFiG8b6/0kesRBUGHtMnMz+DztOGbWBkLpEPh2oNsA4bj0eUSFUPy
         rg+MQZpCnLR/uj1LDnCCsm7GcAoXaEneMwvWGpXH3QRB4/yUnRjDeRFTirAW0jQecZ7i
         fAnVJx/5/WQ7HJzfV/R/XatJZXvQBwxTCHSd8TqhxqEzABhsl9TofPIu/oXb7Uw629HB
         qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeZF9tP6ZG7ruJThbgQPBUxPhrS24qJFPWMRWImYY6I=;
        b=E5lY/xbQzMGf8L/v3tZrmD6WPVpk/i9t/m0wmfvGXEmdG3BXLP4NTd0FSa7Ix4GIMs
         OLGzAW/TMNkkOr0zYqyim1JIa/T5pfFMYXpF+p6P+RrhjUmDryES40bB+NToFvlIxPXy
         2Qv4lfobkpHAtmq6RNVvxHe5wbW1BRPrbmTERx1xFE4+FyyxGY14k+H3JoHI0atEXqlW
         4s16uFtBEfrwAoxApZFmwFtrbSXkNlogKubuJTDBmlIQoNcB0pOlKNX2olBc6+1IAgQE
         L2jFk74kW901PWblkMEudlzEb/f+orUZW8Qlxv/f8B4m8HnqS05PqkZCLU1FscgsHiOm
         VX9g==
X-Gm-Message-State: AFqh2kp7I2g7yln/f061SKgDCFDDj1TEJ+T0doWxNikocCpxQsTTRErD
        qsk9R4ppeYWx4/nhvYWLEvL92d3zrccPFjqUi6fAgw==
X-Google-Smtp-Source: AMrXdXscR/7x0YC6Kvo859oedLmzuyD5FUO1cBzkTSwU538oaEpHT8oMsTGkhl9aBPzyQb3+7xe1s/AL9kWpKcAKRck=
X-Received: by 2002:a05:6870:b96:b0:14b:c9ab:66e9 with SMTP id
 lg22-20020a0568700b9600b0014bc9ab66e9mr925849oab.42.1671405697478; Sun, 18
 Dec 2022 15:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20221013215946.216184-1-marex@denx.de> <20221013215946.216184-2-marex@denx.de>
 <CACRpkdZwZCDA-pvneLYyMvxqeZkSoM3CFRHEkpOLoiWpPvXOxQ@mail.gmail.com> <24df1fa1-c24e-a07b-f7bc-dbf9f059549d@denx.de>
In-Reply-To: <24df1fa1-c24e-a07b-f7bc-dbf9f059549d@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Dec 2022 00:21:23 +0100
Message-ID: <CACRpkdZ63r0Vo0TpQ8w4t9gzJ2uXu1ywaTWXJ3mmuT1zW+KH4g@mail.gmail.com>
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

On Fri, Dec 16, 2022 at 10:51 PM Marek Vasut <marex@denx.de> wrote:
> On 10/17/22 12:24, Linus Walleij wrote:
> > On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:
> >
> >> Always configure GPIO pins which are used as interrupt source as INPUTs.
> >> In case the default pin configuration is OUTPUT, or the prior stage does
> >> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> >> INPUT and no interrupts are received.
> >>
> >> Always configure the interrupt source GPIO pin as input to fix the above case.
> >>
> >> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Can you please just pick these two patches up ?

Bartosz is queueing GPIO patches, I'm sure he will get to
queue them soon enough.

Yours,
Linus Walleij

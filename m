Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 107A759BC3D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 11:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbiHVJFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 05:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbiHVJD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 05:03:28 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E4A321
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 02:03:21 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id u6so7894613eda.12
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=PfP60D9HcZlcTmmRkDILCGp84nMKR71wAxP/XLHNcOc=;
        b=dcOe3X+PKAbEoSgP1SZmV125Z3qv1XttTwkArPyYcr4xSsp1l0HctYY2pv0uExaNHs
         BSjz8aI9/G3YSdKhzFhH4CM26Cp3NbzkVihaziCi6knnGjVWDuodYzoqNDXyfNKbrhPb
         UHDG2NBq7HvBzE/cVwbtE5cAhkXQhMN87foLuPRlelhuP82lAzr5Yde41DKpyBIzO+mN
         HIVVXPLUopYlfKhEimJOiRXK27dIR5p0EdpWDotSbKPfnQzDABmMtGMYeN6kyfaZbYRN
         0s61P20Acr+L1GVSLBYmoWZlAAvXC2NhF9tw6XT5iUBlLjrqMQ71IR+FoqGenpIcgCK0
         3j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=PfP60D9HcZlcTmmRkDILCGp84nMKR71wAxP/XLHNcOc=;
        b=E6UwBrCYjVlZpe1DW+XKnBurVzZ/MTzj35NMU4UjyPojbITqQZqQCkY9pnYnAZpXCE
         XVAdseVzfV45a9GWY4VvxErisv64p1Zx309javRmFvi2sa4abk/2BYAtBZ8YKYt5cDM7
         qcX85KgC1uHhFUpCWEmgrAO6oVblCKssPF2Baf3oDLFFJUJq8VzruPy30+HD8d3l03ED
         3kzjg6OQetK8uLuBMq2hISlHMBb4JwId6BBAvJ3t3L04eqwyDFLEK3upkh/vC60B4vCj
         o+dH+QxBoBJTZOowCzZDpMF5E4F7E9mjlT9ZywAHj+4LINgS7lWDHfPB3rlwZ+PK3kHJ
         JuAg==
X-Gm-Message-State: ACgBeo2s1v3J/42Xwb/q6hH71w4deHgI0+VI4KIrRQBiVZxzCLz0FPI0
        qLJJrYFU3CaT3go6ikRXdXzOqxbjkWi+p3DTckpStw==
X-Google-Smtp-Source: AA6agR4jfiw9ukbwgaBM5kt0WK81+CDs8BDK8ocqBwlyo9nrKF50l8XJTQbKiqdo/xZ0koN9LAIfirRH7ThqRuR3Ic4=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr15225219edc.126.1661158999829; Mon, 22
 Aug 2022 02:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220808025121.110223-1-jhlspies@gmail.com>
In-Reply-To: <20220808025121.110223-1-jhlspies@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 11:03:08 +0200
Message-ID: <CACRpkda6VoNjJfKY3+oCvdB+V6O_4cumKpjVSdBb9e8mEmHF6g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: Enhance support for IRQ_TYPE_EDGE_BOTH
To:     =?UTF-8?B?Sm/Do28gSC4gU3BpZXM=?= <jhlspies@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 8, 2022 at 4:53 AM Jo=C3=A3o H. Spies <jhlspies@gmail.com> wrot=
e:

> Switching between falling/rising edges for IRQ_TYPE_EDGE_BOTH on pins tha=
t
> require debounce can cause the device to lose events due to a desync
> between pin state and irq type.
>
> This problem is resolved by switching between IRQ_TYPE_LEVEL_LOW and
> IRQ_TYPE_LEVEL_HIGH instead.
>
> Fixes: 936ee26 ("gpio/rockchip: add driver for rockchip gpio")
> Signed-off-by: Jo=C3=A3o H. Spies <jhlspies@gmail.com>

No reaction from maintainers so I'm just gonna assume this fix is
correct and applied for fixes.

Yours,
Linus Walleij

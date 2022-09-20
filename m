Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6A45BE1DE
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 11:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiITJ0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 05:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiITJ0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 05:26:40 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD7D491CA
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 02:26:39 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id go34so4710378ejc.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=30Rp9NEli57SuAH4dgCyjCBOrkO4jr8HK882zdNyibE=;
        b=XMHJ5Z/Om4h6VkvDGwQLnGlLreGXUekF8n4ZKei1o3RSIgoDXOobVnKz3u9NDp3p8D
         fb/tV3M+N4QWIh44H11Bs1AmfT1Jlojhc4PRqjn87r/p3LvoXsyxdjiqf9FaJA6MhN8e
         p2ftc/BExJJ0Or04NVZd/aq2tt6XYndptGZIbR1AkV9MnZXV1B4tPwBd3QWmyeJrIH3M
         uUwaiPzVneirDHSpn/PCxefyB5PeYv+0tnibBvS9EyduZqFbOcTAhA4qED0xUBLRiUxi
         4Ijcg93v0aNh8BRmbSnrraxsDZXmD8eRkI5tAySFc3sjm8tWJ0EIawKMjdjG1erBcxyU
         QzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=30Rp9NEli57SuAH4dgCyjCBOrkO4jr8HK882zdNyibE=;
        b=R7U5Oh4DzZ8QBJrrPdsSI/1tzNQocRKXckclHvFurfpK/fLZ0tTe1AKjHpfu1MuvLF
         OjtSaeXXF7gespSPDt+vPgRUZ1rVpCfJjIUPtBWRmqXSPaWzUpqRX9Y9WhNWAh4chdUT
         V5dpx3vQZsUSMZmlSKaX/Z3Fa51yUeJWEUlQgajAl9VLQ37WX2JmgcgSw9zKiGbzA6yV
         nPZhNojezohcFaQgoshNDVv97LBXH3Zx+hd/IiIxj7FryCPIGQ3DBN9qiMEPJfgKUfdX
         063MKvlk7qw8Z0B1gZRd5E7jm+0IhyI8BeeoNyr+c7gydBkveSlJ6g7v98OBhbtnNWNi
         ADxQ==
X-Gm-Message-State: ACrzQf1Y+y/XUkZ1HTwMaIzl/3c5Kzkw31D+SfkjmYXDls1wux/nQfVL
        RVwSPrPg4bax7TADIar+HQ+aEiulKdkd4Ik5N/r3bw==
X-Google-Smtp-Source: AMsMyM5ZWYCS+erppaMkXm3Adtd5u3ROxOslRO8q+DpEQjz/DuPmleCPR1igpZDvPOpH31i5ucLgxVgJMomIovSMO90=
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr16438316ejc.208.1663665998141; Tue, 20
 Sep 2022 02:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220917060929.657778-1-jay.xu@rock-chips.com>
In-Reply-To: <20220917060929.657778-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Sep 2022 11:26:26 +0200
Message-ID: <CACRpkdanniba+TUAeqei93dmkBT82HY5D95KxTsc8aE7jV+5VQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 0/2] rockchip pinctrl for acpi
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     jbx6244@gmail.com, heiko@sntech.de,
        andriy.shevchenko@linux.intel.com, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 17, 2022 at 8:09 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> These patch fixes to support acpi by:
> 1. populate gpio platform before pinctrl to probe
> 2. get gpiochip by finding from gpiochip list
> 3. get match data by device api
>
> Jianqun Xu (2):
>   pinctrl: rockchip: find gpiochip by name from gpio module
>   pinctrl: rockchip: get match data by device_get_match_data

These look OK to me but I would feel better if Heiko or Andy ACK:ed
them so I give them a few more days to comment.

Yours,
Linus Walleij

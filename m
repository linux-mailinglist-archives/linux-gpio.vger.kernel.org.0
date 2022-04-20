Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26F1509333
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 00:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383009AbiDTWxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 18:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383010AbiDTWxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 18:53:15 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A1E22B33
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 15:50:27 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id f38so5575845ybi.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 15:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X8s23fLxLi04YEMH4bxBt9AiWpQLyo5GBs2JMum7Vug=;
        b=zUWotnmPLjRieffw34mfhGBLWp6ZmSUK+lMvEh3AAjgoh6G3ietR/j1OUgrrTOk3fB
         oxpLx6YA4m081foKHie5D4iyQqQ0txptgUsovgj4EMtYFuFInJgB19IZRwSVWTAD6R3d
         YPT6DxRtEmWmBD4PqAtWos7uyMz+C6yK9ch3hfoZnPKNif25y+eQhKjszEDXH7B86C5e
         b/AC31Koeyh2SS/8ckGayCEl81M2RkVnMk2kVxqCrfwtExeozqtEen57SpjU+AkIHAAe
         wfpjnftV8FkzqegVexZOxE+fdo/idu+r9ekhIQbruFtIrDyZCsTRd5PAikXzLAhdoCyw
         pHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X8s23fLxLi04YEMH4bxBt9AiWpQLyo5GBs2JMum7Vug=;
        b=WuECt1tLJkHXv0Yg/0d97K0eGZHFB5QmeDOBJbczcGNJvOI5kpFRnGyrbKx6C1dYDU
         YRFlrwhVfI88T+bcy+3dj03CMZPU/H7WPUWrwNktrPP28HtwBWKz555doUxC3OKrdyqs
         F/wu596pK7TLlU2sAKrIfSi+AthC5kGeuHWp8SR5SCGhWvi6iqivoLJ80N/wNQkCp5/G
         8FMQ4sY/cWBFZtUydE3cNHFiwKawurJVjkaJNNO964QtUOWBQ5fY4/YfMRl+D31oQrR3
         7QsyS0WZ9ErnAS+ty6wIZEQZ5s2p6H0LpHeKpWSAYV2/p3Y6qEfz5PNrSID9K8xv9rfQ
         Pm8w==
X-Gm-Message-State: AOAM5301GMf6ntS6LOkX+qgBnLDFd/KXe3lfV5eYXv/6Uu1wlXUyG81A
        H+moDrGgXbm9IMuvOufQx62xopQER431I5/6xkGUx3AIOc8=
X-Google-Smtp-Source: ABdhPJxG7ifSltsyteZyw+NK8chpzsnfyLwzIcd9/d+dlKaytJ2om9/FWed2AjIrfeGR1DUKfQzCg2kJm8PBQdunyzc=
X-Received: by 2002:a25:e6d5:0:b0:645:7257:8271 with SMTP id
 d204-20020a25e6d5000000b0064572578271mr1390597ybh.291.1650495026644; Wed, 20
 Apr 2022 15:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220409105958.37412-1-yuehaibing@huawei.com>
In-Reply-To: <20220409105958.37412-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 00:50:15 +0200
Message-ID: <CACRpkdYVHPA7GyjyeOU_Q78dZR_VD1-=6pVX74j5FKee7cKpGQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: moore: Fix build error
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     sean.wang@kernel.org, matthias.bgg@gmail.com,
        light.hsieh@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 9, 2022 at 1:00 PM YueHaibing <yuehaibing@huawei.com> wrote:

> If EINT_MTK is m and PINCTRL_MTK_V2 is y, build fails:
>
> drivers/pinctrl/mediatek/pinctrl-moore.o: In function `mtk_gpio_set_config':
> pinctrl-moore.c:(.text+0xa6c): undefined reference to `mtk_eint_set_debounce'
> drivers/pinctrl/mediatek/pinctrl-moore.o: In function `mtk_gpio_to_irq':
> pinctrl-moore.c:(.text+0xacc): undefined reference to `mtk_eint_find_irq'
>
> Select EINT_MTK for PINCTRL_MTK_V2 to fix this.
>
> Fixes: 8174a8512e3e ("pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Good catch! Patch applied for fixes.

Yours,
Linus Walleij

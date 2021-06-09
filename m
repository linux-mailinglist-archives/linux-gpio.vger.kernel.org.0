Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43803A1222
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 13:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238062AbhFILSn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 07:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhFILSn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 07:18:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9654C06175F
        for <linux-gpio@vger.kernel.org>; Wed,  9 Jun 2021 04:16:48 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c11so31166792ljd.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jun 2021 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZpbqtJSZ1KNTljx3ae2/3qbE0gFiJQ1VxWyxhfTI9UM=;
        b=XYOAJfLEOC5rqg67hcQ6BisKWrEyQaq8X+h5WSoYbIbnqCdASAuMEDJj6t3pSfFzN5
         W/qxYWTqnzqceXGB0sf7gn0wixts1Lc064c3JpGb9YGETaR3MPCIXUk8uyOCrmm62HeT
         m83FsOOdANaST8QQBWyq71b5m2IUcJOjLeGchXQzAbF+AsMlvtJodPHaU+i3ZVIEHpzm
         Nd2XY2nvaE/k9tug+J4gtGlxKf1AR8QKSi+Apxcu9IeMDoy1MtqLCdgtutd7tjHKFv09
         fMHlXtNqVeG0DmkQwS51K5UXBGGpi8ln4miLsPvPgrVLTA5HhbCFL3dCPCwbrTHYSVpV
         IGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZpbqtJSZ1KNTljx3ae2/3qbE0gFiJQ1VxWyxhfTI9UM=;
        b=tGorplR9vPBC1b/FGh/gbuuxeajWyPWIImK04qsrO6f9IvIZZBICLh8ooYvwPrDGfE
         eHLrRqKkoRkye0F9Vr0q2BsfMmhe9+Ujjzhy6OdcRlWOi9Uba8TyB2pgv1JwaT8qCvCZ
         Kh/sSea/nxd1LM0s7n/JN/b569a8QPQky8yDZDcttvZraJg8JPdoscpkgrKOr9maHYlw
         SK9k8Zwbonre6HTJh4G4Rqs2+WjXbghZ3Nt+DLSENfSeOQSdoluonzZnev1q8tY/HX8F
         3eNfimCDDuhMvV3NDRZ0sFYK3ynztgudqGAD07ebGHAgfwTE5tkivs3bY06uf+/OIngi
         KeCg==
X-Gm-Message-State: AOAM5316EcargFoLHwLKGkjGjHScWHdWp65iRJadVLaMujS1br6v+xVc
        4iRyhj4zPma4efsjHstlAFmxplB5MV52UVZ2qmg3eQ746H4=
X-Google-Smtp-Source: ABdhPJy4w82RLAEdUxCAUBrAJHzaPxPtyjGKrQwy2Q6i1VGLBfN9DtD9QTG1P/hgMU4utYiYrmlz0QzfOUnd6ujMkiQ=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr22165531lji.273.1623237407061;
 Wed, 09 Jun 2021 04:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210608143853.4153234-1-weiyongjun1@huawei.com>
In-Reply-To: <20210608143853.4153234-1-weiyongjun1@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:16:36 +0200
Message-ID: <CACRpkdYi7J0jTSifGOAfZRhaN9Ro-56BvHxxEtLEEJRb_6rPYA@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: idt3243x: Fix return value check in idt_gpio_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 8, 2021 at 4:28 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function devm_platform_ioremap_resource_byname()
> returns ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
>
> Fixes: 4195926aedca ("gpio: Add support for IDT 79RC3243x GPIO controller")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

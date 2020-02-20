Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07D6E1660AE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 16:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgBTPOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 10:14:17 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33477 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgBTPOR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 10:14:17 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so4646137lji.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 07:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nyYfAxHT6CRHzAhL+Lfi1DTcyn2H/tLwm1L1QgCaoUc=;
        b=FB6lzG1QsIqJHCuslHP3XrKS96DyFbJ/GgtiTNNd+l2lp80jw0+yLLjt0yAnjFUU6/
         8WD/q9sg3t58MaC9meV35lDEcTrOtbdtPD1gGvBOTvftfV6FsjjVwS4RSzkAV6QEiTmI
         VkJrdusURrmMv0GCiczAYp9z8LUIdgMCgb5L33aNByuSoyffErjFIldKL9bea4/kpf8N
         RI/47mpW1GDKEPL7hpCsxbmnKlj2JtpAdfgYY/N13m1vHCq8UlzrBbEpSVbNXnebI2Jk
         7y7BA/Uxnxq6PfuBrRb+x1Z032LUiaaFim9zrrTNbinVCNYATV2YijjptrZYmbGw2eFb
         iKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nyYfAxHT6CRHzAhL+Lfi1DTcyn2H/tLwm1L1QgCaoUc=;
        b=aerwbeyM0CeQiRhI9qyq3IvlGKiLmRrbBl5ECW5sSEwSv+i8/RaQIUz+Y8uuX4D6rT
         edTcnkiEynbhKVIe+o3b1qR+U3vSvzI8sBhegOAaVYjjoAuw9sebNij2R13ky9Lg6IYC
         6FiFAIf6rig4aho2AJNE80Ifl8mUOLdoAHNtqtqW9OZKjGalILiXC7gtl8mU36RFuScy
         Bh3Jr/35CAbquT3s4vreig4zRGWkefybQS3ktHNjGjt243pE2Z1NiVy02p/aY6QXifPR
         0La80MQrYVxoIiiumdR/uh2SekvduC7WIU2rRVsb+iSLMzLhlwECDETfSkQY7V0WHvwE
         glfA==
X-Gm-Message-State: APjAAAWzeiZHfA5+pE/YphOeRezhagdW9UeeQT7q9XFWurPIzELvNMiU
        8PczbnwCXAP7Ewfsb7g/Lj+hyNDBR6mHgVBuL1rQEg==
X-Google-Smtp-Source: APXvYqxtKVKfD5MHxlSSaj0Vz28Axw6Zu0+dlk/mKScpMhfCjU4oekoeWPt9CHiwud40m5c1q60F4dL0wXI2I30UJCs=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr18719210ljg.168.1582211654160;
 Thu, 20 Feb 2020 07:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20200218023625.14324-1-yuehaibing@huawei.com>
In-Reply-To: <20200218023625.14324-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Feb 2020 16:14:03 +0100
Message-ID: <CACRpkdbgWj3FtKP2S1BcNDphYRS5G-c6-Ms1HGyrcOox8EFpOA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: remove set but not used variable 'e'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@listd.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 3:36 AM YueHaibing <yuehaibing@huawei.com> wrote:

> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: In function mtk_hw_pin_field_lookup:
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:70:39: warning:
>  variable e set but not used [-Wunused-but-set-variable]
>
> Since commit 3de7deefce69 ("pinctrl: mediatek: Check gpio pin
> number and use binary search in mtk_hw_pin_field_lookup()"),
> it is not used any more, so remove it, also remove redundant
> assignment to variable c, it will be assigned a new value later
> before used.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Matthias Review tag.

Yours,
Linus Walleij

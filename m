Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A2E1CF548
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 15:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELNLS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 09:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgELNLS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 09:11:18 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AEBC061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 06:11:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so13547596ljl.6
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fNfgxj6D87Y6aWL+yxcHi3/ZDBy+NqsDMh/WXoRdX1U=;
        b=XXYe6w33B97BoR/z6hG5JEkETOvNGNMrZV96hfo5kh1O8zhaVuGYzOPweM95vq0kjU
         57EFOdkvWl3WAQHXg6Q3o4JWFKEZSbnpmV/bqR9djJc6ms9oMHzk5NXs7kURhR8pGUq0
         RBLUP8xcQSN69u+il8uS+gDxeN99P9wC428Q4zyI+v5miNcPdGXE3x03jXF0iWESZJc/
         QP7APn9LIfbzIqgsFhVNU/CbuytCzkybv5IBz9YA7Ig9LIpwkYfGo2cnUmS5zhHj1vse
         QuhgnzamTqzY9r93jiDGKGasVJQBKPE4HMO+FM9bR/8XVlpKeaTTdLFF+hB9mmHt4OUL
         iKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fNfgxj6D87Y6aWL+yxcHi3/ZDBy+NqsDMh/WXoRdX1U=;
        b=KNXO+dzh3fI3aiBwvrmprkgMVj6BPwgK8EWMWpAR6prEKwkrAAOoY9j39wQi6yuXTB
         iF3NMlyvCfjre6QPYWSTZk+4mwl8FU3/SIIBUdwVqU1EiUyGgj7OCNpbZK7mIDmy2RRx
         clBPPdWbySBi2Ltzs/larTdKD+zClttEtEazmvEj8iY4u62CXQ2bjzTtO4nNo4kgpcNj
         7UIDIkOzcwy7LZrN9qy3EZ82FHXXZHzFTIPLORwFAjQWYMtVn029jcHgAvUFiAYkO/jS
         CVEk5k6+lqvspXNeAp5Eq7J5MRPL0ubmgQjt7+8qWlSyZuJbEiG5FVCODY/O4PqZ+rzt
         9aEw==
X-Gm-Message-State: AOAM5309Pkv6/RkNuyS1UrxhCpcri4vTY38kxQBXO2krgrnDVGWDGAmO
        oOpKsm2IZfrbbt1fSAQw0bq5zcvwZly+5Je9wrCQHEB3
X-Google-Smtp-Source: ABdhPJyseI75vZ2crF7NrcrcTQnpEY6FN7zltnf0g/qE5/ZQT6YyGMv6RCtLFh0M/N1vs0bqqMnH4EcVGx1QC2FlSGw=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr12781831ljg.99.1589289076229;
 Tue, 12 May 2020 06:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140848.554957-1-arnd@arndb.de>
In-Reply-To: <20200505140848.554957-1-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 15:11:05 +0200
Message-ID: <CACRpkdZCVY6ph5WH+fUdbuc4yzEGkmDmUZ7L9HFHffB=73Cc+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: add pinctrl-mtk-common-v2 module license
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 5, 2020 at 4:08 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Kbuild warns when this file is built as a loadable module:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o
> see include/linux/module.h for more information
>
> Add the missing license/author/description tags.
>
> Fixes: 8174a8512e3e ("pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij

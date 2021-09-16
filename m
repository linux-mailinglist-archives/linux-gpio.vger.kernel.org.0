Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1863840ED20
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 00:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240739AbhIPWLM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 18:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbhIPWLM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 18:11:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868A3C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:09:50 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i4so24343515lfv.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XRw/8kw3Gm47yGNo4b+3xVaG3u8h4lDetU6RLgvPpYM=;
        b=x/Atd5iS9d/mD7e9HXfAhFD5uoynPZEfLmRpaGeKsIRyjJmIuRY4PGeVuARgQr/FwA
         z9TQgvIsE8ni7UTcLOqpRGU0lICeTgik7+rFzVupx472d6voJt8IkwEGiT9sA4Cj8Rjk
         3q4FHT+HfeQgpXNtCMDUAEnP0rYTIpzwQxqNCRSKUDR/bwGQXKdjyq7V7FVHUHhsaEoL
         Kg0FnZEPCWmop4kA2f65sgqvDIfAvSqQwjla+WNXQ+9mA1XjDXfO2OimcRkWv/G1WpKt
         Xbef66PUeh/ljLs2sHHOjLOEcr1WKiQb0xKh1spWfeKjhoRnMYmeDEvSA5SP1EIZnmfD
         vzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XRw/8kw3Gm47yGNo4b+3xVaG3u8h4lDetU6RLgvPpYM=;
        b=si/QuZQh1z99V7XGsn3U4R7iA33EPRjSL9JvMat+t/ku1yVQaGi7tQSzir6bkap5SH
         n1GHKLb3GlDdRddcM2w+hducgs48IFgW9PuEyve8RBBdxoM2gR34y0XPeS/Lx/Dlx2pT
         QK4G33c+xZ0jgS9fWyC+Pf3E6yeg0DAJ9O7pUbn6lBAtBYkqBp4sbIkTxUunUVlxJked
         cduEoKNEL8bQGDOOhLWyIPC74DroNpSagm8dVtxlYdK/YuUQga4LBx4b8quHKr0ptbeW
         Ai7spvM6HqNcDyKhFlgKR7Lau361P4vAE04Orkskx+lxQuEyrBojMAZQsdPQvjGw3yzS
         4pXA==
X-Gm-Message-State: AOAM5300abJddVB1Xotwfs2MjwMt4smmHoKnTdafI+q562rnoIGi0np2
        wUs8RJ2WE7DL7v6Y9frsAR2K7vXcYrVQqqllIbzSYw==
X-Google-Smtp-Source: ABdhPJw2e9G19NVqKc7SICEm2HKhYNk5D7R4u6geiIOB2wtNdYcQ82XGr1cfIGnY1UlnIOCWgtx6ssTpN9N0Q64tSRU=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr5683022lfu.291.1631830188831;
 Thu, 16 Sep 2021 15:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210825082536.2547-1-caihuoqing@baidu.com>
In-Reply-To: <20210825082536.2547-1-caihuoqing@baidu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:09:37 +0200
Message-ID: <CACRpkdYZa=67LxZWHfrFBfnSJmi=0CcHyZmoJvaPojugtuAdmg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Kconfig: Remove repeated config dependency
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 25, 2021 at 10:25 AM Cai Huoqing <caihuoqing@baidu.com> wrote:

> remove it because "if (ARCH_U8500 || ARCH_NOMADIK)" is already used
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Oh right.

Patch applied.

Yours,
Linus Walleij

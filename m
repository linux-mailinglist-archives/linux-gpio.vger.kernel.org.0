Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90C0413FE6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 05:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhIVDKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 23:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhIVDKQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 23:10:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC74C061756
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 20:08:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p29so5795402lfa.11
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 20:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jvDHJ7BpWxgug9U9vBbLk1VQrGHUm2D+G+8DLCbP+bY=;
        b=Sfgsur3unKHCxqZ719aFss9Iu86/cxn/VrdBaa7t0sVfZbZ04ROT6DUvvF3it4orPq
         3LhMVXZA4pU7CBnxGrS9DyBiNXXr8/bOw7ZL2Uij+QQ8/Clst6kCbXd+thMELOx3WWFv
         hoOf9UsOV81dDEkVI1gPR5gR17doBuWVXzTDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jvDHJ7BpWxgug9U9vBbLk1VQrGHUm2D+G+8DLCbP+bY=;
        b=kq4ZZNudGG4zs72ct3zCEp+fkid/cO6/zWGLzD/kHwnGtN/ILYunBLX9FDJ7QRUUb0
         uk//sV8H8iNbz0UtVfvlUlvj5GkhAPJBz53NQGeiMG1gnCoG51EqN401naJ3d0lJ+20g
         1Ecz5eALRx9ewIxh0brr0dzBbxNsU5LqWl8qCnEt0Kn/qFupN+LnNrUad5ENZYGnUuwa
         4kKsU5LwTMNQKC17pJ4++lnJ+ucz7GKXBv65EfpQwYtkw8eFV/Rc65ZKnlaHMoaNe6HD
         2eAjFWU9Qk84jsv1h5YBCgVxyyVqCjATCtGvT1uiYvj0zaX9a9w8h/eOtrY9sXrt60eO
         LE4Q==
X-Gm-Message-State: AOAM532tHgZ8OvThBV5zkAjPaR/QYH6lD8fCQKTfbsaw7mW19IenhtBV
        ASspOso6ucTvnvLbUk+9R2bvH41cSHfPuiiLlwLbgQ==
X-Google-Smtp-Source: ABdhPJwXu6UxZE2/bkKplxqrHu28gVpzzYxNZSK+7DKxIotOikhK8OfyyvyApfd/1hOqHv5/p6JsHHkF9q5bI3DOZ6s=
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr27470353lfk.482.1632280125364;
 Tue, 21 Sep 2021 20:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com> <20210922025640.11600-4-zhiyong.tao@mediatek.com>
In-Reply-To: <20210922025640.11600-4-zhiyong.tao@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 22 Sep 2021 11:08:34 +0800
Message-ID: <CAGXv+5G9cW8uNnaUDzoAOWdy4Rw1Kgm6D7jFhHY2rE_vW4JGFw@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] pinctrl: mediatek: fix coding style
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 10:58 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> Fix Camel spelling coding style to avoid checkpatch
> warning in a following patch.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

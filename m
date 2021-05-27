Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971F739317A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 16:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbhE0Oxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 10:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbhE0Oxi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 10:53:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E1BC061760
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 07:52:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j6so457493lfr.11
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jqOWEVHuZGkfA6MD8Z68F0r2FOE/7+7mfKMuVI/ccg=;
        b=cJoEDb4CQ/mHG5hJsPhdH+w76PE7kgmJxWhbPuRqPqvqTaEib07YsiwAXxRgaLuM0+
         /bKteq6nUzAEouzLWj9/mJJCmYoGxyisr2QDmn5KYOcDs0m4/dwPxdSsczE7qsZsc8K0
         U3oAGI1C8St8Aalf/NABCefTVRYf6G3kYRaUeWDu8G5pLRxzT0Hv4U9yWMI8kOE8vZd5
         VGU7U9oSdwVl8I2Qv6PmTHaVqzWJm7tjB3YYFJkOqzD3Nrz6poXMtRbx+ICPPy+9zPsA
         TjotsHzY9phpNO1B2bvHVe22wACZlNtJBsBnufuS3agHuoZ3BDjmLeQSH5JT0ryyChOF
         MpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jqOWEVHuZGkfA6MD8Z68F0r2FOE/7+7mfKMuVI/ccg=;
        b=Uf4UlxENRBlyuMMKZmUn93aCfwuaoxTZYPxcGb7cMDvkCN4K2zKTsbfNe8qFRiCpRX
         rixWxDbW2rE60U0n4ohW49CKPR02+23X4KK/p3gNjVV1YYjcxgOIgrCcRQwYHc6Wzvi7
         8LW5y9LHo8eyoddYFPcxsDwyqZnN6SPQVdQxGCYd0UasCOooy25IUSXQG4E5LN+7Wmbd
         TgHx8T6QRH0kDe98Wif2pDdBN/lQ2Wbzo0a8ML4dRNEeyGh7EXBIjlHbVRwsu7UiPvFN
         ox16ms4wX687XGjILfKZoA2Nmb6Jwo5VciJBxsBxIo7sGb1Rv68v2lefzQxRiuSHpOBG
         I1Ow==
X-Gm-Message-State: AOAM531kzxC0QlSapOc5MFvj6vuCgUbn4Lmhmv9HkeLw4ZPFh9XyQkI6
        dK5TRhUq4gLmZNGId4TFSEMLeTjGDXVBL/XPFBo+0mH6AHI=
X-Google-Smtp-Source: ABdhPJwOz7U2P9wcNokB7S5LqfRAKa5kO1E7gucgX+G5ePQajC2FmgoKGqJaaeDH5utID4W/FYcBSXnMCsWi5qkepiY=
X-Received: by 2002:a05:6512:1185:: with SMTP id g5mr2652587lfr.586.1622127121750;
 Thu, 27 May 2021 07:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com> <20210519162409.3755679-2-fparent@baylibre.com>
In-Reply-To: <20210519162409.3755679-2-fparent@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 16:51:50 +0200
Message-ID: <CACRpkdZ70OcbgyFN2cQtLgsXFCTsvstsrBYYt3UY6Wc=NbXuag@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: don't hardcode mode encoding in
 common code
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        mkorpershoek@baylibre.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 6:24 PM Fabien Parent <fparent@baylibre.com> wrote:

> MT8365 encode the pins mode differently than other
> MTK pinctrl drivers that use the PINCTRL_MTK common code.
>
> Add 3 new fields in mtk_pinctrl_devdata in order to store how
> pin modes are encoded into the register. At the
> same time update all the pinctrl driver that depends on
> CONFIG_PINCTRL_MTK.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied.

Yours,
Linus Walleij

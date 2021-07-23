Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA153D3D12
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 18:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhGWPYH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 11:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhGWPYH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 11:24:07 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A806AC061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 09:04:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id n6so2269779ljp.9
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kZLoHb00e/f2uvt6VDNXJoTXgrvoGciw5eKO7Rkag8U=;
        b=J57dd99fueJo0Ewd/FRALzk6FomUTPkmWz2HZ4Gi3VfLL89dwVw5CqFoJqS6jtDU2S
         nIuHNd7IrBsbhH5UO7LrRS3k2VNPhFpQu1zVqTMzMWMh1X8AjlCPaq1++OG5y1aEzWvw
         AsTNBoTFTzRjw7XhLopXN0C6O3Qt53DlWZEuD9+SIYZLJCz0IjuwyLKZDYnUl/455bcm
         IXEIlKhkBsx/mWN3pA3la9JamMKa1FH2dmmvEQoo/T3wHotL/jObVoU1C5tPsqxlnxZY
         g3jdTxgTeetP70wta3dJpyADgkLCgl13xN/uAdfkHOiLAx7pT0ndxjZi8FSZe+v3de3l
         xclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kZLoHb00e/f2uvt6VDNXJoTXgrvoGciw5eKO7Rkag8U=;
        b=qb/N/nK58xJGgEyShKomnaq3gIFJu8SJqE+h42NGibIOJS2iM30ztctjFu0PiHvx/H
         /MzuvUPTWCjjCzliou2iwhXJmTRxo2mAjbIrNvR80/UP3NvaUiVtoyriWTVFvLKQ+Bzs
         bAJbvKOuF4EhqayhypDJ0antf+WA+wN2625evzdgmHtmGxhyjD8E9ON6ZGXMEDj2k50N
         aaztHj2hTdg0aGUmB2UciQHdq/bykblBBFh/c1nenOz2nmT7nUYpB0Li5wiJfKKjTTnS
         ARENzpmvKGJ0KqCsjpbNpbJnciHs2nGNINbO+XSFtMthapDJiZMQCnuYC8JVjYKRzYJR
         wgWQ==
X-Gm-Message-State: AOAM532FPMwCrPRRFzpYvlbhjOSxTWvE1D4ktQsX61rmEskbGS9Napgu
        r3Ea+8RKCGtUurhe21q8hr57RJmHceONSDAsGGrbuA==
X-Google-Smtp-Source: ABdhPJzo0PSYV15eT1qrz5sHyw5iPO4XGjMebwCKucdy2PFnKayrx6kV3CaDbrwwYX/zYhX7EUChqcq6g8MKzHPVFMQ=
X-Received: by 2002:a05:651c:160e:: with SMTP id f14mr3794529ljq.273.1627056278976;
 Fri, 23 Jul 2021 09:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210607061041.2654568-1-ping.bai@nxp.com>
In-Reply-To: <20210607061041.2654568-1-ping.bai@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 18:04:28 +0200
Message-ID: <CACRpkdYeGJvRM7g_2E174NXWv+hqS0wY1PJouQbfu1_sM0B4WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 8:00 AM Jacky Bai <ping.bai@nxp.com> wrote:

> Add pinctrl binding doc for i.MX8ULP
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED74F35F1D9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 13:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbhDNLDq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 07:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbhDNLDq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 07:03:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BE6C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 04:03:24 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id n138so32571791lfa.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/vNS6umXkwbF29d+Z7tlr1T3O0+txjyE70BHssp7rg=;
        b=fdJ/dPQmKi55RzbyBZIL1hkuqGGVcUSzFj43in6mgs3qA9PsjCYAdNT3pn972rgt10
         16QCcDi23voSd1xBfjOMRaW1/mr5W3jXk2cEBV3SKAH+0uddV81gU2FgX01fRwYqIGDy
         wMjWEnDhpuk1qup0MW1tEBFvM0INw8QTMvZByOHEeBW7k4HAzoa8h3HQqZJUseBW3hUh
         lNqVhXcOmAaDcEw/FAuI8waKfcxDsf+RSsU+xh0BXT+YsE2YADQhLoxmGQJrGKmorFXl
         r/Ytjb+PJGVzjn9a1Cnw+ypU1271xnSJwXKaLdivoW0z2RNHxLdvkVDiKeMaRbUyv8zf
         FfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/vNS6umXkwbF29d+Z7tlr1T3O0+txjyE70BHssp7rg=;
        b=DBnsJ8UKpHErpoIhYZZWghfd/g5b2NU4UH+Lbmdlio+B57vF7BWBjQJwlks0ivYu+S
         qDqbWTDdXvp1VtvLPi+9zqL6w5BJvNkbeiPqrrVq1PIC1tTM4DcqE5pBcw9s3OhAqtYR
         /8SltCryvk6PRGcnVx/+xHE5l6qZkh9jMkfgfLwrLHch9Y9x7XZxDNlCNx8Jxv3r5DIs
         bbMCImKH7Ww8ElBTNeyAwvpmn+DpNPzchp+l8gXgdd/yuPuVXQbUYWId/ZjKVch3VXvK
         U9SpTtRuIF/mAl6J3XYR4OGgLbpMwLVCe3VabaMc03k3niM/gTU/6E1yJCyyMuEJKcVB
         9wAQ==
X-Gm-Message-State: AOAM531sdrMBxtpoRHKPKhr8De46omoMEdSe8YsvcVkCjbSwTd+Uzc8b
        KiAmbAg6LH6qUMOoeyelRL2EYFp2GSkoSGmvtxdChw==
X-Google-Smtp-Source: ABdhPJw5W4a3WQ1O7p3Pr1A24/jEz2x5EJmTSO6VW7baQsN+jWwug+hpyjloLA0YsPf+3gSiUjffc5qI+Gpzp5tEnVo=
X-Received: by 2002:a19:4f0e:: with SMTP id d14mr14276105lfb.649.1618398203177;
 Wed, 14 Apr 2021 04:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210410204500.18091-1-ezequiel@collabora.com>
In-Reply-To: <20210410204500.18091-1-ezequiel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Apr 2021 13:03:12 +0200
Message-ID: <CACRpkdYrFZOV=_yh9ab2tF6omiQ1MKeV21hYMnt0_KssuK8nGA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: rockchip: add RK3568 SoC support
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter Geis <pgwipeout@gmail.com>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 10, 2021 at 10:45 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:

> Add RK3568/RK3566 SoC support to pinctrl.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Patch applied.

Yours,
Linus Walleij

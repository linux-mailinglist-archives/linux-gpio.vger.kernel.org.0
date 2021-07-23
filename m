Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841563D382E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 11:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhGWJSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 05:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbhGWJSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 05:18:13 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EC1C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 02:58:47 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bp1so1188081lfb.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXuM8D5k6/Yl7ozL3DfM+PVJYiIerLcTEkx5mVID/UU=;
        b=NGgdq7v+o5iqkF3EI+m7OhMam7v6/wLB+PtgVWtPK+zgiAfitTZEjpKoG8KZfnGRZ0
         XJ8xuYkmi14aUj966cwbUP99rci0Pn0csyZhH9ZTUDnuQSS32kadqR3lypzYlQJVtsnM
         M/Ob2kqRn3bnETXtydx4LmnRgUUYyQCgOuGSK3GFT7vITGtGj0rltsuaNPV67aIl2IPE
         bHvysTHvHR7wop3cRkd0567v6cxdtTxGnhtE0ta1ytVcgpKU5CaZP8raw12NEl4CmFcw
         RqAlqSRFEHdmfT39ZgMX58L1/MNwxVvr9JKjOeHcHDvcFn9WS2ZMo7vYxE3BPlFA+Tmq
         I92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXuM8D5k6/Yl7ozL3DfM+PVJYiIerLcTEkx5mVID/UU=;
        b=SJC1muOuGH2T1NZul0qiMHAd3VX+rNE+NLbaxy/2q1YYdFmLoPZvu3XbU4xI1hIWTf
         5G4eWtSIu2t9XB1PVqVzxknOQQVixhrfmil2MbMkut6doA/B0ZimroZFnQNc8qgieXgb
         +kIeyAzVts3lKD0D3ltuWuS7rR2fmwggjK9MYDHnjGd64/pBICTmjrXeCM8t/hIOJdVG
         A7BR1/Zgl7gAxHv7rQCkDqMdZ9NHHlFLmvj/9w9bPXmSDeucJ+6vu+sson983SQMazSa
         nL6Vr2NHNRr30oNWsdnV0JgQPVD9H01tVE167DDjQlZjQCo8xjZzPJhr0CuB8YkrLhIw
         0svA==
X-Gm-Message-State: AOAM53010o3nRBQUEw+FYS8Z1h85PuLzb1RJv7OxiKSP8kUsJjhU3mV2
        ORdablOttYYHv6je2DbJv9iGqe/u9HN60sfbfQP8bQ==
X-Google-Smtp-Source: ABdhPJzUNSEtuAGq/AntijcVwb7VOysRbc8PRRpm+HrzsTl4s4LzDpYbxtndNsmw3C9e7zr97SPpp9rInqEhXg6DtRs=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr2434778lfr.465.1627034325426;
 Fri, 23 Jul 2021 02:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com> <20210712100317.23298-7-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-7-steven_lee@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 11:58:34 +0200
Message-ID: <CACRpkdbKyV_Crw8MS63SZGf=nKztDkKnJgRprLdvXe0u7BmVNg@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] gpio: gpio-aspeed-sgpio: Add set_config function
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 12, 2021 at 12:04 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST SoC supports *retain pin state* function when wdt reset.
> The patch adds set_config function for handling sgpio reset tolerance
> register.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Excellent reuse of existing pin config property.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

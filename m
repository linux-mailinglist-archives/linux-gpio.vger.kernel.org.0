Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E263D381E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 11:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhGWJOy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 05:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbhGWJOy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 05:14:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEE1C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 02:55:27 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q2so1012054ljq.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fP0e5+pzHaDijpgYG1lLGjRTibrvPnmwfOfR2a79Oo4=;
        b=PgwQBnjSvLk4x+X2yQe7jp60ecUt1DEGtW2oMScbsZQYq//k/F5P24Ew8ozjmFMAv9
         eJLWQ32egQtmYPHnGW6HvSZ9bECnSmqMdHK/CdIUE2xOzb9PTjHViKBsodCcLS9H9+f1
         Y2v9/uQadwjgUv2+rxkPwgOUbyhQ/tzVSp0ADSKQCeFZREoTBTbLkLfHJpCyU++//o+w
         PPa5gWBS/iR8l/Th/mvFurpKKz6QThYvBgU5z9cAC7//s2s7N2FnEuu/x4BKaszBe59W
         w+5WnT6deW8axtamvoy1MiN6nbQmi9jHGBzH7V68wgdPjVcq5exj2BrLbAasWHSw4Qfc
         4pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fP0e5+pzHaDijpgYG1lLGjRTibrvPnmwfOfR2a79Oo4=;
        b=lBLaa5lQvhVoPik35X9fxYQPT3X33LSmfEtumaTxuj+OSF01avYeYf4uzXEVT5hRvf
         weTv8mELGZN+50WVFPXXtG3Qojw6a0CnL7UfhtSi6CzsGTfahmkhuok/nwC/yDFuVlFL
         Yh97yKtHRpQUorA/V3KQMg6D3xK7AGUGRmXub75h2+aJ6zAhRCMPR0G7zNofH9XnSUXA
         DeVoZ/zTxBer7HZwUsliTPwPFgCR/a6OgmIg3nTRIUH8hLQWHZLMoJDF4osGgiYAUn1U
         sQD1q2RaGeyoWM5evv0vwD4RyYyiXZJKCKeMvvo8URFsZdsmj10SzdkLEMCboo43q+DB
         MdlA==
X-Gm-Message-State: AOAM533xtvoHulovDXvazFdj+fVFrVUDIOdFuYdANo1LpBvG8ZQ8ICpg
        Orlpj/hWmSyqdaKHJfMzX+mdUpYQRbouS0DtdJoVRg==
X-Google-Smtp-Source: ABdhPJwPEw7PL/ZNV+knFCr6ygwXtfSSsgPtD8AuMekygxnk/RTl974xpeWic6KoZZjpg5e/ZwPK/u6fHqHmTlKzNJs=
X-Received: by 2002:a2e:908d:: with SMTP id l13mr2708186ljg.467.1627034126232;
 Fri, 23 Jul 2021 02:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com> <20210712100317.23298-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-2-steven_lee@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 11:55:15 +0200
Message-ID: <CACRpkdY6LZ1+bZkc+Nk3Fr4vn8neYHjMNeAxDR_8u44Nq71+Xw@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
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

On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> sgpio-aspeed bindings should be converted to yaml format.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

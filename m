Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CE4393958
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 01:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhE0Xre (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 19:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbhE0Xrc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 19:47:32 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF64C061761
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 16:45:58 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j6so2571008lfr.11
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 16:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pzhAZz5qD9tMIBygAnX25ExGzRT83UA6SsM5Jk9PK9c=;
        b=ku+MevdNuxRQCIlQDe5WbthdcCPQDlxzodRhu4e04QT5ujq4MSRkOtpvYQW/yxHMuy
         f8M/4piku6X9w+HnbFpx3Laek/DEUtWRK5WXzuJxghvKoAN8b1NoWQRlhGfHvluUWD3I
         Zxo+KYHxKlMCru/TegYs6o7Wx1HC3HrsXqbOPlzPKezkluNtQhqrCVb9ewW+lVeON4aZ
         7BAasc7TxACThYfU8UpHTYw5znXA8c7O3yUAyqzfv/JSJJzPAZMOGrlFx+tVD6pyX/cW
         yUSCBW3S+B0M9XgiWX8isA12ea6Er/YDTkFGL4bEkXkwTv7cDHejONmAqsLBRkchgtBb
         rtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pzhAZz5qD9tMIBygAnX25ExGzRT83UA6SsM5Jk9PK9c=;
        b=TKDzVJKXcBNXT8QWGGh0f8OHXpS45xELEvsbfS6WRb1vI2wQv7h/lOtl6WdxwQPO2y
         DXikFpqIcoYAUU9rb2cDTQLxxKVKpd9rLJMyqvuBxuVI4MeCJ9Pkn7gRBT9dAoUxCv+z
         8Y3mpZ1P578nKaVhc/9cK7WuVLGR5989v842O0S+M41auV4Q01c39ndeEYxHUu1YsZQr
         +4M0VkdbdpPZipmftaYewR+tAWlRsNPrmumsNaO25qaH1DBT6SnL1Sjur3bqp4AEiaOT
         U7J2ysr/60gW+yuGfGQH3SEs5rKgrMimxjENJc4BL4F2GOalfOlLj26eueaqF9jzGApY
         NScQ==
X-Gm-Message-State: AOAM530AhJLvrbGX4BbiY0pQYppdoB9Aa4xKMOChnMKfxPeL7CnRna24
        ISXTOA8OY9DOpMWuO6wJxtlaREdUX38Vbru7t1UzF9XjyOs=
X-Google-Smtp-Source: ABdhPJy/46H+k3aOEa5cM0efkOnNLslLyNp40ndo+HmC/hefCNnT9RC3XB9+Hy8ze9TKQNzaARS55qPRJF1ZogTpez8=
X-Received: by 2002:a05:6512:11ea:: with SMTP id p10mr3746839lfs.157.1622159156359;
 Thu, 27 May 2021 16:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com> <20210525055308.31069-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-2-steven_lee@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 01:45:45 +0200
Message-ID: <CACRpkdaFVnGeOHCdwoBS4UMho8OJ_s6cAbkqJEM+uNyf9j=EQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Update enum for adding SGPM2
 and SGPS2
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "moderated list:ASPEED PINCTRL DRIVERS" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
        "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 7:53 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 has 2 SGPIO master interfaces one with 128 pins and another one
> has 80 pins. It also supports 2 SGPIO slave interfaces.
> In the current bindings, there are only SGPM1 and SGPS1 defined in enum,
> SGPM2 and SGPS2 should also be added in the bindings.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

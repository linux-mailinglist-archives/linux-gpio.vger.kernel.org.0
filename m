Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B593D383C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 12:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbhGWJTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 05:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhGWJTe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 05:19:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5FAC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:00:07 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d17so1254826lfv.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q3A3wcg13DZEjlCLDewUoUp2VK6us3A/bBxLiSdBb/g=;
        b=ANJjpl7NzOK7kQfV2NofKZZL6aTJrGWvKTTPloBDHHVg3B6xAG714RqD03hWe6uq80
         PZNZOc/PjOZiuE9PetDORTDVnG3p8lN5vcySRm8QT4m7XaqVt59XbrpVvbjykfeeihcd
         tmd3chqjQbdHk91ZhJEWKqMhKpii+6mnHI+qbDM4dwA9zF/FuIzNg/Zhxdhg+Tc7UOI/
         46uWhyLPz2bH8AOCjs3QfgQe/+cFANBWXdSnHP5jd/fR9iIbaso43z5GHNvfo3ZtozNb
         vC0yTCteUH9OcxwnTQAASPULIljFvOkiPjQK6xTxu/o3ssRUOckAatfnSPggS+LVfQul
         ef9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q3A3wcg13DZEjlCLDewUoUp2VK6us3A/bBxLiSdBb/g=;
        b=DY1IRyLrP1IhH+084Bgx9ifthow2hOh3/6om23lmCKMyd6k+csk9I5SBrbn9oZEmXh
         ZSpSNtVSPfd6Op8F1r0igleQ/nKZ7Q+utSd07kLOP+NdcoeEUkbNG3nTEVuv6Mr8PaEL
         Hb+Ofhi5t3xrbo2+9gkZGvHNBajjwJvqdJDmSpwtRw3P6O8tdih+1hfkHWecZMaXGSfl
         YfE/lQoUbEpaJK+5ucmGmTJWO9KBg7poz1yWS6W1zkMtK2fEIZQtQeYZt2yJSCee0Cdz
         iZN589bIu2aZgbA4eetKB36d4sCtkM0pGU9X8gbUEArhztPi/vTj3u4uJeAKSLxqlItu
         AjDA==
X-Gm-Message-State: AOAM531uYzCQ0ui9tNUsBfBcyCqcW+aqz73no9X6VTHYbRx1Lqb1Nz18
        JFAEdfW5zUyKaOJMa9YeKnP0vKqT2JmR95WCfh/AaA==
X-Google-Smtp-Source: ABdhPJxcpwkaKCEEng7O+N0rUtzYgwgekwY+aOeUQQrJkKShW042z4cuNAEJbb1Pn6WghT80XUFEIu8S0GqeR9yEIfw=
X-Received: by 2002:a05:6512:169e:: with SMTP id bu30mr2459661lfb.291.1627034406022;
 Fri, 23 Jul 2021 03:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com> <20210712100317.23298-9-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-9-steven_lee@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 11:59:55 +0200
Message-ID: <CACRpkdZa696HyQvOssrUK=KiiJGVfvCZZ_7zyOWGoEaB-R_BkA@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] gpio: gpio-aspeed-sgpio: Use generic device
 property APIs
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

> Replace all of_property_read_u32() with device_property_read_u32().
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

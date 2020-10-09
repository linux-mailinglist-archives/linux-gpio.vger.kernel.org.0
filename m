Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252AD288644
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 11:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733194AbgJIJou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 05:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733190AbgJIJor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 05:44:47 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6937AC0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2020 02:44:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a5so8953708ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2020 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/LrU4HDUwe5Ja8OmdzeBEJH8weSMyd+EM1T0OFoAefs=;
        b=K1ofWV6X5uMHY8OlF9e5/o0nQkR8+DSLkBFjXYTr5dbtbtAL6Pwq/xpz74m1YLvsfq
         B0uYEQ2BDzzyahvpLbB3TO0QATgKcubo7mG5CNqgQsS5O5ORXzSQR7QKesLjHW4VqUPS
         ymxtb+7+6vtpjJ+QhvJ+710zUkZUBmNF7yU2J/MgiuAdPORUFQKKN5c3CN6kmnUt/nix
         dex1au+ZjBtzvLBadu1wSgKPMuwqXzZ/oAwhENu1lOdDsrpPr/1SyexZ8RPBlF+6B7nU
         ZuZukMJfqcTyN5xbLG0BlPkyFGB7k3R02uQ/25pIxZbfRGBrHE4zgnaVoYfbCnYSdm7p
         L5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/LrU4HDUwe5Ja8OmdzeBEJH8weSMyd+EM1T0OFoAefs=;
        b=S4MJFeLxRJ2CDbcXFfLXvw8o9xMD8Xnh/QjP0nyNkgHyqq1zSHwEo/keeELlJYcdPv
         y/sBiYlkiTu74F/pz71x56JmDF+Pc136TuRbwiYvrErdQWXQxnaBN7wFRv/wj+E0vieB
         TZ3nHY9P/FTc4+O/LzxumifPPj1Z2DOEAoMfaSwX5CTuUfHqCcSwzQVKEWmhh8KU4Xcl
         V0IhDAs8D5HS/prMf9E7anlRtbIBUh5BLtx8zf2rC5P8oSSt9mjUxe9z95Gl0Z4yOGXH
         +LmhKONkEpATLrALtTlz75Ff+dojttZXl+UfDaClHsqd0p/LHb9H5bCiePT/VZXA8WY2
         wStA==
X-Gm-Message-State: AOAM531WjJ+V4g7b6AF9uhJbs/bVnBBKLY4F8h7AFT7+pl8eVXKjjnA0
        qVagVicWOLT+ReSTzk+uR+/fCduIrtR3Utofqip2/w==
X-Google-Smtp-Source: ABdhPJwtkHFBkATYIWMQv0CcvoFYf5KDv3EuMjA78eZclQ8SGUhRMetPMbZkX8dtJwt5mRbxYVIoAzQz0eSEVJCUgoE=
X-Received: by 2002:a2e:a549:: with SMTP id e9mr2502953ljn.293.1602236685801;
 Fri, 09 Oct 2020 02:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201008130515.2385825-1-lars.povlsen@microchip.com> <20201008130515.2385825-2-lars.povlsen@microchip.com>
In-Reply-To: <20201008130515.2385825-2-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Oct 2020 11:44:35 +0200
Message-ID: <CACRpkdaFYoXFUuWow5s9TitrRDhMW=wiaxgfMcY6sQkYYgC-Lw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Add bindings for
 pinctrl-microchip-sgpio driver
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lars!

This is overall looking fine. Except for the 3 cell business. I just can't
wrap my head around why that is needed.

On Thu, Oct 8, 2020 at 3:05 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> +      '#gpio-cells':
> +        const: 3

So at the very least needs a description making it crystal clear why each
cell is needed, and used for since the standard bindings are not used.

+      sgpio_in2: gpio@0 {
+        reg = <0>;
+        compatible = "microchip,sparx5-sgpio-bank";
+        gpio-controller;
+        #gpio-cells = <3>;
+        ngpios = <96>;
+      };

So here reg = 0 and the out port has reg 1. Isn't that what you also put
in the second cell of the GPIO phandle? Then why? The driver
can very well just parse its own reg property and fill that in.

When you obtain a phandle like that:

gpios = <&sgpio_in2 11 0 GPIO_OUT_LOW>;

Isn't that 0 just duplicating the "reg"? Just parse reg when you set up
your driver state and put it as variable in the state container for your
driver state for this particular gpio_chip. No need to get it from
the phandle.

Yours,
Linus Walleij

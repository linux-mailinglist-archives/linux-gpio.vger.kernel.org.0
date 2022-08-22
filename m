Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137CB59BBC8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 10:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbiHVIie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 04:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbiHVIi2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 04:38:28 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A192B4A6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:38:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id gk3so19695518ejb.8
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=5OBoHrdlmLoJOWu5Z6u5wsXYdDXsGII6yOBzDwmmk64=;
        b=Q5AWfYM/rPqlMVN4qyTDPaeV/0+Fk0sK5jGatklasd63Xvzc/Kde3ny7t+KQZiqhIi
         xsESJzpeoc5Lj7GBHNkmN+DL75GF2tfoLYlTL0t5oybt5T4qkzTZOtSnum4SCRoVeD+5
         OwXvk2cy7EyTb3Gu6Hkp4xMVbEeb1iQSjZIJPPlEuaZSTW7Bq71o5TtgXC8JUKif7xJ8
         vvKdA/XZ8SX+JhfY6W5XqInUgwpTUMu5HM0oEiNREievTLz9/od5tYsgeuCNeCISgGJI
         7BYkKKmxWsn9xLuTDXk1pJ8ACucfi4oWsaMV/NjeMxbD2ocFyhJNvN9MVGBz62abvbCY
         QbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5OBoHrdlmLoJOWu5Z6u5wsXYdDXsGII6yOBzDwmmk64=;
        b=L//2DdykxxDuIX1YhnbdQtB2+4KJs6fZ4WKHRVgZyqt2xonIDB9op+NHN+lIWOmiBk
         MOXURaBc8rbOHofgyBrQX299ISqf7iUtGbofMaulgvWYsjncQv/bbIeLnPI9SpLOhh8p
         Hb7DBbTFN2iKRdUGY0aQtjPBqeZQFCltcFt1nMXoStI0t0aC/W755lpzea4J7KR/ePfD
         CxqwE2N7+AqExBVnNmDXUxxyHsJDsex2ie8vouItAQyIEDVue4N5OzYDM8/P3CzuCRWt
         JD8rnswy6n91eP6TQBpskmDV920vRQ1ybN84DjNqIwFSB0LCpXQuRVO/sK5GT7f49V2S
         +nFQ==
X-Gm-Message-State: ACgBeo2XIdcQiYyxRA8JaSdnZ2pqEXCnlWWFLBvudmt72JMt9emuTdnT
        KRTAnecq2EqaQNETw2GT3vukgx83QY7RyJ8dcG953A==
X-Google-Smtp-Source: AA6agR6ZR63Fh74m2vscZd7j1aOwLRpZQ7CAvO0GxPchmdyIMOJWkKrwFuKZZRefZqXis0gsyYLXWca4nOtfLFidPho=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr12458571ejs.190.1661157503046; Mon, 22
 Aug 2022 01:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220802095252.2486591-1-foss+kernel@0leil.net>
In-Reply-To: <20220802095252.2486591-1-foss+kernel@0leil.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 10:38:11 +0200
Message-ID: <CACRpkdZXTtar73-HP8_wcAsCYw7JOgPwkXZt-_3s0GdoggBABw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Making Rockchip IO domains dependency from other
 devices explicit
To:     Quentin Schulz <foss+kernel@0leil.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     heiko@sntech.de, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 2, 2022 at 11:53 AM Quentin Schulz <foss+kernel@0leil.net> wrote:

> Some background on IO domains on Rockchip:
>
> On some Rockchip SoCs, some SoC pins are split in what are called IO
> domains.
>
> An IO domain is supplied power externally, by regulators from a PMIC for
> example. This external power supply is then used by the IO domain as
> "supply" for the IO pins if they are outputs.
>
> Each IO domain can configure which voltage the IO pins will be operating
> on (1.8V or 3.3V).
>
> There already exists an IO domain driver for Rockchip SoCs[1]. This
> driver allows to explicit the relationship between the external power
> supplies and IO domains[2]. This makes sure the regulators are enabled
> by the Linux kernel so the IO domains are supplied with power and
> correctly configured as per the supplied voltage.
> This driver is a regulator consumer and does not offer any other
> interface for device dependency.

What makes me confused about the patch is the relationship, if any,
between this "IO domain" and generic power domains (genpd) that has
been worked on for ~10 years.

I am worried that we are reinventing the world.

While my intuitive feeling is that genpd power domains are only on-chip
and not considering off-chip pins, I am not so sure that it warrants
its own abstraction and want to know whether this can be retrofit into
genpd rather than inventing this?

Documentation/devicetree/bindings/power/power-domain.yaml
include/linux/pm_domain.h

Yours,
Linus Walleij

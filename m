Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FF355AD55
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 01:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbiFYXEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 19:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiFYXEb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 19:04:31 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E752E0BC
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:04:30 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3137316bb69so54633457b3.10
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=te003fRb1WWr3bm4jg5jDztC35Iw9NRuXP7HGy9iIc4=;
        b=idbokq4qOysgj6wUEeo7TyIrQ1cxbROBT6f4KX69aR2e5lB5BP0llDwEXcUAJuuDdH
         X00eI0YJVIJ3bbMLlrfR6dkArNZHw2n4UzDDrTP4MUSUyPKX48WDEjBx9WoQsALpWB3M
         u6dSz64D7kErqwWoqckykiL4QEXKEB7EvQNdhUI1YnZUUdUfJASRxPELbDdZYFBwoCd9
         kUbb4CN+YauJKcmQGnR/0CqmnSbzEdj866NPudfZ8Vc6Cwf4ZvmBXGA7swhI/swwKYG0
         Z1eFLbtnZBaJ4dyxHM6M4uzWl0GPhmo+RZ2SOihp0ZoYIqijhU/wa2wPuCbL+DZ+/hEJ
         nDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=te003fRb1WWr3bm4jg5jDztC35Iw9NRuXP7HGy9iIc4=;
        b=KbAodrWFh4dJNhUN74SutjrYeA4P+rnT21eNgp6oiE883p7dK2r3EhhnFPak4kdYqY
         M84PPmDo0WLNwoqhGRQGnjYyfn8QuxAYn8ireieiLjpurwi/sDaw3M/V3V5sF7UuJ9lc
         c7m3w0WZp+fYhIgDAQKXVcKhnDPeiNPvTBt5p92q9JuwWiOn0WRkGBj2IhJybf0zSkcf
         rKoOgL8rs8joqxtCxhfEpwuXs+hvaaxhGJGV0Zxq645ZS5jdCWb2T5ZMUfdb+MaM49PQ
         23ru2pRmF2qyiRWDEiI7AxiX48kEeWYcG75GUGpbFuL+Iwf9m1utu9RYzW5XbXbnyqPA
         OFfw==
X-Gm-Message-State: AJIora/t/PLEY4NCLcPqlRJu6nyNMmMeeznmEtO/SoyZa2/+Jt6u6sKr
        WM6d0OGizf/O/mpdQtM/u43LTSelMVcT1eagvycQxg==
X-Google-Smtp-Source: AGRyM1sbVMH65MlKLWX8moevG5FiNGhuqXv/bco6wJyHWlDXgOk2JMJOfPVbPSvlWf7mbtVdEVrU2TnZ2sdJ7+xxcdI=
X-Received: by 2002:a81:6587:0:b0:318:38c2:2fb1 with SMTP id
 z129-20020a816587000000b0031838c22fb1mr6772281ywb.118.1656198269830; Sat, 25
 Jun 2022 16:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220614202831.236341-1-stefan.wahren@i2se.com> <20220614202831.236341-2-stefan.wahren@i2se.com>
In-Reply-To: <20220614202831.236341-2-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:04:18 +0200
Message-ID: <CACRpkdY6ykRSmTzavm9F5ZHysPaU5He0GCqqPrhG4zD-e0jorQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] pinctrl: bcm2835: drop irq_enable/disable callbacks
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Marc Zyngier <maz@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 14, 2022 at 10:29 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> The commit b8a19382ac62 ("pinctrl: bcm2835: Fix support for threaded level
> triggered IRQs") assigned the irq_mask/unmask callbacks with the
> already existing functions for irq_enable/disable. The wasn't completely
> the right way (tm) to fix the issue, because these callbacks shouldn't
> be identical. So fix this by rename the functions to represent their
> intension and drop the unnecessary irq_enable/disable assigment.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied.

Yours,
Linus Walleij

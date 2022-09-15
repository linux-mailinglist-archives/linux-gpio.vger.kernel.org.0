Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458DF5B96C5
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 10:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiIOI7G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 04:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiIOI7E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 04:59:04 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEED90828
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:59:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id go34so40572152ejc.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1yevQqreqFif1tWjDWGjJnPqQZbw5Gj8I8oZ/6Fr7mk=;
        b=WCwmrkP+09XaX2sS2DJ9Z6v2ic6IGQx0B7niR11WVSgzQ1MyS8R6QmqnsQo35Hn0fJ
         JJX56OSe09XpAAw4Jj+ahgToitci/rZNgthSG7iECnIHQ0T0WIpXz6mlceXLZk2WtcQj
         KvTwpPgESZXOg2CBIGdiLqHm5A+3ZcnYe1B8S/O0h9zlqFH4ZNr14eNimbalI0UhnoyE
         jXWJV0VN+ptM0XuZxuCEifqgKsC5cnjtZeIB/06hIyR8aduteXjAXzUqoPAtjnLr8YwH
         BVNfHudy4pZinSW63UG6nHKy7Sg0hSlHhU6HVXd/sJbVmg6bdHGNwgyE4uQubBWichjO
         QrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1yevQqreqFif1tWjDWGjJnPqQZbw5Gj8I8oZ/6Fr7mk=;
        b=C/Osdf3LJNNcNaUarvubmVZM5A6BHrQwuFYksOo6gGOC+S/c88xH58Bkkv/AmG6WM1
         nn6c7M+6jzzMZT29rIyGkQA5UIe9Q0n4KC4o74IyZFZEnNKA/ZiQjvLXhA6AHC85suCI
         uz+/KKq6de+SO2ypLVXXTTGpbvhgKttHm6Z/UO5DugeL/3fjiaTxwuEZNb17oGhJAMWX
         G2yrYcVY0ymeMlHQuX3BgO36MGEmHiaFcFr+chMYSUWvXKB06XAsMU11t1LtDeXHtPuj
         f1GrxBCZ7Mfe8ZCGM57E0dmNAGzQRhu9GE1QGG64uNh7IXox6Pl+/wxqCrEmW0P8rIpf
         OWWQ==
X-Gm-Message-State: ACgBeo0SKugippktahEoxEFjbWtQdClaGl8IqNf7VsPCWSk2zvsbvEQX
        OOWUzZtdClQzCDWqHw/2vHUGHpHUTAZNLb49GW65jA==
X-Google-Smtp-Source: AA6agR6FQxW+G+2JxcTI18HbQeQFA4W7utMa4guK35w3CcDNsSaFT+0yiGM/D2WGcfKBtTS/WbU81zjM4+Rau0+S5KY=
X-Received: by 2002:a17:906:8a5c:b0:77c:9d8:6fbc with SMTP id
 gx28-20020a1709068a5c00b0077c09d86fbcmr15461520ejc.500.1663232341934; Thu, 15
 Sep 2022 01:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220914151145.73253-1-brgl@bgdev.pl>
In-Reply-To: <20220914151145.73253-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Sep 2022 10:58:50 +0200
Message-ID: <CACRpkdZaSL_pkmrVGOT-y7+3i4y6f6Cjgehycq2FKLwPxrbFvw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: TODO: add an item about GPIO safe-state
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Drew Fustini <dfustini@baylibre.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 14, 2022 at 5:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> This adds a new TODO item for gpiolib and can also be used to start
> a discussion about the need for it and implementation details.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Several approaches have been tried in the past. Consider adding
these lore links:

"[PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO
subnodes" (2016)
https://lore.kernel.org/linux-devicetree/1456214089-13954-3-git-send-email-mpa@pengutronix.de/
"[PATCH] gpio: 74x164: add lines-initial-states property" (2018)
https://lore.kernel.org/lkml/20180815201855.29738-1-mail@david-bauer.net/"
"[RFC] Initial state for GPIOs" (2019)
https://lore.kernel.org/linux-gpio/bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com/

Just so we don't have to constantly look them up for referral.

Yours,
Linus Walleij

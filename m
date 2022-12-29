Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB37658840
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 02:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiL2BJM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 20:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiL2BJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 20:09:11 -0500
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C1913E01
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:09:10 -0800 (PST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1322d768ba7so20285646fac.5
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CSxGIw+ZRj8V/kCVsC6Js3ZVqSjZmXsDp/GBkaKhYUE=;
        b=oXgTdEjlZoCSNLk0P98/BmkldDqLU6kFo5uqsAiePgjZgvLlSalqrtav3TVPeGqAt0
         Ds1s2VqQYf+ybpBHjoPinfAQm0uXY5rD5VHix0rVwzUsFzITY6/UJSDrRE6eT/6FrRlt
         z8l3rs9U/zs/4YzdmVo3kBCE5iZg8/HK9+waZP4lCZf0zPufspMnu0BW0lf9kTMfv1rg
         I5rzm7DQvW+UkfIXIUEj1b1VQuxnbQeWVadjEu8LOyJ6re/EibXrx2GTk0c5bKSAD/go
         LAduq+7YBc3xS1j7VaNlzYUP8f/OPH2dJQ6A2+9Yw5+MP+GtxDFIp9xupMEO6GpN8k4D
         7yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSxGIw+ZRj8V/kCVsC6Js3ZVqSjZmXsDp/GBkaKhYUE=;
        b=LGSqBr16PyNJEv+NrYDeIMFVqz+g3/LQxMjX+wjStqaa9sFfSTuoM6NSvoDdqwIypU
         Ev/cvbc6eDhHOB68kFskXWx7KmO0MYPPeHJXfB6vJ+pD1Zbhki83SspVJZ+inv9qttjg
         PSGPn3IilCdnYD8MskiIO9lTpz4lLdRV8h0o5m8Mld8xL5q7CP/U+JAsilAzGTdRQFD6
         u/FFuJLOfd1acVTIhw70pgKDkRilSXIECJ3y2vmMuEpTbG7yjNfq7NANVjD3Vh+poI7y
         0BOp1mrkt8Rxdvr7ZUXjejpWxTAkdv5k81xqD1WvKVjsaSu2HV1YKctJtkyemCLUkeHM
         iNJA==
X-Gm-Message-State: AFqh2koqyhwALPkZ8w23tN1yKPxByb3v+pLKGgzXT8YkPiTQsYvlqA3v
        oamlUcLKrvGKEgv9+RfvGAljHAg5NZt0G6b5zVK9bg==
X-Google-Smtp-Source: AMrXdXtDoQrhdeOOoONNNLue4VjIU2gFq400wqiDHHng8CJLddjmM/zWlyuce0ENdXblIvtb4zjitumPbisCQazPnn4=
X-Received: by 2002:a05:6870:6c0b:b0:13b:96fc:18c1 with SMTP id
 na11-20020a0568706c0b00b0013b96fc18c1mr1774410oab.291.1672276150033; Wed, 28
 Dec 2022 17:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20221215164301.934805-1-arnd@kernel.org>
In-Reply-To: <20221215164301.934805-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 02:11:04 +0100
Message-ID: <CACRpkdZuA0Fo9Nh8s0RjMgHs35uwtK8VvhZYrr9nmr_gnku8RQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: convert to NOIRQ_SYSTEM_SLEEP_PM_OPS
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Slark Xiao <slark_xiao@163.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 15, 2022 at 5:43 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> With the old SET_NOIRQ_SYSTEM_SLEEP_PM_OPS, some configs result in a
> build warning:
>
> drivers/pinctrl/pinctrl-at91.c:1668:12: error: 'at91_gpio_resume' defined but not used [-Werror=unused-function]
>  1668 | static int at91_gpio_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~
> drivers/pinctrl/pinctrl-at91.c:1650:12: error: 'at91_gpio_suspend' defined but not used [-Werror=unused-function]
>  1650 | static int at91_gpio_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij

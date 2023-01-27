Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 543DD67E60D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbjA0NFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjA0NFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:05:34 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA85521A2C
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:05:33 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4c131bede4bso66017107b3.5
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YcHgor3j7sfq7dG9lZ+zfqfv+wWvZ14MjhutrsPuTTA=;
        b=O3319HV9toGkg3HbQwjbfh1ww6CsLiLwYEhFhvZoFbvRYOK+jMsmQBQAnaq115PkOw
         7ViauIGtWT0feZpYCv0MzDoaX9zjOx3I18pFLU/5xGWIvqq1Yo19U7wT5CEeuCW2n8hf
         8UblEAJj7VNPXR6ZQe2Ex32cIXj/Dx7FWqEsBJ9QKAkoNI1GHNXW1uol38R0v4wvgdDG
         KVKtCgtl9lk+L3wa4U1Umk673SwGgAm5mmK+sH/t1J77Ah+2PJOUDzY7CIXGR3YaNsWK
         DEKb9/3MtfYmzBjhON48ZLeRz3onlPSuBPDiD5C8nGGm0RW9kjBjPkIRjBbSZnEGH6Ny
         EXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcHgor3j7sfq7dG9lZ+zfqfv+wWvZ14MjhutrsPuTTA=;
        b=mq4d4ZIz+2SofGdp5vygAtinykoyAQtM3YCSQzLzdEAzsoCGt4B2jXR30XRNJ+eXjF
         ujWYAn/5ilW3XikrdczYT3CWoJdI4sO55jX+Um8hZxdhKw7oFOGIy7EKwvWHpgDJBdN7
         OFwPEbM8kqxwVCczDj0b65HPPGHby1QXiAZWqk7LhHL3BLsDvhIM2yaWYFcTpbaCxw3p
         EsPKSHAJ8jj2ycgCdHuJCzLdmRDBm4wEGqH/d96Qz7C0TOu39GGlE6rS4ThUScBaZG+0
         t376zpKM8snZ5fItxZGWqVCs5w18bDITZ6qr6G7d+x/cKfTPCj63EyXI4PjBWacO+Bba
         +uFA==
X-Gm-Message-State: AO0yUKU1GaAJ4k8qlVCely0HolzOjDVU+mo5EvgPykSFL8dIjQxfs4ym
        n77gF4R8Jxk/tzCSbV0xQNQpm1b71lABqYOYGMKnOqAKmzZVTw==
X-Google-Smtp-Source: AK7set8kwuYwONuHAxV11qnYxf7knSTf12gek0e1T4t1E7vn16gXKGCnI0SCcutrPehtW336Qc9npmTwy76/MuE04fQ=
X-Received: by 2002:a81:784f:0:b0:506:651b:cd0 with SMTP id
 t76-20020a81784f000000b00506651b0cd0mr1461691ywc.273.1674824733210; Fri, 27
 Jan 2023 05:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20230126132801.2042371-1-arnd@kernel.org> <20230126132801.2042371-3-arnd@kernel.org>
In-Reply-To: <20230126132801.2042371-3-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:05:22 +0100
Message-ID: <CACRpkdZ1R6hi_RGD7zjkc2iNVL1my=gGDr734ED7S19im9+MBw@mail.gmail.com>
Subject: Re: [PATCH 2/8] gpiolib: coldfire: remove custom asm/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 2:28 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that coldfire is the only user of a custom asm/gpio.h, it seems
> better to remove this as well, and have the same interface everywhere.
>
> For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
> functions, the custom version is only a micro-optimization to inline the
> function for constant GPIO numbers. However, in the coldfire defconfigs,
> I was unable to find a single instance where this micro-optimization
> was even used, and according to Geert the only user appears to be the
> QSPI chip that is disabled everywhere.
>
> The custom gpio_request_one() function is even less useful, as it is
> guarded by an #ifdef that is never true.
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

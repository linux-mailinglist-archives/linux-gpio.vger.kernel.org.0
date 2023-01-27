Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FECE67E084
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 10:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbjA0JmI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 04:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjA0JmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 04:42:06 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C852198
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:42:05 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id a24so2636377vsl.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gULpff1yEFxypcWVbV9eKIs2PQqZVvxyOk55T8kYBMc=;
        b=eD5Q8ujbKCRs5MBullvkPZOykA+Fnm49r6YgBuyuJWkHNwVvdaBLz4FWiLjcrMbLM/
         bcUfiwYwPHiEzH6y8rcCG/yNHUn4QHlRKJZwV5HoNqvL9RA51A2poAxDWDXoTNJDDo9i
         8LLdGnowh1ZBuV6ru3zY/5YYdrDjCn8QPPX68quXBYAyEEXtioT2KsxUiI9Z5kxspbFR
         xNzPHknhmQ2eFhBFS5faulU+kRO6W5534pdHDLt1tEKOjMb02ufvmZrKf4KJrsp34KoW
         BUJa/ayYiMRrdDsUUz0BgnFY8ua5KmPQRajBVz7EPn6TVduV7Ha/WpSSqkm2ujap530a
         g7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gULpff1yEFxypcWVbV9eKIs2PQqZVvxyOk55T8kYBMc=;
        b=JOi9efb35f3v2ts8QPB1JHxE0eROwAnS1ekzNv2gkU9dRxcMlA35D1UOUMqvNhhh08
         A/bUjqwIjUhEQ6zIf32EFlBuJEgiAVLulzXnt82GIMWDRA2lMnPRub4wrFv/rzJfT+Rl
         i4pdMHoHiDnXINZ402ZL0h5OT1J9pi0LZAN3auyrxVjOYWHKVN6ATb8KBGHHxkmcaaZh
         jEI6d7p5N1mMM5AHtdIUuXtFH9AdtdoME7pzRTx/Epcwbm0QO2+Sx7kU7NBrm3fUymvF
         sRbG14Xh9bocRn6TUbn3zrTt5e/uscRWgcaTK+POo1jLWEt81FHgegiPIzCqVkie//jP
         DJfQ==
X-Gm-Message-State: AO0yUKVADfMM0VfRdfSvhNL0NfMXhOiNt3+yuwB8vLEJhbrq0a6AEEr0
        tIL5uNnI/Sx8vwI2tOSl2WGWwSkaHbm5nweBkC4vWg==
X-Google-Smtp-Source: AK7set80EBj1LKnORUBuFFXM6YAgLbkC+2azZ3LmsGPZpBVs+KQBJkc9P63Tvt9BeCwNQspPz0atAaViqlgsjGuAZw8=
X-Received: by 2002:a67:f114:0:b0:3ed:1e92:a8ab with SMTP id
 n20-20020a67f114000000b003ed1e92a8abmr402277vsk.73.1674812524470; Fri, 27 Jan
 2023 01:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20230126132801.2042371-1-arnd@kernel.org> <20230126132801.2042371-3-arnd@kernel.org>
In-Reply-To: <20230126132801.2042371-3-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 27 Jan 2023 10:41:53 +0100
Message-ID: <CAMRc=MdY8Dn3-JrhyJ-z432dCz-adRcyUtLGpQP=2c6BBzSfXA@mail.gmail.com>
Subject: Re: [PATCH 2/8] gpiolib: coldfire: remove custom asm/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 2:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
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
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

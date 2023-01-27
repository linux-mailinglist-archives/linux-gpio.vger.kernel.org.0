Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DCC67E661
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234750AbjA0NQl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234751AbjA0NQR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:16:17 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3060E3A870
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:15:48 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id a9so5927403ybb.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C8yIxiQEtzimAfIwMvWve0BvcXW2WOHyI5uBRhYu328=;
        b=WXnkdGwU1PMU0HEx2sCiQpXobREgZBgcNDYokpmomOAuf7agn5/Mcd6PpfEvJ+VnXe
         c2Y23cZghlCqknYy/E9gSxK3Y21S2zdH0jorpS10nupVpe//ybKdH8xX5VZT21JR5wBA
         lhz7SrMSVkLg1w42+xnN9x7LDH/aZ90eQC9B+IgZd2FKhQnWznMKglgWaXWj/7OmWlpa
         Hg3l+JBS0eiU3WnCae9Q9Hfa8fORJKn6OLeflX+1CxtTRLz3Wu0+NkWL5dHx6j2Mansa
         zzxNpb1BEvi6l77raPIrAEaz3mCytKgucNfnyZh9JGfn+h0i5bg8RHEM647xUsRpWbHn
         aVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8yIxiQEtzimAfIwMvWve0BvcXW2WOHyI5uBRhYu328=;
        b=wInFfEWxCq0tZpxaI9/SqvVqfWaF000DwBsdqxoQdE6lJPxNu/St2kM/LKFAWniz3u
         alE+f+SFD1CHF3lsvCtYk++YK9bUMnkgbG+mBrmF4FhEzMESvOIoDW9/sUL8T1BYmo16
         iKrx/THndbhZJwSeK5QgzQp0BQlf80cTDi6bSG9kHm+TQjzP09Drre6ICk8UD2rkAvRY
         IEb4MVqi6TQHExxxBExnwLQWXrFiUUZGaRoz33YPAyZxrQ+z6hLih19uGd84Nr8JjnFg
         mBNQ8GLy46maz2kmCQgyasHhILOVK7R48XMp70Cqfr4miMtDCzSnXCvNkkB1KuxOqXi9
         jAZw==
X-Gm-Message-State: AO0yUKWdg5fimkPi7JqIqQphNUHAysqLPQ5TknJJYsrG6oUWh6iGx6Cn
        wcqpr87nEZD3hVOqykZX3dvhJkWpiF8eX3O4JO9vHVSEBi+J0kBE
X-Google-Smtp-Source: AK7set++nmuyq5+8BCRRRfRfH7u3J1e3LyLC+Pxyts1y13uqVCpCG5qv8QOxxujlNglJgIO7p8Eo7LmvxPLyieN3g6g=
X-Received: by 2002:a25:d884:0:b0:80b:66c5:9fc5 with SMTP id
 p126-20020a25d884000000b0080b66c59fc5mr1751624ybg.210.1674825346334; Fri, 27
 Jan 2023 05:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20230126132801.2042371-1-arnd@kernel.org> <20230126132801.2042371-7-arnd@kernel.org>
In-Reply-To: <20230126132801.2042371-7-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:15:35 +0100
Message-ID: <CACRpkdbKmnviPb+JKM9CZuGHa1OTWdEeQw3B+qirhMMkhqDOQQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] gpiolib: split linux/gpio/driver.h out of linux/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 2:28 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Almost all gpio drivers include linux/gpio/driver.h, and other
> files should not rely on includes from this header.
>
> Remove the indirect include from here and include the correct
> headers directly from where they are used.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Makes the kernel look better after than before so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I was going to send this to Bartosz but don't want us falling over
each other, however consider the approach I use to get rid of
<linux/gpio/driver.h> here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=gpiochip-no-driver-h
(My patch set was at least approved by the build bots.)

Comparing the approaches it seems you need these two, feel free to
cherry-pick to avoid build errors from the bots:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=gpiochip-no-driver-h&id=89f4f9cc70c686303679e57bdc3ac86507979fe3
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=gpiochip-no-driver-h&id=73ca8058a7b2075c993040bdc92b6a82f57d4316

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A82579782F
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241212AbjIGQmk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241706AbjIGQmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:42:22 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58F42137
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:40:59 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68a41035828so1010422b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104801; x=1694709601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=oqyiKwvyQo+kXKRDdQEwO0lO/FKlkWF3Yf3H6RI6ucvO3o9uHzX+tK4LQfqpC4MB7B
         97OFUnH7gnTZBcT0Jn2uj4djuvUf8BRda61MJ+sgdfb2GYzh5tCDt0p1OZn+oagxUF9a
         m5oenD1PYcfJKwtij4JtlfIKh9tLCKnONbnBS2FiLJo6nKf8Q2M71T2EyowVuetQZc1p
         nBn/p59I+7n4umpH6bBshO2GyfF6tAKfvwg9hkdvz/BcB3Jvq76E/zvMiVad82SOTK+h
         WKP0cXW+G5iuFjDgle+3z/dp2ASqApebBrdYwK7sO+q5U8BYkUE4V0jta3WuYAnRG2k1
         t4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104801; x=1694709601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=B9ird3i7WwGDv8JTnhQX97ZiwZNCKgTSgHrk9wVC1wJ7g0xN2QETsWvHqc4sSbI9R0
         kfv01Vn5ZJwC7xepgjudq5hO5nwq5yqbCQyKmlapdii1htiEyyYdDgeOo2j8Zt3XgHlF
         uFBc1ULijlKTI/wAC7p/P/pQA1bA03dl/4HNLabiZcX8ivaoSGYq0afESc4Wi/L7oL7h
         JP+g+//yk25wDIboHxl6wPld+A0B9TwIrZpvx1ybxXywYzh2ffnhn4j4qDFj1vvsVgJ3
         DnsQi8oLM8t27OKd/jjHi9njIAZQF1EM1JZyFl8QA3veXnUdvYYguEQkRpVWBwMuBg9p
         R+iQ==
X-Gm-Message-State: AOJu0Yx9uSf4R0YK1dEOOORXTVArs9GYVoMzZghqHjP4rwfZ/gqOeZiI
        Djt6Y+fsmwlsjshui9bpjaO44WHDAV+t92VZwZQw3CdYzySHszO5w24=
X-Google-Smtp-Source: AGHT+IEos+IWcRlRURBpWq2f/yqX4JwD1uUNGc4FMcBDjtB4EYVZgMX+6wsZb6/oamwVKLnZoLMvxAzj5BAJ8/qIfJs=
X-Received: by 2002:a25:aad4:0:b0:d7b:9ac8:f439 with SMTP id
 t78-20020a25aad4000000b00d7b9ac8f439mr18109140ybi.40.1694071872125; Thu, 07
 Sep 2023 00:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:31:01 +0200
Message-ID: <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I was cleaning this one just some merge cycle ago, now it
looks even better!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

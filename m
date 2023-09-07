Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDA4797A18
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 19:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjIGRa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 13:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239233AbjIGRaZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 13:30:25 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470381FE6
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 10:30:01 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf55a81eeaso9272415ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107736; x=1694712536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=nzN9TGbIYIXkdJ2jlFVmhyfxUqmU7xURhQIs6YN0f6BC4jMdYTVKy3vxbZbaIyysMy
         u7bO/55/j4XtWb9fGjH7pjC3TJmtRccpejNQABYk0ambqsY282j1rw7zHHDlag0Mcwpq
         K4RhjUXCM0nMz3JqxT7qpWdc39M6s/+B/IW+QsXLpnijfXG22bsZ8WPUghOmgIQIRVCO
         B2DMecuz88zfKUBrzruWuCN8ZVzbrq0UkVsqLg75NUt7scGwPRgwWrdeQHGIONCb891F
         TIWK2DBjLo605MJfaqVQZJUB7H/N+qAxQLJ9WJopXs0ZhB8hF2VDNquhWdJgts6yNNXB
         6f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107736; x=1694712536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=HUPwbRcauCAogzbd7VrwYnSXlLZ1Mx7MIEkfkqIanqdS/2KqsOlkq1liuOf+edlhE4
         W/zaLIlXZq9e+JJ/w5OzIfz97tJMlk5qwyg0ivnowXB1dBvczEiSTe7G31JA/3N77fXo
         laluc9FzrDqiFcOLyiFcwpHjkksgLqrwqV3LYrqxB7XDWisCMC7TWNXCnzJV4rxGo1hb
         ULQ83FlnDh3nWIAqLjxjFYjeWKtZIMTx0JUzNi6NkFDw4EtLYjsmnwwCWDo8Uo9m99oc
         jTupgdkKKuZVjDOynuQ6QlCl6v6UFuk/fFa8ako0Q5CUGSBQep5vTHAFPoxh3ztGHqgW
         1W8g==
X-Gm-Message-State: AOJu0YwvQ53NMFiJWJCHhwZzufYEByccsBkPctylglgJe1lY+Jk1CenU
        /A6wH4oc3tHEhj4LIHPZ+L1eNzENKL1P43E60WO0y5x47DREGz5M4Z4=
X-Google-Smtp-Source: AGHT+IFxuGmnz6UhP+iDHBaAUw7EFN+gVZSw6nwdZwmmFMJ3XnkMU5k7fxCuPngY53Trr0s6Te5MkJ1CXk5K8y+Rwo4=
X-Received: by 2002:a25:ce47:0:b0:d1d:514e:27c6 with SMTP id
 x68-20020a25ce47000000b00d1d514e27c6mr18577035ybe.6.1694070485563; Thu, 07
 Sep 2023 00:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-5-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-5-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:07:53 +0200
Message-ID: <CACRpkdYCOVJZ6TUMQQHSaKZHMCx8tE8=3z=1BogYTkr52mFr8Q@mail.gmail.com>
Subject: Re: [PATCH 04/21] gpiolib: provide gpio_device_get_desc()
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
> Getting the GPIO descriptor directly from the gpio_chip struct is
> dangerous as we don't take the reference to the underlying GPIO device.
> In order to start working towards removing gpiochip_get_desc(), let's
> provide a safer variant that works with an existing reference to struct
> gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Andy had some good doc comments, with these addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

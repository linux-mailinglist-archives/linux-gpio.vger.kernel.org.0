Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C6C797810
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjIGQlU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242037AbjIGQlA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:41:00 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B0A1BFF
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:40:21 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6491907dbc3so7225686d6.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104752; x=1694709552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=skVYqQgOZV6AkOClCjme3UdcTWx/DZzrFSb1rW07vTReuURTLIgtvcIMVnaDSRiB9/
         059wJlKS226exHwjtp4W6144+h5ROy3lW0c5qs9sKX4GPUl124FvSXHt5cMYidBtee2B
         yzI0DbnCz7Lgx2wEp5V1N9JgdOmX/Cai/f4/Xfnom9Xf+F6UyIHqFzKq8jr1GOPpzY+3
         1HMOsrxz1DyuMksCw+c32VhSOYK+Dnk5b0+XIMXL7LzZko8CM0w22XzYpCh1//Yz/kwo
         Aw8gnPiM3yz5/c6zDuS0CA1OFRPeHfsDgLl9+syHCMsJ7e3hx0rFzqly94UIWngobdMK
         0WNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104752; x=1694709552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=i9rzZSfsXXep8O1IsEWA2SeReI9OUbf7NjJ+HiN/SZbOuvDknKnqrevuIK+Xp7yxrX
         PRxYAthqPOn0JomlvqKaEJCWgyeobgHcj4Y8ahGpCcL/BChFrKRDBn+PPwevLU+T7zlh
         luTYCeNczyw6yck4K6Z0SFca8EfgvVhR+xXlgtrFMzYIm+RW01sVGGg3BE0IHcfDz+d1
         O43fIo83lGJ1FlScHC9tBqGgssHvNfHeSM0jlsMGRSBFBnZFzRIHvKiRp8fGkKdhhG+e
         XU6sfWFRweLEKzWqp/qc+4YiY6QziwcuXoJTC3px/A/i+Fh5HhZ9VPNWhryBTQLzdNay
         at3A==
X-Gm-Message-State: AOJu0Yx2iX1Ixrlab04uVC1r/BzC/ME6PEa6tMQB6DSofXrMyo4Dvhn3
        eOu6JohRc2LfKWVaFUHVd6EXjXxG5/bdbzPXJAv7z0tbJCdXPxttJto=
X-Google-Smtp-Source: AGHT+IHaxiCnBZm00LuWWUA+a8rnudg+hvum/6YQLw0kwU5o8WTcy0PQZuAfaxNBOQSTfwUYu0m1J/nwQGnmFDsy/5I=
X-Received: by 2002:a25:e6c9:0:b0:d05:fa02:5bf5 with SMTP id
 d192-20020a25e6c9000000b00d05fa025bf5mr19872193ybh.48.1694072468477; Thu, 07
 Sep 2023 00:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-21-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-21-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:40:57 +0200
Message-ID: <CACRpkdY-DMJAzkjVFx2Jyw6yG76u8cZ61YPUbcCsosN5kZ02Ww@mail.gmail.com>
Subject: Re: [PATCH 20/21] gpio: sysfs: drop the mention of gpiochip_find()
 from sysfs code
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have removed all callers of gpiochip_find() so don't mention it in
> gpiolib-sysfs.c.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

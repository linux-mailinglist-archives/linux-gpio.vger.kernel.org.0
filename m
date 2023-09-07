Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBCDA7977A1
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbjIGQaO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240201AbjIGQ3w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:29:52 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9B726B5
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:27:32 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5925e580f12so11715497b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103920; x=1694708720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwy6uKOVyjPH/vJMAsaPCoM0fNwaGdU7NPhSy+lwVBs=;
        b=xdsqmRACSdY+KS1OPPBTQcWgXgUZT/FuT25HCqJ5sulRzIgb+bPMV4b2O6VV6DGEC7
         NUkogJm5EF0KeJexq1mvTtmSEqhW8Oypu7vPvl9lT0rlq2zEEeakwuiCHKlFE2XUNbBn
         bSCRGqrdGF73d98QEqltgDY31onOF+RqvZvaHH1Bw8ScMyGjzANnyCTg+SuYnzO96Tmv
         ZTCKEkIrOTr1w6GtE6bFsScmCvvQwIRDO7U9VIphJV3DYOIQvppvtHapYh+IBOQqESy9
         uw97WSQ4xIIT7mW5m9XaX45yC77v4RVyq44aK4CuXxTwl6UQ3KI+76kQquYFIdAJvXLY
         GdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103920; x=1694708720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwy6uKOVyjPH/vJMAsaPCoM0fNwaGdU7NPhSy+lwVBs=;
        b=I31GRK3v1BNQPuucde7Xrby+ZVNX+fRVGxnFmi90tSTsxjnKJUdHDcUdExJI3WlLjo
         Ir5EKn0KXUJEM7koRca0Rtpp0XpEFiLwWaK+se/a9JVfC62QMwqbsxeMsREuSLR8ANDq
         DB2PCF+Grdr9hIH+TDiPS6778Q6OgYyqjfVWiY4OSatYDcMVdp5nOLfi7tosb/9bI6iB
         ljPNXf1+RUZMBIUwiSctTMRthI3EQPXoR6IAEU9b6MHU3MhPGJslHuDPHII/Rk+N/f1R
         AzQ7LVAzxmMIw01yT4xsjewEB8U31qEqOQ5Kb0lfQa8cgVzZ4txeAhFK62cz6j44O0DA
         8byA==
X-Gm-Message-State: AOJu0Yx2CXzNVV31ANmGiyODHPWU2QfJGYJq8T11whIBmHtiGHKXGoAI
        GjnfcxOoePRAxsdUy8x7mIPL3G7IWWZ4LCz0gfrTlW4qPHP8Kt9JZTQ=
X-Google-Smtp-Source: AGHT+IFDrgWVURx3JNju7kZZF1wu9Y/TadMJ5yuRpzoXN8X2bh2xdWz8hzInBvmi+tzixNC0aGXs9GN4uotRGCxcdwY=
X-Received: by 2002:a25:dc54:0:b0:d44:a90b:ba50 with SMTP id
 y81-20020a25dc54000000b00d44a90bba50mr19457872ybe.5.1694071251891; Thu, 07
 Sep 2023 00:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-11-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-11-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:20:40 +0200
Message-ID: <CACRpkdZdaBELiyR8da2GHxj+=FFzsvL+5POX5139+OTA8rKUeg@mail.gmail.com>
Subject: Re: [PATCH 10/21] gpiolib: replace find_chip_by_name() with gpio_device_find_by_label()
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Remove all remaining uses of find_chip_by_name() (and subsequently:
> gpiochip_find()) from gpiolib.c and use the new
> gpio_device_find_by_label() instead.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

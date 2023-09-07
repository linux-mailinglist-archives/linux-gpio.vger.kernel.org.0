Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6C679762D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjIGQEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234669AbjIGQCH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:02:07 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAE559F4
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 08:52:08 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-573f87480aeso754827a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101852; x=1694706652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=rM59P3lHLfhBQ9Haf4gBPF00zoXWz8fyuskpNIdaceLNJi1wDTnCy0XIjqU3FCo+aH
         /dALmxZN+8DXpDuN3du/zbA1fsMvGedNpxlJ8cnZnSUmITpj2faBpMAyqLQ6tsMnU/Lm
         RAVwT49xjGAJNodfqupC+S86ouAJ2HGRTVV5RX3MwBLybIBkwsfbD8L0HTWdTp67rg7k
         sYBwT3VetUR8ZpwG+miiFPOrk12lUqtCwLf8SI7G6HwMvXMgNAT/6NA0wmt7J6cI1dx2
         1DKGO38AKepkc24KtWSvDQONGz+qg0em1cK6QvSDzYjIHje07NmHLmIgSRL2khe9UaZy
         lB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101852; x=1694706652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=geiAKvdEB2CbJImhnZiR/yto988Ud/0C0IPyA9bh2RiO28OSjZLsqAb/MNLauindPj
         amKzbZySuYfZblS59yfLwq75P9LPF3UcFePUVpVldNe61rc2oX0AOPe4q+e3oQ/uEoHg
         e78TShICLKBZdzpgI+mf5geUFw24iIy3sVMzBxMlXfTZz4w88M3ySrdUeLRgH5y7r8UZ
         N/Cktj98sp+3aKRSyFBamzkA37vOLDskCJkGw2fvGuhVsO5y6slfw6Uhbgkze2fzmxDE
         AqL9QwQOfWnp+6Z6Si47p01vWhoJ5jZ6cXuFnC17cpLOnq4YvRh0bWbgc2AijxmVjomi
         x2UQ==
X-Gm-Message-State: AOJu0YwR90YckoCCo+mUhat4yd52rwZ43M4s5DpKir8bc62Pz1y1Rdpu
        kidg28gPTzeoIxEcb2fiuXc0qwDg6N7PhCTC8EDvib8O2GwJMVXr
X-Google-Smtp-Source: AGHT+IHhmgzWKTsylHHZ2qSwdCSe8fG9sB+HCDYVng7dujabCyOchOSgbCuVeCZbRiidwPEiAF4MbYeMV3WMB/wKWxY=
X-Received: by 2002:a25:40ce:0:b0:d7a:d628:f69d with SMTP id
 n197-20020a2540ce000000b00d7ad628f69dmr19332220yba.32.1694070175534; Thu, 07
 Sep 2023 00:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-2-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:02:44 +0200
Message-ID: <CACRpkdbT25G+KSUOPjgo9BQmPy2_rgXULVM1fpZQDqE+Xcj80g@mail.gmail.com>
Subject: Re: [PATCH 01/21] gpiolib: make gpio_device_get() and
 gpio_device_put() public
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
> In order to start migrating away from accessing struct gpio_chip by
> users other than their owners, let's first make the reference management
> functions for the opaque struct gpio_device public in the driver.h
> header.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

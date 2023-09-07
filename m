Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCA97977EB
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbjIGQg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238455AbjIGQgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:36:44 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE799ED7
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:24:19 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6493389c56fso6431766d6.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103804; x=1694708604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=FOwhOJozd8M40/YWup+plr6VgqYXcfICt7UAxbOylybVUdtc+reXJs2IFzhXVp3wU4
         WVuZBoziwWW2WIBnzwNomUo/kkMq1faL7/X8n6twZUcJqiWg5mBEHIuenngN4mpLozqS
         ByDI+bxdb/zvqBJpsfnxyOWaONm9RrdGF31l/Y6k9yGd3EjIheoZ/sO44wYbT98rfoil
         eHcfcV06FeUZSg34vyAvmVimFOH+tD34HNlLzbXz0gPWzuMl9ii3VzQeqnmBM0OluvI+
         zK5n7e9tU5Yc9Eky82UL9arEKSVV82JWOsquBxjCgq7KXrGBjG61tmlhszlGBcIj7sHb
         eXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103804; x=1694708604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=kvfEcKuxthAKLTpJqW9zEgUqMKkZ5j40QEorgMqde5nRF/1cT2QSX4+h/rnuMQRd0y
         uIbpU9lSbaQrv3vdNc3B+0c5p+/6XPqLcmiuR1XFV4Tudtcwpumo94LHUtrr968fOGb2
         rmyRy/4XmALwLFD+5vnTp3VLIYVbLjS/hlo0P0p7qAW3N3Uh0/U/Q357J2aRnocUDuvQ
         yOtYxKE64YCfUrQes/wvCsZOBcrGuGl0ChHW9JEj1cxnI5nK7SSePa9nG6Vp5el63IZS
         5b718AM6yPcMKf60gEMsT5/QjsSfQ2LLTYjJPQB27B+8gcFiOYwPi7M9lIYYpImBejkJ
         a6pw==
X-Gm-Message-State: AOJu0YyL7Uwxt1rKiHsUGw0fwP9+9oLVcneAjHe+dX6P05UahlkSlsAq
        9HEKhtiQPFHZfTR+iIoqUMTMgvx9K8kDNw98OVdH9xElEmINz5+Wzcg=
X-Google-Smtp-Source: AGHT+IFBssMxe62b6gjC3N4aS6mxtu2dG9GSPKFawDHtfKqDxWyo3xiYEaVk7D6s0DhtiZ21qOVsU28YZ+Ws9GvtAJ0=
X-Received: by 2002:a5b:791:0:b0:d1f:6886:854a with SMTP id
 b17-20020a5b0791000000b00d1f6886854amr17648637ybq.9.1694071162023; Thu, 07
 Sep 2023 00:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-10-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-10-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:19:09 +0200
Message-ID: <CACRpkdazRyhqHhH+Ock3U0wFRkd_U5QUTZmOeTFoXx-Pe_jCRw@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpiolib: reluctantly provide gpio_device_get_chip()
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
> The process of converting all unauthorized users of struct gpio_chip to
> using dedicated struct gpio_device function will be long so in the
> meantime we must provide a way of retrieving the pointer to struct
> gpio_chip from a GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah, sigh. Maybe add a notice to drivers/gpio/TODO that this needs
to happen long time.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

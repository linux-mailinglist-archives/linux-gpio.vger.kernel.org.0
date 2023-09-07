Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEAD797C69
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 20:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235410AbjIGSzD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 14:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjIGSzC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 14:55:02 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A006170C
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 11:54:37 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-412989e3b7bso9273081cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 11:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694112876; x=1694717676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=ItMTSovLtNnHC5JQaDNvP1hE1opDF7GiZhCLBmb0uNC/8oeTdnjOh18RSTQyjT7LEd
         FzKlEKZjWB/wITbbXAyURB7G/vCfjArfcvcCF7Vs9ldop9LD28uXSZfz4F+QFPLn0hE4
         5dSpgwxoZKLSCJ7/5iW2qtN16n9TFtveG/C5/g+sT9O2JZFbP7kVRZitQbOvatpHSEH1
         EUdWnOOrEa8qhHmEZfkmnVK+lHuH9hjUnL7LHy0JPJuIEvkwX9UPYlICrZg3YSTEQdot
         GidegvlQmgt0RGWJvPbVsw/h0FwRfpOUyrNXKu8H/ZLvVZZwa0EDGXV8pXzQqxUFRTTI
         eRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694112876; x=1694717676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=fVkn6ZwfjIfODhr9EUeaA9aThawuRNO/uCMBrR/frc9r8jG8+2uhxIVKJ4GS/Hs/H3
         aST8uyY0KbLoo1w4LqxWEOSsBOHuZnoFssEHj9cdR7iaQFqSMuqr1xbOkdOosVWKvkth
         YoelSWsIWpmFDYIZf4kNVOmWJ4uEvOHRI3d+BsaBnClthxjeV0jxeuO0e289l3mIgAK9
         JZZKXkLhQntFYoNHv3Ble096PyDfbm283oyBosVXo6kfFKTmV/+S6uVOoXWE5osqUbQh
         QRCW73QoLeN91DjWgoBWAyEoJzSfC+6pVMirEZ3D2Stjjo3mBEg7x33GsasNp/04jOPf
         Gl9w==
X-Gm-Message-State: AOJu0Yy/iFy4xxWJs4zO0OoNZR+asObUlVUDwEeEoHJu6Io30lS4vnAn
        2ywFOb5eCU3VYJAWjm40w0z8YIJmHAsP/AkO+FTeJjEWcQaJjRKh
X-Google-Smtp-Source: AGHT+IFX/4eyumxiC7nEFR+XPxzCJ5uyMTs6iy7ZgZ+cx415alKaYaIdPMXy/YLPsS1BT9j2oJ541saIGrDoN3xslRU=
X-Received: by 2002:a25:838b:0:b0:d35:f59a:6e46 with SMTP id
 t11-20020a25838b000000b00d35f59a6e46mr18424020ybk.49.1694072273274; Thu, 07
 Sep 2023 00:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:37:42 +0200
Message-ID: <CACRpkdaq8jwYLWfqvmjJFyxRPktTSTt-FY_OoPQ-ymU3fFk41w@mail.gmail.com>
Subject: Re: [PATCH 17/21] gpio: of: replace gpiochip_find_* with gpio_device_find_*
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

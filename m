Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D0A7976F1
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238843AbjIGQSx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242772AbjIGQSL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:18:11 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50E3A256
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 08:57:40 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5924093a9b2so11460537b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694102192; x=1694706992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=KIspldjjOyJZT9fLTXXGGJqN2Dt8j8PS1GEinwjbnJNU2pGYHKUOiicYM0nDVeEs+Z
         VGik7uyVz6vyBNAnoYGS8TosiakCaxDgn3QRmmsNnTHFJ0X2HKrf+n67gjj3f9W+od3d
         stLf9GoeY1Jw6JdiXeevL/C9rGOFusSoFt6bQZNqhaMDT/VBurkse7Orz14aFNtWHwB/
         EWS3cUiZPHC4eGpq2aZinbFcjz58nYOx+yc1ylquhugSMUZOSVddXdmxUIJrPPQE00s9
         H3Dzb06KEoM81/d78tNQXSy/jCnkQweegnpk9yn5Mha8CJrLXbQZUoee35a77e+9hSdc
         NvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102192; x=1694706992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=XH5565+D/FfRo354kcaj6J51qaV52RkvLGVu/eGIZ2uj1YLC40djiiEHSVBNYPIgAb
         3MixzZTlYcieUuOJQ3ynap+LF6HjClDIsP+k93nMB9u4TLQDjWrNj51+JDjsN81pcIDm
         ST/Ji8wKjK2OfHVPLJTO3XGk3y9K0x5iTTSDEWQApm6u+8kB7e7yQ0WK2f0ZaQGmx5yK
         WooYm8Wj5NWqeufXISFA2gLWa8kvYn1edSodVhT7e86iC5KxrSWkoO4JhHrBljH6iz0u
         vKoqYWwvIyZMXEEIBk+HKmtAeRYtqo32mHaRosRxS+zNadL2jXsXePPB28h60FyVeWHd
         5PWA==
X-Gm-Message-State: AOJu0YyOz0r8y+/hmbvkz6tAaJuyNCm9vTv2bodHFhy9ES9NhkEk5JSS
        /xSnszC++7ac/z+60h7Gdw9lwDKeCRHpFCRnfZR/mfXIYoc3GbHlHsg=
X-Google-Smtp-Source: AGHT+IH52ZmMDQle74d5+xBv94alRH/CYtL/TIhLKM9b7HFrce/j3cJJJRCz5BcoTZ3hxH+Wxp8LvqydUyq2rr0UgjU=
X-Received: by 2002:a25:5f0d:0:b0:d7b:90c6:683c with SMTP id
 t13-20020a255f0d000000b00d7b90c6683cmr17866183ybb.26.1694070426178; Thu, 07
 Sep 2023 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-4-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-4-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:06:55 +0200
Message-ID: <CACRpkdbE5AJHiGan_oj4_kBSOh7okfwM0u9qDcEyTBr+NCO=wA@mail.gmail.com>
Subject: Re: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
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
> By far the most common way of looking up GPIO devices is using their
> label. Provide a helpers for that to avoid every user implementing their
> own matching function.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah this is what everyone and their dog reimplements.
Good to centralize this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4AB1797784
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbjIGQ1A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237585AbjIGQ0I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:26:08 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24CD6A53
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:22:17 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d80089712e5so576231276.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103656; x=1694708456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY2mdAZRDyp8VLACjM3IsJrv/DB/YaVz8BTWDKGc7zo=;
        b=vEXfZRNV4z+S+QdiOeua1GH1WBudEIKwatZLiCXGnTyukPj6+sYms2MZ6O19fGovES
         +NVYI6MHhf7WTZJrZWEKNjYmKbb5/Arkygnyr53r9IV28LIgx7+Jlwl3M5KWV68vfIxe
         3RADh1m4NvsFTmIgclGx/rq+rSGT7E+rDHOrYj4YEkN1VphwkgQslJyp/nf2rGngDhx+
         G7LpKZoEoejFwjgADZBbJRn7RUrkki6PJ34XPsSQcRCXMGFWiOqBWnZxKkzcNTCJudwE
         J8lJMTzVvlupe8oMXYeeuYC1UvvrsO29MJfx78sMaT6VUBK/iVQwPasm+9nTr0pHkVfv
         OTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103656; x=1694708456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY2mdAZRDyp8VLACjM3IsJrv/DB/YaVz8BTWDKGc7zo=;
        b=kOIU+SBDY9n/j3k77NewZqVMl2DtKtFmekpdPn1sdXoLwbhBrjTG0NSpm4MZ6YP+i2
         P412fU1dP7g7rnq5kwq5G6RDAKm8yfJ2maVaNv+9ksIpC/MBPmbnAqwtfL5Tphc//940
         vQf6dtU73ODK2TW9ys6kwKPtF2E2ZCeKWdSgawvzYh/jx00ClxO/gA4Mpgtv8Ir5kHpW
         yTaCgKRaBCAZuu7ptfr/wIL1TmFOFm4A9Edvq/U2FstjqW1XF7qFjLJkWNKzHX9v42/1
         LbPjkY96KG2TDxctFyMq25WXed3p1Ilb4z8CzqLD5LMZt9aWn7kurO06Ckc2PyYTqWyU
         BuXA==
X-Gm-Message-State: AOJu0YyIKP5IPf6BOaslM548YrJBLXL+wOZnvxNtcScn1oG5ADjcg9eW
        A35ljrGxRtK41A/+7+7O7DAUOrUDCgWeEviBDecxuVAFOB0ieYfr/28=
X-Google-Smtp-Source: AGHT+IG0DLNKfUPhB/XHRakKjzQvJdJ2oAW9KHDtArjRFCSpF0Q5z+EJuu/6b8snoqW3fkVGsSaqNy6kxIliPZAjMsU=
X-Received: by 2002:a25:dc04:0:b0:d4a:499d:a881 with SMTP id
 y4-20020a25dc04000000b00d4a499da881mr2163263ybe.9.1694072375343; Thu, 07 Sep
 2023 00:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-19-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-19-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:39:24 +0200
Message-ID: <CACRpkdYOp5162vhQXBp9FwLZzXnjByYHt8OurK4aUyQmJzgfoA@mail.gmail.com>
Subject: Re: [PATCH 18/21] gpio: acpi: replace gpiochip_find() with gpio_device_find()
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
> Update the ACPI GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

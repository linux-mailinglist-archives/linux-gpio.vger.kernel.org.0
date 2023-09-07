Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23AC87977FF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241719AbjIGQiy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244297AbjIGQiW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:38:22 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C693C0C
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:25:59 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-56c2e840e70so858415a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103882; x=1694708682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=BlTxtdrXl7oL8bqKSF5cYR+jZar6ay6+bYxPV8xbmdvRtK6vxV6w8poOyY4zjHBvXJ
         mDWBnqXUaR+Bz+/7ol0Pl5UmjJ5ABp7+dHtoJQSfhvOq7yUAC+7+DR4pTIxhBcO7EZoP
         hZz8F8yP3gl4nOpGVU6flg1Vh3aS+MffmdopW/WIJnfv7oB3hhccSUEkmNv5Yri0avim
         JvamzcbdYrWlbTrvD/vJE2bI36VDHTf/tK8cfMgHf/Pd+KKSY5M+omQ8J0cuC0OHklN/
         GTn1ClzVN5w5afo+ITuX9P1dZXsihRkLuqKm2RMsKvvx2n2HSzc7FyVNxFq4krWKF8vG
         58Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103882; x=1694708682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=et4B7/LDRPHCIO7n+/izwejd7o5WEW3Esn6KZ60xjHQia67ubfmR4DISaTizKB4kDW
         NsmzUG5zkANhddX1n7SJzL6Sa7UdnDBkoe2yPxFnTSZv7lsgktcAZMfWbCFo8P/lwOqX
         QtlsRbvh2gcgxLB+Y765XGOIqi8KDiUKq4YypVsNRjElwIWSmYq+810jwQyT0AQker43
         fCfyuKniOm613NHkXNdCXFOOYCWvR1x+2lMHG6cdDCXCw6VLfvddzYi0saweHRgRS2jo
         YxUUmPZ0qLDT5JdI3nx8/PESHliZemIXaaQwStv9CN0zpVLeBIklyEcc746ekUwhLIDl
         CcjQ==
X-Gm-Message-State: AOJu0YyAEkE/s9r90SLDYeWExqrSsrO/nn8A2QVPCTwfjBzV/2DHz/Fn
        9uZolpYvP28Hw/JJfpWBc/bsLY/+VUZrZZJgcSHmOiBAugxwSnlcgSo=
X-Google-Smtp-Source: AGHT+IG2TLQ2WqAfuGI+vTl02pQSFPJWDZVOY1MfvYV7hKobdzNo0vRGz8kywS9VyDIIMdmuzYR3qPmWC3h4lMZlj/s=
X-Received: by 2002:a25:dc81:0:b0:d7b:9a5d:37c with SMTP id
 y123-20020a25dc81000000b00d7b9a5d037cmr18599620ybe.49.1694071708542; Thu, 07
 Sep 2023 00:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-15-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-15-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:28:17 +0200
Message-ID: <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
Subject: Re: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
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
> Using struct gpio_chip is not safe as it will disappear if the
> underlying driver is unbound for any reason. Switch to using reference
> counted struct gpio_device and its dedicated accessors.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As Andy points out add <linux/cleanup.h>, with that fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think this can be merged into the gpio tree after leaving some
slack for the HTE maintainer to look at it, things look so much
better after this.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994435F3D2A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 09:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiJDHWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 03:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiJDHWC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:22:02 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E7048E98
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:22:00 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id e18so17611177edj.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YnbrbPRNheE9mWTJE4BedbmANy/DirNPf0JAWTobUag=;
        b=Ybdv/qRicXmIOsMNjXI17pstXqXaR+Dw56FsqSyGghn3qdM10JCt/1kETQokGMA5s9
         RuSF1rWx0+G20ZnGzdTu/J+Hbs0U0u3xsP4kLTP1IfUZfSbM0fgcwMuybGdF0mkpx9YR
         JpUFm2O6GQNeTi/T0sKDRarIsPnZ9tfr/mwKd6gVJke7pjvOBy0lbeEMZ+Z1vdEbnOgk
         RDrcBeoQdkjc1tl4EgBeKQc7v0lvundIsRthU/ecEkVuVnYE98YPSJgd44H/5Q2JVn0a
         CFR4oO4srums5XeARgyr/Iqi5b3Ex5etZbDOKXN+Z4IJX+/qpD41+QE6g+lL+3392VvN
         kTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YnbrbPRNheE9mWTJE4BedbmANy/DirNPf0JAWTobUag=;
        b=SqnUh5rQCt4OOd9IjlKKCYDeK/vN77OK2P5P5JvJqZ9PHwUjwd9IIYoDdegwltnd/h
         QR8w4/sX69MQ6/FuvglLvDR0eeMv/f1IuNAfpeqdCAfh7zJyrUYK8nLm6oPlxqw3km/e
         RENV6rOS6s0WEb7dwFa1VgT1PJTBanvWeA7P9fidccu6inzisQghd69ZT0DnAVuWrlhc
         UaqJW079DJPC1JWkHuh+2zihYCR7RAKb5eOEq+6JcCZaFGXTTCopBYzN119fzlcqI6mG
         rElNmxEWchjiqoeNHz/ilwxxfQVbpxB+WXx14DMR8yaylkdD+3nmhieoDEv2/6uwtSas
         ZecA==
X-Gm-Message-State: ACrzQf1oNV0EKEy2Io+OupRb5tOSNkMNpxIWUcljWTWgYkLl0fLiKVLM
        VG1iAzK98HH+x3ya87t4lN2bP/jqA19t1TtyjO7Ibg==
X-Google-Smtp-Source: AMsMyM5XQ5P+rNaBfvVVp11VNsr3Q3EQBWaj/a2JoRWmaNBmuDp6q5wWXSBdDuB7cAmux3QQv6S7B2+2BvxOZ2odGys=
X-Received: by 2002:a05:6402:190f:b0:452:d6ba:a150 with SMTP id
 e15-20020a056402190f00b00452d6baa150mr22017066edz.126.1664868119506; Tue, 04
 Oct 2022 00:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220930132033.4003377-1-foss+kernel@0leil.net>
In-Reply-To: <20220930132033.4003377-1-foss+kernel@0leil.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:21:48 +0200
Message-ID: <CACRpkdYOB4uy4wc+kchHioaQ+JSkoi3m6fimiLvLESRjwhaC1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] fix gpio-sysfs/libgpiod for rockchip
To:     Quentin Schulz <foss+kernel@0leil.net>
Cc:     brgl@bgdev.pl, heiko@sntech.de, jay.xu@rock-chips.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 30, 2022 at 3:20 PM Quentin Schulz <foss+kernel@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Since the split of gpio and pinctrl in their own driver, gpio-sysfs and
> libgpiod userspace GPIO handling has been broken because the pins aren't
> put into their GPIO function anymore since pinctrl subsystem is
> "bypassed" when requesting GPIOs from userspace.
>
> This fixes it by making the gpio driver actually request from the
> pinctrl subsystem to put the pin in its GPIO function when the GPIO
> direction is set in userspace.
>
> I discovered the issue because we have a GPIO the user needs to control
> from userspace to flash FW on an on-board STM32 that is actually on the
> same pin as one used by the flash controller. Considering the storage
> medium tried by the BOOTROM is emmc->nor->nand->sdmmc, booting from emmc
> didn't show the issue because the default function for pins is GPIO and
> the flash controller pins didn't need to be muxed by the BOOTROM.
> However, if there's nothing on emmc, the BOOTROM does the pinmux for SPI
> controller and puts the pins in their flash mode and therefore the
> handling of that pin as a GPIO from userspace was not possible, but only
> when booting on something else than eMMC.
>
> This restores the behavior as seen in v5.14 and earlier.
>
> v2:
>  - fix missing header; reported by kernel test robot <lkp@intel.com>

Patches applied to the pinctrl tree (also the GPIO patch) as that is the
dependence point. Will go into v6.1 merge window.

Yours,
Linus Walleij

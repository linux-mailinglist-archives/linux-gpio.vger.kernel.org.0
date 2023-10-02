Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C830A7B4BB5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 08:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbjJBGxG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 02:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235576AbjJBGxF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 02:53:05 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412B3BF
        for <linux-gpio@vger.kernel.org>; Sun,  1 Oct 2023 23:53:01 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-452c0d60616so1986356137.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 Oct 2023 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696229580; x=1696834380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ryxoZacRjxfVjFlzq6b9dnRAwZ9Cwhv/ctEImXuEGU=;
        b=H4bjcETEOQsD881Qg6aEedbLymtufIQwY5MVzUYu/ICezTi7BwASBQGCSqKW20Egaa
         3R7r1dkL3CTL5jAGNM5oxp8PmWvBp1P9S+IzPOf2Cmmt/fY6YlNN2azS2So4BgzkKCcA
         eUe/FiWOaBskcQm/zgoJCwVaoVc8ouF9w5XJLMbROSZqJmuL72wv3bj8ji28u3K9a1nl
         DxLsUHM8O5bsuXP8QK8mmkHooiY09dxUmW2Wvwv0hs6WB+hOn5/FM9eIR9wFj2Whc/Bu
         DG+w3nZFlx6D3bmNmRe/lqPvFTI0Qasfu/ZbTE1Fazcufq+yigJpom9kyruCE36NyyQQ
         0vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696229580; x=1696834380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ryxoZacRjxfVjFlzq6b9dnRAwZ9Cwhv/ctEImXuEGU=;
        b=nVAumeBcGX1tber9eRHA7Ux1YD2kFj2nhmhI1JsgwqCoeX5yyD1Z4umwvvXk5BMVLK
         /4yf3/peiepnc3AJBGapwH13Yy0zDn9GP27QlixvO1mrRD5ciZm+guKa3guDJCCa888R
         1vS4OcQjyWtzTh6uTqUioxPqepSKOIoisK78UwWeJvQouVcHaZHZZYQr/WWMufMrbLyX
         bwCMBY8GxIPitKDkuJ9y5usclRxZoBguSDCp7xG3ztltXilvd5GgFuxjzzAhBg2cx6bi
         T7rNp87T1AuViMbisHz6AIRJ9116igOS8YYR/cHlSiH9DbQEJfhmpUWE456tbPONw4G/
         vrHA==
X-Gm-Message-State: AOJu0YwAgEU/g/891CsvyFshea/Dybjj+tbokNRuIqJ7nl+Nh3KRk4cZ
        W3aj6YahEk89SBFGVT53T5TaVVEsoX3K7SNTT6/zNA==
X-Google-Smtp-Source: AGHT+IEgGi6qU2Mp3mDYr8L0Z6jDhHwhMnnuFjnFIJ7nxBJXc9EksuQXfdql9FqITrIaHBUfcgn5Fc+wHwg/LrGhOnU=
X-Received: by 2002:a05:6102:3178:b0:450:cebb:4f15 with SMTP id
 l24-20020a056102317800b00450cebb4f15mr4555097vsm.1.1696229580147; Sun, 01 Oct
 2023 23:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230928070706.2290137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230928070706.2290137-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 08:52:48 +0200
Message-ID: <CAMRc=Mf1yPMAXRYc4S8MnzmQY_i9EaNVDRPf+FnJAeXRzXJ55g@mail.gmail.com>
Subject: Re: [PATCH 00/23] gpio: Convert to platform remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 28, 2023 at 9:07=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this series converts all platform drivers below drivers/gpio to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
>
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>
> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply or a subject prefix is suboptimal, please apply the remainder of
> this series anyhow.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (23):
>   gpio: altera: Convert to platform remove callback returning void
>   gpio: amdpt: Convert to platform remove callback returning void
>   gpio: brcmstb: Convert to platform remove callback returning void
>   gpio: cadence: Convert to platform remove callback returning void
>   gpio: dln2: Convert to platform remove callback returning void
>   gpio: ftgpio010: Convert to platform remove callback returning void
>   gpio: grgpio: Convert to platform remove callback returning void
>   gpio: ljca: Convert to platform remove callback returning void
>   gpio: lpc18xx: Convert to platform remove callback returning void
>   gpio: mb86s7x: Convert to platform remove callback returning void
>   gpio: mm-lantiq: Convert to platform remove callback returning void
>   gpio: mpc5200: Convert to platform remove callback returning void
>   gpio: mpc8xxx: Convert to platform remove callback returning void
>   gpio: omap: Convert to platform remove callback returning void
>   gpio: rcar: Convert to platform remove callback returning void
>   gpio: rockchip: Convert to platform remove callback returning void
>   gpio: tb10x: Convert to platform remove callback returning void
>   gpio: ts5500: Convert to platform remove callback returning void
>   gpio: uniphier: Convert to platform remove callback returning void
>   gpio: xgene-sb: Convert to platform remove callback returning void
>   gpio: xgs-iproc: Convert to platform remove callback returning void
>   gpio: xilinx: Convert to platform remove callback returning void
>   gpio: zynq: Convert to platform remove callback returning void
>
>  drivers/gpio/gpio-altera.c    | 6 ++----
>  drivers/gpio/gpio-amdpt.c     | 6 ++----
>  drivers/gpio/gpio-brcmstb.c   | 6 ++----
>  drivers/gpio/gpio-cadence.c   | 6 ++----
>  drivers/gpio/gpio-dln2.c      | 6 ++----
>  drivers/gpio/gpio-ftgpio010.c | 6 ++----
>  drivers/gpio/gpio-grgpio.c    | 6 ++----
>  drivers/gpio/gpio-ljca.c      | 5 ++---
>  drivers/gpio/gpio-lpc18xx.c   | 6 ++----
>  drivers/gpio/gpio-mb86s7x.c   | 6 ++----
>  drivers/gpio/gpio-mm-lantiq.c | 6 ++----
>  drivers/gpio/gpio-mpc5200.c   | 8 +++-----
>  drivers/gpio/gpio-mpc8xxx.c   | 6 ++----
>  drivers/gpio/gpio-omap.c      | 6 ++----
>  drivers/gpio/gpio-rcar.c      | 5 ++---
>  drivers/gpio/gpio-rockchip.c  | 6 ++----
>  drivers/gpio/gpio-tb10x.c     | 6 ++----
>  drivers/gpio/gpio-ts5500.c    | 6 ++----
>  drivers/gpio/gpio-uniphier.c  | 6 ++----
>  drivers/gpio/gpio-xgene-sb.c  | 6 ++----
>  drivers/gpio/gpio-xgs-iproc.c | 6 ++----
>  drivers/gpio/gpio-xilinx.c    | 6 ++----
>  drivers/gpio/gpio-zynq.c      | 5 ++---
>  23 files changed, 47 insertions(+), 90 deletions(-)
>
>
> base-commit: 719136e5c24768ebdf80b9daa53facebbdd377c3
> --
> 2.40.1
>

Series queued for v6.7, thanks!

Bart
